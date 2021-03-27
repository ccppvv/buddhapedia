'use strict';

const Controller = require('egg').Controller;

class DictsController extends Controller {
  async index() {
    const ctx = this.ctx;
    let { name, id } = ctx.query;
    const queries = { name, id };
    ctx.body = await this.ctx.service.dicts.list(queries);
  }
}

module.exports = DictsController;
