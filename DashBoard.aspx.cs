using System;
using LPT.Dashboard_Master;
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
        }



        [WebMethod]
        public static string AddDetail(string txt_AppName, string txt_Reader, string txt_ResumeScore, string txt_VideoScore, string txt_HVStatus, string txt_ReadingScore, string txt_ReadingStatus)
        {

            string msg = "";

            Dashboard_PL PL = new Dashboard_PL();
         

            PL.Application_Name = txt_AppName;
            PL.Reader = txt_Reader;
            PL.Resume_Score = txt_ResumeScore;
            PL.Video_Score = txt_VideoScore;
            PL.H_V_Status = txt_HVStatus;
            PL.Reading_Score = txt_ReadingScore;
            PL.Reading_Status = txt_ReadingStatus;
            

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