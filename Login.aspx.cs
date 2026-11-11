using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectApp
{
    public partial class LoginReg : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            string str = "select count(Reg_Id) from Login_Tab where Username='"+TxtUname.Text+"' and Password='" + Txtpassword.Text+ "'";
            string cid = obj.Fn_Exescalar(str);
            int cid1 = Convert.ToInt32(cid);
            if (cid1 == 1)
            {
                string str1 = "select Reg_Id from Login_Tab where Username='" +TxtUname.Text+ "' and Password='" +Txtpassword.Text+"'";
                string regid = obj.Fn_Exescalar(str1);
                Session["regid"] = regid;

                string str2 = "select Log_Type from Login_Tab where Username='" + TxtUname.Text+ "' and Password='" + Txtpassword.Text+ "'";
                string logtype = obj.Fn_Exescalar(str2);
                if (logtype =="admin")
                {
                    Response.Redirect("AdminHome.aspx");
                }
                else if (logtype =="user")
                {
                    string str3 = "select User_Status from User_Reg_Tab where User_Id=" + regid;
                    string status = obj.Fn_Exescalar(str3);
                    Lbllogin.Visible = true;
                    Lbllogin.Text = "Status: " + status;                 
                    if (status == "active")
                    {
                        Response.Redirect("UserHome.aspx");
                    }
                    else if (status == "block")
                    {
                        Lbllogin.Visible = true;
                        Lbllogin.Text = "You are Blocked by Admin";
                    }
                }
            }
            else
            {
                Lbllogin.Visible = true;
                Lbllogin.Text = "Invalid Username and Password";
            }
        }
    }
}