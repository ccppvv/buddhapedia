/* indent size: 2 */
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
    },
    {
      tableName: 'scripture_divisions',
    }
  );

  Model.associate = function () {};

  return Model;
};
