'use strict';

const Controller = require('egg').Controller;

class WordsController extends Controller {
  async index() {
    const ctx = this.ctx;
    let { word, dictid, pageSize = 1, pageIndex = 20 } = ctx.query;
    pageSize = parseInt(pageSize);
    pageIndex = parseInt(pageIndex);
    if (pageSize <= 0 || isNaN(parseInt(pageSize)) || pageIndex <= 0) {
      ctx.body = {
        code: -1,
        message: '参数错误!'
      };
      return;
    }
    const queries = { word, dictid, pageSize, pageIndex };
    ctx.body = await this.ctx.service.words.list(queries);
  }
}

module.exports = WordsController;
