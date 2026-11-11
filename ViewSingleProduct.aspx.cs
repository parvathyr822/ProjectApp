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
    public partial class ViewSingleProduct : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string s = "select Product_Name,Product_Price,Product_Image,Product_Description,Product_Stock from Product_Tab where Product_Id='" + Session["product_id"] + "'";

                string s = "select *from Product_Tab where Product_Id='" + Session["product_id"] + "'";
                SqlDataReader dr = obj.Fn_Exereader(s);
                while (dr.Read())
                {
                    LblProName.Text = dr["Product_Name"].ToString();
                    LblProPrice.Text= dr["Product_Price"].ToString();
                    ProImage.ImageUrl= dr["Product_Image"].ToString();
                    LblProDesc.Text= dr["Product_Description"].ToString();
                    DdlQuantity.Items.Clear();

                    int stock = Convert.ToInt32(dr["Product_Stock"]);
                    for(int i = 1; i <= stock; i++)
                    {
                        DdlQuantity.Items.Add(i.ToString());
                    }
                }
            }
        }
        protected void Ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            Lbldisplay.Visible = true;
            Lbldisplay.Text = DdlQuantity.SelectedItem.Text;
        }

        protected void Btn_Click(object sender, EventArgs e)
        {
            int productid = Convert.ToInt32(Session["product_id"]); 
            int userid = Convert.ToInt32(Session["regid"]);
            int quantity = Convert.ToInt32(DdlQuantity.SelectedValue);
            string sel = "select Product_Price from Product_Tab where Product_Id=" + productid;
            SqlDataReader dr = obj.Fn_Exereader(sel);
            if(dr.Read())
            {
                decimal price = Convert.ToInt32(dr["Product_Price"]);
                decimal subtotal = price * quantity;

                string ins= "insert into Cart_Tab values("+productid+","+userid+","+quantity+","+subtotal+",1)";
                int insert= obj.Fn_Exenonquery(ins);
            }
            Response.Redirect("AddToCart.aspx");
        }

        protected void Btncontinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserHome.aspx");
        }

        protected void Btnviewcart_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCart.aspx");
        }
    }

        
 }
