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
      return {
        code: 0,
        data: items,
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
    // if (juan.endsWith('a')
    //   || juan.endsWith('b')
    //   || juan.endsWith('c')
    //   || juan.endsWith('d')
    //   || juan.endsWith('e')
    //   || juan.endsWith('f')
    //   || juan.endsWith('g')
    //   || juan.endsWith('h')
    // ) {
    //   if (juan.includes('-') && juan.length !== 1) {

    //   }
    // }
    const lastSlashIndex = link.lastIndexOf('/');
    return link[lastSlashIndex + 1].toUpperCase();
  }

  getJuanInfo(juanInfo) {
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

  async findOne({id, juan = 1}) {
    try {
      const item = await this.ctx.model.Scriptures.findByPk(id);
      if (!item) {
        throw new Error('记录不存在!');
      }
      const {link, part_info: juanInfo} = item;
      const juan = this.getJuanInfo(juanInfo);
      console.log('juanInfo', item, juanInfo, juan);
      const capital = this.getCapital(link);
      const getUrl = (item, juan) => {
        const upper = `http://cbdata.dila.edu.tw/v1.2/juans?work=${capital + item.number.toUpperCase()}&juan=${juan}`
        const lower = `http://cbdata.dila.edu.tw/v1.2/juans?work=${capital + item.number.toLowerCase()}&juan=${juan}`
        return {
          upper,
          lower
        };
      };
      const upperOptionsRequest = {
        method: 'GET',
        url: getUrl(item, juan).upper,
        headers: {}
      };
      const lowerOptionsRequest = {
        method: 'GET',
        url: getUrl(item, juan).lower,
        headers: {}
      };
      console.log(upperOptionsRequest, lowerOptionsRequest)

      let ures = await request(upperOptionsRequest);
      let lres = await request(lowerOptionsRequest);
      ures = JSON.parse(ures);
      lres = JSON.parse(lres);
      if (ures.num_found) {
        return {
          code: 0,
          data: ures.results[0]
        };
      }
      return {
        code: 0,
        data: lres.results && lres.results[0],
      };
    } catch (error) {
      console.log('error', error);
      return {
        code: -1,
        message: error.message,
      };
    }
  }
}

module.exports = ScripturesService;
