const pump = require('mz-modules/pump');
const path = require('path');
const { v4: uuid  } = require('uuid')
const fs = require('fs');
const Controller = require('egg').Controller;

const fileTypeList = ['image', 'video', 'audio', 'other'];
class FilesController extends Controller {
  async create() {
    const parts = this.ctx.multipart();
    const files = [];
    let fileType = '';
    let resourceType = '';
    let resourceId = '';

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
        }
        continue;
      } else {
        if (!stream.filename) {
          continue;
        }
        const extname = path.extname(stream.filename);
        const filename = `${uuid()}${extname}`;
        const target = path.join(
          this.config.baseDir,
          `/upload_files/${fileType}`,
          filename
        );
        if (fs.existsSync(target)) {
          fs.unlinkSync(target);
        }
        const writeStream = fs.createWriteStream(target);
        await pump(stream, writeStream);
        files.push(path.join(`upload_files/${fileType}`, filename));
      }
    }
    if (!resourceId || !resourceType || !fileType || !files.length) {
      this.ctx.body = {
        code: -1,
        message: 'resourceId、resourceType、fileType及文件必传！',
      };
      return;
    }
    await this.ctx.service.files.add({
      resource_id: resourceId,
      resource_type: resourceType,
      file_type: fileType,
      file_names: files.join(','),
    });
    this.ctx.body = {
      code: 0,
      data: files,
      message: '上传文件成功',
    };
  }

  async destroy() {
    const ctx = this.ctx;
    const {
      service,
      params: { id },
      request: { body }
    } = ctx;
    const { resourceType: resource_type } = body;
    if (!id) {
      ctx.body = {
        code: 0,
        message: '参数错误：id必填！',
      };
      return;
    }
    ctx.body = await service.files.delete({ id, resource_type});
  }
}
module.exports = FilesController;
