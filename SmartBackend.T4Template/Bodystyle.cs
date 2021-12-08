using System;
 
namespace Your.Namespace.Here
{
    /// <summary>
    /// Represents a Bodystyle.
    /// NOTE: This class is generated from a T4 template - you should not modify it manually.
    /// </summary>
    public class Bodystyle 
    {
        public Guid Id { get; set; }
 
        public string Name { get; set; }
 
        public string Description { get; set; }
 
        public Guid UserCreatedById { get; set; }
 
        public bool IsDeleted { get; set; }
    }
}      
