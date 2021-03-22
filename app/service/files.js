'use strict';
const path = require('path');
const fs = require('fs');
const Service = require('egg').Service;

class FilesService extends Service {
  async findOne(where) {
    const ctx = this.ctx;
    try {
      const item = await ctx.model.Files.findOne({ where });
      return {
        code: 0,
        data: item,
      };
    } catch (error) {
      console.log('error', error);
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async find(where) {
    const ctx = this.ctx;
    try {
      const items = await ctx.model.Files.findAll({
        where,
        order: [['created_at']],
      });
      return {
        code: 0,
        data: items.map(item => {
          const data = item.get();
          return {
            ...data,
            file_hash: path.join(
              `/static/${data.file_type}`,
              data.file_hash
            ),
          }
        }),
      };
    } catch (error) {
      console.log('error', error);
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async add(row) {
    try {
      const item = await this.ctx.model.Files.findOne({
        where: row,
      });
      if (item) {
        throw new Error('同名记录已存在，请重新添加!');
      }
      await this.ctx.model.Files.create(row);
      return {
        code: 0,
        message: 'OK',
      };
    } catch (error) {
      throw error;
    }
  }

  async update(row, where) {
    try {
      const item = await this.ctx.model.Files.findByPk(where.id);
      if (!item) {
        throw new Error('记录不存在!');
      }
      if (!Object.keys(where).length) {
        throw new Error('禁止全库修改!');
      }
      await this.ctx.model.Files.update(row, { where });
      return {
        code: 0,
        message: 'OK',
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async delete(row) {
    try {
      const items = await this.ctx.model.Files.findAll({
        where: {
          ...(row.id ? { resource_id: row.id } : null),
          ...(row.resource_type ? { resource_type: row.resource_type } : null),
          ...(row.file_hash ? { file_hash: row.file_hash } : null),
          ...(row.file_type ? { file_type: row.file_type } : null),
        },
      });
      if (!items || !items.length) {
        throw new Error('记录不存在!');
      }
      items.map(async (item) => {
        try {
          const target = path.join(
            this.config.baseDir,
            'upload_files',
            item.file_type,
            item.file_hash
          );
          fs.unlinkSync(target);
        } catch (error) {
          this.ctx.logger.error('File unlink error: ', error.message);
        }
        await item.destroy();
      });
      return {
        code: 0,
        message: 'OK',
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }
}

module.exports = FilesService;
