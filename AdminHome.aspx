<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminHome.aspx.cs"
    Inherits="ProjectApp.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <title>VERDELLE - Admin Home</title>


    <!-- Bootstrap -->

    <link rel="stylesheet"
        type="text/css"
        href="css/bootstrap.css" />

    <!-- Font Awesome -->

    <link href="css/font-awesome.min.css"
        rel="stylesheet" />

    <!-- Template CSS -->

    <link href="css/style.css"
        rel="stylesheet" />

    <link href="css/responsive.css"
        rel="stylesheet" />


    <style type="text/css">

        /* =========================
           PAGE
           ========================= */

        .admin_area {

            min-height: 100vh;

            position: relative;

            display: flex;

            flex-direction: column;
        }


        /* =========================
           BACKGROUND
           ========================= */

        .admin_bg {

            position: fixed;

            top: 0;

            left: 0;

            width: 100%;

            height: 100%;

            z-index: -2;
        }


        .admin_bg img {

            width: 100%;

            height: 100%;

            object-fit: cover;
        }


        /* Green overlay */

        .admin_bg:after {

            content: "";

            position: absolute;

            top: 0;

            left: 0;

            width: 100%;

            height: 100%;

            background: rgba(38, 113, 101, 0.72);
        }


        /* =========================
           HEADER
           ========================= */

        .admin_header {

            padding: 18px 0;
        }


        .admin_container {

            width: 100%;

            max-width: 1140px;

            margin: auto;

            padding: 0 15px;
        }


        .admin_nav {

            display: flex;

            align-items: center;

            justify-content: space-between;
        }


        /* Logo */

        .logo {

            font-family: "Dancing Script", cursive;

            font-size: 34px;

            font-weight: bold;

            color: white;

            text-decoration: none;
        }


        .logo:hover {

            color: white;

            text-decoration: none;
        }


        /* Navigation */

        .navigation {

            display: flex;

            align-items: center;
        }


        .navigation a {

            padding: 10px 20px;

            color: white;

            text-decoration: none;

            text-transform: uppercase;

            font-size: 14px;
        }


        .navigation a:hover {

            background-color: #81b214;

            color: white;
        }


        /* =========================
           MAIN CONTENT
           ========================= */

        .admin_content {

            flex: 1;

            display: flex;

            flex-direction: column;

            align-items: center;

            justify-content: center;

            padding: 60px 15px;
        }


        /* Heading */

        .admin_title {

            text-align: center;

            color: white;

            margin-bottom: 40px;
        }


        .admin_title h1 {

            font-family: "Dancing Script", cursive;

            font-size: 52px;

            margin-bottom: 8px;
        }


        .admin_title p {

            font-size: 17px;

            margin: 0;

            color: #ffffff;
        }


        /* =========================
           CARDS
           ========================= */

        .admin_cards {

            display: flex;

            flex-wrap: wrap;

            justify-content: center;

            gap: 25px;

            max-width: 900px;

            width: 100%;
        }


        .admin_card {

            width: 190px;

            min-height: 150px;

            background: rgba(255,255,255,0.95);

            border-radius: 10px;

            padding: 25px 15px;

            text-align: center;

            box-shadow: 0 6px 20px
                rgba(0,0,0,0.25);

            transition: 0.3s;
        }


        .admin_card:hover {

            transform: translateY(-7px);

            box-shadow: 0 10px 25px
                rgba(0,0,0,0.35);
        }


        /* Icons */

        .admin_icon {

            font-size: 35px;

            color: #206a5d;

            margin-bottom: 15px;
        }


        /* LinkButton */

        .admin_button {

            color: #206a5d;

            text-decoration: none;

            font-size: 16px;

            font-weight: 600;

            background: none;

            border: none;

            cursor: pointer;
        }


        .admin_button:hover {

            color: #81b214;

            text-decoration: none;
        }


        /* =========================
           MOBILE
           ========================= */

        @media (max-width: 768px) {

            .admin_nav {

                flex-direction: column;

                gap: 15px;
            }


            .admin_title h1 {

                font-size: 42px;
            }


            .admin_card {

                width: 180px;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <div class="admin_area">


        <!-- BACKGROUND -->

        <div class="admin_bg">

            <img src="images/hero-bg.jpg"
                 alt="Indoor Plants" />

        </div>


        <!-- =========================
             HEADER
             ========================= -->

        <header class="admin_header">

            <div class="admin_container">

                <div class="admin_nav">


                    <!-- LOGO -->

                    <a href="AdminHome.aspx"
                       class="logo">

                        VERDELLE

                    </a>


                    <!-- NAVIGATION -->

                    <div class="navigation">

                        <a href="AdminHome.aspx">
                            

                        </a>
                        

                    </div>


                </div>

            </div>

        </header>


        <!-- =========================
             ADMIN CONTENT
             ========================= -->

        <section class="admin_content">


            <!-- TITLE -->

            <div class="admin_title">

                <h1>
                    Admin Dashboard
                </h1>

                <p>
                    Manage your VERDELLE plant store
                </p>

            </div>


            <!-- CARDS -->

            <div class="admin_cards">


                <!-- ADD CATEGORY -->

                <div class="admin_card">

                    <div class="admin_icon">

                        <i class="fa fa-th-large"></i>

                    </div>


                    <asp:LinkButton
                        ID="Lbtncat"
                        runat="server"
                        PostBackUrl="~/AddCategory.aspx"
                        CssClass="admin_button">

                        Add Category

                    </asp:LinkButton>

                </div>


                <!-- ADD PRODUCT -->

                <div class="admin_card">

                    <div class="admin_icon">

                        <i class="fa fa-leaf"></i>

                    </div>


                    <asp:LinkButton
                        ID="Lbtnpro"
                        runat="server"
                        PostBackUrl="~/AddProduct.aspx"
                        CssClass="admin_button">

                        Add Product

                    </asp:LinkButton>

                </div>


                <!-- EDIT CATEGORY -->

                <div class="admin_card">

                    <div class="admin_icon">

                        <i class="fa fa-pencil-square-o"></i>

                    </div>


                    <asp:LinkButton
                        ID="Lbtneditcat"
                        runat="server"
                        PostBackUrl="~/EditCategory.aspx"
                        CssClass="admin_button">

                        Edit Category

                    </asp:LinkButton>

                </div>


                <!-- EDIT PRODUCT -->

                <div class="admin_card">

                    <div class="admin_icon">

                        <i class="fa fa-edit"></i>

                    </div>


                    <asp:LinkButton
                        ID="Lbtneditpro"
                        runat="server"
                        PostBackUrl="~/EditProduct.aspx"
                        CssClass="admin_button">

                        Edit Product

                    </asp:LinkButton>

                </div>

                <!-- VIEW FEEDBACK -->

<div class="admin_card">

    <div class="admin_icon">
        <i class="fa fa-comments"></i>
    </div>

    <asp:LinkButton
        ID="LinkButton1"
        runat="server"
        PostBackUrl="~/ViewFeedback.aspx"
        CssClass="admin_button">

        View Feedback

    </asp:LinkButton>

</div>

                <!-- ACTIVE USER DETAILS -->

<div class="admin_card">

    <div class="admin_icon">
        <i class="fa fa-users"></i>
    </div>

    <asp:LinkButton
        ID="LinkButton2"
        runat="server"
        PostBackUrl="~/ActiveUser.aspx"
        CssClass="admin_button">

        Active User Details

    </asp:LinkButton>

</div>

            </div>


        </section>


    </div>


    <!-- JAVASCRIPT -->

    <script src="js/jquery-3.4.1.min.js"></script>

    <script src="js/bootstrap.js"></script>

    <script src="js/custom.js"></script>


</form>

</body>

</html>