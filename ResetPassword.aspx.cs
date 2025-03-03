using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["token"] == null)
            {
                Response.Redirect("ForgotPassword.aspx");
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string token = Request.QueryString["token"];
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            string connectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            SqlConnection conn = new SqlConnection(connectionString);
            string query = "SELECT Email FROM Users WHERE ResetToken = @Token AND TokenExpiry > GETDATE()";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Token", token);

            conn.Open();
            object result = cmd.ExecuteScalar();
            if (result != null)
            {
                string email = result.ToString();
                query = "UPDATE Users SET Password = @Password, ResetToken = NULL, TokenExpiry = NULL WHERE Email = @Email";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Password", newPassword);
                cmd.Parameters.AddWithValue("@Email", email);

                cmd.ExecuteNonQuery();
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Password reset successfully!";
            }
            else
            {
                lblMessage.Text = "Invalid or expired token.";
            }
        }
    }
}