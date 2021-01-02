/* indent size: 2 */
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
    },
    {
      tableName: 'scripture_directories',
    }
  );

  Model.associate = function () {};

  return Model;
};
