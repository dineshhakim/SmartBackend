using System;
using System.Collections.Generic;
using System.Text;

namespace SmartBackend.Model
{
    public class User
    {
        public Guid Id { get; set; }

        public string Locale => DefaultLocale;

        public Guid TenantId { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string DisplayName { get; set; }
        public string EmailAddress { get; set; }
        public bool? IsEverLoggedIn { get; set; }
        public bool? SyncFromAD { get; set; }
        public DateTime? LastLoggedOn { get; set; }
        public string DefaultLocale { get; set; }
        public bool? IsDeleted { get; set; }
        public Guid? DepartmentId { get; set; }
        public Guid? DefaultTenantId { get; set; }
        public DateTime? CreatedOn { get; set; }
        public Guid? UserCreatedById { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public Guid? UserModifiedById { get; set; }
        public Guid? UserDeletedById { get; set; }
        public DateTime? DeletedOn { get; set; }
        public string DefaultTimeZoneId { get; set; }

        public List<Guid> Roles { get; set; }


        public string PhoneNumber { get; set; }
        public Guid? RoleId { get; set; }
        public string DefaultTenantName { get; set; }

        public Guid? FunctionGroupId { get; set; }
        public Guid? LicenseTypeId { get; set; }
        public Guid TestFacilityOwnerId { get; set; }
        public Guid? EmployeeTypeId { get; set; }
        public Guid? VendorId { get; set; }
    }
}
