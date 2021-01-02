'use strict';
// 本地开发数据库配置
// const LOCAL_IP = '10.95.30.75';
// const LOCAL_PWD = '123456';
const LOCAL_IP = '127.0.0.1';
const LOCAL_PWD = 'Fdsa@890-';

module.exports = {
  logger: {
    // https://eggjs.org/zh-cn/core/logger.html
    level: 'DEBUG',
    outputJSON: true,
    allowDebugAtProd: true,
  },
  sequelize: {
    datasources: [
      {
        dialect: 'mysql', // support: mysql, mariadb, postgres, mssql
        username: 'root',
        password: LOCAL_PWD,
        host: LOCAL_IP,
        port: 3306,
        delegate: 'model',
        baseDir: 'model',
        database: 'buddhapedia',
      },
    ],
  },
};
