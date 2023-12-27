using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Web.Script.Services; // Add this namespace

namespace MyProject.OverallWork
{
    /// <summary>
    /// Summary description for Backend
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService] // Add this attribute
    public class Backend : System.Web.Services.WebService
    {
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<string> GetDatabaseData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MeetingEntities"].ConnectionString;
            List<string> customers = new List<string>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Name FROM Corporate_Customer_Tbl"; 
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            customers.Add(reader["Name"].ToString()); 
                        }
                    }
                }
            }

            return customers;
        }
        [WebMethod]
        public List<string> GetIndividualData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MeetingEntities"].ConnectionString;
            List<string> Individual = new List<string>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Name FROM Individual_Customer_Tbl";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Individual.Add(reader["Name"].ToString());
                        }
                    }
                }
            }

            return Individual;
        }
        [WebMethod]
        public List<string> GetProduct()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MeetingEntities"].ConnectionString;
            List<string> Product = new List<string>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Name FROM Products_Service_Tbl";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Product.Add(reader["Name"].ToString());
                        }
                    }
                }
            }

            return Product;
        }
        [WebMethod]
        public string GetUnit(string productName)
        {
            try
            {
                string unit = GetUnitByProductName(productName);
                return unit;
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

        private string GetUnitByProductName(string Name)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MeetingEntities"].ConnectionString;
            List<string> ProductUnit = new List<string>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Unit FROM Products_Service_Tbl WHERE Name = @Name";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", Name);

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return reader["Unit"].ToString();
                        }
                    }
                }
            }

            return "Unit Not Found";
        }


    }
}
