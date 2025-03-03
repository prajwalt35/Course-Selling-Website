using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string token = Guid.NewGuid().ToString();
            DateTime expiry = DateTime.Now.AddMinutes(30);

            string connectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            SqlConnection conn = new SqlConnection(connectionString);
            string query = "UPDATE Users SET ResetToken = @Token, TokenExpiry = @Expiry WHERE Email = @Email";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Token", token);
            cmd.Parameters.AddWithValue("@Expiry", expiry);
            cmd.Parameters.AddWithValue("@Email", email);

            conn.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0)
            {
                SendResetEmail(email, token);
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Reset link has been sent to your email.";
            }
            else
            {
                lblMessage.Text = "Email not found!";
            }
        }

        private void SendResetEmail(string email, string token)
        {

            string resetLink = "http://localhost:56572/ResetPassword.aspx?email=" +
                               HttpUtility.UrlEncode(email) + "&token=" + token;

            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("er.prajwal.thorat@gmail.com");
            mail.Subject = "Password Reset Request";
            mail.Body = "Click the following link to reset your password: <a href='" + resetLink + "'>Reset Password</a>";
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new System.Net.NetworkCredential("er.prajwal.thorat@gmail.com", "krlb kljs wuqu ldqs");
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
    }
}