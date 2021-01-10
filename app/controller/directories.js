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
    const { directoriesData } = request.body;
    /*
     * directoriesData格式(字符串):
     * name1,page1,order1,pid1;
     * name2,page2,order2,pid2;
     * ...
     */
    let rows = directoriesData.split(/\s*;\s*/g);
    if (!rows[rows.length - 1].trim()) {
      // 最后一项如果为空，丢弃
      rows.pop();
    }
    const errRowNumbers = [];
    rows = rows.map((rowData, index) => {
      const row = rowData.trim().split(/\s*,\s*/g);
      if (!row[0] || !row[1] || row[2] === undefined) {
        errRowNumbers.push(index + 1);
      }
      return { name: row[0], page: row[1], order: row[2], pid: 0 };
    });
    if (errRowNumbers.length) {
      ctx.body = {
        code: 0,
        message: `第${errRowNumbers.join('、')}行数据错误：name、page、order必填！`,
      };
      return;
    }
    ctx.body = await service.directories.add(rows);
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
  //   ctx.body = await service.directories.delete({ id });
  // }
}

module.exports = DirectoriesController;
