<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="ProjectApp.ViewCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Cart - VERDELLE</title>

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

        .nav_links .active {
            background-color: #81b214;
            color: white;
        }

        .cart_content {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 30px 20px 60px;
            box-sizing: border-box;
        }

        .cart_box {
            width: 95%;
            max-width: 1100px;
            background: rgba(255, 255, 255, 0.96);
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

        .cart_grid {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .cart_grid th {
            background-color: #81b214;
            color: white;
            padding: 14px 10px;
            font-size: 14px;
            text-transform: uppercase;
            border: 1px solid #81b214;
        }

        .cart_grid td {
            padding: 12px 10px;
            border: 1px solid #ddd;
            background-color: white;
            color: #444;
            vertical-align: middle;
        }

        .cart_grid tr:hover td {
            background-color: #f4f8ed;
        }

        .cart_grid a {
            color: #81b214;
            font-weight: 600;
            text-decoration: none;
        }

        .cart_grid a:hover {
            color: #527a08;
        }

        .cart_grid input[type="submit"],
        .cart_grid input[type="button"] {
            background-color: #81b214;
            color: white;
            border: none;
            padding: 7px 13px;
            border-radius: 4px;
            cursor: pointer;
        }

        .cart_grid input[type="submit"]:hover,
        .cart_grid input[type="button"]:hover {
            background-color: #527a08;
        }

        .cart_grid img {
            width: 85px;
            height: 65px;
            object-fit: cover;
            border-radius: 6px;
        }

        .confirm_section {
            text-align: center;
            margin-top: 30px;
        }

        .confirm_button {
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

        .confirm_button:hover {
            background-color: #527a08;
        }

        @media (max-width: 900px) {

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
                padding: 20px;
                overflow-x: auto;
            }

            .cart_grid {
                min-width: 750px;
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

               <%-- <div class="nav_links">

                    <a href="UserHome.aspx">
                        HOME
                    </a>

                    <a href="ViewAllProducts.aspx">
                        PLANTS
                    </a>

                    <a href="ViewCart.aspx" class="active">
                        <i class="fa fa-shopping-cart"></i>
                        CART
                    </a>

                    <a href="LoginReg.aspx">
                        LOGIN
                    </a>

                </div>--%>

            </header>

            <div class="cart_content">

                <div class="cart_box">

                    <h1 class="page_title">
                        Your <span>Cart</span>
                    </h1>

                    <asp:GridView
                        ID="CartGrid"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataKeyNames="Cart_Id"
                        OnRowCancelingEdit="CartGrid_RowCancelingEdit"
                        OnRowDeleting="CartGrid_RowDeleting"
                        OnRowEditing="CartGrid_RowEditing"
                        OnRowUpdating="CartGrid_RowUpdating"
                        CssClass="cart_grid">

                        <Columns>

                            <asp:CommandField
                                ShowEditButton="True"
                                HeaderText="Edit" />

                            <asp:CommandField
                                ShowDeleteButton="True"
                                HeaderText="Delete" />

                            <asp:BoundField
                                DataField="Product_Name"
                                HeaderText="Product Name" />

                            <asp:TemplateField
                                HeaderText="Product Image">

                                <ItemTemplate>

                                    <asp:Image
                                        ID="Image1"
                                        runat="server"
                                        ImageUrl='<%# Eval("Product_Image") %>'
                                        AlternateText="Product Image" />

                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:BoundField
                                DataField="Quantity"
                                HeaderText="Quantity" />

                            <asp:BoundField
                                DataField="Subtotal"
                                HeaderText="Subtotal" />

                        </Columns>

                    </asp:GridView>

                    <div class="confirm_section">

                        <asp:Button
                            ID="Btnconfirm"
                            runat="server"
                            Text="Confirm"
                            CssClass="confirm_button" OnClick="Btnconfirm_Click" />

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