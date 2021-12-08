using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Model.ViewModels
{
    public class GlobalLookupViewModel
    {
        public Guid Id { get; set; }
        public Guid? LookupTypeId { get; set; }
        public string LookupTypeName { get; set; }
        public Guid? ParentValue { get; set; }
        public string ParentValueName { get; set; }
        public bool IsDeleted { get; set; }
        public Guid UserCreatedById { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid? UserModifiedById { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Locale { get; set; }
        public string DefaultLocale { get; set; }
    }
}
