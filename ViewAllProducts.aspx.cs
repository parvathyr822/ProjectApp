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
    public partial class ViewAllProducts : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Get_DataList();
            }
        }
        public void Get_DataList()
        {
            string s = "select * from Product_Tab where Category_Id='"+Session["category_id"]+"' and Product_Status='available'";
            DataTable dt = obj.Fn_Adapter_Datatable(s);
            DataList.DataSource = dt;
            DataList.DataBind();
        }

        protected void ImgBtn_Command(object sender, CommandEventArgs e)
        {
            int product_id = Convert.ToInt32(e.CommandArgument);
            Session["product_id"] = product_id;
            Response.Redirect("ViewSingleProduct.aspx");
        }
    }
}