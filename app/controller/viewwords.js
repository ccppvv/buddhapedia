'use strict';

const Controller = require('egg').Controller;

class ViewWordsController extends Controller {
  async index() {
    const ctx = this.ctx;
    let { id, dictid } = ctx.query;
    if (id === undefined || dictid === undefined) {
      ctx.body = {
        code: -1,
        message: '参数错误, id/dictid必填!'
      };
      return;
    }
    const queries = { id, dictid };
    ctx.body = await this.ctx.service.viewwords.findOne(queries);
  }
}

module.exports = ViewWordsController;
