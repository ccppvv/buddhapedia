"use strict";
const Service = require("egg").Service;

class DirectoriesService extends Service {
  async list(where) {
    const ctx = this.ctx;
    try {
      const items = await ctx.model.Directories.findAll({
        order: [["order"]],
        where,
      });
      return {
        code: 0,
        data: items,
      };
    } catch (error) {
      console.log("error", error);
      return {
        code: -1,
        message: error.message,
      };
    }
  }

  async add(rows) {
    try {
      await this.ctx.model.Directories.bulkCreate(rows);
      return {
        code: 0,
        message: "OK",
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
      const item = await this.ctx.model.Directories.findByPk(where.id);
      if (!item) {
        throw new Error("记录不存在!");
      }
      if (!Object.keys(where).length) {
        throw new Error("禁止全库修改!");
      }
      await this.ctx.model.Directories.update(row, { where });
      return {
        code: 0,
        message: "OK",
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
      const item = await this.ctx.model.Directories.findByPk(row.id);
      if (!item) {
        throw new Error('记录不存在!');
      }
      const division = await this.ctx.model.Divisions.findOne({
        where: { pid: row.id },
      });
      if (division) {
        throw new Error('请清空所有二级目录后再执行删除操作!');
      }
      await item.destroy();
      return {
        code: 0,
        message: "OK",
      };
    } catch (error) {
      return {
        code: -1,
        message: error.message,
      };
    }
  }
}

module.exports = DirectoriesService;
