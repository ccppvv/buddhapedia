'use strict';
const Service = require('egg').Service;

class DetailsService extends Service {
  async list(where) {
    const ctx = this.ctx;
    try {
      const items = await ctx.model.Details.findAll({
        order: [['id']],
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

  async add(rows) {
    try {
      await this.ctx.model.Details.bulkCreate(rows);
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
      const item = await this.ctx.model.Details.findByPk(where.id);
      if (!item) {
        throw new Error('记录不存在!');
      }
      if (!Object.keys(where).length) {
        throw new Error('禁止全库修改!');
      }
      await this.ctx.model.Details.update(row, { where });
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
      const item = await this.ctx.model.Details.findByPk(row.id);
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

module.exports = DetailsService;
