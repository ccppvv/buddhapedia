'use strict';
module.exports = app => {
  const DataTypes = app.Sequelize;

  const Model = app.model.define(
    'Words',
    {
      id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0,
        autoIncrement: true,
        primaryKey: true,
      },
      dictid: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0,
        primaryKey: true,
      },
      word: {
        type: DataTypes.STRING(256),
        defaultValue: '',
        allowNull: false,
      },
      content: {
        type: DataTypes.STRING(1024),
        allowNull: false,
        defaultValue: '',
      },
    },
    {
      tableName: 'dictionary_items',
      timestamps: false
    }
  );
  Model.associate = function () {
    app.model.Words.belongsTo(app.model.Dicts, { foreignKey: 'dictid', targetKey: 'id'})
  };

  return Model;
};
