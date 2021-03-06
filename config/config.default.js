/* eslint valid-jsdoc: "off" */

'use strict';
const path = require('path');

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = (exports = {});

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1609425653246_9347';
  config.security = {
    csrf: {
      enable: false,
    },
  };

  config.static = {
    prefix: '/static',
    dir: [
      path.join(appInfo.baseDir, './upload_files/image'),
      path.join(appInfo.baseDir, './upload_files/video'),
      path.join(appInfo.baseDir, './upload_files/audio'),
      path.join(appInfo.baseDir, './upload_files/other'),
    ],
    dynamic: true, // 如果当前访问的静态资源没有缓存，则缓存静态文件，和`preload`配合使用；
    preload: false,
    maxAge: 31536000, // in prod env, 0 in other envs
  };

  config.uploadOption = {
    dir: path.resolve(appInfo.baseDir, './upload_files'),
  };

  config.multipart = {
    fileSize: '50mb',
    mode: 'stream',
    fileExtensions: ['.xls', '.txt', '.jpg', '.jpeg', '.mp3', '.zip', '.chm'],
  };

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
