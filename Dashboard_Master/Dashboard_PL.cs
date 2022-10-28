using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace LPT.Dashboard_Master
{
    public class Dashboard_PL
    {

        public int Dashboard_Master { get; set; }
        public string XMLData { get; set; }
        public bool isException { get; set; }
        public string exceptionMessage { get; set; }
        public DataTable dt { get; set; }
        public DataSet ds { get; set; }



        public int OpCode { get; set; }
        public int App_Id { get; set; }
        public string Application_Name { get; set; }
        public string Reader { get; set; }
        public string Resume_Score { get; set; }
        public string Video_Score { get; set; }
        public string H_V_Status { get; set; }
        public string Reading_Score { get; set; }
        public string Reading_Status { get; set; }
        //public DateTime Updated_On { get; set; }
        //public string Updated_By { get; set; }

    }
}