<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AddProduct.aspx.cs"
    Inherits="ProjectApp.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <title>VERDELLE - Add Product</title>


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

        .product_area {
            min-height: 100vh;
            position: relative;

            display: flex;
            flex-direction: column;
        }


        /* =========================
           BACKGROUND
           ========================= */

        .product_bg {
            position: fixed;

            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            z-index: -2;
        }


        .product_bg img {
            width: 100%;
            height: 100%;

            object-fit: cover;
        }


        .product_bg:after {
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

        .product_header {
            padding: 18px 0;
        }


        .product_container {
            width: 100%;
            max-width: 1140px;

            margin: auto;
            padding: 0 15px;
        }


        .product_nav {
            display: flex;

            align-items: center;

            justify-content: space-between;
        }


        /* LOGO */

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


        /* NAVIGATION */

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
           CONTENT
           ========================= */

        .product_content {
            flex: 1;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 40px 15px;
        }


        /* FORM BOX */

        .product_box {
            width: 100%;

            max-width: 600px;

            background: rgba(255,255,255,0.96);

            padding: 35px 45px;

            border-radius: 10px;

            box-shadow: 0 8px 30px
                rgba(0,0,0,0.30);
        }


        /* TITLE */

        .product_title {
            text-align: center;

            margin-bottom: 25px;
        }


        .product_title h1 {
            font-family: "Dancing Script", cursive;

            font-size: 42px;

            color: #206a5d;

            margin-bottom: 5px;
        }


        .product_title p {
            color: #777;

            margin: 0;
        }


        /* LABEL */

        .product_label {
            display: block;

            font-weight: 600;

            color: #333;

            margin-bottom: 7px;
        }


        /* TEXTBOX */

        .product_input {
            width: 100%;

            height: 42px;

            padding: 8px 12px;

            border: 1px solid #ccc;

            border-radius: 5px;

            box-sizing: border-box;
        }


        .product_input:focus {
            outline: none;

            border-color: #81b214;
        }


        /* DROPDOWN */

        .product_dropdown {
            width: 100%;

            height: 42px;

            padding: 8px 12px;

            border: 1px solid #ccc;

            border-radius: 5px;

            background: white;

            box-sizing: border-box;
        }


        .product_dropdown:focus {
            outline: none;

            border-color: #81b214;
        }


        /* DESCRIPTION */

        .product_description {
            width: 100%;

            height: 85px;

            padding: 10px 12px;

            border: 1px solid #ccc;

            border-radius: 5px;

            resize: none;

            box-sizing: border-box;
        }


        .product_description:focus {
            outline: none;

            border-color: #81b214;
        }


        /* FILE UPLOAD */

        .product_file {
            width: 100%;

            padding: 8px 0;

            color: #555;
        }


        /* VALIDATORS */

        .validator {
            color: red;

            font-size: 13px;
        }


        /* INSERT BUTTON */

        .insert_button {
            width: 100%;

            height: 45px;

            margin-top: 15px;

            border: none;

            border-radius: 5px;

            background-color: #81b214;

            color: white;

            font-size: 16px;

            font-weight: 600;

            cursor: pointer;
        }


        .insert_button:hover {
            background-color: #6d990e;
        }


        /* MESSAGE */

        .insert_message {
            display: block;

            text-align: center;

            margin-top: 15px;

            color: #206a5d;

            font-weight: 600;
        }


        /* =========================
           MOBILE
           ========================= */

        @media (max-width: 768px) {

            .product_nav {
                flex-direction: column;

                gap: 15px;
            }


            .navigation a {
                padding: 8px 12px;
            }


            .product_box {
                padding: 30px 20px;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <div class="product_area">


        <!-- BACKGROUND -->

        <div class="product_bg">

            <img src="images/hero-bg.jpg"
                 alt="Indoor Plants" />

        </div>


        <!-- =========================
             HEADER
             ========================= -->

        <header class="product_header">

            <div class="product_container">

                <div class="product_nav">


                    <!-- LOGO -->

                    <a href="AdminHome.aspx"
                       class="logo">

                        VERDELLE

                    </a>


                    <!-- NAVIGATION -->

                    <div class="navigation">

                        <a href="AdminHome.aspx">
                            HOME
                        </a>

                        

                    </div>


                </div>

            </div>

        </header>


        <!-- =========================
             PRODUCT CONTENT
             ========================= -->

        <section class="product_content">


            <div class="product_box">


                <!-- TITLE -->

                <div class="product_title">

                    <h1>
                        Add Product
                    </h1>

                    <p>
                        Add a new indoor plant to your store
                    </p>

                </div>


                <!-- CATEGORY -->

                <div>

                    <asp:Label
                        ID="Lblcatname"
                        runat="server"
                        Text="Category Name"
                        CssClass="product_label">
                    </asp:Label>


                    <asp:DropDownList
                        ID="Ddlcatname"
                        runat="server"
                        AutoPostBack="True"
                        CssClass="product_dropdown">
                    </asp:DropDownList>


                    <asp:RequiredFieldValidator
                        ID="Rfvcatname"
                        runat="server"
                        ControlToValidate="Ddlcatname"
                        ErrorMessage="Enter category name"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- PRODUCT NAME -->

                <div>

                    <asp:Label
                        ID="Lblproname"
                        runat="server"
                        Text="Product Name"
                        CssClass="product_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="Txtproname"
                        runat="server"
                        CssClass="product_input">
                    </asp:TextBox>


                    <asp:RequiredFieldValidator
                        ID="Rfvproname"
                        runat="server"
                        ControlToValidate="Txtproname"
                        ErrorMessage="Enter product name"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- PRICE -->

                <div>

                    <asp:Label
                        ID="Lblprice"
                        runat="server"
                        Text="Product Price"
                        CssClass="product_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="Txtproprice"
                        runat="server"
                        CssClass="product_input">
                    </asp:TextBox>


                    <asp:RequiredFieldValidator
                        ID="Rfvproprice"
                        runat="server"
                        ControlToValidate="Txtproprice"
                        ErrorMessage="Enter product price"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- IMAGE -->

                <div>

                    <asp:Label
                        ID="Lblimage"
                        runat="server"
                        Text="Product Image"
                        CssClass="product_label">
                    </asp:Label>


                    <asp:FileUpload
                        ID="Fupimage"
                        runat="server"
                        CssClass="product_file" />


                    <asp:RequiredFieldValidator
                        ID="Rfvproimage"
                        runat="server"
                        ControlToValidate="Fupimage"
                        ErrorMessage="Enter product image"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- DESCRIPTION -->

                <div>

                    <asp:Label
                        ID="Lbldesc"
                        runat="server"
                        Text="Product Description"
                        CssClass="product_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="Txtprodesc"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="product_description">
                    </asp:TextBox>


                    <asp:RequiredFieldValidator
                        ID="Rfvprodesc"
                        runat="server"
                        ControlToValidate="Txtprodesc"
                        ErrorMessage="Enter product description"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- STOCK -->

                <div>

                    <asp:Label
                        ID="Lblstock"
                        runat="server"
                        Text="Product Stock"
                        CssClass="product_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="Txtprostock"
                        runat="server"
                        CssClass="product_input">
                    </asp:TextBox>


                    <asp:RequiredFieldValidator
                        ID="Rfvprostock"
                        runat="server"
                        ControlToValidate="Txtprostock"
                        ErrorMessage="Enter product stock"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <!-- INSERT -->

                <asp:Button
                    ID="Btninsert"
                    runat="server"
                    Text="INSERT PRODUCT"
                    CssClass="insert_button"
                    OnClick="Btninsert_Click" />


                <!-- MESSAGE -->

                <asp:Label
                    ID="Lblinsert"
                    runat="server"
                    Visible="False"
                    CssClass="insert_message">
                </asp:Label>


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