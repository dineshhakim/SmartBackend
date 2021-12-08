using SmartBackend.Model;
using SmartBackend.Repository.Helpers;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Repository
{
    public interface IBuildLevelRepository
    {
        Result<SpTransactionMessage> Create(BuildLevelInsertDbViewModel viewModel);
    }
}
