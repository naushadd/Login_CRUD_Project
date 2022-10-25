using System;
using LPT.Payrolldata;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LPT
{
    public partial class Payroll_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                payroll_PL Pl = new payroll_PL();
                Pl.staff = 41;
                payroll_DL.SqlCon(Pl);
                if (Pl.ds != null && Pl.ds.Tables[0].Rows.Count > 0)
                {
                    txt_LV.DataSource = Pl.ds.Tables[0];
                    txt_LV.DataBind();

                }

            }
        }

     
    }
}