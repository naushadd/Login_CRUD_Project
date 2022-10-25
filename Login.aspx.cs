using System;
using System.Data;
using LPT.Login_Master;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LPT
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
            }
        }
        protected void Btn_login(object sender, EventArgs e)
        {
            
            if(txt_user.Text.Trim() != "" && txt_Password.Text.Trim() != "")
            {
                LoginFinal(txt_user.Text.Trim() , txt_Password.Text.Trim());
            }
            else
            {
                RegisterStartupScript("applyCSS2", "<script>ShowM('Incorrect Email Account!!');</script>");
            }
        }

        public void LoginFinal(string User_Name, string Password)
        {
            DataTable dtLoginDetails = GetLoginInfo(User_Name , Password);
            if (dtLoginDetails.Rows.Count > 0)
            {
                if (dtLoginDetails.Rows[0]["User_Name"].ToString().Equals(txt_user.Text.Trim()) && dtLoginDetails.Rows[0]["Password"].ToString().Equals(txt_Password.Text.Trim()))
                {
                    Session["UserId"] = User_Name;

                    //Session["auto_id"] = dtLoginDetails.Rows[0]["auto_id"].ToString();

                    Response.Redirect("Index.aspx", true);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('invalid password detail.')", true);
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('invalid userid detail.')", true);
            }

        }
        DataTable GetLoginInfo(string username, string password)
        {
            Login_PL pL = new Login_PL();
            pL.OpCode = 11;
            pL.User_Name = username;
            pL.Password = password;
           

            Login_DL.SqlCon(pL);

            if (pL.isException)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + pL.exceptionMessage.Replace("'", "") + "')", true);
            }
            return pL.dt;

        }
    }
}