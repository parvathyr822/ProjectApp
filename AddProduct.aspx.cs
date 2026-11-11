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
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"server=PARVATHY-R\SQLEXPRESS;database=Project_DB;Integrated Security=True");

        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {          
            string s = "select Category_Id,Category_Name from Category_Tab where Category_Status='available'";
            SqlDataAdapter da = new SqlDataAdapter(s,con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Ddlcatname.DataSource = ds;
            Ddlcatname.DataTextField = "Category_Name";
            Ddlcatname.DataValueField = "Category_Id";
            Ddlcatname.DataBind();

            }
        }

        protected void Btninsert_Click(object sender, EventArgs e)
        {
            string path = "~/Product Images/" + Fupimage.FileName;
            Fupimage.SaveAs(MapPath(path));

            string ins = "insert into Product_Tab values(" + Ddlcatname.SelectedItem.Value + ",'" + Txtproname.Text + "'," + Txtproprice.Text + ",'" + path + "','" + Txtprodesc.Text + "'," + Txtprostock.Text + ",'available')";
            int i = obj.Fn_Exenonquery(ins);
            if (i == 1)
            {
                Lblinsert.Visible = true;
                Lblinsert.Text = "Inserted";
            }
        }
    }
}