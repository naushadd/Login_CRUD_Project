using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using LPT.Payrolldata;

namespace LPT
{
    public partial class Payroll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindStaff();
                if (Request.QueryString.Count > 0)
                {

                    ddlStaff.SelectedValue = Request.QueryString["id"].ToString();
                  
                }

            }

        }

        public void BindStaff()
        {
            payroll_PL PL = new payroll_PL();
            PL.staff = 43;
            payroll_DL.SqlCon(PL);

            if (!PL.isException)
            {

                if (PL.ds.Tables[0].Rows.Count > 0)
                {
                    ddlStaff.DataSource = PL.ds.Tables[0];
                    ddlStaff.DataValueField = "id";
                    ddlStaff.DataTextField = "staffname";

                    ddlStaff.DataBind();

                }
                else
                {
                    ddlStaff.DataBind();
                }
            }
            else
            {
                ddlStaff.DataBind();
            }
            ddlStaff.Items.Insert(0, new ListItem("Select Staff Name", ""));

        }


        [WebMethod]
        public static void Add_data(string ddlStaff, string txt_basic, string txt_house, string txt_medical, string txt_special, string txt_total)
        {
           
            payroll_PL pL = new payroll_PL();
            pL.staff = 13;
            pL.StaffName = ddlStaff;
            pL.Basicsalary = Convert.ToInt32(txt_basic);
            pL.Houserent = Convert.ToInt32(txt_house);
            pL.Medicalallowances = Convert.ToInt32(txt_medical);
            pL.Specialallowances = Convert.ToInt32(txt_special);
            pL.Totalsalary = Convert.ToInt32(txt_total);
            payroll_DL.SqlCon(pL);

        }


        [WebMethod]
        public static string payroll_define(String StaffName) //here StaffName is auto id
        {
            string data = "";
            payroll_PL pL = new payroll_PL();
            pL.staff = 42;
            pL.StaffName = StaffName;
            payroll_DL.SqlCon(pL);


            if (pL.dt != null && pL.dt.Rows.Count > 0)
            {
                utilityres hjds = new utilityres();
                data = hjds.JSONfromDT(pL.dt);

            }
            else
            {
                data = "data is not show";
            }
            return data;

        }

    }

}
