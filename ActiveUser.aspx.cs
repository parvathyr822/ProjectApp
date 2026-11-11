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
    public partial class ActiveUser : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
        }
        public void Display()
        {
            string sel = "select * from User_Reg_Tab where User_Status='active'";
            DataSet ds = obj.Fn_Adapter_Dataset(sel);
            ActiveUserGrid.DataSource = ds;
            ActiveUserGrid.DataBind();
        }

        protected void Btnblock_Command(object sender, CommandEventArgs e)
        {
            int uid = Convert.ToInt32(e.CommandArgument);
            string upd = "update User_Reg_Tab set User_Status='blocked' where User_Id=" + uid;
            int i = obj.Fn_Exenonquery(upd);
            if (i == 1)
            {
                Display();
            }
        }
    }
}