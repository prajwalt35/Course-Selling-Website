using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class User : System.Web.UI.MasterPage
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

            conn.Open();

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", username);

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
            //View Course
            Response.Redirect("~/User_View_Course.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //Logout Button
            Response.Redirect("Login.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            //update profile
            Response.Redirect("~/User_Edit_Profile.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //View User profile
            Response.Redirect("~/User_View_User_Details.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            //Change Password
            Response.Redirect("~/User_ForgotPassword.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //View Cart
            Response.Redirect("~/User_Cart.aspx");
        }
    }
}