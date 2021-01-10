'use strict';

const Controller = require('egg').Controller;
const PAGE_LIST = [
  'tibetan-scriptures',
  'outide-tibetan-scriptures',
  'buddhism-dictionary',
  'buddhist-symbolism',
  'language-learn',
];

class ResourcesController extends Controller {
  async index() {
    const ctx = this.ctx;
    let { page, pid } = ctx.query;
    if (!page || pid === undefined) {
      ctx.body = {
        code: -1,
        message: 'page、pid必传!',
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
    const queries = { page, pid };
    ctx.body = await this.ctx.service.resources.list(queries);
  }

  async create() {
    const ctx = this.ctx;
    const { service, request } = ctx;
    const { page, name, link, order, tip, pid } = request.body;
    const row = { page, name, link, tip, order, pid };
    if (!page || !name || !link || order === undefined || pid === undefined) {
      ctx.body = {
        code: 0,
        message: '参数错误：page、name、link、order、pid必填！',
      };
      return;
    }
    ctx.body = await service.resources.add(row);
  }

  async update() {
    const ctx = this.ctx;
    const {
      service,
      request: { body },
      params: { id },
    } = ctx;
    if (!id) {
      ctx.body = {
        code: 0,
        message: '参数错误：id必填！',
      };
      return;
    }
    ctx.body = await service.resources.update(body, { id });
  }

  async show() {
    const ctx = this.ctx;
    const { service, params } = ctx;
    const { id } = params;
    ctx.body = await service.resources.findOne({
      where: { id },
    });
  }

  // async destroy() {
  //   const ctx = this.ctx;
  //   const {
  //     service,
  //     params: { id },
  //   } = ctx;
  //   if (!id) {
  //     ctx.body = {
  //       code: 0,
  //       message: '参数错误：id必填！',
  //     };
  //     return;
  //   }
  //   ctx.body = await service.resources.delete({ id });
  // }
}

module.exports = ResourcesController;
