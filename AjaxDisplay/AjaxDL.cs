using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace LPT.AjaxDisplay
{
    public class AjaxDL
    {

        public static void SqlCon(AjaxPL PL)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["crud"].ConnectionString);
                SqlCommand cmd = new SqlCommand("sp_AjaxDisplay", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Ajax", PL.AjaxDisplay);

                // cmd.Parameters.AddWithValue("@XMLData", obj_PL.XMLData);
                cmd.Parameters.AddWithValue("@Name ", PL.Name);
                cmd.Parameters.AddWithValue("@Surname", PL.Surname);
                cmd.Parameters.AddWithValue("@Country", PL.Country);

                cmd.Parameters.Add("@isException", System.Data.SqlDbType.Bit);
                cmd.Parameters["@isException"].Direction = System.Data.ParameterDirection.Output;

                cmd.Parameters.Add("@exceptionMessage", SqlDbType.NVarChar, 500);
                cmd.Parameters["@exceptionMessage"].Direction = ParameterDirection.Output;

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                PL.ds = new DataSet();
                sda.Fill(PL.ds);
                if (PL.ds.Tables.Count > 0)
                {
                    PL.dt = PL.ds.Tables[0];
                }


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