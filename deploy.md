# 佛典代码部署步骤

服务部署分为两步，第一步准备mysql数据库及数据，第二步进行服务的部署

## 1. mysql安装及数据导入

1. 安装Mysql 5.6.28（或者临近的版本，比如5.7.x）并进行初始密码的设置，注意这个用户名和密码要记下来
2. 从项目根目录下的sql-data目录中，复制出全部七个sql脚本
3. 在windows的命令行中执行数据库连接命令```mysql -h 127.0.0.1 -P3306 -uroot -pabcdef; ```来开启本地mysql服务器，其中，root这几个字符，替换成mysql的用户名；abcdef这几个字符，替换成mysql的数据库密码；127.0.0.1替换成服务器ip；3306替换成mysql的密码
4. 数据库连接成功后，执行数据库创建命令：```create database buddhapedia;```
5. 执行数据导入命令，将第二步中复制的几个sql脚本里面的数据导入到buddhapedia这个数据库中，具体命令行如：

```mysql -h 127.0.0.1 -P3306 -uroot -pabcdef buddhapedia < ./buddhapedia.scripture_descriptions.sql```

上面这条命令导入的就是**当前文件夹下**的`buddhapedia.scripture_descriptions.sql`这个sql脚本里的数据，注意这个脚本的位置，你在哪个文件夹下启动命令行的，就要把脚本复制到哪个文件夹下，以防找不到sql脚本导致导入失败

## 2. 服务部署

1. 安装Node.js最新版，https://nodejs.org/en/；安装yarn, ```npm i -g yarn```
2. 安装依赖，需要一个一个安装，否则会由于目标服务器并发下载数量的限制而安装失败:
```yarn install egg```
```yarn install egg-scripts```
```yarn install egg-sequelize```
```yarn install dayjs lodash md5 mysql2 request request-promise```
3. 不能用egg-scripts启动，因为不支持windows，只能用pm2
4. pm2用yarn```安装成功后不可用```，需要在一台windows电脑上下载下来后```手动复制到windows服务器上```，代码源目录下的module-sources/global-modules.zip是pm2的模块文件，module-sources/npm.zip是pm2源文件的注册相关文件，分别复制到```c:\Users\Administrator\AppData\Roaming\npm\node_modules```及```c:\Users\Administrator\AppData\Roaming\npm```下解压
4. 启动: ```npm start```

#### 注意事项

1. 新版佛典网站，会依赖老版佛典网站的数据，具体就是原网站中**可下载的所有数据数据**，所以意味着***老版本的网站的zip包、chm文件、图像文件、音频文件、视频文件还不能删除***，因为这些文件暂时没办法保存到数据库中，仍然要保存在原来的服务器的磁盘中
2. 假设新版佛典网站的域名为http://www.fodian.net ，那么新版佛典网站的web端、移动端和管理端的访问方式分别为：http://www.fodian.net:7001/pc/index.html，http://www.fodian.net:7001/wap/index.html，http://www.fodian.net:7001/admin/index.html
3. web端和移动端的访问，基本不涉及到db的增删改，所以相对安全些；但是管理端会需要管理员能珍惜网站的数据，不要随便做删除和修改操作，新增数据的时候，最好也联系下```于洪松```来解决