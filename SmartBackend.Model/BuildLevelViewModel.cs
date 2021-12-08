using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SmartBackend.Model
{
    public class BuildLevelViewModel
    {
        public Guid Id { get; set; }
        public Guid? TenantId { get; set; }
        public bool? IsDeleted { get; set; }

        // public bool? IsActive { get { return !this.IsDeleted; } set { value = !this.IsDeleted; } }
        public Guid UserCreatedById { get; set; }
        public DateTime CreatedOn { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Locale { get; set; }
        public Guid? UserModifiedById { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string DefaultLocale { get; set; }
        public string RowType
        {
            get
            {
                return "BuildLevel";
            }
        }
    }

    public class BuildLevelInsertDbViewModel
    {
        public Guid Id { get; set; }
        public Guid? TenantId { get; set; }
        public bool? IsDeleted { get; set; }
        public Guid UserCreatedById { get; set; }
        public DateTime CreatedOn { get; set; }
        [Required]
        public string Name { get; set; }

        public string Description { get; set; }
        public string Locale { get; set; }
        public Guid? UserModifiedById { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string DefaultLocale { get; set; }
    }

    public class BuildLevelUpdateDbViewModel
    {
        [Required]
        public Guid? Id { get; set; }
        public Guid? TenantId { get; set; }
        public bool? IsDeleted { get; set; }
        [Required]
        public string Name { get; set; }

        public string Description { get; set; }
        public string Locale { get; set; }
        public Guid? UserModifiedById { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string DefaultLocale { get; set; }
    }
}
