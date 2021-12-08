using Dapper;
using SmartBackend.Model;
using SmartBackend.Repository.Helpers;
using SQLDatabaseQueryContainer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace SmartBackend.Repository
{
    public class BuildLevelRepository : IBuildLevelRepository
    {
        protected IDbHelper _dbHelper;
        private const string CacheRegion = "BuildLevel";
        public BuildLevelRepository(IDbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public IEnumerable<BuildLevelViewModel> GetAll(string locale)
        {
            var dapper = _dbHelper.GetDbConnection(_dbHelper.DatabaseTitanDB);
            return dapper.Query<BuildLevelViewModel>(BuildLevelQueries.StoreProcGetAllByLocale, new { @locale = locale, @defaultLocale = locale },
                null, true, null, CommandType.StoredProcedure).Where(x => x.Name != null);
        }

        public Result<SpTransactionMessage> Create(BuildLevelInsertDbViewModel buildLevelDbViewModel)
        {
            var spTransactionMessage = _dbHelper.ExecuteQuery(BuildLevelQueries.StoreProcInsert,
                buildLevelDbViewModel,
                CommandType.StoredProcedure);
            return spTransactionMessage;

        }

        public Result<SpTransactionMessage> Update(BuildLevelUpdateDbViewModel buildLevelDbViewModel)
        {
            var spTransactionMessage = _dbHelper.ExecuteQuery(BuildLevelQueries.StoreProcUpdate,
                new { buildLevelDbViewModel.Id, buildLevelDbViewModel.Name, buildLevelDbViewModel.Description, buildLevelDbViewModel.Locale, buildLevelDbViewModel.ModifiedOn, buildLevelDbViewModel.UserModifiedById, buildLevelDbViewModel.IsDeleted },
                CommandType.StoredProcedure);
            return spTransactionMessage;
        }

    }
}
