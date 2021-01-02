// app/extend/helper.js
'use strict';
const _ = require('lodash');
const dayjs = require('dayjs');
const utc = require('dayjs/plugin/utc'); // dependent on utc plugin
const timezone = require('dayjs/plugin/timezone');
const isBetween = require('dayjs/plugin/isBetween');
const dayOfYear = require('dayjs/plugin/dayOfYear');

dayjs.extend(utc);
dayjs.extend(timezone);
dayjs.extend(isBetween);
dayjs.extend(dayOfYear);
// Asia/Shanghai;

// dayjs.tz.setDefault('Asia/Shanghai');

/**
 * 解决 时区向前了 8 小时问题
 * 使用 UTC 时区，作为默认时区
 * 使用时候，需要用 dayjs.tz 作为初始化函数
 */
dayjs.tz.setDefault('UTC');

// 和 dayjs.tz("2014-06-01 12:00", "America/New_York") 同样行为
// console.log(dayjs.tz('2014-06-01 12:00').format(), '-=============');

// let timezone = "Asia/Tokyo";

module.exports = {
  get time() {
    // this 是 helper 对象，在其中可以调用其他 helper 方法
    // this.ctx => context 对象
    // this.app => application 对象
    return {
      utt(timeStamp, format) {
        return dayjs(timeStamp).format(format || 'YYYY-MM-DD HH:mm:ss');
      },
      startOfDay(timeStamp) {
        return dayjs(timeStamp).startOf('day').unix();
      },
      endOfDay(timeStamp) {
        return dayjs(timeStamp).endOf('day').unix();
      },
      tzt(timeStamp) {
        return dayjs.tz(timeStamp).format('YYYY-MM-DD HH:mm:ss');
      },
    };
  },
  delay: ms => new Promise(resolve => setTimeout(resolve, ms)),

  get dayjs() {
    return dayjs;
  },

  /**
   * @param {array} 参数传 [pageSize pageIndex]
   * @return {object} {offset,limit}
   */
  formatPage([pageSize, pageIndex]) {
    const offset = _.toInteger((pageIndex - 1) * pageSize);
    const limit = _.toInteger(pageSize);

    if (offset >= 0 && limit >= 1) {
      return { offset, limit };
    }
    return { offset: 0, limit: 0 };
  },
  /**
   * 自定义 helper . 目前有递归数据 key 转化
   */
  get sequelizeUtil() {
    return {
      getCol(model, colName) {
        const sequelize = model.sequelize;
        return sequelize.col(model.rawAttributes[colName].field);
      },
    };
  },
};
