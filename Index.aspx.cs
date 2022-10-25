using LPT.staff;
using LPT.Login_Master;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LPT
{
    public partial class Index : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PL Pl = new PL();
                Pl.staff = 41;
                Dl.SqlCon(Pl);
                if (Pl.ds != null && Pl.ds.Tables[0].Rows.Count > 0)
                {
                    LV.DataSource = Pl.ds.Tables[0];
                    LV.DataBind();

                }

            }

        }

        [WebMethod]
        public static string Showdata(string staffid, string staffname, string phone, string email, string status)
        {

            string msg;
            PL Pl = new PL();


            if (string.IsNullOrEmpty(staffid))
            {
                Pl.id = 0;
                Pl.staff = 11;
                msg = "Record save successfully";
            }
            else
            {
                Pl.id = Convert.ToInt32(staffid);
                Pl.staff = 21;
                msg = "Record update successfully";

            }
            Pl.staffname = staffname;
            Pl.phone = phone;
            Pl.email = email;
            Pl.status = Convert.ToInt32(status);
            Dl.SqlCon(Pl);
            return msg;
        }



        [WebMethod]
        public static string edit_staff_id(string staff_id)
        {
            string data = "";
            PL Pl = new PL();
            Pl.staff = 42;
            Pl.id = Convert.ToInt32(staff_id);
            Dl.SqlCon(Pl);


            if (Pl.dt != null && Pl.dt.Rows.Count > 0)
            {
                utilityres hjds = new utilityres();
                data = hjds.JSONfromDT(Pl.dt);

            }
            else
            {
                data = "data is not edited";
            }
            return data;

        }


        [WebMethod]
        public static string delete_data(string staff_id)
        {
            string data = "";

            PL Pl = new PL();
            Pl.staff = 16;
            Pl.id = Convert.ToInt32(staff_id);
            Dl.SqlCon(Pl);


            if (!Pl.isException)
            {
                data = "successfully deleted";

            }
            else
            {
                data = "data is not deleted";
            }

            return data;


        }
    }   
}