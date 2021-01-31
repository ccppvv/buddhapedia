'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Details',
    {
      id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: '0',
        autoIncrement: true,
        primaryKey: true,
      },
      page: {
        type: DataTypes.STRING(32),
        allowNull: false,
        defaultValue: '',
      },
      type: {
        type: DataTypes.STRING(64),
        allowNull: false,
        defaultValue: '',
      },
      from: {
        type: DataTypes.STRING(32),
        allowNull: false,
        defaultValue: '0',
      },
      content: {
        type: DataTypes.STRING(2048),
        allowNull: false,
        defaultValue: '',
      },
      order: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: '',
      },
    },
    {
      tableName: 'scripture_details',
    }
  );

  Model.associate = function () {};

  return Model;
};
