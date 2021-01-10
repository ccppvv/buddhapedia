'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Resources',
    {
      id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: '0',
        autoIncrement: true,
        primaryKey: true,
      },
      pid: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: '0',
      },
      page: {
        type: DataTypes.STRING(256),
        defaultValue: '',
        allowNull: false,
      },
      order: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0,
      },
      name: {
        type: DataTypes.STRING(256),
        allowNull: false,
      },
      link: {
        type: DataTypes.STRING(512),
        allowNull: false,
        defaultValue: 0,
      },
      tip: {
        type: DataTypes.STRING(256),
        allowNull: true,
        defaultValue: '',
      },
    },
    {
      tableName: 'scripture_resources',
    }
  );

  Model.associate = function () {};

  return Model;
};
