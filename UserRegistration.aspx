<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="ProjectApp.UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>User Registration - VERDELLE</title>

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

        .registration_page {
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

        .nav_links .active {
            background-color: #81b214;
            color: white;
        }

        .registration_content {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px 20px 60px;
            box-sizing: border-box;
        }

        .registration_box {
            background: rgba(255, 255, 255, 0.96);
            width: 95%;
            max-width: 650px;
            padding: 35px 45px;
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

        .form_row {
            display: flex;
            align-items: center;
            margin-bottom: 18px;
        }

        .form_label {
            width: 170px;
            color: #333;
            font-size: 15px;
            font-weight: 600;
            flex-shrink: 0;
        }

        .form_input {
            flex: 1;
        }

        .form_input input[type="text"],
        .form_input input[type="password"],
        .form_input textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            outline: none;
            font-family: "Open Sans", sans-serif;
        }

        .form_input input[type="text"]:focus,
        .form_input input[type="password"]:focus,
        .form_input textarea:focus {
            border-color: #81b214;
            box-shadow: 0 0 4px rgba(129, 178, 20, 0.35);
        }

        .form_input textarea {
            height: 80px;
            resize: vertical;
        }

        .validator {
            color: #d9534f;
            font-size: 12px;
            margin-left: 10px;
        }

        .button_row {
            text-align: center;
            margin-top: 25px;
        }

        .register_button {
            background-color: #81b214;
            color: white;
            border: none;
            padding: 12px 35px;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
        }

        .register_button:hover {
            background-color: #527a08;
        }

        @media (max-width: 700px) {

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

            .registration_box {
                padding: 25px 20px;
            }

            .form_row {
                display: block;
            }

            .form_label {
                display: block;
                width: 100%;
                margin-bottom: 6px;
            }

            .validator {
                display: block;
                margin: 5px 0 0 0;
            }

            .page_title {
                font-size: 34px;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="registration_page">

            <div class="plant_bg">
                <img src="images/hero-bg.jpg" alt="Indoor Plants" />
            </div>

            <div class="plant_overlay"></div>

            <header class="custom_header">

                <a href="UserHome.aspx" class="logo">
                    VERDELLE
                </a>

                <div class="nav_links">
                    <a href="LoginReg.aspx">LOGIN</a>
                    <a href="UserHome.aspx">HOME</a>
                </div>

            </header>

            <div class="registration_content">

                <div class="registration_box">

                    <h1 class="page_title">
                        Create Your <span>Account</span>
                    </h1>

                    <div class="form_row">

                        <div class="form_label">
                            <asp:Label ID="Lblname" runat="server" Text="Name"></asp:Label>
                        </div>

                        <div class="form_input">
                            <asp:TextBox ID="Txtname" runat="server"></asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="Rfvname"
                                runat="server"
                                ControlToValidate="Txtname"
                                ErrorMessage="Enter the name"
                                CssClass="validator">
                                Enter the name
                            </asp:RequiredFieldValidator>
                        </div>

                    </div>


                    <div class="form_row">

                        <div class="form_label">
                            <asp:Label ID="Lblage" runat="server" Text="Age"></asp:Label>
                        </div>

                        <div class="form_input">

                            <asp:TextBox ID="Txtage" runat="server"></asp:TextBox>

                            <asp:RangeValidator
                                ID="Rvage"
                                runat="server"
                                ControlToValidate="Txtage"
                                ErrorMessage="Enter age between 20 to 60"
                                MaximumValue="60"
                                MinimumValue="20"
                                Type="Integer"
                                CssClass="validator">
                                Enter age between 20 to 60
                            </asp:RangeValidator>

                        </div>

                    </div>


                    <div class="form_row">

                        <div class="form_label">
                            <asp:Label ID="Lbladdress" runat="server" Text="Address"></asp:Label>
                        </div>

                        <div class="form_input">

                            <asp:TextBox
                                ID="Txtaddress"
                                runat="server"
                                TextMode="MultiLine">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="Rfvaddress"
                                runat="server"
                                ControlToValidate="Txtaddress"
                                ErrorMessage="Enter a valid street address"
                                CssClass="validator">
                                Enter a valid street address
                            </asp:RequiredFieldValidator>

                        </div>

                    </div>


                    <div class="form_row">

                        <div class="form_label">
                            <asp:Label ID="Lblphone" runat="server" Text="Phone"></asp:Label>
                        </div>

                        <div class="form_input">

                            <asp:TextBox ID="Txtphone" runat="server"></asp:TextBox>

                            <asp:RegularExpressionValidator
                                ID="Revphone"
                                runat="server"
                                ControlToValidate="Txtphone"
                                ErrorMessage="Invalid phone number"
                                ValidationExpression="^[789]\d{9}$"
                                CssClass="validator">
                                Invalid phone number
                            </asp:RegularExpressionValidator>

                        </div>

                    </div>


                    <div class="form_row">

                        <div class="form_label">
                            <asp:Label ID="Lblemail" runat="server" Text="Email"></asp:Label>
                        </div>

                        <div class="form_input">

                            <asp:TextBox ID="Txtemail" runat="server"></asp:TextBox>

                            <asp:RegularExpressionValidator
                                ID="Revemail"
                                runat="server"
                                ControlToValidate="Txtemail"
                                ErrorMessage="Enter valid email ID"
                                ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$"
                                CssClass="validator">
                                Enter valid email ID
                            </asp:RegularExpressionValidator>

                        </div>

                    </div>


                    <div class="form_row">

                        <div class="form_label">
                            <asp:Label ID="LblUname" runat="server" Text="Username"></asp:Label>
                        </div>

                        <div class="form_input">

                            <asp:TextBox ID="TxtUname" runat="server"></asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="RfvUname"
                                runat="server"
                                ControlToValidate="TxtUname"
                                ErrorMessage="Enter username"
                                CssClass="validator">
                                Enter username
                            </asp:RequiredFieldValidator>

                        </div>

                    </div>


                    <div class="form_row">

                        <div class="form_label">
                            <asp:Label ID="Lblpass" runat="server" Text="Password"></asp:Label>
                        </div>

                        <div class="form_input">

                            <asp:TextBox
                                ID="Txtpass"
                                runat="server"
                                TextMode="Password">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="Rfvpass"
                                runat="server"
                                ControlToValidate="Txtpass"
                                Display="Dynamic"
                                ErrorMessage="Enter password"
                                CssClass="validator">
                                Enter password
                            </asp:RequiredFieldValidator>

                        </div>

                    </div>


                    <div class="form_row">

                        <div class="form_label">
                            <asp:Label ID="Lblconpass" runat="server" Text="Confirm Password"></asp:Label>
                        </div>

                        <div class="form_input">

                            <asp:TextBox
                                ID="Txtconpass"
                                runat="server"
                                TextMode="Password">
                            </asp:TextBox>

                            <asp:CompareValidator
                                ID="cvconpass"
                                runat="server"
                                ControlToCompare="Txtpass"
                                ControlToValidate="Txtconpass"
                                ErrorMessage="Password mismatch"
                                CssClass="validator">
                                Password mismatch
                            </asp:CompareValidator>

                        </div>

                    </div>


                    <div class="button_row">

                        <asp:Button
                            ID="BtnReg"
                            runat="server"
                            OnClick="BtnReg_Click"
                            Text="Register"
                            CssClass="register_button" />

                    </div>


                    <asp:Label
                        ID="LblReg"
                        runat="server"
                        Text="Label"
                        Visible="False">
                    </asp:Label>

                </div>

            </div>

        </div>

    </form>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>