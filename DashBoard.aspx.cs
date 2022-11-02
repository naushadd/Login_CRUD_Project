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
                ShowReader();
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
                    //ddlReadingStatus.DataValueField = "Id";
                    ddlReadingStatus.DataTextField = "Id";
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

  

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Dashboard_PL pL = new Dashboard_PL();

            pL.Reader = ddlReadingStatus.SelectedValue;


            if (hid_Id.Value != "")
            {
                pL.OpCode = 12;
                pL.App_Id = Convert.ToInt32(hid_Id.Value);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Added Successfully')", true);
            }

            Dashboard_DL.SqlCon(pL);
            ShowReader();
        }


        public void ShowReader()
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

        protected void SubmitEvaluate_Click(object sender, EventArgs e)
        {

            Dashboard_PL pL = new Dashboard_PL();

            pL.Resume_Score = txt_ResumeScore.Text;
            pL.Video_Score = txt_VideoScore.Text;
            pL.H_V_Status = txt_HVStatus.SelectedValue;
            pL.Reading_Score = txt_ReadingScore.Text;
            pL.Reading_Status = txt_ReadingStatus.SelectedValue;


            if (hid_Id.Value != "")
            {
                pL.OpCode = 11;
                pL.App_Id = Convert.ToInt32(hid_Id.Value);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Added Successfully')", true);
            }

            Dashboard_DL.SqlCon(pL);
            ShowReader();

        }
    }
    
}