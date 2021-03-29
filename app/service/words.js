'use strict';
const Service = require('egg').Service;

class WordsService extends Service {
  async list({ word, pageSize, pageIndex }) {
    const ctx = this.ctx;
    const { Op } = this.app.Sequelize;
    try {
      const where = {};
      if (word) {
        where.word = {
          [Op.like]: `%${word}%`
        };
      }

      const offset = (pageIndex - 1) * pageSize;
      const items = await ctx.model.Words.findAll({
        limit: pageSize,
        offset,
        order: [['id']],
        where,
        include: [{ model: this.ctx.model.Dicts, attributes: ['name'] }]
      });
      const count = await this.ctx.model.Words.count({where});
      return {
        code: 0,
        total: count,
        data: items.map(item => {
          const data = item.get();
          return ({
            ...data,
            content: data.content.replace('\\n', '')
          });
        })
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }
}

module.exports = WordsService;
