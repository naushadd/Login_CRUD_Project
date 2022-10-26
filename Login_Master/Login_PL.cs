using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LPT.Login_Master {
    public class Login_PL {

        public int Login_Master { get; set; }
        public string XMLData { get; set; }
        public bool isException { get; set; }
        public string exceptionMessage { get; set; }
        public DataSet ds { get; set; }
        public DataTable dt { get; set; }
        
        
        
        public int OpCode { get; set; } 
        public int Id { get; set; }
        public string User_Name { get; set; }
        public string Password { get; set; }
        public string User_Email { get; set; }

    }
}