using System;
using System.Collections.Generic;
using System.Text;

namespace SQLDatabaseQueryContainer
{
    public static class BuildLevelQueries
    {
        // public static readonly string StoreProcSelectById = "spTestFacilitySelectById";
        public static readonly string StoreProcInsert = "spBuildLevelInsert";

        public static readonly string StoreProcUpdate = "spBuildLevelUpdate";

        public static readonly string StoreProcSelectById = "spBuildLevelSelectById";

        public static string StoreProcGetAllByLocale = "spBuildLevelGetAllByLocale";

        public static readonly string StoreProcGetProjectBuildLevels = "spGetProjectBuildLevels";

        public static string StoreProcGetAllStatusByLocale = "spBuildLevelGetAllStatusByLocale";


    }
}
