"use strict";

const Controller = require("egg").Controller;
const PAGE_LIST = [
  "tibetan-scriptures",
  "outside-tibetan-scriptures",
  "buddhism-dictionary",
  "buddhist-symbolism",
  "language-learn",
];

class ScripturesController extends Controller {
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
    if (!PAGE_LIST.includes(page)) {
      ctx.body = {
        code: -1,
        message: "不支持的page类型!",
      };
      return;
    }
    const queries = { page, pid };
    ctx.body = await this.ctx.service.scriptures.list(queries);
  }

  async create() {
    const ctx = this.ctx;
    const { service, request } = ctx;
    const { scripturesData } = request.body;
    /*
     // tibetan-scriptures,0,长阿含经,tibetan-scriptures,0001,01,p0001,https://www.fodian.net/01-ahan/01/t01n0001.zip,(22卷),〖 后秦 佛陀耶舍共竺佛念译〗,https://www.fodian.net/01-ahan/01/t01n0001-b.zip,宗教文化出版社版本;
     *  scripturesData格式(字符串):
     // * pid1,name1,page1,number1,section1,page_info1,link1,part_info1,author_info1,version_name1,version_link1;
     // * pid2,name2,page2,number2,section2,page_info2,link2,part_info2,author_info2,version_name2,version_link2;
     * ...
     */
    let rows = scripturesData.split(/\s*;\s*/g);
    if (!rows[rows.length - 1].trim()) {
      // 最后一项如果为空，丢弃
      rows.pop();
    }
    console.log(rows.length);
    const errRowNumbers = [];
    rows = rows.map((rowData, index) => {
      const row = rowData.trim().split(/\s*,\s*/g);
      if (
        row[1] === undefined ||
        !row[6] ||
        !row[0] ||
        !row[2] ||
        !row[3] ||
        !row[4] ||
        !row[5] ||
        !row[7] ||
        !row[8] ||
        !PAGE_LIST.includes(row[0])
      ) {
        errRowNumbers.push(index + 1);
      }
      return {
        pid: parseInt(row[1]),
        name: row[6],
        page: row[0],
        number: row[2],
        section: row[3],
        page_info: row[4],
        link: row[5],
        part_info: row[7],
        author_info: row[8],
        version_name: row[10] || "",
        version_link: row[9] || "",
      };
    });
    if (errRowNumbers.length) {
      ctx.body = {
        code: 0,
        message: `第${errRowNumbers.join(
          "、"
        )}行数据错误：pid、name、page、number、section、page_info、link、part_info、author_info必填！`,
      };
      return;
    }
    ctx.body = await service.scriptures.add(rows);
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
  //   ctx.body = await service.scriptures.delete({ id });
  // }
}

module.exports = ScripturesController;
