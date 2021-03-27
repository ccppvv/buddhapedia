'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Viewwords',
    {
      id: {
        type: DataTypes.INTEGER(9),
        allowNull: false,
        defaultValue: 0,
        autoIncrement: true,
        primaryKey: true,
      },
      dictid: {
        type: DataTypes.INTEGER(9),
        allowNull: false,
        defaultValue: 0,
        primaryKey: true,
      },
      title: {
        type: DataTypes.STRING(256),
        defaultValue: '',
        allowNull: false,
      },
      content: {
        type: DataTypes.TEXT,
        allowNull: false,
        defaultValue: '',
      },
      dict_name: {
        type: DataTypes.STRING(128),
        allowNull: false,
        defaultValue: '',
      },
      author: {
        type: DataTypes.STRING(128),
        allowNull: false,
        defaultValue: '',
      },
    },
    {
      tableName: 'dictionary_view_items',
      timestamps: false
    }
  );

  return Model;
};
