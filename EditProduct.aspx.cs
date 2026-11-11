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
    public partial class EditProduct : System.Web.UI.Page
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
            string s = "select * from Product_Tab";
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
                path = "Product Images/" + fu.FileName;
                fu.SaveAs(Server.MapPath(path));
            }

            int Productid = Convert.ToInt32(EditGrid.DataKeys[i].Value);           
            TextBox txtprice = (TextBox)EditGrid.Rows[i].Cells[2].Controls[0];
            TextBox txtdescription = (TextBox)EditGrid.Rows[i].Cells[4].Controls[0];
            TextBox txtstock = (TextBox)EditGrid.Rows[i].Cells[5].Controls[0];
            TextBox txtstatus = (TextBox)EditGrid.Rows[i].Cells[6].Controls[0];


            string query = "update Product_Tab set Product_Price=" + txtprice.Text + ",Product_Image='" + path + "'," +
                "Product_Description='" + txtdescription.Text + "',Product_Stock=" + txtstock.Text + "," +
                "Product_Status='" + txtstatus.Text + "' where Product_Id="+Productid;
            SqlCommand cmd = new SqlCommand(query,con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            EditGrid.EditIndex = -1;
            Get_EditGrid();
        }

        protected void EditGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            EditGrid.PageIndex = e.NewPageIndex;
            Get_EditGrid();
        }
    }
}