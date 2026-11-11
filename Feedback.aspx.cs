using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectApp
{
    public partial class Feedback : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string date = Convert.ToDateTime(DateTime.Now.ToShortDateString()).ToString("yyyy-MM-dd");
            string ins = "insert into Feedback_Tab values(" + Session["regid"] + "," + Pid.Text + ",'" + fbm.Text + "','"+date+"','active','null')";
            int i = obj.Fn_Exenonquery(ins);
            if (i == 1)
            {
                lbldisplay.Visible = true;
                lbldisplay.Text = "Feedback Sent";
            }
        }
    }
}