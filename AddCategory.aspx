<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AddCategory.aspx.cs"
    Inherits="ProjectApp.AddCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <title>VERDELLE - Add Category</title>


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

        .category_area {

            min-height: 100vh;

            position: relative;

            display: flex;

            flex-direction: column;
        }


        /* =========================
           BACKGROUND
           ========================= */

        .category_bg {

            position: fixed;

            top: 0;

            left: 0;

            width: 100%;

            height: 100%;

            z-index: -2;
        }


        .category_bg img {

            width: 100%;

            height: 100%;

            object-fit: cover;
        }


        /* Green overlay */

        .category_bg:after {

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

        .category_header {

            padding: 18px 0;
        }


        .category_container {

            width: 100%;

            max-width: 1140px;

            margin: auto;

            padding: 0 15px;
        }


        .category_nav {

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

        .category_content {

            flex: 1;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 40px 15px;
        }


        /* =========================
           FORM BOX
           ========================= */

        .category_box {

            width: 100%;

            max-width: 550px;

            background: rgba(255,255,255,0.96);

            padding: 35px 45px;

            border-radius: 10px;

            box-shadow: 0 8px 30px
                rgba(0,0,0,0.30);
        }


        /* TITLE */

        .category_title {

            text-align: center;

            margin-bottom: 25px;
        }


        .category_title h1 {

            font-family: "Dancing Script", cursive;

            font-size: 42px;

            color: #206a5d;

            margin-bottom: 5px;
        }


        .category_title p {

            color: #777;

            margin: 0;
        }


        /* LABEL */

        .category_label {

            display: block;

            font-weight: 600;

            color: #333;

            margin-bottom: 7px;
        }


        /* TEXTBOX */

        .category_input {

            width: 100%;

            height: 42px;

            padding: 8px 12px;

            border: 1px solid #ccc;

            border-radius: 5px;

            box-sizing: border-box;
        }


        .category_input:focus {

            outline: none;

            border-color: #81b214;
        }


        /* DESCRIPTION */

        .category_description {

            width: 100%;

            height: 90px;

            padding: 10px 12px;

            border: 1px solid #ccc;

            border-radius: 5px;

            resize: none;

            box-sizing: border-box;
        }


        .category_description:focus {

            outline: none;

            border-color: #81b214;
        }


        /* FILE UPLOAD */

        .category_file {

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


        /* MOBILE */

        @media (max-width: 768px) {

            .category_nav {

                flex-direction: column;

                gap: 15px;
            }


            .navigation a {

                padding: 8px 12px;
            }


            .category_box {

                padding: 30px 20px;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <div class="category_area">


        <!-- =========================
             BACKGROUND
             ========================= -->

        <div class="category_bg">

            <img src="images/hero-bg.jpg"
                 alt="Indoor Plants" />

        </div>


        <!-- =========================
             HEADER
             ========================= -->

        <header class="category_header">

            <div class="category_container">

                <div class="category_nav">


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
             CATEGORY CONTENT
             ========================= -->

        <section class="category_content">


            <div class="category_box">


                <!-- TITLE -->

                <div class="category_title">

                    <h1>
                        Add Category
                    </h1>

                    <p>
                        Add a new plant category
                    </p>

                </div>


                <!-- CATEGORY NAME -->

                <div>

                    <asp:Label
                        ID="Lblcatname"
                        runat="server"
                        Text="Category Name"
                        CssClass="category_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="Txtcatname"
                        runat="server"
                        CssClass="category_input">
                    </asp:TextBox>


                    <asp:RequiredFieldValidator
                        ID="Rfvcatname"
                        runat="server"
                        ControlToValidate="Txtcatname"
                        ErrorMessage="Enter category name"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- CATEGORY IMAGE -->

                <div>

                    <asp:Label
                        ID="Lblcatimage"
                        runat="server"
                        Text="Category Image"
                        CssClass="category_label">
                    </asp:Label>


                    <asp:FileUpload
                        ID="Fupimage"
                        runat="server"
                        CssClass="category_file" />


                    <asp:RequiredFieldValidator
                        ID="Rfvcatimage"
                        runat="server"
                        ControlToValidate="Fupimage"
                        ErrorMessage="Enter category image"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- CATEGORY DESCRIPTION -->

                <div>

                    <asp:Label
                        ID="Lblcatdescr"
                        runat="server"
                        Text="Category Description"
                        CssClass="category_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="Txtcatdesc"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="category_description">
                    </asp:TextBox>


                    <asp:RequiredFieldValidator
                        ID="Rfvcatdesc"
                        runat="server"
                        ControlToValidate="Txtcatdesc"
                        ErrorMessage="Enter category description"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <!-- INSERT BUTTON -->

                <asp:Button
                    ID="Btninsert"
                    runat="server"
                    Text="INSERT CATEGORY"
                    CssClass="insert_button"
                    OnClick="Btninsert_Click" />


                <!-- INSERT MESSAGE -->

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