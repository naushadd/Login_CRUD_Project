using System;
using LPT.Dashboard_Master;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

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


            if (!IsPostBack)
            {

                BindStaff();

            }

        }



        public void BindStaff()
        {
            Dashboard_PL PL = new Dashboard_PL();
            PL.OpCode = 50;
            Dashboard_DL.SqlCon(PL);

            if (!PL.isException)
            {

                if (PL.ds.Tables[0].Rows.Count > 0)
                {
                    ddlReadingStatus.DataSource = PL.ds.Tables[0];
                    ddlReadingStatus.DataValueField = "Id";
                    ddlReadingStatus.DataTextField = "User_Name";

                    ddlReadingStatus.DataBind();

                }
                else
                {
                    ddlReadingStatus.DataBind();
                }
            }
            else
            {
                ddlReadingStatus.DataBind();
            }
            ddlReadingStatus.Items.Insert(0, new ListItem("Select Name", ""));

        }




        [WebMethod]
        public static string AddDetail(string txt_AppName, string txt_ResumeScore, string txt_VideoScore, string txt_HVStatus, string txt_ReadingScore, string txt_ReadingStatus)
        {

            string msg = "";

            Dashboard_PL PL = new Dashboard_PL();
         
            PL.Application_Name = txt_AppName;
            PL.Resume_Score = txt_ResumeScore;
            PL.Video_Score = txt_VideoScore;
            PL.H_V_Status = txt_HVStatus;
            PL.Reading_Score = txt_ReadingScore;
            PL.Reading_Status = txt_ReadingStatus;

            //PL.Updated_By = HttpContext.Current.Session["Id"].ToString();
            PL.OpCode = 11;

            Dashboard_DL.SqlCon(PL);

            if (!PL.isException)
            {
                msg = "Saved successfully";
            }

            return msg;
        }


    }
}