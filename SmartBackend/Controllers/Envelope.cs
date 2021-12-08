using SmartBackend.Model.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmartBackend.Controllers
{
    public class Envelope : Envelope<string>
    {
        protected Envelope(string errorMessage)
            : base(string.Empty, errorMessage)
        {
        }

        public Envelope(string errorMessage, bool isSuccess) : base(errorMessage, isSuccess)
        {
        }

        public static Envelope<T> Ok<T>(T result)
        {
            return new Envelope<T>(result, string.Empty);
        }
        public static Envelope<T> Ok<T>(T result, string message, bool isSuccess)
        {
            return new Envelope<T>(result, message, isSuccess);
        }
        public static Envelope Ok(IViewModel viewModel)
        {
            return new Envelope(viewModel.Message, viewModel.IsSuccess);
        }
        public static Envelope Ok()
        {
            return new Envelope(string.Empty);
        }

        public static Envelope Error(string errorMessage)
        {
            return new Envelope(errorMessage);
        }
    }
    public class Envelope<T>
    {
        public T Result { get; }
        public string ErrorMessage { get; }
        public DateTime TimeGenerated { get; }
        public bool IsSuccess { get; }

        protected internal Envelope(T result, string errorMessage)
        {
            Result = result;
            ErrorMessage = errorMessage;
            TimeGenerated = DateTime.UtcNow;
        }

        public Envelope(T result, string errorMessage, bool isSuccess)
        {
            Result = result;
            ErrorMessage = errorMessage;
            TimeGenerated = DateTime.UtcNow;
            IsSuccess = isSuccess;
        }
        public Envelope(string errorMessage, bool isSuccess)
        {
            ErrorMessage = errorMessage;
            TimeGenerated = DateTime.UtcNow;
            IsSuccess = isSuccess;
        }
    }
}
