using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Net_MicroProject
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            LoadCart();
        }

        private void LoadCart()
        {
            string username = Session["Username"].ToString();
            string connectionString = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            StringBuilder html = new StringBuilder();
            decimal totalCartPrice = 0; // Variable to store the total price

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

                string query = "SELECT P.Id, P.Name, P.Price, P.ImageUrl, O.Quantity, (P.Price * O.Quantity) AS TotalPrice " +
                               "FROM Orders O " +
                               "INNER JOIN Products P ON O.ProductId = P.Id " +
                               "WHERE O.UserId = @UserId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        decimal productTotal = Convert.ToDecimal(reader["TotalPrice"]);
                        totalCartPrice += productTotal; // Add to total cart price

                        html.Append("<div class='cart-item'>");
                        html.Append("<img src='" + reader["ImageUrl"].ToString() + "' alt='Course Image'>");
                        html.Append("<h3>" + reader["Name"].ToString() + "</h3>");
                        html.Append("<p class='price'>$" + reader["Price"].ToString() + "</p>");
                        html.Append("<p>Quantity: " + reader["Quantity"].ToString() + "</p>");
                        html.Append("<p>Total: $" + productTotal.ToString("0.00") + "</p>");
                        html.Append($"<a href='User_RemoveFromCart.aspx?productId={reader["Id"]}' class='btn-remove'>Remove</a>");
                        html.Append("</div>");
                    }
                }
            }

            // Display the total cart price at the bottom
            html.Append("==================================================================================");
            html.Append($"<div class='cart-total'><h3>Total Cart Price: $<span class='cart-total-span'>{totalCartPrice.ToString("0.00")}</span></h3></div>");

            ltlCartItems.Text = html.ToString();
        }

    }
}