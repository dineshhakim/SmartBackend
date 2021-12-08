using SmartBackend.Controllers;
using SmartBackend.Model;
using SmartBackend.Model.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace SmartBackend
{
    public class SmartBaseController : ControllerBase
    {
        //Hardcoding the userid for demo purposes
        public User CurrentUser
        {
            get
            {
                User u = new User
                {
                    Id = Guid.Parse("3bdc1617-d620-65d0-26ef-000e1090a386"),
                    DefaultLocale = "en-us",
                };
                return u;
            }
        }
      

    }
}
