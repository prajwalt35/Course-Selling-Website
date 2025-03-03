using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCourses();
        }

        private void LoadCourses()
        {
            string connectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            StringBuilder html = new StringBuilder();

            SqlConnection conn = new SqlConnection(connectionString);
            string query = "SELECT * FROM Products";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                html.Append("<div class='card'>");
                html.Append("<img src='" + reader["ImageUrl"].ToString() + "' alt='Course Image'>");
                html.Append("<h3>" + reader["Name"].ToString() + "</h3>");
                html.Append("<p>" + reader["Description"].ToString() + "</p>");
                html.Append("<p class='price'>$" + reader["Price"].ToString() + "</p>");
                html.Append("<button class=\"btn-cart\"><i class=\"fas fa-shopping-cart\"></i> Add to Cart\r\n </button>");
                html.Append("</div>");
            }

            ltlCourses.Text = html.ToString(); // Assign generated HTML to Literal control
        }
    }
}