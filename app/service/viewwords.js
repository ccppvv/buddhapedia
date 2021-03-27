'use strict';
const Service = require('egg').Service;

class ViewWordsService extends Service {
  async findOne(where) {
    const ctx = this.ctx;
    try {
      const item = await ctx.model.Viewwords.findOne({ where });
      return {
        code: 0,
        data: item
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }
}

module.exports = ViewWordsService;
