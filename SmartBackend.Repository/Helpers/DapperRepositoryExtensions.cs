using Dapper;
using SmartBackend.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;

namespace SmartBackend.Repository.Helpers
{
    public static class DapperRepositoryExtensions
    {
         

        public static dynamic FindById(this IDbConnection connection, string sqlQuery, object id,
            CommandType commandType = CommandType.Text)
        {
            return connection.Query(sqlQuery, new { Id = id }, commandType: commandType).FirstOrDefault();
        }

        public static Result<SpTransactionMessage> ExecuteQuery(this IDbConnection connection, string sqlQuery,
            object paramterValues,
            CommandType commandType, IDbTransaction transaction = null)
        {
            var result =
                connection.Query<SpTransactionMessage>(sqlQuery, paramterValues, commandType: commandType, transaction: transaction)
                    .FirstOrDefault();

            if ((result != null && result.Success) || result == null)
            {
                return Result.Ok(result ?? new SpTransactionMessage() { Success = true });
            }

            return Result.Fail(result, result.Message);
        }

        public static T ExecuteQuery<T>(this IDbConnection connection, string sqlQuery, object paramterValues,
            CommandType commandType)
        {
            return connection.Query<T>(sqlQuery, paramterValues, commandType: commandType).FirstOrDefault();
        }

       

        const string TenantString = "Tenant";

        private static IEnumerable<PropertyInfo> GetPrimitiveTypeProperties<T>()
        {
            var results = new List<PropertyInfo>();
            var properties = typeof(T).GetProperties();
            properties.ToList().ForEach(p =>
            {
                if (IsPrimitive(p.PropertyType))
                    results.Add(p);
            });
            return results;
        }

        private static bool IsPrimitive(Type t)
        {
            //// quite understand what your definition of primitive type is
            //return new[]
            //{
            //    typeof(string),
            //    typeof(char),
            //    typeof(byte),
            //    typeof(sbyte),
            //    typeof(ushort),
            //    typeof(short),
            //    typeof(uint),
            //    typeof(int),
            //    typeof(ulong),
            //    typeof(long),
            //    typeof(float),
            //    typeof(double),
            //    typeof(decimal),
            //    typeof(DateTime),
            //}.Contains(t);
            return t?.Namespace?.StartsWith("System") ?? false;
        }

        

        public static IDictionary<string, object> ToDictionary(this object obj)
        {
            IDictionary<string, object> result = new Dictionary<string, object>();
            var properties = TypeDescriptor.GetProperties(obj);
            foreach (PropertyDescriptor property in properties)
            {
                result.Add(property.Name, property.GetValue(obj));
            }
            return result;
        }
    }
}
