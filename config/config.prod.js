/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = {
    logger: {
      // https://eggjs.org/zh-cn/core/logger.html
      level: 'DEBUG',
      outputJSON: true,
      dir: '../egg-log/',
      allowDebugAtProd: true,
      appLogName: 'egg-app.log',
      coreLogName: 'egg-web.log',
      agentLogName: 'egg-agent.log',
      errorLogName: 'common-error.log',
    },
    sequelize: {
      datasources: [
        {
          dialect: 'mysql', // support: mysql, mariadb, postgres, mssql
          username: 'nptmysqljtuser',
          password: 'Mdtw*C1Z4eAj',
          host: '222.76.219.103',
          port: 3306,
          delegate: 'model',
          baseDir: 'model',
          database: 'buddhapedia',
        },
      ],
    },
    onerror: {
      all(err, ctx) {
        // 在此处定义针对所有响应类型的错误处理方法
        // 注意，定义了 config.all 之后，其他错误处理方法不会再生效
        ctx.set('content-type', 'application/json; charset=UTF-8');

        ctx.body = JSON.stringify({
          message: err.message,
          stack: err.stack,
        });
        ctx.status = 500;
      },
    },
  };

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1609425653246_9347';

  // add your middleware config here
  config.middleware = [];

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  return {
    ...config,
    ...userConfig,
  };
};
