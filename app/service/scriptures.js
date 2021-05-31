'use strict';
const request = require('request-promise');
const Service = require('egg').Service;

class ScripturesService extends Service {
  async list(where) {
    const ctx = this.ctx;
    try {
      const items = await ctx.model.Scriptures.findAll({
        order: [['number']],
        where,
      });
      const division = await ctx.model.Divisions.findByPk(where.pid);
      return {
        code: 0,
        data: items,
        wholeLink: division ? division.whole_link : ''
      };
    } catch (error) {
      console.log('error', error);
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async add(rows) {
    try {
      await this.ctx.model.Scriptures.bulkCreate(rows);
      return {
        code: 0,
        message: 'OK',
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async update(row, where) {
    try {
      const item = await this.ctx.model.Scriptures.findByPk(where.id);
      if (!item) {
        throw new Error('记录不存在!');
      }
      if (!Object.keys(where).length) {
        throw new Error('禁止全库修改!');
      }
      await this.ctx.model.Scriptures.update(row, {where});
      return {
        code: 0,
        message: 'OK',
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async delete(row) {
    try {
      const item = await this.ctx.model.Scriptures.findByPk(row.id);
      if (!item) {
        throw new Error('记录不存在!');
      }
      await item.destroy();
      return {
        code: 0,
        message: 'OK',
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  getCapital(link) {
    const lastSlashIndex = link.lastIndexOf('/');
    const ret = link[lastSlashIndex + 1].toUpperCase();
    if (ret === 'W') {
      return 'ZW';
    }
    if (ret === 'H') {
      return 'ZS';
    }
    if (ret === 'X') {
      return '';
    }
    return ret;
  }

  fillJuanInfo = (juan) => {
    if (juan.length === 1) {
      return `00${juan}`;
    }
    if (juan.length === 2) {
      return `0${juan}`;
    }
    if (juan.length === 3) {
      return juan;
    }
    return '';
  }

  getJuanInfo = (juanInfo) => {
    if (!juanInfo) {
      return 1;
    }
    if (juanInfo === '-') {
      return 1;
    }
    const rest = juanInfo
      .replace(/第/g, '')
      .replace(/卷/g, '')
      .replace(/（/g, '')
      .replace(/）/g, '')
      .replace(/\(/g, '')
      .replace(/\)/g, '');
    if (rest.includes('-') && rest.length > 1) {
      return rest.split('-')[0];
    }
    return rest;
  }

  async findOne({id, juan = '1'}) {
    let url = '';
    let file = '';
    try {
      const item = await this.ctx.model.Scriptures.findByPk(id);
      file = item.link;
      if (!item) {
        throw new Error('记录不存在!');
      }
      const {link, part_info: srcJuan} = item;
      const juanInfo = this.fillJuanInfo(juan);
      console.log('juan', juan);
      if (!juanInfo) {
        throw new Error('卷信息必须为数字!');
      }
      // console.log('juanInfo', item, juanInfo, juan);
      const capital = this.getCapital(link);
      url = `http://api.cbetaonline.cn/download/html/${capital + item.number.toUpperCase()}_${juanInfo}`;
      const optionsRequest = {
        method: 'GET',
        url,
        headers: {}
      };

      const res = await request(optionsRequest);
      return {
        code: 0,
        data: res,
        url: `http://api.cbetaonline.cn/download/html/${capital + item.number.toUpperCase()}_${juanInfo}`,
        juan: this.getJuanInfo(srcJuan),
        file
      };
    } catch (error) {
      console.log('error', error);
      return {
        code: -1,
        message: error.message,
        url,
        file,
        data: ''
      };
    }
  }
}

module.exports = ScripturesService;
