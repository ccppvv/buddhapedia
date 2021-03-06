'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Divisions',
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
      order: {
        type: DataTypes.INTEGER,
        allowNull: true,
        defaultValue: 0,
      },
      name: {
        type: DataTypes.STRING(512),
        allowNull: true,
      },
      part: {
        type: DataTypes.STRING(32),
        allowNull: true,
        defaultValue: '',
      },
      range: {
        type: DataTypes.STRING(256),
        defaultValue: '',
        allowNull: true,
      },
      page: {
        type: DataTypes.STRING(256),
        defaultValue: '',
        allowNull: false,
      },
      link: {
        type: DataTypes.STRING(512),
        defaultValue: '',
        allowNull: true,
      },
      resource_type: {
        type: DataTypes.STRING(32),
        defaultValue: '',
        allowNull: false,
      },
      whole_link: {
        type: DataTypes.STRING(4096),
        defaultValue: '',
        allowNull: true,
      }
    },
    {
      tableName: 'scripture_divisions',
    }
  );

  Model.associate = function () {};

  return Model;
};
