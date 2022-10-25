using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LPT.Payrolldata
{
    public class payroll_DL
    {
        public static void SqlCon(payroll_PL obj_PL)
        {
            try
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["crud"].ConnectionString);
                SqlCommand cmd = new SqlCommand("sp_Payroll", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@staff", obj_PL.staff);
                cmd.Parameters.AddWithValue("@XMLData", obj_PL.XMLData);

                cmd.Parameters.AddWithValue("@id", obj_PL.id);
                cmd.Parameters.AddWithValue("@StaffName", obj_PL.StaffName);
                cmd.Parameters.AddWithValue("@Basicsalary", obj_PL.Basicsalary);
                cmd.Parameters.AddWithValue("@Houserent", obj_PL.Houserent);
                cmd.Parameters.AddWithValue("@Medicalallowances", obj_PL.Medicalallowances);
                cmd.Parameters.AddWithValue("@Specialallowances", obj_PL.Specialallowances);
                cmd.Parameters.AddWithValue("@Totalsalary", obj_PL.Totalsalary);

                cmd.Parameters.AddWithValue("@user_name", obj_PL.user_name);
                cmd.Parameters.AddWithValue("@user_id", obj_PL.user_id);
                cmd.Parameters.AddWithValue("@user_password", obj_PL.user_password);

                ////cmd.Parameters.AddWithValue("@id", obj_PL.id);
                ////cmd.Parameters.AddWithValue("@phone", obj_PL.phone);
                ////cmd.Parameters.AddWithValue("@staffname", obj_PL.staffname);




                cmd.Parameters.Add("@isException", SqlDbType.Bit);
                cmd.Parameters["@isException"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@exceptionMessage", SqlDbType.NVarChar, 500);
                cmd.Parameters["@exceptionMessage"].Direction = ParameterDirection.Output;

                SqlDataAdapter sqlAdp = new SqlDataAdapter(cmd);

                obj_PL.dt = new DataTable();
                obj_PL.ds = new DataSet();
                sqlAdp.Fill(obj_PL.ds);
                if (obj_PL.ds != null && obj_PL.ds.Tables.Count > 0)
                {
                    obj_PL.dt = obj_PL.ds.Tables[0].Copy();
                }

                obj_PL.isException = Convert.ToBoolean(cmd.Parameters["@isException"].Value);
                obj_PL.exceptionMessage = cmd.Parameters["@exceptionMessage"].Value.ToString();
            }
            catch (Exception ex)
            {
                obj_PL.isException = true;
                obj_PL.exceptionMessage = ex.Message;

            }
        }

    }
}