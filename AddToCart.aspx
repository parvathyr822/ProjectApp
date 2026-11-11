<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="ProjectApp.AddToCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Add To Cart - VERDELLE</title>

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

        .cart_page {
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }

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
        }

        .nav_links a:hover {
            color: #81b214;
        }

        .cart_content {
            min-height: calc(100vh - 100px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 20px 60px;
            box-sizing: border-box;
        }

        .cart_box {
            width: 90%;
            max-width: 700px;
            background: rgba(255, 255, 255, 0.96);
            padding: 45px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.3);
            box-sizing: border-box;
        }

        .page_title {
            font-family: "Dancing Script", cursive;
            font-size: 45px;
            font-weight: bold;
            color: #333;
            margin: 0 0 20px;
        }

        .page_title span {
            color: #81b214;
        }

        .cart_icon {
            font-size: 65px;
            color: #81b214;
            margin-bottom: 15px;
        }

        .cart_message {
            color: #666;
            font-size: 16px;
            line-height: 1.7;
        }

        @media (max-width: 768px) {

            .custom_header {
                padding: 20px;
            }

            .logo {
                font-size: 30px;
            }

            .nav_links a {
                padding: 8px 10px;
                font-size: 12px;
            }

            .cart_box {
                width: 100%;
                padding: 30px 20px;
            }

            .page_title {
                font-size: 36px;
            }

        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="cart_page">

            <div class="plant_bg">
                <img src="images/hero-bg.jpg" alt="Indoor Plants" />
            </div>

            <div class="plant_overlay"></div>

            <header class="custom_header">

                <a href="UserHome.aspx" class="logo">
                    VERDELLE
                </a>

<%--                <div class="nav_links">

                    <a href="UserHome.aspx">
                        HOME
                    </a>

                    <a href="ViewAllProducts.aspx">
                        PLANTS
                    </a>

                    <a href="ViewCart.aspx">
                        <i class="fa fa-shopping-cart"></i>
                        CART
                    </a>

                </div>--%>

            </header>

            <div class="cart_content">

                <div class="cart_box">

                    <div class="cart_icon">
                        <i class="fa fa-shopping-cart"></i>
                    </div>

                    <h1 class="page_title">
                        Add To <span>Cart</span>
                    </h1>

                    <p class="cart_message">
                        Your selected product has been added to your shopping cart.
                    </p>

                </div>

            </div>

        </div>

    </form>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/custom.js"></script>

</body>

</html>