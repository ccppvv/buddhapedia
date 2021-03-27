'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Dicts',
    {
      id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: '0',
        autoIncrement: true,
        primaryKey: true,
      },
      name: {
        type: DataTypes.STRING(256),
        defaultValue: '',
        allowNull: false,
      },
      author: {
        type: DataTypes.STRING(256),
        allowNull: false,
        defaultValue: '',
      },
      version: {
        type: DataTypes.STRING(256),
        allowNull: false,
        defaultValue: '',
      },
      language: {
        type: DataTypes.STRING(256),
        allowNull: false,
      },
      memo: {
        type: DataTypes.STRING(512),
        allowNull: false,
        defaultValue: 0,
      },
      updated_at: {
        type: DataTypes.STRING(256),
        allowNull: true,
        defaultValue: '',
      },
    },
    {
      tableName: 'dictionary_dicts',
      timestamps: false
    }
  );

  Model.associate = function () {};

  return Model;
};
