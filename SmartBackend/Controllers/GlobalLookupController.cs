using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SmartBackend.Core.Common.IService;
using SmartBackend.Model.ViewModelDB;
using SmartBackend.Model.ViewModels;
using SmartBackend.Repository.CoreInterfaces;

namespace SmartBackend.Controllers
{
    public class GlobalLookupController : SmartBaseController
    {
        private readonly IGlobalLookupService _globalLookupService;
        private readonly IGlobalLookupRepository _globalLookupRepository;

        public GlobalLookupController(IGlobalLookupService globalLookupService, IGlobalLookupRepository globalLookupRepository)
        {
            _globalLookupService = globalLookupService;
            _globalLookupRepository = globalLookupRepository;
        }
        /// <summary>
        /// Gets all the items that are not deleted.
        /// Note: There is no pagination enabled and it will return all the items.
        /// </summary>
        /// <returns></returns>
        [Route("api/GlobalLookup/GetAll")]
        [HttpGet]
        public ActionResult GetAll()
        {
            var result = _globalLookupRepository.GetAll(CurrentUser.Locale);
            IViewModel viewModel = new ViewData()
            {
                IsSuccess = false,
                Message = " Entity not found"
            };
            if (result == null)
            {
                return Ok(viewModel);
            }

            viewModel.Message = "Success";
            viewModel.IsSuccess = true;
            return Ok(result);

        }

        // GET api/<controller>/5
        /// <summary>
        /// Get GlobalLookup by GlobalLookupTypeId
        /// </summary>
        /// 
        [Route("api/GlobalLookup/GetByGlobalLookupTypeId/{globalLookupTypeId}")]
        [HttpGet]
        public ActionResult GetByGlobalLookupTypeId(Guid globalLookupTypeId)
        {
            var result = _globalLookupRepository.GetByGlobalLookupTypeId(globalLookupTypeId, CurrentUser.Locale, CurrentUser.TenantId);
            IViewModel viewModel = new ViewData()
            {
                IsSuccess = false,
                Message = " Entity not found"
            };
            if (result == null)
            {
                return Ok(viewModel);
            }

            viewModel.Message = "Success";
            viewModel.IsSuccess = true;
            return Ok(result);

        }

        // GET api/<controller>/5
        /// <summary>
        /// Get GlobalLookup By Parent Id
        /// </summary>
        /// 
        [Route("api/GlobalLookup/GetByParentId/{ParentId}")]
        [HttpGet]
        public ActionResult GetByTireParentId(Guid ParentId)
        {
            var result = _globalLookupRepository.GetByParentId(ParentId, CurrentUser.Locale, CurrentUser.TenantId);
            IViewModel viewModel = new ViewData()
            {
                IsSuccess = false,
                Message = " Entity not found"
            };
            if (result == null)
            {
                return Ok(viewModel);
            }

            viewModel.Message = "Success";
            viewModel.IsSuccess = true;
            return Ok(result);

        }


        // GET api/<controller>/5
        /// <summary>
        /// Get GlobalLookup
        /// </summary>
        [Route("api/GlobalLookup/GetById/{id}")]
        [HttpGet]
        public ActionResult GetById(Guid id)
        {
            var result = _globalLookupRepository.GetById(id, CurrentUser.Locale);
            IViewModel viewModel = new ViewData()
            {
                IsSuccess = false,
                Message = " Entity not found"
            };
            if (result == null)
            {
                return Ok(viewModel);
            }

            viewModel.Message = "Success";
            viewModel.IsSuccess = true;
            return Ok(result);

        }

        // POST api/<controller>
        /// <summary>
        /// Create GlobalLookup
        /// </summary>
        [Route("api/GlobalLookup")]
        [HttpPost]
        public ActionResult Post([FromBody] GlobalLookupCreateDbViewModel value)
        {
            value.Id = Guid.NewGuid();
            value.UserCreatedById = CurrentUser.Id;
            value.CreatedOn = DateTime.UtcNow;
            value.Locale = CurrentUser.DefaultLocale;
            value.DefaultLocale = CurrentUser.DefaultLocale;
            value.TenantId = CurrentUser.TenantId;
            var viewData = new ViewData()
            {
                IsSuccess = false,
                Message = "no dice"
            };

            /*if (!ModelState.IsValid)
            {
                viewData.Message = string.Join("; ", ModelState.Values
                    .SelectMany(x => x.Errors)
                    .Select(x => x.ErrorMessage));
                return Ok(viewData);
            }*/

            var result = _globalLookupService.Create(value);

            if (result != null && result.IsSuccess)
            {
                viewData.IsSuccess = true;
                viewData.Message = "Success";
            }
            else
            {
                viewData.IsSuccess = result.IsSuccess;
                viewData.Message = result.Error;
            }
            return Ok(result);
        }


        /// <summary>
        /// Update GlobalLookup
        /// </summary>
        [Route("api/GlobalLookup")]
        [HttpPut]
        public ActionResult Put([FromBody] GlobalLookupUpdateDbViewModel value)
        {
            value.UserModifiedById = CurrentUser.Id;
            value.ModifiedOn = DateTime.UtcNow;
            value.Locale = CurrentUser.DefaultLocale;
            var viewData = new ViewData()
            {
                IsSuccess = false,
                Message = "no dice"
            };

            /*if (!ModelState.IsValid)
            {
                viewData.Message = string.Join("; ", ModelState.Values
                    .SelectMany(x => x.Errors)
                    .Select(x => x.ErrorMessage));
                return Ok(viewData);
            }*/

            var result = _globalLookupService.Update(value);

            if (result != null && result.IsSuccess)
            {
                viewData.IsSuccess = true;
                viewData.Message = "Success";
            }
            else
            {
                viewData.IsSuccess = result.IsSuccess;
                viewData.Message = result.Error;
            }
            return Ok(result);
        }

        /// <summary>
        /// Delete GlobalLookup
        /// </summary>
        [HttpDelete]
        [Route("api/GlobalLookup/Delete/{id}")]
        public ActionResult Delete(Guid id)
        {
            var viewModel = new GlobalLookupDeleteDbViewModel();
            viewModel.Id = id;
            viewModel.UserModifiedById = CurrentUser.Id;
            viewModel.ModifiedOn = DateTime.UtcNow;
            var viewData = new ViewData()
            {
                IsSuccess = false,
                Message = "no dice"
            };

            /*if (!ModelState.IsValid)
            {
                viewData.Message = string.Join("; ", ModelState.Values
                    .SelectMany(x => x.Errors)
                    .Select(x => x.ErrorMessage));
                return Ok(viewData);
            }*/

            var result = _globalLookupService.Delete(viewModel);

            if (result != null && result.IsSuccess)
            {
                viewData.IsSuccess = true;
                viewData.Message = "Success";
            }

            return Ok(result);

        }
    }
}