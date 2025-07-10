using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Project
{
    public partial class Output : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartmentDataAboveAverage();
            }
        }

        private void LoadDepartmentDataAboveAverage()
        {
            string connStr = ConfigurationManager.ConnectionStrings["tannuConn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    WITH DeptStats AS (
                        SELECT 
                            d.Name AS Department,
                            COUNT(e.EmployeeID) AS EmployeeCount,
                            AVG(CAST(e.Salary AS FLOAT)) AS AvgSalary
                        FROM Employees e
                        INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
                        GROUP BY d.Name
                    ),
                    OverallAvg AS (
                        SELECT AVG(CAST(Salary AS FLOAT)) AS OverallAvgSalary FROM Employees
                    )
                    SELECT 
                        ds.Department,
                        ds.EmployeeCount,
                        CAST(ds.AvgSalary AS DECIMAL(10, 2)) AS AvgSalary
                    FROM DeptStats ds, OverallAvg oa
                    WHERE ds.AvgSalary > oa.OverallAvgSalary";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}
