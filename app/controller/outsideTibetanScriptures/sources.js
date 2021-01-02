'use strict';

const Controller = require('egg').Controller;

class SourcesController extends Controller {
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
    ctx.body = await this.ctx.service.outsideTibetanScriptures.sources.list({
      pageSize,
      pageIndex,
      ...queries,
    });
  }

  async create() {
    const ctx = this.ctx;
    const { service, request } = ctx;
    const { name, order } = request.body;
    const row = { name, order };
    if (!name) {
      ctx.body = {
        code: 0,
        message: '参数错误：name必填！',
      };
      return;
    }
    ctx.body = await service.outsideTibetanScriptures.sources.add(row);
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
    ctx.body = await service.outsideTibetanScriptures.sources.update(row, {
      id,
    });
  }

  async show() {
    const ctx = this.ctx;
    const { service, params } = ctx;
    const { id } = params;
    ctx.body = await service.outsideTibetanScriptures.sources.findOne({
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
    ctx.body = await service.outsideTibetanScriptures.sources.delete({ id });
  }
}

module.exports = SourcesController;
