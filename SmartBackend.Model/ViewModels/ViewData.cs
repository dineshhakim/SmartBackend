using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Model.ViewModels
{
    public class ViewData : IViewModel
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
    }
    public class MultiSelectViewData : IMultiViewData
    {
        public string Label { get; set; }
        public Guid? Value { get; set; }
    }
}
