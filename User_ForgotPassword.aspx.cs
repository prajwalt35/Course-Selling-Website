using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string otp = new Random().Next(100000, 999999).ToString(); // Generate 6-digit OTP
            DateTime expiryTime = DateTime.Now.AddMinutes(10); // OTP expires in 10 minutes

            string ConnectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            SqlConnection con = new SqlConnection(ConnectionString);
           
            string query = @" IF EXISTS (SELECT 1 FROM OTPVerification WHERE Email = @Email)
                                UPDATE OTPVerification SET OTP = @OTP, ExpiryTime = @ExpiryTime WHERE Email = @Email;
                              ELSE
                                INSERT INTO OTPVerification (Email, OTP, ExpiryTime) VALUES (@Email, @OTP, @ExpiryTime);";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@OTP", otp);
            cmd.Parameters.AddWithValue("@ExpiryTime", expiryTime);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
 
            // Send OTP via Email
            SendOTPEmail(email, otp);
            lblMessage.Text = "OTP sent to your email.";

            Session["email"] = email;
            Response.Redirect("~/User_VerifyOTP.aspx?");
        }

        private void SendOTPEmail(string email, string otp)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("er.prajwal.thorat@gmail.com");
            mail.Subject = "Your OTP Code";
            mail.Body = "Your OTP for password reset is: " + otp;
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new System.Net.NetworkCredential("er.prajwal.thorat@gmail.com", "krlb kljs wuqu ldqs");
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
    }
}