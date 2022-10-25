using System;
using System.Web.Services;
using LPT.AjaxDisplay;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LPT
{
    public partial class Ajax_Display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static void Showdata(string txt_Name, string txt_Surname, string txt_Country)
        {
           
            AjaxPL Pl = new AjaxPL();

            Pl.Name = txt_Name;
            Pl.Surname = txt_Surname;
            Pl.Country = txt_Country;
            Pl.AjaxDisplay = 11;
            AjaxDL.SqlCon(Pl);
            
        }


    }
}