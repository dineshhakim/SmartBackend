using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Model.ViewModelDB
{
    public class GlobalLookupDbViewModel
    {
        public Guid Id { get; set; }
        public Guid? LookupTypeId { get; set; }
        public Guid? ParentId { get; set; }
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


    public class GlobalLookupCreateDbViewModel
    {
        public Guid Id { get; set; }

        public Guid? LookupTypeId { get; set; }

        public Guid? ParentValue { get; set; }

        public Guid UserCreatedById { get; set; }

        public DateTime CreatedOn { get; set; }

        public Guid? UserModifiedById { get; set; }

        public DateTime? ModifiedOn { get; set; }

        public Guid? TenantId { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string DefaultLocale { get; set; }
        public string Locale { get; set; }

    }


    public class GlobalLookupUpdateDbViewModel
    {
        public Guid Id { get; set; }

        public Guid? LookupTypeId { get; set; }

        public Guid? ParentValue { get; set; }

        public bool IsDeleted { get; set; }

        public Guid? UserModifiedById { get; set; }

        public DateTime? ModifiedOn { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string Locale { get; set; }

    }

    public class GlobalLookupDeleteDbViewModel : DeleteViewModel
    {

    }
}
