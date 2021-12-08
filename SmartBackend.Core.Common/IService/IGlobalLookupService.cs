using SmartBackend.Model;
using SmartBackend.Model.ViewModelDB;
using SmartBackend.Repository.Helpers;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Core.Common.IService
{
    public interface IGlobalLookupService
    {
        //GlobalLookupViewModel GetById(Guid id);
        //GlobalLookupViewModel GetByIdAndByLocale(Guid id, string locale);          
        Result<SpTransactionMessage> Create(GlobalLookupCreateDbViewModel tfc);
        Result<SpTransactionMessage> Update(GlobalLookupUpdateDbViewModel tfc);
        Result<SpTransactionMessage> Delete(GlobalLookupDeleteDbViewModel tfd);
    }
}
