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

  async findOne({id}) {
    if (!id.includes('_')) {
      return {
        code: -1,
        message: 'id格式不正确, 必须为T${number}_${section}的格式!'
      };
    }
    const parts = id.split('_');
    if (parts[1].length === 2) {
      parts[1] = `0${parts[1]}`;
    }
    if (parts[1].length === 1) {
      parts[1] = `00${parts[1]}`;
    }
    if (parts[1].length > 3) {
      return {
        code: -1,
        message: 'id格式不正确, 请联系admin@fodian.net或ccppvv@hotmail.com获取支持!'
      };
    }
    try {
      const optionsRequest = {
        method: 'GET',
        url: `https://api.cbetaonline.cn/download/html/${parts[0]}_${parts[1]}`,
        headers: {}
      };

      const res = await request(optionsRequest);
      return {
        code: 0,
        data: res,
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
