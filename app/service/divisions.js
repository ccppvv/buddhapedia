'use strict';
const Service = require('egg').Service;

class ScripturesService extends Service {
  async list(where) {
    const ctx = this.ctx;
    try {
      const items = await ctx.model.Scriptures.findAll({
        // order: [['order']],
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

  async add(row) {
    try {
      await this.ctx.model.Scriptures.create(row);
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
      const item = await this.ctx.model.Scriptures.findByPk(where.id);
      if (!item) {
        throw new Error('记录不存在!');
      }
      if (!Object.keys(where).length) {
        throw new Error('禁止全库修改!');
      }
      await this.ctx.model.Scriptures.update(row, { where });
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
      const item = await this.ctx.model.Scriptures.findByPk(row.id);
      if (!item) {
        throw new Error('记录不存在!');
      }
      await item.destroy();
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

module.exports = ScripturesService;
