'use strict';

const Controller = require('egg').Controller;
const PAGE_LIST = [
  'tibetan-scriptures',
  'outside-tibetan-scriptures',
  'buddhism-dictionary',
  'buddhist-symbolism',
  'language-learn',
  'ftp-download',
];

const TYPE_LIST = [
  'speech',
  'media',
  'record'
];
class DetailsController extends Controller {
  async index() {
    const ctx = this.ctx;
    let { page, type } = ctx.query;
    if (!page || !type)  {
      ctx.body = {
        code: -1,
        message: 'page、type必传!',
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
    if (!TYPE_LIST.includes(type)) {
      ctx.body = {
        code: -1,
        message: '不支持的type类型!',
      };
      return;
    }
    const queries = { page, type };
    ctx.body = await this.ctx.service.details.list(queries);
  }

  async create() {
    const ctx = this.ctx;
    const { service, request } = ctx;
    const { detailsData } = request.body;
    /*
     * detailsData格式(字符串):
     * order,type,page,from,content;
     */
    let rows = detailsData.split(/\s*;\s*/g);
    if (!rows[rows.length - 1].trim()) {
      // 最后一项如果为空，丢弃
      rows.pop();
    }
    const errRowNumbers = [];
    rows = rows.map((rowData, index) => {
      const row = rowData.trim().split(/\s*,\s*/g);
      if (!row[0] || !row[1] || !row[2] || !row[3] || !row[4]) {
        errRowNumbers.push(index + 1);
      }
      return { order: row[0], type: row[1], page: row[2], from: row[3], content: row[4] };
    });
    if (errRowNumbers.length) {
      ctx.body = {
        code: 0,
        message: `第${errRowNumbers.join('、')}行数据错误：name、page、order必填！`,
      };
      return;
    }
    ctx.body = await service.details.add(rows);
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
    ctx.body = await service.details.update(row, { id });
  }

  async show() {
    const ctx = this.ctx;
    const { service, params } = ctx;
    const { id } = params;
    ctx.body = await service.details.findOne({
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
  //   ctx.body = await service.details.delete({ id });
  // }
}

module.exports = DetailsController;
