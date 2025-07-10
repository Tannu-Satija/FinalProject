using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDepartments("ASC");
                BindEmployees("ASC");
            }
        }

        protected void ddlDeptSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sortOrder = ddlDeptSort.SelectedValue;
            BindDepartments(sortOrder);
        }

        protected void ddlEmpSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sortOrder = ddlEmpSort.SelectedValue;
            BindEmployees(sortOrder);
        }

        private void BindDepartments(string sortOrder)
        {
            string connStr = ConfigurationManager.ConnectionStrings["tannuConn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = $@"
                    SELECT d.Name AS DepartmentName,
                           AVG(e.Salary) AS AverageSalary,
                           COUNT(e.EmployeeID) AS NumberOfEmployees
                    FROM Employees e
                    JOIN Departments d ON e.DepartmentID = d.DepartmentID
                    GROUP BY d.Name
                    ORDER BY AVG(e.Salary) {sortOrder}";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvDepartments.DataSource = dt;
                gvDepartments.DataBind();
            }
        }

        private void BindEmployees(string sortOrder)
        {
            string connStr = ConfigurationManager.ConnectionStrings["tannuConn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = $"SELECT Name, Salary FROM Employees ORDER BY Salary {sortOrder}";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvEmployees.DataSource = dt;
                gvEmployees.DataBind();
            }
        }
    }
}
