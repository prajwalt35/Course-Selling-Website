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
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!string.IsNullOrEmpty(Request.QueryString["productId"]))
            {
                int productId = Convert.ToInt32(Request.QueryString["productId"]);
                RemoveProductFromCart(productId);
            }

            Response.Redirect("User_Cart.aspx");
        }
        private void RemoveProductFromCart(int productId)
        {
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
                        userId = Convert.ToInt32(result);
                }

                if (userId == 0) return;

                // Check quantity before removing
                string checkQuery = "SELECT Quantity FROM Orders WHERE UserId = @UserId AND ProductId = @ProductId";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@UserId", userId);
                    checkCmd.Parameters.AddWithValue("@ProductId", productId);

                    object result = checkCmd.ExecuteScalar();

                    if (result != null)
                    {
                        int quantity = Convert.ToInt32(result);
                        if (quantity > 1)
                        {
                            string updateQuery = "UPDATE Orders SET Quantity = Quantity - 1 WHERE UserId = @UserId AND ProductId = @ProductId";
                            using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                            {
                                updateCmd.Parameters.AddWithValue("@UserId", userId);
                                updateCmd.Parameters.AddWithValue("@ProductId", productId);
                                updateCmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            string deleteQuery = "DELETE FROM Orders WHERE UserId = @UserId AND ProductId = @ProductId";
                            using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn))
                            {
                                deleteCmd.Parameters.AddWithValue("@UserId", userId);
                                deleteCmd.Parameters.AddWithValue("@ProductId", productId);
                                deleteCmd.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }
        }
    }
}