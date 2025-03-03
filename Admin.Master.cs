using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        string ConnectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["Username"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            string user_name = Session["Username"].ToString();
            FetchFullName(user_name);
        }
        private void FetchFullName(string username)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            string query = "SELECT Full_Name FROM Users WHERE Username = @Username";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", username);

            conn.Open();
            object result = cmd.ExecuteScalar(); // Fetch single value

            if (result != null)
            {
                User_name.Text = result.ToString();
            }
            else
            {
                User_name.Text = "User not found!";
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Add New Course
            Response.Redirect("~/Admin_Add_New_Course.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //Remove Course
            Response.Redirect("~/Admin_Remove_Course.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //View Course
            Response.Redirect("~/Admin_View_Course.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //View payment History
            Response.Redirect("~/Admin_View_Payment_History.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            //View User Details
            Response.Redirect("~/Admin_View_User_Details.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            //Profile Edit
            Response.Redirect("~/Admin_Edit_Profile.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //Logout
            Response.Redirect("Login.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            //Home page
            Response.Redirect("~/Admin_Home.aspx");
        }
    }
}