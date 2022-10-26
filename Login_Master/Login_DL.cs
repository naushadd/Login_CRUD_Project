using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace LPT.Login_Master {
    public class Login_DL {


        public static void SqlCon(Login_PL obj_PL) {
            try {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["crud"].ConnectionString);
                SqlCommand cmd = new SqlCommand("sp_Login",con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Login_Master",obj_PL.Login_Master);
                cmd.Parameters.AddWithValue("@XMLData",obj_PL.XMLData);

                cmd.Parameters.AddWithValue("@OpCode",obj_PL.OpCode);


                //cmd.Parameters.Add("@auto_id", SqlDbType.NVarChar, 15).Value = obj_PL.auto_id;
                //cmd.Parameters["@auto_id"].Direction = ParameterDirection.InputOutput;
                cmd.Parameters.AddWithValue("@Id", obj_PL.Id);
                cmd.Parameters.AddWithValue("@User_Name",obj_PL.User_Name);
                cmd.Parameters.AddWithValue("@Password",obj_PL.Password);
                cmd.Parameters.AddWithValue("@User_Email", obj_PL.User_Email);


                cmd.Parameters.Add("@isException",SqlDbType.Bit);
                cmd.Parameters["@isException"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add("@exceptionMessage",SqlDbType.NVarChar,500);
                cmd.Parameters["@exceptionMessage"].Direction = ParameterDirection.Output;


                SqlDataAdapter sqlAdp = new SqlDataAdapter(cmd);
                obj_PL.dt = new DataTable();
                sqlAdp.Fill(obj_PL.dt);

                obj_PL.isException = Convert.ToBoolean(cmd.Parameters["@isException"].Value);
                obj_PL.exceptionMessage = cmd.Parameters["@exceptionMessage"].Value.ToString();
            }
            catch(Exception ex) {
                obj_PL.isException = true;
                obj_PL.exceptionMessage = ex.Message;

            }
        }

    }
}