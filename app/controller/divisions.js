'use strict';

const Controller = require('egg').Controller;
const PAGE_LIST = [
  'tibetan-scriptures',
  'outside-tibetan-scriptures',
  'buddhism-dictionary',
  'buddhist-symbolism',
  'language-learn',
];

class DivisionsController extends Controller {
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
    ctx.body = await this.ctx.service.divisions.list(queries);
  }

  async create() {
    const ctx = this.ctx;
    const { service, request } = ctx;
    const { divisionsData } = request.body;
    /*
     * divisionsData格式(字符串):
     * resource_type1,pid1,name1,page1,order1,part1,range1;
     * resource_type2,pid2,name2,page2,order2,part2,range2;
     * ...
     */
    let rows = divisionsData.split(/\s*;\s*/g);
    if (!rows[rows.length - 1].trim()) {
      // 最后一项如果为空，丢弃
      rows.pop();
    }
    const errRowNumbers = [];
    rows = rows.map((rowData, index) => {
      const row = rowData.trim().split(/\s*,\s*/g);
      if (row[1] === undefined || !row[2] || !row[3] || row[4] === undefined || !PAGE_LIST.includes(row[3])) {
        errRowNumbers.push(index + 1);
      }
      // resource_type可选 'resource' / 'scriptures', scriptures本来应该是单数，插入db的时候拼错了，暂时先这样吧=_=
      return { resource_type: row[0], pid: parseInt(row[1]), name: row[2], page: row[3], order: row[4], part: row[5], range: row[6], link: '' };
    });
    if (errRowNumbers.length) {
      ctx.body = {
        code: 0,
        message: `第${errRowNumbers.join('、')}行数据错误：pid、name、page、order必填！`,
      };
      return;
    }
    ctx.body = await service.divisions.add(rows);
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
    ctx.body = await service.divisions.update(body, { id });
  }

  async show() {
    const ctx = this.ctx;
    const { service, params } = ctx;
    const { id } = params;
    ctx.body = await service.divisions.findOne({
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
  //   ctx.body = await service.divisions.delete({ id });
  // }
}

module.exports = DivisionsController;
