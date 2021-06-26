'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);
  router.post('/api/login', controller.users.login);
  router.post('/api/resetPwd', controller.users.resetPwd);
  router.post('/api/sendVerifyCode', controller.users.sendVerifyCode);
  router.resources('express', '/api/home/express', controller.home.express);
  // 一级目录
  router.resources('directories', '/api/directories', controller.directories);
  // 二级目录
  router.resources('divisions', '/api/divisions', controller.divisions);
  // 带下载连接的资源信息
  router.resources('resources', '/api/resources', controller.resources);
  // 具体的经文信息
  router.resources('scriptures', '/api/scriptures', controller.scriptures);
  // 详情信息
  router.resources('details', '/api/details', controller.details);
  // 描述信息
  router.resources(
    'descriptions',
    '/api/descriptions',
    controller.descriptions
  );
  // 文件相关接口
  router.delete('/api/files/delete', controller.files.delete);
  router.resources('files', '/api/files', controller.files);
  router.get('/api/files/filenames', controller.files.find);
  router.resources(
    'dictionary-dicts',
    '/api/dicts',
    controller.dicts
  );
  router.resources(
    'dictionary-words',
    '/api/words',
    controller.words
  );
  router.resources(
    'dictionary-view-words',
    '/api/viewwords',
    controller.viewwords
  );
};
