<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ProjectApp.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Payment - VERDELLE</title>

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

        .payment_page {
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }

        /* Background */

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
            background: rgba(32, 106, 93, 0.75);
            z-index: -1;
        }

        /* Header */

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

        /* Main Content */

        .payment_content {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 25px 20px 60px;
            box-sizing: border-box;
        }

        .payment_box {
            width: 95%;
            max-width: 850px;
            background: rgba(255, 255, 255, 0.97);
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
            margin: 0 0 10px;
        }

        .page_title span {
            color: #81b214;
        }

        .page_description {
            text-align: center;
            color: #777;
            font-size: 14px;
            margin-bottom: 30px;
        }

        /* Sections */

        .payment_section_box {
            padding: 25px;
            border: 1px solid #e5e5e5;
            border-radius: 8px;
            margin-bottom: 25px;
            background: #fff;
        }

        .section_title {
            color: #206a5d;
            font-size: 20px;
            font-weight: bold;
            margin: 0 0 22px;
            padding-bottom: 12px;
            border-bottom: 2px solid #81b214;
        }

        .form_group {
            margin-bottom: 20px;
        }

        .form_label {
            display: block;
            margin-bottom: 8px;
            color: #444;
            font-size: 14px;
            font-weight: 600;
        }

        .payment_input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            outline: none;
        }

        .payment_input:focus {
            border-color: #81b214;
            box-shadow: 0 0 5px rgba(129, 178, 20, 0.2);
        }

        .validation_message {
            display: block;
            color: #d9534f;
            font-size: 12px;
            margin-top: 5px;
        }

        /* Buttons */

        .button_section {
            text-align: center;
            margin-top: 20px;
        }

        .payment_button {
            background-color: #81b214;
            color: white;
            border: none;
            padding: 12px 35px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
        }

        .payment_button:hover {
            background-color: #527a08;
        }

        .secondary_button {
            background-color: #206a5d;
            color: white;
            border: none;
            padding: 12px 35px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
        }

        .secondary_button:hover {
            background-color: #164c42;
        }

        .status_message {
            display: block;
            margin-top: 18px;
            text-align: center;
            color: #206a5d;
            font-weight: 600;
        }

        /* Responsive */

        @media (max-width: 700px) {

            .custom_header {
                padding: 20px;
                flex-direction: column;
                gap: 15px;
            }

            .logo {
                font-size: 32px;
            }

            .nav_links {
                flex-wrap: wrap;
                justify-content: center;
            }

            .nav_links a {
                padding: 8px 10px;
                font-size: 12px;
            }

            .payment_box {
                padding: 20px;
            }

            .payment_section_box {
                padding: 18px;
            }

            .page_title {
                font-size: 36px;
            }
        }

    </style>

    <script type="text/javascript">

        function isName(event) {
            var charCode = event.which ? event.which : event.keyCode;

            if ((charCode >= 65 && charCode <= 90) ||
                (charCode >= 97 && charCode <= 122) ||
                charCode == 32) {
                return true;
            }

            return false;
        }

        function isAmount(event) {
            var charCode = event.which ? event.which : event.keyCode;

            if (charCode >= 48 && charCode <= 57) {
                return true;
            }

            if (charCode == 46) {
                return true;
            }

            return false;
        }

        function validateBalance() {
            var balance = document.getElementById('<%= Txtamt.ClientID %>').value;
            var error = document.getElementById("balanceError");

            if (balance == "") {
                error.innerHTML = "";
            }
            else if (parseFloat(balance) < 0) {
                error.innerHTML = "Balance cannot be negative.";
            }
            else {
                error.innerHTML = "";
            }
        }

    </script>

</head>

