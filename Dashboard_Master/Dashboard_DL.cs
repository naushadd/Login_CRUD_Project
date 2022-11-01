using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LPT.Dashboard_Master
{
    public class Dashboard_DL
    {

        public static void SqlCon(Dashboard_PL PL)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["crud"].ConnectionString);
                SqlCommand cmd = new SqlCommand("sp_Dashboard", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Dashboard_Master", PL.Dashboard_Master);
                cmd.Parameters.AddWithValue("@OpCode", PL.OpCode);

                cmd.Parameters.AddWithValue("@App_Id", PL.App_Id);
                cmd.Parameters.AddWithValue("@Application_Name ", PL.Application_Name);
                cmd.Parameters.AddWithValue("@Resume_Score", PL.Resume_Score);
                cmd.Parameters.AddWithValue("@Video_Score", PL.Video_Score);
                cmd.Parameters.AddWithValue("@H_V_Status", PL.H_V_Status);
                cmd.Parameters.AddWithValue("@Reading_Score", PL.Reading_Score);
                cmd.Parameters.AddWithValue("@Reading_Status", PL.Reading_Status);
                cmd.Parameters.AddWithValue("@Updated_By", PL.Updated_By);
                cmd.Parameters.AddWithValue("@Reader", PL.Reader);



                cmd.Parameters.Add("@isException", System.Data.SqlDbType.Bit);
                cmd.Parameters["@isException"].Direction = System.Data.ParameterDirection.Output;

                cmd.Parameters.Add("@exceptionMessage", SqlDbType.NVarChar, 500);
                cmd.Parameters["@exceptionMessage"].Direction = ParameterDirection.Output;

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                PL.ds = new DataSet();
                sda.Fill(PL.ds);

                //if (PL.ds.Tables.Count > 0)
                //{
                //    PL.dt = PL.ds.Tables[0];
                //}

                if (PL.ds != null && PL.ds.Tables.Count > 0)
                {
                    PL.dt = PL.ds.Tables[0].Copy();
                }

                //SqlDataAdapter sdt = new SqlDataAdapter(cmd);
                //PL.dt = new DataTable();
                //sdt.Fill(PL.dt);


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