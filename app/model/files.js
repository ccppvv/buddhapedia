'use strict';
module.exports = (app) => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Files',
    {
      id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: '0',
        autoIncrement: true,
        primaryKey: true,
      },
      resource_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: '0',
      },
      resource_type: {
        type: DataTypes.STRING(32),
        allowNull: false,
        defaultValue: '',
      },
      file_type: {
        type: DataTypes.STRING(32),
        allowNull: false,
        defaultValue: '',
      },
      file_name: {
        type: DataTypes.STRING(1024),
        allowNull: false,
        defaultValue: '',
      },
      file_hash: {
        type: DataTypes.STRING(128),
        allowNull: false,
        defaultValue: '',
      },
    },
    {
      tableName: 'scripture_files',
    }
  );

  Model.associate = function () {};

  return Model;
};
