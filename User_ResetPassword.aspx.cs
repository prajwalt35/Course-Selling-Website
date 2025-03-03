using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Management;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        string email;
        string ConnectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            email = Session["email"].ToString();
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (newPassword != confirmPassword)
            {
                sucesslblMessage.Text = " ";
                lblMessage.Text = "Passwords do not match!";   
            }
            else
            {
                lblMessage.Text = " ";
                SqlConnection con = new SqlConnection(ConnectionString);
                string query = "UPDATE Users SET Password = @Password WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Password", newPassword);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                con.Close();

                if (rowsAffected > 0)
                {
                    sucesslblMessage.Text = "Password reset successfully!";
                }
                else
                {
                    lblMessage.Text = "Error resetting password!";
                }
                
            }

        }
    }
}