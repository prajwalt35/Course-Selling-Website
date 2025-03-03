using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection conn;
        string connectionstring = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectionstring);
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string username = txtUsername.Text;
                string password = txtPassword.Text;
                string email = txtEmail.Text;
                string role = "User";
                string age = txtage.Text;
                string mobileno = txtmobileno.Text;
                string fullname = txtfull_name.Text;

                if (password == txtConfirmPassword.Text)
                {
                    conn.Open();
                    string query = "INSERT INTO Users (Username, Password, Role, Email, Age, Mobileno, Full_Name) VALUES (@Username, @Password, @Role, @Email, @Age, @Mobileno, @Full_Name)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Role", role);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Mobileno", mobileno);
                    cmd.Parameters.AddWithValue("@Full_Name", fullname);

                    cmd.ExecuteNonQuery();

                    //Pass this data into Session to Login page
                    Session["Message"] = "Registration successful!";

                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMessage.Text = "Password and Confirm password Not Matched";
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<Script> alert('{ex.Message}');</Script>");
            }
        }
    }
}