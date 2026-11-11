using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectApp
{
    public partial class AddCategory : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btninsert_Click(object sender, EventArgs e)
        {
            string path = "~/Category Images/" + Fupimage.FileName;
            Fupimage.SaveAs(MapPath(path));

            string ins = "insert into Category_Tab values('" + Txtcatname.Text + "','" + path + "','" + Txtcatdesc.Text + "','available')";
            int i = obj.Fn_Exenonquery(ins);
            if (i == 1)
            {
                Lblinsert.Visible = true;
                Lblinsert.Text = "Inserted";
            }
        }
    }
}