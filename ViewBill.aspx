<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBill.aspx.cs" Inherits="ProjectApp.ViewBill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>View Bill - VERDELLE</title>

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

        .bill_page {
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
            background: rgba(32, 106, 93, 0.72);
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

        /* Bill Content */

        .bill_content {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 25px 20px 60px;
            box-sizing: border-box;
        }

        .bill_box {
            width: 95%;
            max-width: 950px;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.3);
            box-sizing: border-box;
        }

        .page_title {
            text-align: center;
            font-family: "Dancing Script", cursive;
            font-size: 45px;
            font-weight: bold;
            color: #333;
            margin: 0 0 35px;
        }

        .page_title span {
            color: #81b214;
        }

        /* Customer Details */

        .customer_details {
            display: grid;
            grid-template-columns: 180px 1fr;
            row-gap: 18px;
            column-gap: 20px;
            margin-bottom: 35px;
        }

        .detail_label {
            font-weight: 600;
            color: #555;
            padding: 10px 0;
        }

        .bill_textbox {
            width: 100%;
            max-width: 400px;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f8f8f8;
            color: #444;
            box-sizing: border-box;
        }

        /* GridView */

        .bill_grid {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
            margin-top: 10px;
        }

        .bill_grid th {
            background-color: #81b214;
            color: white;
            padding: 14px 12px;
            font-size: 14px;
            text-transform: uppercase;
            border: 1px solid #81b214;
        }

        .bill_grid td {
            padding: 13px 12px;
            border: 1px solid #ddd;
            background-color: white;
            color: #444;
        }

        .bill_grid tr:hover td {
            background-color: #f4f8ed;
        }

        /* Grand Total */

        .total_section {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }

        .total_label {
            font-size: 20px;
            font-weight: bold;
            color: #444;
            margin-right: 15px;
        }

        .total_value {
            font-size: 22px;
            font-weight: bold;
            color: #81b214;
        }

        /* Payment Button */

        .payment_section {
            text-align: center;
            margin-top: 30px;
        }

        .payment_button {
            background-color: #81b214;
            color: white;
            border: none;
            padding: 13px 45px;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
        }

        .payment_button:hover {
            background-color: #527a08;
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

            .bill_box {
                width: 100%;
                padding: 25px 20px;
                overflow-x: auto;
            }

            .page_title {
                font-size: 38px;
            }

            .customer_details {
                grid-template-columns: 1fr;
                row-gap: 5px;
            }

            .detail_label {
                padding-bottom: 0;
            }

            .bill_textbox {
                max-width: 100%;
            }

            .bill_grid {
                min-width: 550px;
            }

            .total_section {
                justify-content: center;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="bill_page">

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

                    <a href="ViewBill.aspx" class="active">
                        BILL
                    </a>--%>

                </div>

            </header>

            <!-- Bill -->

            <div class="bill_content">

                <div class="bill_box">

                    <h1 class="page_title">
                        <span>VERDELLE PURCHASE RECEIPT</span>
                    </h1>

                    <!-- Customer Details -->

                    <div class="customer_details">

                        <asp:Label
                            ID="Label2"
                            runat="server"
                            Text="User Name"
                            CssClass="detail_label">
                        </asp:Label>

                        <asp:TextBox
                            ID="Txtname"
                            runat="server"
                            CssClass="bill_textbox">
                        </asp:TextBox>


                        <asp:Label
                            ID="Label3"
                            runat="server"
                            Text="User Phone"
                            CssClass="detail_label">
                        </asp:Label>

                        <asp:TextBox
                            ID="Txtphone"
                            runat="server"
                            CssClass="bill_textbox">
                        </asp:TextBox>


                        <asp:Label
                            ID="Label4"
                            runat="server"
                            Text="Order Date"
                            CssClass="detail_label">
                        </asp:Label>

                        <asp:TextBox
                            ID="Txtdate"
                            runat="server"
                            CssClass="bill_textbox">
                        </asp:TextBox>

                    </div>

                    <!-- Products -->

                    <asp:GridView
                        ID="ViewBillGrid"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="bill_grid">

                        <Columns>

                            <asp:BoundField
                                DataField="Product_Name"
                                HeaderText="Product Name" />

                            <asp:BoundField
                                DataField="Quantity"
                                HeaderText="Quantity" />

                            <asp:BoundField
                                DataField="Subtotal"
                                HeaderText="Subtotal" />

                        </Columns>

                    </asp:GridView>

                    <!-- Grand Total -->

                    <div class="total_section">

                        <asp:Label
                            ID="Lblgrndtotal"
                            runat="server"
                            Text="Grand Total"
                            CssClass="total_label">
                        </asp:Label>

                    </div>

                    <!-- Payment -->

                    <div class="payment_section">

                        <asp:Button
                            ID="BtnPayment"
                            runat="server"
                            Text="Payment"
                            CssClass="payment_button"
                            OnClick="Btnpayment" />

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