using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection conn;
        string connectionstring = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectionstring);
        }

        protected void course_submit_Click(object sender, EventArgs e)
        {
            string Username = Session["Username"].ToString();
            string Newpassword = txtpassword.Text;
            string Role = "User";
            string Newemail = txtemail.Text;
            string Newage = txtage.Text;
            string Newmobileno = txtMobileno.Text;

            conn.Open();
            string query = "UPDATE Users SET Password = @Password, Role = @Role, Email = @Email, Age = @Age, Mobileno = @Mobileno WHERE Username = @Username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", Username);
            cmd.Parameters.AddWithValue("@Password", Newpassword);
            cmd.Parameters.AddWithValue("@Role", Role);
            cmd.Parameters.AddWithValue("@Email", Newemail);
            cmd.Parameters.AddWithValue("@Age", Newage);
            cmd.Parameters.AddWithValue("@Mobileno", Newmobileno);

            int rowsAffected = cmd.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                successmsg.Text = "Profile Updated Successfully!";
            }
            else
            {
                successmsg.Text = "Update Failed. User not found.";
            }
        }
    }
}