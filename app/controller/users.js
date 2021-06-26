const Controller = require('egg').Controller;
const md5 = require('md5');
const nodemailer = require('nodemailer');

class UsersController extends Controller {
  async login() {
    const ctx = this.ctx
    const { username, password } = ctx.request.body;
    try {
      const user = await ctx.model.Users.findOne({
        attributes: ['username', 'password'],
        where: {
          username,
          password: md5(password)
        },
      });
      if (!user) {
        throw new Error( '用户名或密码错误!');
      }
      ctx.body = {
        message: '登录成功!',
        code: 0,
      };
    } catch (error) {
      ctx.body = {
        message: error.message,
        code: -1,
      };
    }
  }
  async resetPwd() {
    const ctx = this.ctx
    const { username, password, verifyCode } = ctx.request.body;
    try {
      const user = await ctx.model.Users.findOne({
        attributes: ['password', 'code'],
        where: {
          username,
        },
      });
      if (!user) {
        throw new Error('未找到该用户!');
      }
      if (!password) {
        throw new Error('密码不允许为空!');
      }
      if (!verifyCode || verifyCode !== user.code) {
        throw new Error('验证码错误，请重新输入!');
      }
      if (!(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/g).test(password)) {
        throw new Error('密码只允许包含字母和数字，长度为8个字符以上，且至少包含一个大写字母、一个小写字母和一个数字!');
      }
      if (user.password === md5(password)) {
        throw new Error('密码与原密码重复!');
      }
    } catch (error) {
      return ctx.body = {
        code: -1,
        message: error.message,
      };
    }
    try {
      await ctx.model.Users.update({ password: md5(password), code: '' }, { where: { username } });
    } catch (error) {
      ctx.body = {
        code: -1,
        message: error.message,
      };
      return;
    }
    ctx.body = {
      message: '重置成功!',
      code: 0,
    };
  }
  async sendVerifyCode() {
    const ctx = this.ctx
    const { username } = ctx.request.body;
    const emailConfig = {
      connectionTimeout: 50000, // 连接超时
      greetingTimeout: 50000, // 取数超时
      host: 'smtp-mail.outlook.com',
      secureConnection: false,
      port: 587,
      tls: {
        ciphers:'SSLv3'
      },
      auth: {
        user: 'buddhapedia@hotmail.com',
        pass: 'Buddha202#1'
      }
    };
    const transporter = nodemailer.createTransport(emailConfig);
    const verifyCode = Math.ceil(Math.random() * 10000);
    try {
      const user = await ctx.model.Users.findOne({
        attributes: ['username'],
        where: {
          username,
        },
      });
      if (!user) {
        throw new Error('未找到当前用户!');
      }
      await ctx.model.Users.update({ code: verifyCode }, { where: { username } });
    } catch (e) {
      return ctx.body = {
        code: -1,
        message: e.message,
      };
    }
    const html = `<div>
      <h4>您的验证码为: ${verifyCode}</h4>
    </div>`;

    try {
      await transporter.sendMail({
        from: 'buddhapedia@hotmail.com',
        to: 'admin@fodian.net',
        subject: '佛典重置验证码',
        html
      });
    } catch (e) {
      return ctx.body = {
        code: -1,
        message: e.message,
      };
    }
    ctx.body = {
      code: 0,
      msg: '发送成功',
    };
  }
}
module.exports = UsersController;
