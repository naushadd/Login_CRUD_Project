using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace LPT.staff
{
    public class PL
    {

        public int staff { get; set; }
        public string XMLData { get; set; }
        public bool isException { get; set; }
        public string exceptionMessage { get; set; }
        public DataSet ds { get; set; }
        public DataTable dt { get; set; }



        public int id { get; set; }
        public int staffid { get; set; }
        public string staffname { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public int status { get; set; }
        public string Created_By { get; set; }
        public DateTime Created_On { get; set; }
        public DateTime Updated_On { get; set; }
        public string Updated_By { get; set; }

    }

}