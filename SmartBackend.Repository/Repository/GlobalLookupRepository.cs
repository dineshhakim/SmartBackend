using Dapper;
using SmartBackend.Model;
using SmartBackend.Model.ViewModelDB;
using SmartBackend.Model.ViewModels;
using SmartBackend.Repository.CoreInterfaces;
using SmartBackend.Repository.Helpers;
using SQLDatabaseQueryContainer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace SmartBackend.Repository.Repository
{

    public class GlobalLookupRepository : IGlobalLookupRepository
    {
        private IDbHelper _dbHelper;
        public GlobalLookupRepository(IDbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }


        public GlobalLookupViewModel GetById(Guid id, string locale)
        {
            var dapper = _dbHelper.GetDbConnection(_dbHelper.DatabaseTitanDB);
            return
                dapper.Query<GlobalLookupViewModel>(GlobalLookupQueries.StoreProcSelectById, new { Id = id, Locale = locale, DefaultLocale= locale }, null, true, null,
                    CommandType.StoredProcedure).FirstOrDefault();
        }

        public IEnumerable<GlobalLookupViewModel> GetAll(string locale)
        {
            var dapper = _dbHelper.GetDbConnection(_dbHelper.DatabaseTitanDB);
            return
                dapper.Query<GlobalLookupViewModel>(GlobalLookupQueries.StoreProcSelectAll, new
                {
                    Locale = locale,
                    DefaultLocale = locale
                }, null, true, null,
                    CommandType.StoredProcedure);

        }



        public IEnumerable<GlobalLookupViewModel> GetByGlobalLookupTypeId(Guid GlobalLookupTypeId, string locale, Guid TenantId)
        {
            var dapper = _dbHelper.GetDbConnection(_dbHelper.DatabaseTitanDB);
            return
                dapper.Query<GlobalLookupViewModel>(GlobalLookupQueries.StoreProcSelectAllByGlobalLookupTypeId, new
                {
                    Locale = locale,
                    DefaultLocale = locale,
                    @GlobalLookupTypeId = GlobalLookupTypeId,
                    @TenantId = TenantId
                }, null, true, null,
                    CommandType.StoredProcedure);
        }
        public IEnumerable<GlobalLookupViewModel> GetByParentId(Guid ParentId, string locale, Guid TenantId)
        {
            var dapper = _dbHelper.GetDbConnection(_dbHelper.DatabaseTitanDB);
            return
                dapper.Query<GlobalLookupViewModel>(GlobalLookupQueries.StoreProcSelectAllByParentId, new
                {
                    Locale = locale,
                    DefaultLocale = locale,
                    @ParentId = ParentId,
                    @TenantId = TenantId
                }, null, true, null,
                    CommandType.StoredProcedure);
        }


        public Result<SpTransactionMessage> Create(GlobalLookupCreateDbViewModel viewModel)
        {
            return _dbHelper.ExecuteQuery(GlobalLookupQueries.StoreProcInsert,
              new
              {
                  @Id = viewModel.Id,
                  @GlobalLookupTypeId = viewModel.LookupTypeId,
                  @ParentId = viewModel.ParentValue,
                  @UserCreatedById = viewModel.UserCreatedById,
                  @CreatedOn = viewModel.CreatedOn,
                  @Name = viewModel.Name,
                  @Description = viewModel.Description,
                  @Locale = viewModel.Locale,
                  @DefaultLocale = viewModel.DefaultLocale,
                  @TenantId = viewModel.TenantId
              },
              CommandType.StoredProcedure);
        }

        public Result<SpTransactionMessage> Update(GlobalLookupUpdateDbViewModel viewModel)
        {
            return _dbHelper.ExecuteQuery(GlobalLookupQueries.StoreProcUpdate,
               new
               {
                   @Id = viewModel.Id,
                   @GlobalLookupTypeId = viewModel.LookupTypeId,
                   @ParentId = viewModel.ParentValue,
                   @IsDeleted = viewModel.IsDeleted,
                   @Name = viewModel.Name,
                   @Description = viewModel.Description,
                   @Locale = viewModel.Locale,
                   @UserModifiedById = viewModel.UserModifiedById,
                   @ModifiedOn = viewModel.ModifiedOn
               },
               CommandType.StoredProcedure);
        }

        public Result<SpTransactionMessage> Delete(GlobalLookupDeleteDbViewModel deleteViewModel)
        {
            //Sp is not created for Delete
            return _dbHelper.ExecuteQuery(GlobalLookupQueries.StoreProcDelete,
                deleteViewModel,
                CommandType.StoredProcedure);
        }
    }

}

