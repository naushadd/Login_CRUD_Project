using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LPT.AjaxDisplay
{
    public class AjaxPL
    {
        public int AjaxDisplay { get; set; }
        public string XMLData { get; set; }
        public bool isException { get; set; }
        public string exceptionMessage { get; set; }
        public DataSet ds { get; set; }
        public DataTable dt { get; set; }





        public string Name { get; set; }
        public string Surname { get; set; }
        public string Country { get; set; }
    }
}