using System;
using System.Collections.Generic;
using System.Text;

namespace SQLDatabaseQueryContainer
{
    public static class GlobalLookupQueries
    {
        public static readonly string StoreProcSelectById = "spGlobalLookupSelectById";
        public static readonly string StoreProcSelectAll = "spGlobalLookupSelectAll";
        public static readonly string StoreProcSelectAllByGlobalLookupTypeId = "spGlobalLookupSelectAllByGlobalLookupTypeId";
        public static readonly string StoreProcSelectAllByParentId = "spGlobalLookupSelectAllByParentId";
        public static readonly string StoreProcInsert = "spGlobalLookupInsert";
        public static readonly string StoreProcUpdate = "spGlobalLookupUpdate";
        public static readonly string StoreProcDelete = "spGlobalLookupDelete";
    }
}
