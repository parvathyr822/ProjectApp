<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="ProjectApp.EditProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Edit Product - VERDELLE</title>

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

        .edit_product_page {
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
            gap: 10px;
        }

        .nav_links a {
            color: white;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 14px;
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 4px;
        }

        .nav_links a:hover {
            color: #81b214;
        }

        .category_active {
            background-color: #81b214;
            color: white !important;
        }

        .product_content {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 20px 60px;
            box-sizing: border-box;
        }

        .product_box {
            background: rgba(255, 255, 255, 0.96);
            width: 95%;
            max-width: 1200px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.25);
            box-sizing: border-box;
        }

        .page_title {
            text-align: center;
            margin: 0 0 30px 0;
            color: #333;
            font-family: "Dancing Script", cursive;
            font-size: 42px;
            font-weight: bold;
        }

        .page_title span {
            color: #81b214;
        }

        .product_grid {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .product_grid th {
            background-color: #81b214;
            color: white;
            padding: 14px 10px;
            font-size: 14px;
            text-transform: uppercase;
            border: 1px solid #81b214;
        }

        .product_grid td {
            padding: 12px 10px;
            border: 1px solid #ddd;
            color: #444;
            background-color: white;
            vertical-align: middle;
        }

        .product_grid tr:hover td {
            background-color: #f4f8ed;
        }

        .product_grid a {
            color: #81b214;
            font-weight: 600;
            text-decoration: none;
        }

        .product_grid a:hover {
            color: #527a08;
        }

        .product_grid input[type="submit"],
        .product_grid input[type="button"] {
            background-color: #81b214;
            color: white;
            border: none;
            padding: 7px 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        .product_grid input[type="submit"]:hover,
        .product_grid input[type="button"]:hover {
            background-color: #527a08;
        }

        .product_grid img {
            border-radius: 6px;
            object-fit: cover;
        }

        .product_grid input[type="file"] {
            max-width: 180px;
        }

        .product_grid tr:last-child td {
            padding: 10px;
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

            .product_box {
                width: 100%;
                padding: 20px;
                overflow-x: auto;
            }

            .page_title {
                font-size: 34px;
            }

            .product_grid {
                min-width: 900px;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="edit_product_page">

            <div class="plant_bg">
                <img src="images/hero-bg.jpg" alt="Indoor Plants" />
            </div>

            <div class="plant_overlay"></div>

            <header class="custom_header">

                <a href="AdminHome.aspx" class="logo">
                    VERDELLE
                </a>

                <div class="nav_links">
                    <a href="AdminHome.aspx">HOME</a>
                    
                </div>

            </header>

            <div class="product_content">

                <div class="product_box">

                    <h1 class="page_title">
                        Edit <span>Product</span>
                    </h1>

                    <asp:GridView
                        ID="EditGrid"
                        runat="server"
                        AllowPaging="True"
                        AutoGenerateColumns="False"
                        DataKeyNames="Product_Id"
                        OnPageIndexChanging="EditGrid_PageIndexChanging"
                        OnRowCancelingEdit="EditGrid_RowCancelingEdit"
                        OnRowEditing="EditGrid_RowEditing"
                        OnRowUpdating="EditGrid_RowUpdating"
                        PageSize="4"
                        CssClass="product_grid">

                        <Columns>

                            <asp:CommandField
                                ShowEditButton="True"
                                HeaderText="Action" />

                            <asp:BoundField
                                DataField="Product_Name"
                                HeaderText="Product Name" />

                            <asp:BoundField
                                DataField="Product_Price"
                                HeaderText="Product Price" />

                            <asp:TemplateField
                                HeaderText="Product Image">

                                <EditItemTemplate>

                                    <asp:FileUpload
                                        ID="EditFileUpload"
                                        runat="server" />

                                </EditItemTemplate>

                                <ItemTemplate>

                                    <asp:Image
                                        ID="EditImage"
                                        runat="server"
                                        Height="70px"
                                        Width="100px"
                                        ImageUrl='<%# Eval("Product_Image") %>'
                                        AlternateText="Product Image" />

                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:BoundField
                                DataField="Product_Description"
                                HeaderText="Product Description" />

                            <asp:BoundField
                                DataField="Product_Stock"
                                HeaderText="Product Stock" />

                            <asp:BoundField
                                DataField="Product_Status"
                                HeaderText="Product Status" />

                        </Columns>

                    </asp:GridView>

                </div>

            </div>

        </div>

    </form>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>