/* indent size: 2 */
'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Express',
    {
      id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: '0',
        primaryKey: true,
      },
      title: {
        type: DataTypes.STRING(512),
        allowNull: true,
      },
      link: {
        type: DataTypes.STRING(255),
        allowNull: true,
        defaultValue: '',
      },
    },
    {
      tableName: 'express',
    }
  );

  Model.associate = function () {};

  return Model;
};
