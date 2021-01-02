'use strict';

const Controller = require('egg').Controller;
const PAGE_LIST = [
  'tibetan-scriptures',
  'outide-tibetan-scriptures',
  'buddhism-dictionary',
  'buddhist-symbolism',
  'language-learn',
];

class DirectoriesController extends Controller {
  async index() {
    const ctx = this.ctx;
    let { page } = ctx.query;
    if (!page) {
      ctx.body = {
        code: -1,
        message: 'page必传!',
      };
      return;
    }
    if (!PAGE_LIST.includes(page)) {
      ctx.body = {
        code: -1,
        message: '不支持的page类型!',
      };
      return;
    }
    const queries = { page };
    ctx.body = await this.ctx.service.directories.list(queries);
  }

  async create() {
    const ctx = this.ctx;
    const { service, request } = ctx;
    const { name, order, page } = request.body;
    const row = { name, order, page };
    if (!name || !page || order === undefined) {
      ctx.body = {
        code: 0,
        message: '参数错误：name/page/order必填！',
      };
      return;
    }
    ctx.body = await service.directories.add(row);
  }

  async update() {
    const ctx = this.ctx;
    const {
      service,
      request: {
        body: { order, name },
      },
      params: { id },
    } = ctx;
    const row = { order, name };
    if (row.order === undefined) {
      delete row.order;
    }
    if (row.name === undefined) {
      delete row.name;
    }
    if (!id) {
      ctx.body = {
        code: 0,
        message: '参数错误：id必填！',
      };
      return;
    }
    ctx.body = await service.directories.update(row, { id });
  }

  async show() {
    const ctx = this.ctx;
    const { service, params } = ctx;
    const { id } = params;
    ctx.body = await service.directories.findOne({
      where: { id },
    });
  }

  async destroy() {
    const ctx = this.ctx;
    const {
      service,
      params: { id },
    } = ctx;
    if (!id) {
      ctx.body = {
        code: 0,
        message: '参数错误：id必填！',
      };
      return;
    }
    ctx.body = await service.directories.delete({ id });
  }
}

module.exports = DirectoriesController;
