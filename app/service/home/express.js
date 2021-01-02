'use strict';
const Service = require('egg').Service;

class HomeExpressService extends Service {
  async find(row) {
    try {
      const items = await this.ctx.model.Home.Express.findAll({
        title: row.title,
      });
      return {
        code: 0,
        data: items.map(item => item.api_id),
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async findOne(id) {
    const ctx = this.ctx;
    try {
      const item = await ctx.model.Home.Express.findByPk(id);
      return {
        code: 0,
        data: item,
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async list({ pageSize, pageIndex, title }) {
    const ctx = this.ctx;
    const offset = (pageIndex - 1) * pageSize;
    const where = title ? { title: title } : {};
    try {
      const item = await ctx.model.Home.Express.findAll({
        limit: pageSize,
        offset,
        order: [['created_at', 'desc']],
        where,
      });
      const count = await this.ctx.model.Home.Express.count();
      return {
        code: 0,
        total: count,
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

  async add(row) {
    try {
      await this.ctx.model.Home.Express.create(row);
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
      const item = await this.ctx.model.Home.Express.findByPk(where.id);
      if (!item) {
        throw new Error('记录不存在!');
      }
      if (!Object.keys(where).length) {
        throw new Error('禁止全库修改!');
      }
      await this.ctx.model.Home.Express.update(row, { where });
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
      const item = await this.ctx.model.Home.Express.findByPk(row.id);
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

module.exports = HomeExpressService;
