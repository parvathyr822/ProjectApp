<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminRegistration.aspx.cs"
    Inherits="ProjectApp.AdminRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <title>VERDELLE - Admin Registration</title>

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

        /* PAGE BACKGROUND */

        .register_area {
            min-height: 100vh;
            position: relative;

            display: flex;
            flex-direction: column;
        }


        /* BACKGROUND IMAGE */

        .register_bg {
            position: fixed;

            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            z-index: -2;
        }


        .register_bg img {
            width: 100%;
            height: 100%;

            object-fit: cover;
        }


        /* GREEN OVERLAY */

        .register_bg:after {
            content: "";

            position: absolute;

            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            background: rgba(38, 113, 101, 0.70);
        }


        /* HEADER */

        .register_header {
            padding: 15px 0;
        }


        .register_container {
            width: 100%;

            max-width: 1140px;

            margin: auto;

            padding: 0 15px;
        }


        .register_nav {
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

            gap: 5px;
        }


        .navigation a {
            padding: 10px 20px;

            color: white;

            text-decoration: none;

            text-transform: uppercase;

            font-size: 15px;
        }


        .navigation a:hover {
            background-color: #81b214;

            color: white;
        }


        /* REGISTRATION CONTENT */

        .register_content {

            flex: 1;

            display: flex;

            justify-content: center;

            align-items: center;

            padding: 40px 15px;
        }


        /* REGISTRATION BOX */

        .register_box {

            width: 100%;

            max-width: 550px;

            background: rgba(255,255,255,0.96);

            padding: 35px 45px;

            border-radius: 10px;

            box-shadow: 0 8px 30px
                rgba(0,0,0,0.30);
        }


        /* TITLE */

        .register_title {

            text-align: center;

            margin-bottom: 25px;
        }


        .register_title h1 {

            font-family: "Dancing Script", cursive;

            font-size: 38px;

            color: #206a5d;

            margin-bottom: 5px;
        }


        .register_title p {

            color: #777;

            margin: 0;
        }


        /* LABEL */

        .register_label {

            display: block;

            font-weight: 600;

            color: #333;

            margin-bottom: 5px;
        }


        /* INPUT */

        .register_input {

            width: 100%;

            height: 42px;

            padding: 8px 12px;

            border: 1px solid #ccc;

            border-radius: 5px;

            box-sizing: border-box;
        }


        .register_input:focus {

            outline: none;

            border-color: #81b214;
        }


        /* VALIDATION */

        .validator {

            color: red;

            font-size: 13px;
        }


        /* REGISTER BUTTON */

        .register_button {

            width: 100%;

            height: 45px;

            margin-top: 10px;

            border: none;

            border-radius: 5px;

            background-color: #81b214;

            color: white;

            font-size: 16px;

            font-weight: 600;

            cursor: pointer;
        }


        .register_button:hover {

            background-color: #6d990e;
        }


        /* RESULT MESSAGE */

        .register_message {

            display: block;

            text-align: center;

            margin-top: 15px;

            color: #206a5d;

            font-weight: 600;
        }


        /* MOBILE */

        @media (max-width: 768px) {

            .register_nav {

                flex-direction: column;

                gap: 15px;
            }

            .navigation a {

                padding: 8px 12px;
            }

            .register_box {

                padding: 30px 20px;
            }
        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <div class="register_area">


        <!-- BACKGROUND -->

        <div class="register_bg">

            <img src="images/hero-bg.jpg"
                 alt="Indoor Plants" />

        </div>


        <!-- HEADER -->

        <header class="register_header">

            <div class="register_container">

                <div class="register_nav">


                    <!-- LOGO -->

                    <a href="UserHome.aspx"
                       class="logo">

                        VERDELLE

                    </a>


                    <!-- NAVIGATION -->

                    <div class="navigation">

                        <a href="UserHome.aspx">
                            HOME
                        </a>

                        <a href="LoginReg.aspx">
                            LOGIN
                        </a>

                    </div>


                </div>

            </div>

        </header>


        <!-- REGISTRATION CONTENT -->

        <section class="register_content">

            <div class="register_box">


                <!-- TITLE -->

                <div class="register_title">

                    <h1>
                        Admin Registration
                    </h1>

                    <p>
                        Create your VERDELLE admin account
                    </p>

                </div>


                <!-- NAME -->

                <div>

                    <asp:Label
                        ID="Lblname"
                        runat="server"
                        Text="Name"
                        CssClass="register_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="TxtName"
                        runat="server"
                        CssClass="register_input">
                    </asp:TextBox>


                    <asp:RequiredFieldValidator
                        ID="RfvName"
                        runat="server"
                        ControlToValidate="TxtName"
                        ErrorMessage="Enter the name"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- EMAIL -->

                <div>

                    <asp:Label
                        ID="Lblemail"
                        runat="server"
                        Text="Email"
                        CssClass="register_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="TxtMail"
                        runat="server"
                        CssClass="register_input">
                    </asp:TextBox>


                    <asp:RegularExpressionValidator
                        ID="RevEmail"
                        runat="server"
                        ControlToValidate="TxtMail"
                        ErrorMessage="Enter valid email ID"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        CssClass="validator">
                    </asp:RegularExpressionValidator>

                </div>


                <br />


                <!-- USERNAME -->

                <div>

                    <asp:Label
                        ID="Lbluname"
                        runat="server"
                        Text="Username"
                        CssClass="register_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="TxtUname"
                        runat="server"
                        CssClass="register_input">
                    </asp:TextBox>


                    <!-- CORRECTED -->
                    <asp:RequiredFieldValidator
                        ID="RfvUname"
                        runat="server"
                        ControlToValidate="TxtUname"
                        ErrorMessage="Enter username"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- PASSWORD -->

                <div>

                    <asp:Label
                        ID="LblPass"
                        runat="server"
                        Text="Password"
                        CssClass="register_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="TxtPass"
                        runat="server"
                        TextMode="Password"
                        CssClass="register_input">
                    </asp:TextBox>


                    <asp:RequiredFieldValidator
                        ID="Rfvpass"
                        runat="server"
                        ControlToValidate="TxtPass"
                        ErrorMessage="Enter password"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <br />


                <!-- CONFIRM PASSWORD -->

                <div>

                    <asp:Label
                        ID="Lblconpass"
                        runat="server"
                        Text="Confirm Password"
                        CssClass="register_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="TxtConpass"
                        runat="server"
                        TextMode="Password"
                        CssClass="register_input">
                    </asp:TextBox>


                    <asp:CompareValidator
                        ID="CvConpass"
                        runat="server"
                        ControlToCompare="TxtPass"
                        ControlToValidate="TxtConpass"
                        ErrorMessage="Password Mismatch"
                        CssClass="validator">
                    </asp:CompareValidator>

                </div>


                <!-- REGISTER BUTTON -->

                <asp:Button
                    ID="BtnReg"
                    runat="server"
                    Text="REGISTER"
                    CssClass="register_button"
                    OnClick="BtnReg_Click" />


                <!-- MESSAGE -->

                <asp:Label
                    ID="LblReg"
                    runat="server"
                    Visible="False"
                    CssClass="register_message">
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