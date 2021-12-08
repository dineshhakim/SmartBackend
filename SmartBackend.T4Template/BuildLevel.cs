using System;
 
namespace Your.Namespace.Here
{
    /// <summary>
    /// Represents a BuildLevel.
    /// NOTE: This class is generated from a T4 template - you should not modify it manually.
    /// </summary>
    public class BuildLevel 
    {
        public Guid Id { get; set; }
 
        public Guid? TenantId { get; set; }
 
        public bool? IsDeleted { get; set; }
 
        public Guid UserCreatedById { get; set; }
 
        public Guid BuildLevelId { get; set; }
 
        public string Name { get; set; }
 
        public string Description { get; set; }
 
        public string Locale { get; set; }
 
        public Guid? UserModifiedById { get; set; }
 
    }
}      
