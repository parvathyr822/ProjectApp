<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="ProjectApp.ViewFeedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>VERDELLE - View Feedback</title>

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

        body {
            background: #206a5d;
        }

        .feedback_page {
            min-height: 100vh;
            position: relative;
            padding-bottom: 40px;
            box-sizing: border-box;
        }

        /* Background Image */

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
            background: rgba(32, 106, 93, 0.72);
            z-index: -1;
        }

        /* Header */

        .custom_header {
            width: 100%;
            padding: 25px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
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
            flex-wrap: wrap;
            gap: 8px;
        }

        .nav_links a {
            color: white;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 14px;
            font-weight: 600;
            padding: 10px 18px;
            border-radius: 4px;
            transition: 0.3s;
        }

        .nav_links a:hover {
            color: #81b214;
        }

        .nav_links .active {
            background-color: #81b214;
            color: white;
        }

        /* Page Heading */

        .page_heading {
            text-align: center;
            padding: 35px 20px 25px;
            color: white;
        }

        .page_heading h1 {
            font-family: "Dancing Script", cursive;
            font-size: 48px;
            font-weight: bold;
            margin: 0;
        }

        .page_heading h1 span {
            color: #81b214;
        }

        .page_heading p {
            font-size: 17px;
            margin-top: 10px;
            margin-bottom: 0;
        }

        /* Feedback Container */

        .feedback_container {
            width: 95%;
            max-width: 1250px;
            margin: 0 auto;
            padding: 25px;
            background: rgba(255, 255, 255, 0.96);
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
            box-sizing: border-box;
            overflow-x: auto;
        }

        .feedback_title {
            color: #333333;
            font-family: "Dancing Script", cursive;
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            margin: 0 0 25px;
        }

        .feedback_title i {
            color: #81b214;
        }

        /* GridView */

        .feedback_grid {
            width: 100%;
            border-collapse: collapse;
            background: white;
            color: #333333;
        }

        .feedback_grid th {
            background: #206a5d;
            color: white;
            padding: 14px 12px;
            text-align: center;
            font-size: 13px;
            white-space: nowrap;
        }

        .feedback_grid td {
            padding: 13px 12px;
            text-align: center;
            border-bottom: 1px solid #e5e5e5;
            font-size: 13px;
            overflow-wrap: anywhere;
        }

        .feedback_grid tr:nth-child(even) {
            background: #f4f8f1;
        }

        .feedback_grid tr:hover {
            background: #eaf3df;
        }

        /* Reply Button */

        .reply_button {
            background: #81b214;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 9px 18px;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
        }

        .reply_button:hover {
            background: #668e0c;
            color: white;
        }

        /* Footer */

        .page_footer {
            text-align: center;
            color: white;
            font-size: 12px;
            padding: 25px 10px 0;
        }

        /* Responsive Design */

        @media (max-width: 768px) {

            .custom_header {
                padding: 20px;
                justify-content: center;
                gap: 15px;
            }

            .logo {
                font-size: 32px;
            }

            .nav_links {
                justify-content: center;
                gap: 5px;
            }

            .nav_links a {
                padding: 8px 10px;
                font-size: 12px;
            }

            .page_heading h1 {
                font-size: 40px;
            }

            .page_heading p {
                font-size: 14px;
            }

            .feedback_container {
                width: 96%;
                padding: 15px;
            }

            .feedback_title {
                font-size: 28px;
            }

        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="feedback_page">

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

                <nav class="nav_links">

                    <a href="AdminHome.aspx">
                        <i class="fa fa-home"></i> ADMIN HOME
                    </a>

                    <a href="ActiveUser.aspx">
                        <i class="fa fa-users"></i> ACTIVE USERS
                    </a>

                    <a href="ViewFeedback.aspx" class="active">
                        <i class="fa fa-comments"></i> FEEDBACK
                    </a>

                    <a href="EmailSending.aspx">
                        <i class="fa fa-envelope"></i> EMAIL
                    </a>

                </nav>

            </header>

            <!-- Heading -->

            <div class="page_heading">

                <h1>
                    Customer <span>Feedback</span>
                </h1>

                <p>
                    Read customer feedback and reply to their messages.
                </p>

            </div>

            <!-- Feedback Details -->

            <div class="feedback_container">

                <h2 class="feedback_title">
                    <i class="fa fa-comments"></i>
                    Feedback Details
                </h2>

                <asp:GridView
                    ID="Feedgrid"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="feedback_grid"
                    GridLines="None"
                    CellPadding="0"
                    Width="100%">

                    <Columns>

                        <asp:BoundField
                            DataField="Product_Id"
                            HeaderText="Product Id" />

                        <asp:BoundField
                            DataField="User_Name"
                            HeaderText="User Name" />

                        <asp:BoundField
                            DataField="User_Email"
                            HeaderText="Email Id" />

                        <asp:BoundField
                            DataField="Feedback_Message"
                            HeaderText="Feedback Message" />

                        <asp:BoundField
                            DataField="Feedback_Date"
                            HeaderText="Feedback Date" />

                        <asp:TemplateField HeaderText="Reply">

                            <ItemTemplate>

                                <asp:Button
                                    ID="ReplyBtn"
                                    runat="server"
                                    CommandArgument='<%# Eval("Feedback_Id") %>'
                                    OnCommand="ReplyBtn_Command"
                                    Text="Reply"
                                    CssClass="reply_button" />

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

            <!-- Footer -->

            <div class="page_footer">
                VERDELLE | Bring Nature Home
            </div>

        </div>

        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/custom.js"></script>

    </form>

</body>
</html>