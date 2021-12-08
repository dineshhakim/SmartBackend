using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Model.ViewModelDB
{
    public class DeleteViewModel
    {
        public Guid Id { get; set; }
        public Guid UserModifiedById { get; set; }
        public DateTime ModifiedOn { get; set; }
        public bool IsDeleted { get; set; }
    }
}
