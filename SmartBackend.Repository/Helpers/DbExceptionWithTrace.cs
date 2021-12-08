using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;

namespace SmartBackend.Repository.Helpers
{
    public class DbExceptionWithTrace : Exception
    {
        private IDataParameterCollection _Parameters;
        private string _CommandText;

        private string _Server;
        private string _Database;

        public IDataParameterCollection Parameters
        {
            get
            {
                return _Parameters;
            }
        }

        public string CommandText
        {
            get
            {
                return _CommandText;
            }
        }

        public string Server
        {
            get
            {
                return _Server;
            }
        }

        public string Database
        {
            get
            {
                return _Database;
            }
        }

        public DbExceptionWithTrace(Exception ex, string commandText, IDataParameterCollection parameters, IDbConnection conn)
            : base(ex.Message, ex)
        {
            _Parameters = parameters;
            _CommandText = commandText;

            SetConnectionAttributes(conn);
        }

        public DbExceptionWithTrace(string message, Exception ex, string commandText, IDataParameterCollection parameters, IDbConnection conn)
            : base(message, ex)
        {
            _Parameters = parameters;
            _CommandText = commandText;

            SetConnectionAttributes(conn);
        }

        private void SetConnectionAttributes(IDbConnection conn)
        {
            if (conn != null)
            {
                try
                {
                    DbConnectionStringBuilder bldr = new DbConnectionStringBuilder();
                    bldr.ConnectionString = conn.ConnectionString;
                    _Server = (string)bldr["data source"];
                    _Database = (string)bldr["initial catalog"];
                }
                catch (Exception)
                {
                    // ignore
                }
            }
        }
    }
}
