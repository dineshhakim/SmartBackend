using SmartBackend.Model;
using SmartBackend.Repository.Helpers;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Core.Common.IService
{
    public interface IBuildLevelService
    {

        IEnumerable<BuildLevelViewModel> GetAll(Guid tenantId, string locale);
        IEnumerable<BuildLevelViewModel> GetAll(string locale);

        Result<SpTransactionMessage> Create(BuildLevelInsertDbViewModel tfc, User currentUser);
        Result<SpTransactionMessage> Update(BuildLevelUpdateDbViewModel tfc, User currenUser);
        Result<SpTransactionMessage> Delete(BuildLevelUpdateDbViewModel tfd, User currentUser);

    }
}
