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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int productId;
                if (int.TryParse(Request.QueryString["productId"], out productId))
                {
                    AddToCart(productId);
                }
                Response.Redirect("User_View_Course.aspx");
            }
        }
        private void AddToCart(int productId)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string username = Session["Username"].ToString();
            string connectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Get UserId from Username
                string getUserQuery = "SELECT Id FROM Users WHERE Username = @Username";
                int userId = 0;
                using (SqlCommand userCmd = new SqlCommand(getUserQuery, conn))
                {
                    userCmd.Parameters.AddWithValue("@Username", username);
                    object result = userCmd.ExecuteScalar();
                    if (result != null)
                    {
                        userId = Convert.ToInt32(result);
                    }
                }

                if (userId == 0) return; // If user doesn't exist, exit

                // Check if product already exists in cart
                string checkQuery = "SELECT Quantity FROM Orders WHERE UserId = @UserId AND ProductId = @ProductId";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    checkCmd.Parameters.AddWithValue("@ProductId", productId);

                    object cartResult = checkCmd.ExecuteScalar();
                    if (cartResult != null)
                    {
                        // Update Quantity if product already in cart
                        string updateQuery = "UPDATE Orders SET Quantity = Quantity + 1 WHERE UserId = @UserId AND ProductId = @ProductId";
                        using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                        {
                            updateCmd.Parameters.AddWithValue("@UserId", userId);
                            updateCmd.Parameters.AddWithValue("@ProductId", productId);
                            updateCmd.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        // Insert new product into cart
                        string insertQuery = "INSERT INTO Orders (UserId, ProductId, Quantity, OrderDate) VALUES (@UserId, @ProductId, 1, GETDATE())";
                        using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                        {
                            insertCmd.Parameters.AddWithValue("@UserId", userId);
                            insertCmd.Parameters.AddWithValue("@ProductId", productId);
                            insertCmd.ExecuteNonQuery();
                        }
                    }
                }
            }
        }

    }
}