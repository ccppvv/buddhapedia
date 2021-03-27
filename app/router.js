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
  // 详情信息
  router.resources('details', '/api/details', controller.details);
  // 描述信息
  router.resources(
    'descriptions',
    '/api/descriptions',
    controller.descriptions
  );
  // 上传文件方法
  router.delete('/api/files/delete/:filename', controller.files.delete);
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
