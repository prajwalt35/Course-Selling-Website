using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string str = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            GetTotalUserCount();
            GetTotalCourse();
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        private void GetTotalCourse()
        {
            int totalCount = 0;
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            string query = "SELECT COUNT(*) FROM Products";
            SqlCommand cmd = new SqlCommand(query, conn);
            totalCount = (int)cmd.ExecuteScalar(); // Fetch total count
            Label1.Text = totalCount.ToString();
        }

        private void GetTotalUserCount()
        {
            int totalCount = 0;
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            string query = "SELECT COUNT(*) FROM Users";
            SqlCommand cmd = new SqlCommand(query, conn);
            totalCount = (int)cmd.ExecuteScalar(); // Fetch total count
            Label2.Text = totalCount.ToString();
        }
    }
}