import { Controller } from "stimulus"
const { Wechaty } = require('wechaty');

export default class extends Controller {

  static targets = ["qrcode"]

  initialize() {
    this.bot = ''
    this.init();
  }

  connect() {
    console.log('chatbot')
    // this.element.textContent = "Hello World!"
  }

  init() {
    const name = 'wechat-puppet-wechat';    
    this.bot = new Wechaty({
      name, // generate xxxx.memory-card.json and save login data for the next login
    });
    this.bot.start()
  }

  onScan(qrcode, status) {
    // require('qrcode-terminal').generate(qrcode); // 在console端显示二维码
    // const qrcodeImageUrl = [
    //   'https://wechaty.js.org/qrcode/',
    //   encodeURIComponent(qrcode),
    // ].join('');
    // console.log(qrcodeImageUrl);
  }

  async onLogin(user) {
      console.log(`贴心小助理${user}登录了`);
      // if (config.AUTOREPLY) {
        // console.log(`已开启机器人自动聊天模式`);
      // }
      // 登陆后创建定时任务
      // await initDay();
  }

  onLogout(user) {
    console.log(`小助手${user} 已经登出`);
  }

  get name() {
    return this.qrcodeTarget.value;
  }

  test() {
    bot.on('scan', onScan);
    bot.on('login', onLogin);
    bot.on('logout', onLogout);
    bot
      .start()
      .then(() => console.log('开始登陆微信'))
      .catch((e) => console.error(e));
    }
}