using LPT.staff;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LPT.staff
{
    public class Dl
    {

        public static void SqlCon(PL PL)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["crud"].ConnectionString);
                SqlCommand cmd = new SqlCommand("sp_staff", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@staff", PL.staff);
                // cmd.Parameters.AddWithValue("@XMLData", obj_PL.XMLData);
                cmd.Parameters.AddWithValue("@id ", PL.id);
                cmd.Parameters.AddWithValue("@staffid ", PL.staffid);
                cmd.Parameters.AddWithValue("@staffname", PL.staffname);
                cmd.Parameters.AddWithValue("@phone", PL.phone);
                cmd.Parameters.AddWithValue("@email", PL.email);
                cmd.Parameters.AddWithValue("@status", PL.status);
                //cmd.Parameters.AddWithValue("@Search", obj_PL.Search);



                cmd.Parameters.Add("@isException", System.Data.SqlDbType.Bit);
                cmd.Parameters["@isException"].Direction = System.Data.ParameterDirection.Output;

                cmd.Parameters.Add("@exceptionMessage", SqlDbType.NVarChar, 500);
                cmd.Parameters["@exceptionMessage"].Direction = ParameterDirection.Output;

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                PL.ds = new DataSet();
                sda.Fill(PL.ds);
                if(PL.ds.Tables.Count > 0)
                {
                    PL.dt = PL.ds.Tables[0];
                }

                //SqlDataAdapter sdt = new SqlDataAdapter(cmd);
                //obj_PL.DataTable = new DataTable();
                //sdt.Fill(obj_PL.dt);


                PL.isException = Convert.ToBoolean(cmd.Parameters["@isException"].Value);
                PL.exceptionMessage = cmd.Parameters["@exceptionMessage"].Value.ToString();

            }
            catch (Exception ex)
            {
                PL.isException = true;
                PL.exceptionMessage = ex.Message;
            }

        }
    }
}