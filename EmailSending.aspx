<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailSending.aspx.cs" Inherits="ProjectApp.EmailSending" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Email Sending - VERDELLE</title>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />

    <style type="text/css">

        html, body {
            margin: 0;
            padding: 0;
            min-height: 100%;
            font-family: "Open Sans", sans-serif;
        }

        .email_page {
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }

        /* Background */

        .plant_bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -2;
        }

        .plant_bg img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .plant_overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(32, 106, 93, 0.75);
            z-index: -1;
        }

        /* Header */

        .custom_header {
            width: 100%;
            padding: 25px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-sizing: border-box;
        }

        .logo {
            color: white;
            font-family: "Dancing Script", cursive;
            font-size: 38px;
            font-weight: bold;
            text-decoration: none;
        }

        .logo:hover {
            color: white;
            text-decoration: none;
        }

        .nav_links {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav_links a {
            color: white;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 14px;
            font-weight: 600;
            padding: 10px 18px;
            border-radius: 4px;
        }

        .nav_links a:hover {
            color: #81b214;
        }

        .nav_links .active {
            background-color: #81b214;
            color: white;
        }

        /* Email Form */

        .email_content {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 35px 20px 60px;
            box-sizing: border-box;
        }

        .email_box {
            width: 95%;
            max-width: 650px;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.3);
            box-sizing: border-box;
        }

        .page_title {
            text-align: center;
            font-family: "Dancing Script", cursive;
            font-size: 45px;
            font-weight: bold;
            color: #333;
            margin: 0 0 10px;
        }

        .page_title span {
            color: #81b214;
        }

        .page_description {
            text-align: center;
            color: #777;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .form_group {
            margin-bottom: 22px;
        }

        .form_label {
            display: block;
            margin-bottom: 9px;
            color: #444;
            font-size: 14px;
            font-weight: 600;
        }

        .email_input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            box-sizing: border-box;
            outline: none;
        }

        .email_input:focus {
            border-color: #81b214;
            box-shadow: 0 0 5px rgba(129, 178, 20, 0.25);
        }

        .message_input {
            min-height: 130px;
            resize: vertical;
        }

        /* Send Button */

        .send_section {
            text-align: center;
            margin-top: 25px;
        }

        .send_button {
            background-color: #81b214;
            color: white;
            border: none;
            padding: 13px 40px;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
        }

        .send_button:hover {
            background-color: #527a08;
        }

        /* Status Message */

        .status_message {
            display: block;
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            font-weight: 600;
            color: #206a5d;
        }

        /* Responsive */

        @media (max-width: 700px) {

            .custom_header {
                padding: 20px;
                flex-direction: column;
                gap: 15px;
            }

            .logo {
                font-size: 32px;
            }

            .nav_links {
                flex-wrap: wrap;
                justify-content: center;
            }

            .nav_links a {
                padding: 8px 10px;
                font-size: 12px;
            }

            .email_box {
                padding: 25px 20px;
            }

            .page_title {
                font-size: 36px;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="email_page">

            <!-- Background -->

            <div class="plant_bg">
                <img src="images/hero-bg.jpg" alt="Indoor Plants" />
            </div>

            <div class="plant_overlay"></div>

            <!-- Header -->

            <header class="custom_header">

                <a href="AdminHome.aspx" class="logo">
                    VERDELLE
                </a>

                <div class="nav_links">

                    <a href="AdminHome.aspx">
                        ADMIN HOME
                    </a>

                    <a href="EmailSending.aspx" class="active">
                        EMAIL SENDING
                    </a>

                </div>

            </header>

            <!-- Email Form -->

            <div class="email_content">

                <div class="email_box">

                    <h1 class="page_title">
                        Feedback <span>Reply</span>
                    </h1>

                    <p class="page_description">
                        Send a reply to your VERDELLE customers.
                    </p>

                    <!-- Feedback Reply -->

                    <div class="form_group">

                        <asp:Label
                            ID="Lblreply"
                            runat="server"
                            Text="Feedback Reply"
                            CssClass="form_label">
                        </asp:Label>

                        <asp:TextBox
                            ID="Txtrply"
                            runat="server"
                            CssClass="email_input">
                        </asp:TextBox>

                    </div>

                    <!-- Reply Message -->

                    <div class="form_group">

                        <asp:Label
                            ID="Lblmsg"
                            runat="server"
                            Text="Reply Message"
                            CssClass="form_label">
                        </asp:Label>

                        <asp:TextBox
                            ID="Txtmsg"
                            runat="server"
                            CssClass="email_input message_input"
                            TextMode="MultiLine"
                            Rows="5">
                        </asp:TextBox>

                    </div>

                    <!-- Send Button -->

                    <div class="send_section">

                        <asp:Button
                            ID="SndBtn"
                            runat="server"
                            OnClick="SndBtn_Click"
                            Text="Send Reply"
                            CssClass="send_button" />

                    </div>

                    <!-- Status Message -->

                    <asp:Label
                        ID="Lbldisplay"
                        runat="server"
                        Text=""
                        Visible="False"
                        CssClass="status_message">
                    </asp:Label>

                </div>

            </div>

        </div>

    </form>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/custom.js"></script>

</body>

</html>