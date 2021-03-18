'use strict';
const path = require('path');
const fs = require('fs');
const Service = require('egg').Service;

class FilesService extends Service {
  async list(where) {
    const ctx = this.ctx;
    try {
      const items = await ctx.model.Files.findAll({
        order: [['number']],
        where,
      });
      return {
        code: 0,
        data: items,
      };
    } catch (error) {
      console.log('error', error);
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async findOne(where) {
    const ctx = this.ctx;
    try {
      const item = await ctx.model.Files.findOne({ where });
      if (!item) {
        throw new Error('记录不存在!');
      }
      return {
        code: 0,
        data: item.file_names.split(','),
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
        where: {
          resource_id: row.resource_id,
          resource_type: row.resource_type,
        },
      });
      if (item) {
        throw new Error('记录已存在，请保存文件并删除记录后重新添加!');
      }
      await this.ctx.model.Files.create(row);
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
    console.log('row', row);
    try {
      const items = await this.ctx.model.Files.findAll({
        where: {
          resource_id: row.id,
          resource_type: row.resource_type,
        },
      });
      if (!items || !items.length) {
        throw new Error('记录不存在!');
      }
      items.map(async (item) => {
        try {
          item.file_names.split(',').map((fileName) => {
            const target = path.join(this.config.baseDir, fileName);
            fs.unlinkSync(target);
          });
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
