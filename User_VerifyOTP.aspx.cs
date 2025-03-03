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
    public partial class WebForm13 : System.Web.UI.Page
    {
        string email;
        string ConnectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            email = Session["email"].ToString();
        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            string enteredOTP = txtOTP.Text.Trim();

            SqlConnection con = new SqlConnection(ConnectionString);
            string query = "SELECT OTP, ExpiryTime FROM OTPVerification WHERE Email=@Email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                string storedOTP = reader["OTP"].ToString();
                DateTime expiryTime = Convert.ToDateTime(reader["ExpiryTime"]);

                if (storedOTP == enteredOTP && DateTime.Now <= expiryTime)
                {
                    Response.Redirect("User_ResetPassword.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid or expired OTP.";
                }
            }
            else
            {
                lblMessage.Text = "No OTP found for this email.";
            }
            con.Close();            
        }
    }
}