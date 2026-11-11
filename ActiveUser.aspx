<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveUser.aspx.cs" Inherits="ProjectApp.ActiveUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Active Users - VERDELLE</title>

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

        .active_user_page {
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

        /* Main Content */

        .content_section {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 30px 20px 60px;
            box-sizing: border-box;
        }

        .content_box {
            width: 98%;
            max-width: 1250px;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 12px;
            padding: 35px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.3);
            box-sizing: border-box;
        }

        .page_title {
            text-align: center;
            font-family: "Dancing Script", cursive;
            font-size: 45px;
            font-weight: bold;
            color: #333;
            margin: 0 0 30px;
        }

        .page_title span {
            color: #81b214;
        }

        /* GridView */

        .grid_container {
            width: 100%;
            overflow-x: auto;
        }

        .user_grid {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .user_grid th {
            background-color: #81b214;
            color: white;
            padding: 14px 10px;
            font-size: 13px;
            border: 1px solid #81b214;
            white-space: nowrap;
        }

        .user_grid td {
            padding: 12px 10px;
            border: 1px solid #ddd;
            background-color: white;
            color: #444;
            font-size: 13px;
        }

        .user_grid tr:hover td {
            background-color: #f4f8ed;
        }

        /* Block Button */

        .user_grid input[type="submit"],
        .user_grid input[type="button"] {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
        }

        .user_grid input[type="submit"]:hover,
        .user_grid input[type="button"]:hover {
            background-color: #b52b27;
        }

        /* Responsive */

        @media (max-width: 768px) {

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

            .content_box {
                padding: 20px;
            }

            .page_title {
                font-size: 36px;
            }

            .user_grid {
                min-width: 1000px;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="active_user_page">

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

                    <a href="ActiveUser.aspx" class="active">
                        ACTIVE USERS
                    </a>

                </div>

            </header>

            <!-- Active Users -->

            <div class="content_section">

                <div class="content_box">

                    <h1 class="page_title">
                        Active <span>Users</span>
                    </h1>

                    <div class="grid_container">

                        <asp:GridView
                            ID="ActiveUserGrid"
                            runat="server"
                            AutoGenerateColumns="False"
                            CssClass="user_grid">

                            <Columns>

                                <asp:BoundField
                                    DataField="User_Id"
                                    HeaderText="User Id" />

                                <asp:BoundField
                                    DataField="User_Name"
                                    HeaderText="User Name" />

                                <asp:BoundField
                                    DataField="User_Age"
                                    HeaderText="User Age" />

                                <asp:BoundField
                                    DataField="User_Address"
                                    HeaderText="User Address" />

                                <asp:BoundField
                                    DataField="User_Phone"
                                    HeaderText="User Phone" />

                                <asp:BoundField
                                    DataField="User_Email"
                                    HeaderText="User Email" />

                                <asp:BoundField
                                    DataField="User_Status"
                                    HeaderText="User Status" />

                                <asp:TemplateField HeaderText="Block">

                                    <ItemTemplate>

                                        <asp:Button
                                            ID="Btnblock"
                                            runat="server"
                                            CommandArgument='<%# Eval("User_Id") %>'
                                            OnCommand="Btnblock_Command"
                                            Text="Block" />

                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>

                    </div>

                </div>

            </div>

        </div>

    </form>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/custom.js"></script>

</body>

</html>