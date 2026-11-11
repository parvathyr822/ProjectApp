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
    public partial class UserHome : System.Web.UI.Page
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
            string s = "select * from Category_Tab where Category_Status='available'";
            DataTable dt = obj.Fn_Adapter_Datatable(s);
            DataList.DataSource = dt;
            DataList.DataBind();
        }
        protected void ImgBtn_Command(object sender, CommandEventArgs e)
        {
            int category_id = Convert.ToInt32(e.CommandArgument);
            Session["category_id"] = category_id;
            Response.Redirect("ViewAllProducts.aspx");
        }

        protected void Lbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Feedback.aspx");
        }
    }
}