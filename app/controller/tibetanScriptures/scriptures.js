'use strict';

const Controller = require('egg').Controller;

class ScripturesController extends Controller {
  async index() {
    const ctx = this.ctx;
    let { pageSize = 20, pageIndex = 1, title } = ctx.query;
    pageSize = parseInt(pageSize);
    pageIndex = parseInt(pageIndex);
    if (pageSize <= 0 || isNaN(parseInt(pageSize)) || pageIndex <= 0) {
      ctx.body = {
        code: -1,
        message: '参数错误!',
      };
      return;
    }
    const queries = { title };
    if (!queries.title) {
      delete queries.title;
    }
    ctx.body = await this.ctx.service.tibetanScriptures.scriptures.list({
      pageSize,
      pageIndex,
      ...queries,
    });
  }

  async create() {
    const ctx = this.ctx;
    const { service, request } = ctx;
    const { title, link } = request.body;
    const row = { title, link };
    if (!title) {
      ctx.body = {
        code: 0,
        message: '参数错误：title必填！',
      };
      return;
    }
    ctx.body = await service.tibetanScriptures.scriptures.add(row);
  }

  async update() {
    const ctx = this.ctx;
    const {
      service,
      request: {
        body: { title = '', link = '' },
      },
      params: { id },
    } = ctx;
    const row = { title, link };
    if (!id) {
      ctx.body = {
        code: 0,
        message: '参数错误：id必填！',
      };
      return;
    }
    ctx.body = await service.tibetanScriptures.scriptures.update(row, { id });
  }

  async show() {
    const ctx = this.ctx;
    const { service, params } = ctx;
    const { id } = params;
    ctx.body = await service.tibetanScriptures.scriptures.findOne({
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
    ctx.body = await service.tibetanScriptures.scriptures.delete({ id });
  }
}

module.exports = ScripturesController;
