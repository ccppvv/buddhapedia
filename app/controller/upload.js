const pump = require('mz-modules/pump');
const path = require('path');
const fs = require('fs');
const Controller = require('egg').Controller;

const fileTypeList = ['image', 'video', 'audio', 'other'];
class UploadController extends Controller {
  async index() {
    const parts = this.ctx.multipart();
    const files = [];
    let fileType = '';

    let stream;
    while ((stream = await parts()) != null) {
      if (stream.length) {
        const fieldName = stream[0];
        const fieldValue = stream[1];
        if (fieldName == 'fileType') {
          fileType = fieldValue;
          if (!fileTypeList.includes(fileType)) {
            break;
          }
        }
        continue;
      } else {
        if (!stream.filename) {
          continue;
        }
        console.log('field: ' + stream.fieldname);
        console.log('filename: ' + stream.filename);
        console.log('encoding: ' + stream.encoding);
        console.log('mime: ' + stream.mime);
        const filename = stream.filename;
        const target = path.join(
          this.config.baseDir,
          `upload_files/${fileType}`,
          filename
        );
        const writeStream = fs.createWriteStream(target);
        await pump(stream, writeStream);
        files.push(filename);
      }
    }

    this.ctx.body = {
      code: 0,
      data: files,
      message: '上传文件成功',
    };
  }
}
module.exports = UploadController;
