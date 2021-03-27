'use strict';
const Service = require('egg').Service;

class DictsService extends Service {
  async list({ name, id }) {
    const ctx = this.ctx;
    const { Op } = this.app.Sequelize;
    try {
      const where = {};
      if (id) {
        where.id = id;
        const item = await ctx.model.Dicts.findOne({
          order: [['id']],
          where
        });
        return {
          code: 0,
          data: item,
        };
      }
      if (name) {
        where.name = {
          [Op.like]: `%${name}%`
        };
      }
      const items = await ctx.model.Dicts.findAll({
        order: [['id']],
        where
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
}

module.exports = DictsService;
