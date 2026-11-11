<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="ProjectApp.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>VERDELLE - Home</title>

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

        .user_home {
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

        .hero_content {
            text-align: center;
            padding: 35px 20px 20px;
            color: white;
        }

        .hero_content h1 {
            font-family: "Dancing Script", cursive;
            font-size: 55px;
            font-weight: bold;
            margin: 0;
        }

        .hero_content h1 span {
            color: #81b214;
        }

        .hero_content p {
            font-size: 17px;
            margin-top: 8px;
            margin-bottom: 0;
        }

        .category_section {
            width: 100%;
            padding: 30px 30px 60px;
            box-sizing: border-box;
        }

        .section_title {
            text-align: center;
            color: white;
            font-family: "Dancing Script", cursive;
            font-size: 40px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .section_title span {
            color: #81b214;
        }

        .category_list {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .category_card {
            width: 210px;
            margin: 12px;
            background: rgba(255, 255, 255, 0.96);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .category_card:hover {
            transform: translateY(-8px);
        }

        .category_image {
            width: 100%;
            height: 170px;
            display: block;
            object-fit: cover;
            border: none;
            cursor: pointer;
        }

        .category_name {
            display: block;
            color: #333;
            font-family: "Dancing Script", cursive;
            font-size: 25px;
            font-weight: bold;
            margin: 12px 10px 5px;
        }

        .category_description {
            display: block;
            color: #666;
            font-size: 13px;
            line-height: 1.5;
            padding: 0 12px 18px;
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

            .hero_content h1 {
                font-size: 42px;
            }

            .hero_content p {
                font-size: 14px;
            }

            .category_section {
                padding: 20px 10px 40px;
            }

            .category_card {
                width: 190px;
            }

        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="user_home">

            <div class="plant_bg">
                <img src="images/hero-bg.jpg" alt="Indoor Plants" />
            </div>

            <div class="plant_overlay"></div>

            <header class="custom_header">

                <a href="UserHome.aspx" class="logo">
                    VERDELLE
                </a>

               <%-- <div class="nav_links">
                    <a href="UserHome.aspx" class="active">HOME</a>
                    <a href="ViewCart.aspx">
                        <i class="fa fa-shopping-cart"></i>
                        CART
                    </a>
                    
                </div>--%>

            </header>

            <div class="hero_content">

                <h1>
                    Welcome to <span>VERDELLE</span>
                </h1>

                <p>
                    Bring nature home and discover plants that make every space feel alive.
                </p>

            </div>

            <div class="category_section">

                <h2 class="section_title">
                    Explore Our <span>Plants</span>
                </h2>

                <div class="category_list">

                    <asp:DataList
                        ID="DataList"
                        runat="server"
                        RepeatColumns="5"
                        RepeatDirection="Horizontal">

                        <ItemTemplate>

                            <div class="category_card">

                                <asp:ImageButton
                                    ID="ImgBtn"
                                    runat="server"
                                    CommandArgument='<%# Eval("Category_Id") %>'
                                    Height="170px"
                                    ImageUrl='<%# Eval("Category_Image") %>'
                                    OnCommand="ImgBtn_Command"
                                    Width="210px"
                                    CssClass="category_image" />

                                <asp:Label
                                    ID="Label2"
                                    runat="server"
                                    Text='<%# Eval("Category_Name") %>'
                                    CssClass="category_name">
                                </asp:Label>

                                <asp:Label
                                    ID="Label3"
                                    runat="server"
                                    Text='<%# Eval("Category_Description") %>'
                                    CssClass="category_description">
                                </asp:Label>

                            </div>

                        </ItemTemplate>

                    </asp:DataList>

                </div>

            </div>

        </div>

                    </div>
            <!-- End category_section -->

            <div style="text-align:center; padding:20px 0 40px 0;">

            <asp:LinkButton
                ID="Lbtn"
                runat="server"
                OnClick="Lbtn_Click"
                Style="display:inline-block;
                       background-color:#81b214;
                       color:white;
                       padding:12px 28px;
                       border-radius:5px;
                       text-decoration:none;
                       font-size:15px;
                       font-weight:bold;">

                <i class="fa fa-comment"></i> Send Feedback

            </asp:LinkButton>

            </div>

        </div>
        <!-- End user_home -->

        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/custom.js"></script>

    </form>
            <div style="text-align:center; padding:20px 0 40px 0;">

        </div>

        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/custom.js"></script>

    </form>

</body>
</html>
