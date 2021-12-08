using SmartBackend.Core.Common.IService;
using SmartBackend.Model;
using SmartBackend.Model.ViewModelDB;
using SmartBackend.Repository.CoreInterfaces;
using SmartBackend.Repository.Helpers;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Core.Common.ServiceImpl
{
    public class GlobalLookupService : IGlobalLookupService
    {
        private readonly IGlobalLookupRepository _repository;

        public GlobalLookupService(IGlobalLookupRepository repository)
        {
            _repository = repository;
        }

        public Result<SpTransactionMessage> Create(GlobalLookupCreateDbViewModel t)
        {
            return _repository.Create(t);
        }

        public Result<SpTransactionMessage> Update(GlobalLookupUpdateDbViewModel t)
        {
            return _repository.Update(t);
        }


        public Result<SpTransactionMessage> Delete(GlobalLookupDeleteDbViewModel t)
        {
            t.IsDeleted = true;
            return _repository.Delete(t);
        }

        public Result<SpTransactionMessage> Delete(Guid id)

        {
            var t = _repository.GetById(id, "en-us");
            if (t == null)
                return
                    Result.Fail(new SpTransactionMessage
                    {
                        Success = false,
                        Message = @"Object with Id-{id} not found"
                    });


            t.IsDeleted = true;
            return _repository.Delete(new GlobalLookupDeleteDbViewModel { Id = id });

        }
    }
}
