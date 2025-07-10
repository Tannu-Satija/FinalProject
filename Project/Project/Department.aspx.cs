using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Project
{
    public partial class Department : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartments();
            }
        }

        private void LoadDepartments()
        {
            string connStr = ConfigurationManager.ConnectionStrings["tannuConn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT DepartmentID, Name AS DepartmentName
                    FROM Departments
                    ORDER BY Name";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvDepartments.DataSource = dt;
                gvDepartments.DataBind();
            }
        }
    }
}
