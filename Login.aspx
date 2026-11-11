<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="ProjectApp.LoginReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <title>VERDELLE - Login</title>

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

        /* ==============================
           LOGIN PAGE
           ============================== */

        .login_area {
            min-height: 100vh;
            position: relative;
            display: flex;
            flex-direction: column;
        }

        /* Background image */

        .login_bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .login_bg img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Green overlay */

        .login_bg:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            background: linear-gradient(
                to right,
                rgba(32,106,93,0.60),
                rgba(32,106,93,0.70),
                rgba(32,106,93,0.60)
            );
        }


        /* ==============================
           HEADER
           ============================== */

        .login_header {
            padding: 15px 0;
        }

        .login_container {
            width: 100%;
            max-width: 1140px;
            margin: auto;
            padding: 0 15px;
        }

        .login_nav {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        /* Logo */

        .logo {
            font-family: 'Dancing Script', cursive;
            font-size: 32px;
            font-weight: bold;
            color: white;
        }

        .logo:hover {
            color: white;
            text-decoration: none;
        }


        /* Navigation */

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

            font-family: "Open Sans", sans-serif;

            transition: 0.3s;
        }

        .navigation a:hover {
            color: #81b214;
        }

        /* Active HOME */

        .navigation .active {
            background-color: #81b214;
            color: white;
        }


        /* ==============================
           LOGIN BOX
           ============================== */

        .login_content {

            flex: 1;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 50px 15px;
        }


        .login_box {

            width: 100%;

            max-width: 420px;

            padding: 40px;

            background: rgba(255,255,255,0.95);

            border-radius: 10px;

            box-shadow: 0 5px 25px
                rgba(0,0,0,0.25);
        }


        .login_title {

            text-align: center;

            margin-bottom: 30px;
        }


        .login_title h1 {

            font-family: 'Dancing Script', cursive;

            font-size: 40px;

            color: #206a5d;

            margin-bottom: 5px;
        }


        .login_title p {

            color: #777;

            margin: 0;
        }


        /* Labels */

        .login_label {

            display: block;

            margin-bottom: 7px;

            font-weight: 600;

            color: #333;
        }


        /* Textboxes */

        .login_input {

            width: 100%;

            height: 45px;

            padding: 8px 12px;

            border: 1px solid #ccc;

            border-radius: 5px;

            box-sizing: border-box;

            margin-bottom: 5px;
        }


        .login_input:focus {

            outline: none;

            border-color: #81b214;
        }


        /* Validators */

        .validator {

            color: red;

            font-size: 13px;
        }


        /* Login Button */

        .login_button {

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


        .login_button:hover {

            background-color: #6d990e;
        }


        /* Login message */

        .login-message {
    display: block;
    color: #dc3545;
    font-size: 14px;
    margin-top: 10px;
    text-align: center;
}


        /* ==============================
           MOBILE
           ============================== */

        @media (max-width: 768px) {

            .login_nav {
                flex-direction: column;
                gap: 15px;
            }

            .navigation a {
                padding: 8px 12px;
            }

            .login_box {
                padding: 30px 20px;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <!-- ==============================
         BACKGROUND
         ============================== -->

    <div class="login_area">

        <div class="login_bg">

            <img src="images/hero-bg.jpg"
                 alt="Indoor Plants" />

        </div>


        <!-- ==============================
             HEADER
             ============================== -->

        <header class="login_header">

            <div class="login_container">

                <div class="login_nav">


                    <!-- LOGO -->

                    <a href="UserHome.aspx"
                       class="logo">

                        VERDELLE

                    </a>

                </div>

            </div>

        </header>


        <!-- ==============================
             LOGIN CONTENT
             ============================== -->

        <section class="login_content">

            <div class="login_box">


                <!-- TITLE -->

                <div class="login_title">

                    <h1>
                        Welcome Back
                    </h1>

                    <p>
                        Login to continue shopping
                    </p>

                </div>


                <!-- USERNAME -->

                <div>

                    <asp:Label
                        ID="LblUname"
                        runat="server"
                        Text="Username"
                        CssClass="login_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="TxtUname"
                        runat="server"
                        CssClass="login_input">
                    </asp:TextBox>


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
                        ID="Lblpassword"
                        runat="server"
                        Text="Password"
                        CssClass="login_label">
                    </asp:Label>


                    <asp:TextBox
                        ID="Txtpassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="login_input">
                    </asp:TextBox>


                    <asp:RequiredFieldValidator
                        ID="Rfvpassword"
                        runat="server"
                        ControlToValidate="Txtpassword"
                        ErrorMessage="Enter password"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>


                <!-- LOGIN BUTTON -->

                <asp:Button
                    ID="Btnlogin"
                    runat="server"
                    Text="LOGIN"
                    CssClass="login_button"
                    OnClick="Btnlogin_Click" />


                <!-- MESSAGE -->

                <asp:Label
                    ID="Lbllogin"
                    runat="server"
                    Visible="False"
                    CssClass="login-message"></asp:Label>


            </div>

        </section>


    </div>


</form>

</body>

</html>