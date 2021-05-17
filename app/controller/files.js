const pump = require('mz-modules/pump');
const path = require('path');
const md5 = require('md5');
const fs = require('fs');
const shell = require('shelljs');
const Controller = require('egg').Controller;

const fileTypeList = ['image', 'video', 'audio', 'other'];
class FilesController extends Controller {
  async find() {
    const ctx = this.ctx;
    const { resourceId, resourceType } = ctx.queries;
    const row = { resource_id: resourceId, resource_type: resourceType };
    ctx.body = await this.ctx.service.files.find(row);
    return ctx.body;
  }

  async create() {
    const parts = this.ctx.multipart();
    let fileType = '';
    let resourceType = '';
    let resourceId = '';
    let dirSeq = '';

    const files = [];
    let stream;
    while ((stream = await parts()) != null) {
      if (stream.length) {
        // 非文件类型的字段：fileType、resourceType、resourceId
        const fieldName = stream[0];
        const fieldValue = stream[1];
        if (fieldName == 'fileType') {
          fileType = fieldValue;
          if (!fileTypeList.includes(fileType)) {
            this.ctx.body = {
              code: -1,
              message: '不支持的文件类型',
            };
            break;
          }
        } else if (fieldName === 'resourceType') {
          resourceType = fieldValue;
        } else if (fieldName === 'resourceId') {
          resourceId = fieldValue;
        } else if (fieldName === 'fileRank') {
          dirSeq = fieldValue;
        }
        continue;
      } else {
        if (!stream.filename) {
          continue;
        }
        const extname = path.extname(stream.filename);
        const filename = `${md5(stream.filename)}${extname}`;
        const fullPath = path.join(
          this.config.baseDir,
          `/upload_files/${fileType}`,
          dirSeq.split(',').join('/'),
        );
        files.push(filename);
        if (!fs.existsSync(fullPath)) {
          shell.mkdir('-p', fullPath);
        }
        const target = path.join(fullPath, filename);
        if (fs.existsSync(target)) {
          fs.unlinkSync(target);
        }
        const writeStream = fs.createWriteStream(target);
        await pump(stream, writeStream);
        try {
          await this.ctx.service.files.add({
            resource_id: resourceId,
            resource_type: resourceType,
            file_type: fileType,
            file_name: stream.filename,
            file_hash: path.join(
              `/upload_files/${fileType}`,
              dirSeq.split(',').join('/'),
              filename
            ),
          });
        } catch (error) {
          this.ctx.body = {
            code: -1,
            error: error.message,
          };
          return;
        }
      }
    }
    if (
      resourceId === undefined ||
      !resourceType ||
      !fileType ||
      !files.length
    ) {
      this.ctx.body = {
        code: -1,
        message: 'resourceId、resourceType、fileType及文件必传！',
      };
      return;
    }
    const insertedFiles = await this.ctx.service.files
      .find({
        resource_id: resourceId,
        resource_type: resourceType,
      });
    this.ctx.body = {
      code: 0,
      data: insertedFiles,
      message: '上传文件成功',
    };
  }

  async destroy() {
    const ctx = this.ctx;
    const {
      service,
      params: { id },
      request: { body },
    } = ctx;
    const { resourceType: resource_type } = body;
    if (!id) {
      ctx.body = {
        code: 0,
        message: '参数错误：id必填！',
      };
      return;
    }
    ctx.body = await service.files.delete({ id, resource_type });
  }

  async delete() {
    const ctx = this.ctx;
    const {
      params: { filename },
      request: { body },
    } = ctx;
    const { fileType } = body;
    if (!filename || !fileType) {
      ctx.body = {
        code: 0,
        message: '参数错误：filename/fileType字段必填！',
      };
      return;
    }
    try {
      const target = path.join(
        this.config.baseDir,
        'upload_files',
        fileType,
        filename
      );
      fs.unlinkSync(target);
      this.ctx.service.files.delete({file_hash: filename, fileType})
    } catch (error) {
      this.ctx.logger.error('File unlink error: ', error.message);
      this.ctx.body = {
        code: -1,
        message: `删除文件失败，Error: ${error.message}`,
      };
      return;
    }
    this.ctx.body = {
      code: 0,
      message: '删除成功',
    };
  }
}
module.exports = FilesController;
