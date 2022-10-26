using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LPT.Login_Master;

namespace LPT
{
    public partial class Password_Update : System.Web.UI.Page
    {
        public static string Id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 

                if (Request.QueryString.Count > 0)
                {
                    try
                    {
                        Id = Request.QueryString[0];

                    }
                    catch (Exception ex)
                    {
                        Response.Redirect("~/Admin/Default.aspx", true);
                    }
                }
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if(txtPassword.Text.Trim()== txtConfPassword.Text.Trim())
            {
                Login_PL pL = new Login_PL();
                pL.OpCode = 43;
                pL.Password = txtPassword.Text.Trim();

                if(Id != null && Id != "")
                {
                    pL.Id = Convert.ToInt32(Id);

                }


                Login_DL.SqlCon(pL);

                if (!pL.isException)
                {
                    
                    Session["ConPassMsg"] = "1";
                    Response.Redirect("Login.aspx");

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + pL.exceptionMessage.Replace("'", "") + "')", true);
                }
            }
            else
            {
                txtPassword.Text = "";
                txtConfPassword.Text = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password not matched')", true);
            }
        }
    }
}