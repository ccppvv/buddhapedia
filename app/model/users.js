'use strict';
module.exports = (app) => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Users',
    {
      username: {
        type: DataTypes.STRING(32),
        allowNull: false,
        defaultValue: '',
      },
      password: {
        type: DataTypes.STRING(128),
        allowNull: false,
        defaultValue: '',
      },
      code: {
        type: DataTypes.STRING(128),
        allowNull: false,
        defaultValue: '',
      },
    },
    {
      tableName: 'users',
      timestamps: false,
    }
  );

  Model.associate = function () {};

  return Model;
};
