using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Collections.Generic;

namespace Project
{
    public partial class Charts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployeeSalaryChart();
                LoadDepartmentBarChart();
            }
        }

        private void LoadEmployeeSalaryChart()
        {
            string connStr = ConfigurationManager.ConnectionStrings["tannuConn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Salary FROM Employees";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Define salary range counters
                int below10k = 0, below30k = 0, below60k = 0, below100k = 0, above100k = 0;

                foreach (DataRow row in dt.Rows)
                {
                    decimal salary = Convert.ToDecimal(row["Salary"]);

                    if (salary < 10000)
                        below10k++;
                    else if (salary < 30000)
                        below30k++;
                    else if (salary < 60000)
                        below60k++;
                    else if (salary < 100000)
                        below100k++;
                    else
                        above100k++;
                }

                // Only include non-zero ranges
                var salaryRanges = new List<string>();
                var rangeCounts = new List<int>();

                if (below10k > 0) { salaryRanges.Add("<10,000"); rangeCounts.Add(below10k); }
                if (below30k > 0) { salaryRanges.Add("<30,000"); rangeCounts.Add(below30k); }
                if (below60k > 0) { salaryRanges.Add("<60,000"); rangeCounts.Add(below60k); }
                if (below100k > 0) { salaryRanges.Add("<1,00,000"); rangeCounts.Add(below100k); }
                if (above100k > 0) { salaryRanges.Add(">1,00,000"); rangeCounts.Add(above100k); }

                JavaScriptSerializer js = new JavaScriptSerializer();
                hfEmployeeNames.Value = js.Serialize(salaryRanges);
                hfEmployeeSalaries.Value = js.Serialize(rangeCounts);
            }
        }

        private void LoadDepartmentBarChart()
        {
            string connStr = ConfigurationManager.ConnectionStrings["tannuConn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT d.Name AS DepartmentName, AVG(e.Salary) AS AvgSalary
                    FROM Employees e
                    INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
                    GROUP BY d.Name";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                var departments = new List<string>();
                var avgSalaries = new List<decimal>();

                foreach (DataRow row in dt.Rows)
                {
                    departments.Add(row["DepartmentName"].ToString());
                    avgSalaries.Add(Convert.ToDecimal(row["AvgSalary"]));
                }

                JavaScriptSerializer js = new JavaScriptSerializer();
                hfDepartmentNames.Value = js.Serialize(departments);
                hfDepartmentAverages.Value = js.Serialize(avgSalaries);
            }
        }
    }
}
