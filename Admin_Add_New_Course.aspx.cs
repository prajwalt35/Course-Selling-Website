using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn;
        String Connectionstring = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void course_submit_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(Connectionstring);

            string Coursename = txtCourse.Text;
            string Price = txtprice.Text;
            string Description = txtCoursedescription.Text;
            string img = txtimg.Text;
            //Image img = FileUpload1;

            conn.Open();
            string query = "INSERT INTO Products (Name, Price, Description, ImageUrl) VALUES (@Coursename, @Price, @Description, @img)";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Coursename", Coursename);
            cmd.Parameters.AddWithValue("@Price", Price);
            cmd.Parameters.AddWithValue("@Description", Description);
            cmd.Parameters.AddWithValue("@img", img);

            cmd.ExecuteNonQuery();
            successmsg.Text = "Course Added Successfully...";
        }
    }
}