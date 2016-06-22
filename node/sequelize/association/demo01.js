'use strict';

const Seq = require('sequelize');
const co = require('co');
const seq = new Seq('mysql://root:@127.0.0.1:3306/sequelize_test', {
  define: {
    freezeTableName: true
  }
});

const User = seq.define('user', {
  name: Seq.STRING
});
const Task = seq.define('task', {
  name: Seq.STRING
});
const Tool = seq.define('tool', {
  name: Seq.STRING
});

Task.belongsTo(User);
User.hasMany(Task);
User.hasMany(Tool, {
  as: 'Instruments'
});

const main = co.wrap(function*() {
  yield seq.sync();
  console.log('sync done');

  {
    const sql = 'SELECT `task`.`id`, `task`.`name`, `task`.`createdAt`, `task`.`updatedAt`, `task`.`userId`, `user`.`id` AS `user.id`, `user`.`name` AS `user.name`, `user`.`createdAt` AS `user.createdAt`, `user`.`updatedAt` AS `user.updatedAt` FROM `task` AS `task` LEFT OUTER JOIN `user` AS `user` ON `task`.`userId` = `user`.`id`;';
    const records = yield Task.findAll({
      include: [User]
    });
    console.log(records);
  }
});

main().catch(console.error);