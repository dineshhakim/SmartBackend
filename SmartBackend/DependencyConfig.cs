using Microsoft.Extensions.DependencyInjection;
using SmartBackend.Core.Common.IService;
using SmartBackend.Core.Common.ServiceImpl;
using SmartBackend.Repository;
using SmartBackend.Repository.CoreInterfaces;
using SmartBackend.Repository.Helpers;
using SmartBackend.Repository.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmartBackend
{
    public class DependencyConfig
    {
        public static void ConfigureServices(IServiceCollection services)
        {
            services.AddScoped<IDbHelper, DbHelper>();            
            services.AddScoped<IGlobalLookupService, GlobalLookupService>();
            services.AddScoped<IGlobalLookupRepository, GlobalLookupRepository>();
        }

    }
}
