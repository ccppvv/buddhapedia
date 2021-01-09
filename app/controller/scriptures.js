'use strict';

const Controller = require('egg').Controller;
const PAGE_LIST = [
  'tibetan-scriptures',
  'outide-tibetan-scriptures',
  'buddhism-dictionary',
  'buddhist-symbolism',
  'language-learn',
];

class ScripturesController extends Controller {
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
    ctx.body = await this.ctx.service.scriptures.list(queries);
  }

  async create() {
    const ctx = this.ctx;
    const { service, request } = ctx;
    const {
      pid,
      page,
      number,
      section,
      page_info,
      name,
      link,
      part_info,
      author_info,
      version_name,
      version_link,
    } = request.body;
    const row = {
      pid,
      page,
      number,
      section,
      page_info,
      name,
      link,
      part_info,
      author_info,
      version_name,
      version_link,
    };
    if (
      pid === undefined ||
      !page ||
      !number ||
      !section ||
      !page_info ||
      !name ||
      !part_info ||
      !author_info
    ) {
      ctx.body = {
        code: 0,
        message:
          '参数错误：pid、page、number、section、page_info、name、part_info、author_info必填！',
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
    ctx.body = await service.scriptures.add(row);
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
        message: '参数错误：page必填！',
      };
      return;
    }
    ctx.body = await service.scriptures.update(body, { id });
  }

  async show() {
    const ctx = this.ctx;
    const { service, params } = ctx;
    const { id } = params;
    ctx.body = await service.scriptures.findOne({
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
    ctx.body = await service.scriptures.delete({ id });
  }
}

module.exports = ScripturesController;
