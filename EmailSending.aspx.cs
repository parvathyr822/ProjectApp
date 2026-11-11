using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;

namespace ProjectApp
{
    public partial class EmailSending : System.Web.UI.Page
    {
        ConClass obj = new ConClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static void SendEmail2(string yourName, string yourGmailUserName, string yourGmailPassword, string toName, string toEmail, string subject, string body)

        {
            string to = toEmail; //To address    
            string from = yourGmailUserName; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = body;
            message.Subject = subject;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential(yourGmailUserName, yourGmailPassword);
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void SndBtn_Click(object sender, EventArgs e)
        {
            string uidquery = "select User_Id from Feedback_Tab where Feedback_Id=" + Session["fbid"] + "";

            string uidstr = obj.Fn_Exescalar(uidquery);

            int uid = Convert.ToInt32(uidstr);

            string namequery = "select User_Name from User_Reg_Tab where User_Id=" + uid + "";

            string toname = obj.Fn_Exescalar(namequery);

            string emailquery = "select User_Email from User_Reg_Tab where User_Id=" + uid + "";

            string toemail = obj.Fn_Exescalar(emailquery);

            SendEmail2("VERDELLE", "hyaaths.admin@gmail.com", "lbuy spmp hpsn sred"+"",toname,toemail,Txtrply.Text,Txtmsg.Text  );

            string upd = "update Feedback_Tab set Reply_Message='" + Txtrply.Text + "', Feedback_Status='inactive' where Feedback_Id=" + Session["fbid"];
            int i = obj.Fn_Exenonquery(upd);
            if (i == 1)
            {
                Lbldisplay.Visible = true;
                Lbldisplay.Text = "Feedback Reply Sent";
            }
        }
    }
}