using System;
using LPT.Dashboard_Master;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LPT
{
    public partial class DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dashboard_PL Pl = new Dashboard_PL();
                Pl.OpCode = 41;
                Dashboard_DL.SqlCon(Pl);
                if (Pl.dt != null && Pl.dt.Rows.Count > 0)
                {
                    DSLV.DataSource = Pl.dt;
                    DSLV.DataBind();

                }

            }
        }
    }
}