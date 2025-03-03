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
    public partial class WebForm11 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader reader;
        string connectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectionString);
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();
                    FetchUserData(username);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void FetchUserData(string username)
        {
            try
            { 
                conn.Open();
                string query = "SELECT Username, Email, Age, Mobileno, Full_Name FROM Users WHERE Username = @Username";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    User_Name.Text = reader["Full_Name"].ToString();
                    Label1.Text = reader["Username"].ToString();
                    Label2.Text = "********";
                    Label3.Text = reader["Email"].ToString();
                    Label4.Text = reader["Mobileno"].ToString();
                    Label5.Text = reader["Age"].ToString();
                }
                else
                {
                    Label1.Text = "User not found!";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = "Error: " + ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //redirect to Edit profile
            Response.Redirect("~/User_Edit_Profile.aspx");
        }
    }
}