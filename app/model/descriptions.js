'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Descriptions',
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
      content: {
        type: DataTypes.STRING(),
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
      tableName: 'scripture_descriptions',
    }
  );

  Model.associate = function () {};

  return Model;
};
