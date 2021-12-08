using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace SmartBackend.Repository
{
    public class TraceBase
    {
        protected void Trace(string message, string category, params object[] args)
        {
            //if (HttpContext.Current != null)
            //{
            //    if (HttpContext.Current.Trace.IsEnabled)
            //    {
            //        HttpContext.Current.Trace.Write(category, String.Format(message, args));
            //    }
            //}
            //else
            //{
            //    // do some other tracing maybe
            //}
        }
    }
}
