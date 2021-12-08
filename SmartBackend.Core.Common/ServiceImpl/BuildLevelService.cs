using SmartBackend.Core.Common.IService;
using SmartBackend.Model;
using SmartBackend.Repository;
using SmartBackend.Repository.Helpers;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Core.Common.ServiceImpl
{
    public class BuildLevelService : IBuildLevelService
    {
        private readonly IBuildLevelRepository _repository;

        public BuildLevelService(IBuildLevelRepository buildLevelRepository)
        {
            _repository = buildLevelRepository;
        }

        public Result<SpTransactionMessage> Create(BuildLevelInsertDbViewModel tfc, User currentUser)
        {
            return _repository.Create(tfc);
        }

        public Result<SpTransactionMessage> Delete(BuildLevelUpdateDbViewModel tfd, User currentUser)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<BuildLevelViewModel> GetAll(Guid tenantId, string locale)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<BuildLevelViewModel> GetAll(string locale)
        {
            throw new NotImplementedException();
        }

        public Result<SpTransactionMessage> Update(BuildLevelUpdateDbViewModel tfc, User currenUser)
        {
            throw new NotImplementedException();
        }
    }
}
