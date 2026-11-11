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
    public partial class ViewBill : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Get_ViewBillGrid();
            }

            string user = "select User_Name,User_Phone from User_Reg_Tab where User_Id=" + Session["regid"] + "";
            SqlDataReader dr = obj.Fn_Exereader(user);
            if (dr.Read())
            {
                Txtname.Text = dr["User_Name"].ToString();
                Txtphone.Text = dr["User_Phone"].ToString();
            }
            dr.Close();

            string date = "select Order_Date from Order_Tab where User_Id=" + Session["regid"] + " and Order_Status='order'";
            SqlDataReader dr1 = obj.Fn_Exereader(date);
            if (dr1.Read())
            {
                Txtdate.Text = Convert.ToDateTime(dr1["Order_Date"]).ToString("dd-MM-yyyy");
            }
            dr1.Close();
         }

            public void Get_ViewBillGrid()
            {
                string order = "select Product_Tab.Product_Name, Order_Tab.Quantity, Order_Tab.Subtotal " +
                 "from Order_Tab inner join Product_Tab " +
                    "on Order_Tab.Product_Id=Product_Tab.Product_Id " +
                    "where Order_Tab.User_Id=" + Session["regid"] +
                       " and Order_Tab.Order_Status='order'";

                SqlDataReader dr2 = obj.Fn_Exereader(order);

                ViewBillGrid.DataSource = dr2;
                ViewBillGrid.DataBind();

                dr2.Close();
            
            string total = "select Grand_Total from Bill_Tab where User_Id="+ Session["regid"]+ "";

            SqlDataReader dr3 = obj.Fn_Exereader(total);

            if (dr3.Read())
            {
                Lblgrndtotal.Text = dr3["Grand_Total"].ToString();
            }

            dr3.Close();
     }
        protected void Btnpayment(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}



