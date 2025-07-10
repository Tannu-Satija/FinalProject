using System;
using System.Data.SqlClient;

namespace Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session only on first load
            if (!IsPostBack)
            {
                Session.Clear(); // Optional: clear previous session
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();

            string connStr = @"Data Source=DESKTOP-GMK701V;Initial Catalog=tannu;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT Username FROM Users WHERE Username = @username AND Password = @password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    Session["username"] = result.ToString();
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Username or Password');", true);
                }
            }
        }
    }
}
