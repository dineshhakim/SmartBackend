using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Model.ViewModels
{
    public interface IViewModel
    {
        bool IsSuccess { get; set; }
        string Message { get; set; }
    }

    public interface IMultiViewData
    {
        string Label { get; set; }
        Guid? Value { get; set; }
    }
}
