using LPT.Payrolldata;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace LPT
{
    public partial class User_authentication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUser();
            }
        }

        public void BindUser()
        {
            payroll_PL PL = new payroll_PL();
            PL.staff = 45;
            payroll_DL.SqlCon(PL);

            if (!PL.isException)
            {

                if (PL.ds.Tables[0].Rows.Count > 0)
                {
                    user_ddlStaff.DataSource = PL.ds.Tables[0];
                    user_ddlStaff.DataValueField = "id";
                    user_ddlStaff.DataTextField = "staffname";

                    user_ddlStaff.DataBind();

                }
                else
                {
                    user_ddlStaff.DataBind();
                }
            }
            else
            {
                user_ddlStaff.DataBind();
            }
            user_ddlStaff.Items.Insert(0, new ListItem("Select Staff Name", ""));

        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            payroll_PL pL = new payroll_PL();
            pL.staff = 14;
            pL.user_name = user_ddlStaff.Text;
            pL.user_id = txt_user.Text;
            pL.user_password = txt_Password.Text;
            payroll_DL.SqlCon(pL);
        }
    }
}