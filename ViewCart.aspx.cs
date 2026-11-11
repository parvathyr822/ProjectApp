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
    public partial class ViewCart : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Get_CartGrid();           
            }
        }
        public void Get_CartGrid()
        {
             
            string sel = "SELECT dbo.Product_Tab.Product_Name, dbo.Product_Tab.Product_Image, " +
                 "dbo.Cart_Tab.Cart_Id, dbo.Cart_Tab.Quantity, dbo.Cart_Tab.Subtotal " +
                 "FROM  dbo.Product_Tab INNER JOIN dbo.Cart_Tab " +
                 "ON dbo.Product_Tab.Product_Id = dbo.Cart_Tab.Product_Id " +
                 "WHERE dbo.Cart_Tab.[User_Id] ="+Session["regid"]+ 
                 " AND dbo.Cart_Tab.[Cart_Status] = 1";

            DataSet ds = obj.Fn_Adapter_Dataset(sel);
            CartGrid.DataSource = ds;
            CartGrid.DataBind();
        }

        protected void CartGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            CartGrid.EditIndex = e.NewEditIndex;
            Get_CartGrid();
        }

        protected void CartGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CartGrid.EditIndex = -1;
            Get_CartGrid();
        }

        protected void CartGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int cartid = Convert.ToInt32(CartGrid.DataKeys[i].Value);
            TextBox txtquantity = (TextBox)CartGrid.Rows[i].Cells[4].Controls[0];
            TextBox txtsubtotal = (TextBox)CartGrid.Rows[i].Cells[5].Controls[0];

            string strup = "update Cart_Tab set Quantity=" + txtquantity.Text + ",Subtotal=" + txtsubtotal.Text + " where Cart_Id="+cartid;
            int upd = obj.Fn_Exenonquery(strup);
            CartGrid.EditIndex = -1;
            Get_CartGrid();

        }

        protected void CartGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int cartid = Convert.ToInt32(CartGrid.DataKeys[i].Value);
            string del = "delete from Cart_Tab where Cart_id=" + cartid;
            int dl = obj.Fn_Exenonquery(del);
            CartGrid.EditIndex = -1;
            Get_CartGrid();
        }

        protected void Btnconfirm_Click(object sender, EventArgs e)
        {
            string newdt = Convert.ToDateTime(DateTime.Now.ToShortDateString()).ToString("yyyy-MM-dd");
            string s = "select Product_Id from Cart_Tab where User_Id=" + Session["regid"] + " and Cart_Status=1";
            SqlDataReader dr = obj.Fn_Exereader(s);
            List<int> plist = new List<int>();
            while (dr.Read())
            {
                plist.Add(Convert.ToInt32(dr["Product_Id"]));
            }
            foreach(int pid in plist)
            {
                string seldetails = "select Quantity,Subtotal from Cart_Tab where Product_Id="+pid+" and User_Id=" + Session["regid"];
                SqlDataReader dr1 = obj.Fn_Exereader(seldetails);
                int quan = 0, subto = 0;
                while (dr1.Read())
                {
                    quan = Convert.ToInt32(dr1["Quantity"]);
                    subto = Convert.ToInt32(dr1["Subtotal"]);
                }

                string ins = "insert into Order_Tab values(" + Session["regid"] + "," + pid + ",'" + newdt + "'," + quan + "," + subto + ",'order')";
                int ins1 = obj.Fn_Exenonquery(ins);
                string upd = "update Cart_Tab set Cart_Status=0 where Product_Id=" + pid + " and User_Id=" + Session["regid"]+" and Cart_Status= 1";
                int upd1 = obj.Fn_Exenonquery(upd);
            }
            string grndtot = "select sum(Subtotal) as Grand_Total from Order_Tab where User_Id=" + Session["regid"] + " and Order_Status='order'";
            SqlDataReader dr2 = obj.Fn_Exereader(grndtot);
            int grtotal = 0;
            if (dr2.Read())
            {
                grtotal = Convert.ToInt32(dr2["Grand_Total"]);
            }

            string insert = "insert into Bill_Tab values(" + Session["regid"] + "," + grtotal + ",'" + newdt + "')";
            int insert1 = obj.Fn_Exenonquery(insert);

            Response.Redirect("ViewBill.aspx");


        }
    }
}