<body>

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div class="payment_page">

            <!-- Background -->

            <div class="plant_bg">
                <img src="images/hero-bg.jpg" alt="Indoor Plants" />
            </div>

            <div class="plant_overlay"></div>

            <!-- Header -->

            <header class="custom_header">

                <a href="UserHome.aspx" class="logo">
                    VERDELLE
                </a>

                <div class="nav_links">

                    <a href="UserHome.aspx">HOME</a>

                    <a href="ViewAllProducts.aspx">PLANTS</a>

                    <a href="ViewCart.aspx">CART</a>

                    <a href="ViewBill.aspx">INVOICE</a>

                    <a href="Payment.aspx" class="active">PAYMENT</a>

                </div>

            </header>

            <!-- Payment Content -->

            <div class="payment_content">

                <div class="payment_box">

                    <h1 class="page_title">
                        Secure <span>Payment</span>
                    </h1>

                    <p class="page_description">
                        Complete your VERDELLE purchase.
                    </p>

                    <!-- Account Details Section -->

                    <div class="payment_section_box">

                        <h2 class="section_title">
                            <i class="fa fa-university"></i>
                            Account Details
                        </h2>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                            <ContentTemplate>

                                <!-- Account Type -->

                                <div class="form_group">

                                    <asp:Label
                                        ID="Lblactype"
                                        runat="server"
                                        Text="Account Type"
                                        CssClass="form_label">
                                    </asp:Label>

                                    <asp:TextBox
                                        ID="Txttype"
                                        runat="server"
                                        CssClass="payment_input">
                                    </asp:TextBox>

                                    <asp:RequiredFieldValidator
                                        ID="RFVtype"
                                        runat="server"
                                        ErrorMessage="Account type is required"
                                        ControlToValidate="Txttype"
                                        CssClass="validation_message"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>

                                </div>

                                <!-- Account Number -->

                                <div class="form_group">

                                    <asp:Label
                                        ID="Lblacno"
                                        runat="server"
                                        Text="Account Number"
                                        CssClass="form_label">
                                    </asp:Label>

                                    <asp:TextBox
                                        ID="Txtacno"
                                        runat="server"
                                        AutoPostBack="True"
                                        OnTextChanged="Txtno_TextChanged"
                                        CssClass="payment_input">
                                    </asp:TextBox>

                                    <asp:RequiredFieldValidator
                                        ID="RFVno"
                                        runat="server"
                                        ControlToValidate="Txtacno"
                                        ErrorMessage="Enter valid account number"
                                        CssClass="validation_message"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>

                                </div>

                                <!-- Balance Amount -->

                                <div class="form_group">

                                    <asp:Label
                                        ID="Lblbalamt"
                                        runat="server"
                                        Text="Balance Amount"
                                        CssClass="form_label">
                                    </asp:Label>

                                    <asp:TextBox
                                        ID="Txtamt"
                                        runat="server"
                                        CssClass="payment_input"
                                        oninput="validateBalance()">
                                    </asp:TextBox>

                                    <asp:RequiredFieldValidator
                                        ID="RFVamt"
                                        runat="server"
                                        ControlToValidate="Txtamt"
                                        ErrorMessage="Insufficient Fund"
                                        CssClass="validation_message"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>

                                    <span id="balanceError"
                                          class="validation_message">
                                    </span>

                                </div>

                                <!-- Insert Button -->

                                <div class="button_section">

                                    <asp:Button
                                        ID="Btninsert"
                                        runat="server"
                                        OnClick="Btninsert_Click"
                                        Text="Insert"
                                        CssClass="payment_button" />

                                </div>

                                <asp:Label
                                    ID="lbldisplay"
                                    runat="server"
                                    Text=""
                                    Visible="False"
                                    CssClass="status_message">
                                </asp:Label>

                            </ContentTemplate>

                        </asp:UpdatePanel>

                    </div>

                    <!-- Payment Section -->

                    <div class="payment_section_box">

                        <h2 class="section_title">
                            <i class="fa fa-credit-card"></i>
                            Make Payment
                        </h2>

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">

                            <ContentTemplate>

                                <div class="form_group">

                                    <asp:Label
                                        ID="Lblno"
                                        runat="server"
                                        Text="Account Number"
                                        CssClass="form_label">
                                    </asp:Label>

                                    <asp:TextBox
                                        ID="Txtno"
                                        runat="server"
                                        CssClass="payment_input">
                                    </asp:TextBox>

                                </div>

                                <div class="button_section">

                                    <asp:Button
                                        ID="Btnpayment"
                                        runat="server"
                                        OnClick="Btnpayment_Click"
                                        Text="Payment"
                                        CausesValidation="false"
                                        CssClass="secondary_button" />

                                </div>

                                <asp:Label
                                    ID="Lblamt"
                                    runat="server"
                                    Text=""
                                    Visible="False"
                                    CssClass="status_message">
                                </asp:Label>

                            </ContentTemplate>

                        </asp:UpdatePanel>

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