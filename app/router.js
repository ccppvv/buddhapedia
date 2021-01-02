'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);
  router.resources('express', '/api/home/express', controller.home.express);
  // 一级目录
  router.resources('directories', '/api/directories', controller.directories);
  // 二级目录
  router.resources('divisions', '/api/divisions', controller.divisions);
  // 带下载连接的资源信息
  router.resources('resources', '/api/resources', controller.resources);
  // 具体的经文信息
  router.resources('scriptures', '/api/scriptures', controller.scriptures);
};