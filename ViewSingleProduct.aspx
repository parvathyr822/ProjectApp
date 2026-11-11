<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSingleProduct.aspx.cs" Inherits="ProjectApp.ViewSingleProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Product Details - VERDELLE</title>

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

        .product_page {
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

        .product_content {
            min-height: calc(100vh - 90px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 20px 60px;
            box-sizing: border-box;
        }

        .product_box {
            width: 90%;
            max-width: 900px;
            background: rgba(255, 255, 255, 0.96);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.3);
            box-sizing: border-box;
        }

        .page_title {
            text-align: center;
            font-family: "Dancing Script", cursive;
            font-size: 42px;
            font-weight: bold;
            color: #333;
            margin: 0 0 30px;
        }

        .page_title span {
            color: #81b214;
        }

        .product_details {
            display: flex;
            align-items: center;
            gap: 45px;
        }

        .image_section {
            width: 45%;
            text-align: center;
        }

        .product_image {
            width: 100%;
            max-width: 330px;
            height: 330px;
            object-fit: cover;
            border-radius: 12px;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.2);
        }

        .details_section {
            width: 55%;
        }

        .product_name {
            display: block;
            color: #333;
            font-family: "Dancing Script", cursive;
            font-size: 38px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product_price {
            display: block;
            color: #81b214;
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .product_description {
            display: block;
            color: #666;
            font-size: 15px;
            line-height: 1.7;
            margin-bottom: 25px;
        }

        .quantity_label {
            display: block;
            color: #333;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .quantity_dropdown {
            width: 120px;
            height: 40px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px 10px;
            margin-bottom: 10px;
        }

        .display_label {
            display: block;
            color: #81b214;
            font-weight: bold;
            font-size: 16px;
            margin: 8px 0 20px;
        }

        .button_section {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .product_button {
            background-color: #81b214;
            color: white;
            border: none;
            padding: 11px 20px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
        }

        .product_button:hover {
            background-color: #527a08;
        }

        .continue_button {
            background-color: #333;
        }

        .continue_button:hover {
            background-color: #555;
        }

        .cart_button {
            background-color: #527a08;
        }

        .cart_button:hover {
            background-color: #3d5c06;
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

            .product_box {
                width: 100%;
                padding: 25px 20px;
            }

            .product_details {
                display: block;
            }

            .image_section,
            .details_section {
                width: 100%;
            }

            .image_section {
                margin-bottom: 30px;
            }

            .product_image {
                width: 260px;
                height: 260px;
            }

            .product_name {
                font-size: 32px;
            }

            .page_title {
                font-size: 35px;
            }

            .button_section {
                justify-content: center;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="product_page">

            <div class="plant_bg">
                <img src="images/hero-bg.jpg" alt="Indoor Plants" />
            </div>

            <div class="plant_overlay"></div>

            <header class="custom_header">

                <a href="UserHome.aspx" class="logo">
                    VERDELLE
                </a>

               <%-- <div class="nav_links">

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

                    <a href="LoginReg.aspx">
                        LOGIN
                    </a>

                </div>--%>

            </header>

            <div class="product_content">

                <div class="product_box">

                    <h1 class="page_title">
                        Product <span>Details</span>
                    </h1>

                    <div class="product_details">

                        <div class="image_section">

                            <asp:Image
                                ID="ProImage"
                                runat="server"
                                CssClass="product_image" />

                        </div>

                        <div class="details_section">

                            <asp:Label
                                ID="LblProName"
                                runat="server"
                                Text="Product_Name"
                                CssClass="product_name">
                            </asp:Label>

                            <asp:Label
                                ID="LblProPrice"
                                runat="server"
                                Text="Product_Price"
                                CssClass="product_price">
                            </asp:Label>

                            <asp:Label
                                ID="LblProDesc"
                                runat="server"
                                Text="Product_Description"
                                CssClass="product_description">
                            </asp:Label>

                            <span class="quantity_label">
                                Select Quantity
                            </span>

                            <asp:DropDownList
                                ID="DdlQuantity"
                                runat="server"
                                AutoPostBack="True"
                                OnSelectedIndexChanged="Ddl_SelectedIndexChanged"
                                CssClass="quantity_dropdown">
                            </asp:DropDownList>

                            <asp:Label
                                ID="Lbldisplay"
                                runat="server"
                                Text="Label"
                                Visible="False"
                                CssClass="display_label">
                            </asp:Label>

                            <div class="button_section">

                                <asp:Button
                                    ID="BtnAddToCart"
                                    runat="server"
                                    OnClick="Btn_Click"
                                    Text="Add To Cart"
                                    CssClass="product_button" />

                                <asp:Button
                                    ID="Btncontinue"
                                    runat="server"
                                    OnClick="Btncontinue_Click"
                                    Text="Continue"
                                    CssClass="product_button continue_button" />

                                <asp:Button
                                    ID="Btnviewcart"
                                    runat="server"
                                    OnClick="Btnviewcart_Click"
                                    Text="View Cart"
                                    CssClass="product_button cart_button" />

                            </div>

                        </div>

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