"use strict";

const PAGE_LIST = [
  'tibetan-scriptures',
  'outside-tibetan-scriptures',
  'buddhism-dictionary',
  'buddhist-symbolism',
  'language-learn',
  'ftp-download',
];

const RESOURCE_LIST = [
  'directories',
  'divisions',
];
const Controller = require("egg").Controller;

class DescriptionsController extends Controller {
  async index() {
    const ctx = this.ctx;
    let { page, pid } = ctx.query;
    if (!page || pid === undefined) {
      ctx.body = {
        code: -1,
        message: "page、pid必传!",
      };
      return;
    }
    const queries = { page, pid };
    ctx.body = await this.ctx.service.descriptions.findOne(queries);
  }

  async create() {
    const ctx = this.ctx;
    const { service, request } = ctx;
    const { pid, page, content, resource_type } = request.body;
    if (!PAGE_LIST.includes(page)) {
      ctx.body = {
        code: 0,
        message: "参数错误：不支持的page类型！",
      };
      return;
    }
    if (!RESOURCE_LIST.includes(resource_type)) {
      ctx.body = {
        code: 0,
        message: "参数错误：不支持的resource类型！",
      };
      return;
    }
    const row = {pid, page, content, resource_type};
    ctx.body = await service.descriptions.add(row);
  }

  async update() {
    const ctx = this.ctx;
    const {
      service,
      request: { body },
      params: { id },
    } = ctx;

    if (!body.page) {
      ctx.body = {
        code: 0,
        message: "参数错误：page必填！",
      };
      return;
    }
    ctx.body = await service.descriptions.update(body, { id });
  }

  async show() {
    const ctx = this.ctx;
    const { service, params } = ctx;
    const { id } = params;
    ctx.body = await service.descriptions.findOne({
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
  //   ctx.body = await service.descriptions.delete({ id });
  // }
}

module.exports = DescriptionsController;
