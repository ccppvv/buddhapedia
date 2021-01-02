/* indent size: 2 */
'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Scriptures',
    {
      id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: '0',
        autoIncrement: true,
        primaryKey: true,
      },
      number: {
        type: DataTypes.STRING(32),
        allowNull: false,
        defaultValue: '',
      },
      section: {
        type: DataTypes.STRING(32),
        allowNull: false,
        defaultValue: '',
      },
      page: {
        type: DataTypes.STRING(32),
        allowNull: false,
        defaultValue: '',
      },
      name: {
        type: DataTypes.STRING(128),
        allowNull: false,
        defaultValue: '',
      },
      link: {
        type: DataTypes.STRING(512),
        defaultValue: '',
        allowNull: true,
      },
      part_info: {
        type: DataTypes.STRING(32),
        allowNull: false,
        defaultValue: '',
      },
      author_info: {
        type: DataTypes.STRING(128),
        allowNull: false,
        defaultValue: '',
      },
      version_name: {
        type: DataTypes.STRING(128),
        defaultValue: '',
        allowNull: true,
      },
      version_link: {
        type: DataTypes.STRING(128),
        defaultValue: '',
        allowNull: true,
      },
    },
    {
      tableName: 'scripture_scriptures',
    }
  );

  Model.associate = function () {};

  return Model;
};
