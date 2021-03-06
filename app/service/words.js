'use strict';
const Service = require('egg').Service;

class WordsService extends Service {
  async list({ word, dictid, pageSize, pageIndex, type }) {
    const ctx = this.ctx;
    const { Op } = this.app.Sequelize;
    try {
      const where = {};
      if (type === 'title') {
        where.word = {
          [Op.like]: `%${word}%`
        };
      } else if (type === 'content') {
        where.content = {
          [Op.like]: `%${word}%`
        };
      } else if (type === 'all') {
        where[Op.or] = [{
          word: {
            [Op.like]: `%${word}%`
          }
        }, {
          content: {
            [Op.like]: `%${word}%`
          }
        }]
      }
      if (dictid !== undefined) {
        where.dictid = dictid;
      }

      const offset = (pageIndex - 1) * pageSize;
      const items = await ctx.model.Words.findAll({
        limit: pageSize,
        offset,
        order: [['id']],
        where,
        include: [{ model: this.ctx.model.Dicts, attributes: ['name'] }]
      });
      const count = await this.ctx.model.Words.count({ where });
      return {
        code: 0,
        total: count,
        data: items.map(item => {
          const data = item.get();
          return ({
            ...data,
            content: data.content.replace('\\n', '')
          });
        }),
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
