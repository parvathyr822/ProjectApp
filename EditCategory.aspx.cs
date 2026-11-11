using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ProjectApp
{
    public partial class EditCategory : System.Web.UI.Page
    {
       SqlConnection con = new SqlConnection(@"server=PARVATHY-R\SQLEXPRESS;database=Project_DB;integrated security=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Get_EditGrid();
            }
        }
        public void Get_EditGrid()
        {
            string s = "select * from Category_Tab";
            SqlDataAdapter da = new SqlDataAdapter(s, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            EditGrid.DataSource = ds;
            EditGrid.DataBind();           
        }

        protected void EditGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            EditGrid.EditIndex = e.NewEditIndex;
            Get_EditGrid();
        }

        protected void EditGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            EditGrid.EditIndex = -1;
            Get_EditGrid();
        }

        protected void EditGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            FileUpload fu = (FileUpload)EditGrid.Rows[i].FindControl("EditFileUpload");
            string path = "";
            if (fu.HasFile)
            {
                path = "Category Images/" + fu.FileName;
                fu.SaveAs(Server.MapPath(path));
            }
            
            int Categoryid = Convert.ToInt32(EditGrid.DataKeys[i].Value);
            TextBox txtdescription= (TextBox)EditGrid.Rows[i].Cells[3].Controls[0];
            TextBox txtstatus = (TextBox)EditGrid.Rows[i].Cells[4].Controls[0];

            string query = "update Category_Tab set Category_Image='" + path + "',Category_Description='" + txtdescription.Text + "'," +
                "Category_Status='"+txtstatus.Text+"' where Category_Id=" + Categoryid;
            SqlCommand cmd = new SqlCommand(query,con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            EditGrid.EditIndex = -1;
            Get_EditGrid();
        }
    }
}