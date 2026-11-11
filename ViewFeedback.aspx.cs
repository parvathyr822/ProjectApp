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
    public partial class ViewFeedback : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sel = "SELECT dbo.Feedback_Tab.Feedback_Id, dbo.Product_Tab.Product_Name, dbo.User_Reg_Tab.User_Name, " +
              "dbo.Feedback_Tab.Feedback_Message, dbo.Feedback_Tab.Feedback_Date, dbo.User_Reg_Tab.User_Email, " +
              "dbo.Product_Tab.Product_Id FROM dbo.Feedback_Tab INNER JOIN " +
              "dbo.Product_Tab ON dbo.Feedback_Tab.Product_Id = dbo.Product_Tab.Product_Id INNER JOIN " +
              "dbo.User_Reg_Tab ON dbo.Feedback_Tab.User_Id = dbo.User_Reg_Tab.User_Id WHERE Feedback_Status = 'active'";

                DataSet ds = obj.Fn_Adapter_Dataset(sel);
                Feedgrid.DataSource = ds;
                Feedgrid.DataBind();
            }
        }

        protected void ReplyBtn_Command(object sender, CommandEventArgs e)
        {
            int fid = Convert.ToInt32(e.CommandArgument);
            Session["fbid"] = fid;
            Response.Redirect("EmailSending.aspx");
        }
    }
}