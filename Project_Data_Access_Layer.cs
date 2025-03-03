using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ASP_Net_MicroProject
{
    public class Products
    {
        public string Name { get; set; }
        public int Price { get; set; }
        public string Description { get; set; }
        public string url { get; set; }
    }
    public class Users
    {
        public string Username { get; set; }
        public string Passsword { get; set; }
        public string Role { get; set; }
        public string Email { get; set; }
        public int Age { get; set; }
        public string Mobileno { get; set; }
    }
    public class Project_Data_Access_Layer
    {
        //Display Data using Select
        public static List<Products> GetProducts()
        {
            List<Products> product = new List<Products>();
            string str = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Products", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Products p = new Products();
                p.Name = reader["Name"].ToString();
                p.Price = Convert.ToInt32(reader["Price"]);
                p.Description = reader["Description"].ToString();
                p.url = reader["ImageUrl"].ToString();
                product.Add(p);
            }
            return product;
        }

        //Display Users Data using Select
        public static List<Users> GetUsers()
        {
            List<Users> listofUsers = new List<Users>();
            string str = "Data Source=localhost\\sqlexpress;Initial Catalog=Project_DB;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Users", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Users u = new Users();
                u.Username = reader["Username"].ToString();
                u.Passsword = reader["Password"].ToString();
                u.Role = reader["Role"].ToString();
                u.Email = reader["Email"].ToString();
                u.Age = Convert.ToInt32(reader["Age"]);
                u.Mobileno = reader["Mobileno"].ToString();
                listofUsers.Add(u);
            }
            return listofUsers;
        }
    }
}