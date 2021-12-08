﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using SmartBackend.Model;
using SmartBackend.Repository.Helpers;
using static SmartBackend.Repository.Helpers.DbHelper;

namespace SmartBackend.Repository.Helpers
{
    public interface IDbHelper
    {
        Database DatabaseTitanDB { get; }
        DbParameter CreateParameter(string name, object value);
        void ExecuteNonQuery(Database database, string sqlString, int timeout, params DbParameter[] parameters);
        void ExecuteNonQueryAndForget(Database db, string sqlString, int timeout, params DbParameter[] parameters);
        CommandType GetCommandTypeForSqlString(string sqlString);
        string GetConnectionString(Database db);
        IDbCommand GetDbCommand(Database database);
        DbCommandBuilder GetDbCommandBuilder(Database database);
        IDbConnection GetDbConnection(Database database);
        IDbConnection GetDbConnection();
        DbDataAdapter GetDbDataAdapter(Database database);

        Result<SpTransactionMessage> ExecuteQuery(string sqlQuery, object paramterValues,
            CommandType commandType);
    }
}
