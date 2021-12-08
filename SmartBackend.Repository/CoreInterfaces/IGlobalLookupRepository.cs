using SmartBackend.Model;
using SmartBackend.Model.ViewModelDB;
using SmartBackend.Model.ViewModels;
using SmartBackend.Repository.Helpers;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Repository.CoreInterfaces
{
    public interface IGlobalLookupRepository
    {
       
        GlobalLookupViewModel GetById(Guid id, string locale);
       
        IEnumerable<GlobalLookupViewModel> GetAll(string locale);
       
        IEnumerable<GlobalLookupViewModel> GetByGlobalLookupTypeId(Guid GlobalLookupTypeId, string locale, Guid TenantId);
       
        IEnumerable<GlobalLookupViewModel> GetByParentId(Guid ParentId, string locale, Guid TenantId);
       
        Result<SpTransactionMessage> Create(GlobalLookupCreateDbViewModel viewModel);
       
        Result<SpTransactionMessage> Update(GlobalLookupUpdateDbViewModel viewModel);
       
        Result<SpTransactionMessage> Delete(GlobalLookupDeleteDbViewModel deleteViewModel);
    }
}
