using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn;
        string connectionstring = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectionstring);
            if (!IsPostBack)
            {
                if (Session["Message"] != null)
                {
                    string msg = Session["Message"].ToString();
                    Response.Write($"<Script> alert('{msg}');</Script>");
                    Session["Message"] = null; // Clear the session message
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string username = txtUsername.Text;
                string password = txtPassword.Text;

                conn.Open();
                string query = "SELECT Role FROM Users WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string role = reader["Role"].ToString();
                    Session["Username"] = username;
                    Session["Role"] = role;

                    //HttpCookie userCookie = new HttpCookie("UserInfo");
                    //userCookie["Username"] = username;
                    //userCookie.Expires = DateTime.Now.AddMinutes(30);

                    Response.Redirect(role == "Admin" ? "Admin_Home.aspx" : "User_View_Course.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid username or password.";

                }
            }
            catch (Exception ex)
            {
                Response.Write($"<Script> alert('{ex.Message}');</Script>");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}