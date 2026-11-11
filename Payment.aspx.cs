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
    public partial class Payment : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Btninsert_Click(object sender, EventArgs e)
        {
            string ins = "insert into Account_Tab values(" + Session["regid"] + ",'" + Txttype.Text + "'," + Txtacno.Text + "," + Txtamt.Text + ")";
            int i = obj.Fn_Exenonquery(ins);
           

        }

        protected void Txtno_TextChanged(object sender, EventArgs e)
        {
            string sel = "select count(Account_Id) from Account_Tab where Account_Number=" + Txtacno.Text + "";
            string caid = obj.Fn_Exescalar(sel);
            if (caid == "1")
            {
                lbldisplay.Visible = true;
                lbldisplay.Text = "Account Number Already Exists";
            }
            else
            {
                lbldisplay.Visible = true;
                lbldisplay.Text = "Account Number Inserted Successfully";
            }
        }

        protected void Btnpayment_Click(object sender, EventArgs e)
        {
            PaymentService.ServiceClient service = new PaymentService.ServiceClient();
            string bal = service.checkbalance(Txtno.Text);
            if (bal == "")
            {
                Lblamt.Visible = true;
                Lblamt.Text = "Invalid Account Number";
                return;
            }
            double dbal = Convert.ToDouble(bal);

            string gtot = service.GetGrandTotal(Session["regid"].ToString());
            double grandtotal = Convert.ToDouble(gtot);
            if (dbal >= grandtotal)
            {
                double newbalance = dbal - grandtotal;
                UpdateBalance.ServiceClient service1 = new UpdateBalance.ServiceClient();
                int i = service1.Balanceupdate(newbalance, Txtno.Text);
                if (i == 1)
                {
                    Lblamt.Visible = true;
                    Lblamt.Text = newbalance.ToString();

                    string pquery = "select Product_Id from Order_Tab where User_Id=" + Session["regid"] + " and Order_Status='order'";
                    SqlDataReader dr = obj.Fn_Exereader(pquery);

                    List<int> proidlist = new List<int>();

                    while (dr.Read())
                    {
                        proidlist.Add(Convert.ToInt32(dr["Product_Id"]));
                    }
                    dr.Close();

                    foreach (int pid in proidlist)
                    {
                        string getstk = "select Product_Stock from Product_Tab where Product_Id=" + pid;
                        string ostk = obj.Fn_Exescalar(getstk);
                        int oldstk = Convert.ToInt32(ostk);

                        string getquan = "select Quantity from Order_Tab where Product_Id=" + pid + " and User_Id=" + Session["regid"] + " and Order_Status='order'";
                        string q = obj.Fn_Exescalar(getquan);
                        int quan = Convert.ToInt32(q);

                        int newstk = oldstk - quan;

                        string stkup = "update Product_Tab set Product_Stock=" + newstk + " where Product_Id=" + pid;
                        obj.Fn_Exenonquery(stkup);

                        string orderup = "update Order_Tab set Order_Status='paid' where Product_Id=" + pid + " and User_Id=" + Session["regid"] + " and Order_Status='order'";
                        obj.Fn_Exenonquery(orderup);
                    }
                }
            else
            {
                Lblamt.Visible = true;
                Lblamt.Text = "Insufficient Balance";
            }
        }
     }
        
    }
}