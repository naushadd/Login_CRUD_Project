using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace LPT.payroll_rate_master.opcode
{
    public class payroll_rate_master_PL
    {
        public string XMLData { get; set; }
        public bool isException { get; set; }
        public string exceptionMessage { get; set; }
        public DataSet ds { get; set; }
        public DataTable dt { get; set; }




    }
}