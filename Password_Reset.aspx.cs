using System;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Net.Configuration;
using System.Data;
using LPT.Login_Master;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LPT
{
    public partial class Password_Reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void SendEmail(object sender, EventArgs e)
        {
            if (txt_To.Text.Trim() != "")
            {
                SendMailFinal(txt_To.Text.Trim());
            }
            else
            {
                RegisterStartupScript("applyCSS2", "<script>ShowM('Incorrect Email Account!!');</script>");
            }

        }


        public void SendMailFinal(string User_Email)
        {
            DataTable dtLoginDetails = GetLoginInfo(User_Email);
            if (dtLoginDetails.Rows.Count > 0)
            {
                var Id = dtLoginDetails.Rows[0]["Id"].ToString();
                if (dtLoginDetails.Rows[0]["User_Email"].ToString().Equals(txt_To.Text.Trim()))
                {
                    SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
                    using (MailMessage mm = new MailMessage(smtpSection.From,txt_To.Text.Trim()))
                    {

                        mm.Subject = "Reset Passsword";
                        mm.Body = "https://localhost:44319/Password_Update.aspx?id=" + Id;
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = smtpSection.Network.Host;
                        smtp.EnableSsl = smtpSection.Network.EnableSsl;
                        NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                        smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                        smtp.Credentials = networkCred;
                        smtp.Port = smtpSection.Network.Port;
                        smtp.Send(mm);
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email Sent. Please Check Your Email');", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('invalid password detail.')", true);
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Email Id Not Registered')", true);
            }

        }


        DataTable GetLoginInfo(string User_Email)
        {
            Login_PL pL = new Login_PL();
            pL.OpCode = 42;
            pL.User_Email = User_Email;


            Login_DL.SqlCon(pL);

            if (pL.isException)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + pL.exceptionMessage.Replace("'", "") + "')", true);
            }
            return pL.dt;

        }

    }
}