using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace LPT.Payrolldata
{
    public class utilityres
    {
        public string JSONfromDT(DataTable dataTable)
        {
            try
            {

                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row;
                foreach (DataRow dr in dataTable.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dataTable.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
                return serializer.Serialize(rows);
            }
            catch (Exception ex)
            {
                return string.Empty;
            }
        }

    }
}