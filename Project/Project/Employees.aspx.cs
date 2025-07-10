using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Project
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployeeData();
            }
        }

        private void LoadEmployeeData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["tannuConn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT e.EmployeeID, e.Name, d.Name AS Department, e.Salary
                    FROM Employees e
                    JOIN Departments d ON e.DepartmentID = d.DepartmentID";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvEmployees.DataSource = dt;
                gvEmployees.DataBind();
            }
        }
    }
}
