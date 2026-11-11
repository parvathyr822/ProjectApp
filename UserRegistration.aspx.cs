using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectApp
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnReg_Click(object sender, EventArgs e)
        {
            string sel = "select max(Reg_Id) from Login_Tab";
            string maxregid = obj.Fn_Exescalar(sel);
            int reg_id = 0;
            if (maxregid == "")
            {
                reg_id = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(maxregid);
                reg_id = newregid + 1;
            }
            string ins = "insert into User_Reg_Tab values(" + reg_id + ",'" + Txtname.Text + "','" + Txtage.Text + "','" + Txtaddress.Text + "'," + Txtphone.Text + ",'" + Txtemail.Text + "','active')";
            int i = obj.Fn_Exenonquery(ins);
            if (i == 1)
            {
                string inslog = "insert into Login_Tab values(" + reg_id + ",'" + TxtUname.Text + "','" + Txtpass.Text + "','user')";
                int j = obj.Fn_Exenonquery(inslog);
                if (i == 1 && j == 1)
                {
                    LblReg.Visible = true;
                    LblReg.Text = "Successfully Registered";
                }
                else
                {
                    LblReg.Visible = true;
                    LblReg.Text = "Invalid Entry";
                }
            }
        }   
    }
}