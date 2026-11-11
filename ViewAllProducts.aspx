<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAllProducts.aspx.cs" Inherits="ProjectApp.ViewAllProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>All Products - VERDELLE</title>

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

        .products_page {
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

        .nav_links .active {
            background-color: #81b214;
            color: white;
        }

        .products_content {
            width: 100%;
            padding: 30px 30px 60px;
            box-sizing: border-box;
        }

        .page_title {
            text-align: center;
            color: white;
            font-family: "Dancing Script", cursive;
            font-size: 45px;
            font-weight: bold;
            margin: 10px 0 35px;
        }

        .page_title span {
            color: #81b214;
        }

        .product_list {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .product_card {
            width: 220px;
            margin: 12px;
            background: rgba(255, 255, 255, 0.96);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
            text-align: center;
            transition: transform 0.3s ease;
            padding-bottom: 18px;
        }

        .product_card:hover {
            transform: translateY(-8px);
        }

        .product_image {
            width: 100%;
            height: 180px;
            display: block;
            object-fit: cover;
            border: none;
            cursor: pointer;
        }

        .product_name {
            display: block;
            color: #333;
            font-family: "Dancing Script", cursive;
            font-size: 25px;
            font-weight: bold;
            margin: 14px 10px 5px;
        }

        .product_price {
            display: block;
            color: #81b214;
            font-size: 18px;
            font-weight: bold;
            margin: 5px 10px;
        }

        .product_description {
            display: block;
            color: #666;
            font-size: 13px;
            line-height: 1.5;
            padding: 0 12px;
        }

        @media (max-width: 1200px) {

            .product_card {
                width: 200px;
            }

            .product_image {
                height: 165px;
            }
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

            .products_content {
                padding: 20px 10px 40px;
            }

            .page_title {
                font-size: 36px;
            }

            .product_card {
                width: 190px;
                margin: 8px;
            }

            .product_image {
                height: 155px;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="products_page">

            <div class="plant_bg">
                <img src="images/hero-bg.jpg" alt="Indoor Plants" />
            </div>

            <div class="plant_overlay"></div>

            <header class="custom_header">

                <a href="UserHome.aspx" class="logo">
                    VERDELLE
                </a>

               

            </header>

            <div class="products_content">

                <h1 class="page_title">
                    Explore Our <span>Plants</span>
                </h1>

                <div class="product_list">

                    <asp:DataList
                        ID="DataList"
                        runat="server"
                        RepeatColumns="5"
                        RepeatDirection="Horizontal">

                        <ItemTemplate>

                            <div class="product_card">

                                <asp:ImageButton
                                    ID="ImgBtn"
                                    runat="server"
                                    CommandArgument='<%# Eval("Product_Id") %>'
                                    ImageUrl='<%# Eval("Product_Image") %>'
                                    OnCommand="ImgBtn_Command"
                                    Width="220px"
                                    Height="180px"
                                    CssClass="product_image" />

                                <asp:Label
                                    ID="Label1"
                                    runat="server"
                                    Text='<%# Eval("Product_Name") %>'
                                    CssClass="product_name">
                                </asp:Label>

                                <asp:Label
                                    ID="Label2"
                                    runat="server"
                                    Text='<%# Eval("Product_Price") %>'
                                    CssClass="product_price">
                                </asp:Label>

                                <asp:Label
                                    ID="Label3"
                                    runat="server"
                                    Text='<%# Eval("Product_Description") %>'
                                    CssClass="product_description">
                                </asp:Label>

                            </div>

                        </ItemTemplate>

                    </asp:DataList>

                </div>

            </div>

        </div>

    </form>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/custom.js"></script>

</body>

</html>