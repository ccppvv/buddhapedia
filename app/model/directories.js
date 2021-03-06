'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Directories',
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
      name: {
        type: DataTypes.STRING(512),
        allowNull: true,
      },
      order: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue: 0,
      },
      page: {
        type: DataTypes.STRING(256),
        defaultValue: '',
        allowNull: false,
      },
      resource_type: {
        type: DataTypes.STRING(32),
        defaultValue: '',
        allowNull: false,
      }
    },
    {
      tableName: 'scripture_directories',
    }
  );

  Model.associate = function () {};

  return Model;
};
