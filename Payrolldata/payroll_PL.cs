using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace LPT.Payrolldata
{
    public class payroll_PL
    {
        public int staff { get; set; }
        public string XMLData { get; set; }
        public bool isException { get; set; }
        public string exceptionMessage { get; set; }
        public DataSet ds { get; set; }
        public DataTable dt { get; set; }

        public string StaffName { get; set; }
        public int Basicsalary { get; set; }
        public int Houserent { get; set; }
        public int Medicalallowances { get; set; }
        public int Specialallowances { get; set; }
        public int Totalsalary { get; set; }
        public int id { get; set; }

        public string user_name { get; set; }
        public string user_id { get; set; }
        public string user_password { get; set; }

        ////public string  staffname { get; set; }
   


    }
}