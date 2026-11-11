<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="ProjectApp.EditCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Category - VERDELLE</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />

    <!-- Template CSS -->
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />

    <style type="text/css">

        html, body {
            margin: 0;
            padding: 0;
            min-height: 100%;
            font-family: "Open Sans", sans-serif;
        }

        .edit_category_page {
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }

        /* Background image */
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

        /* Green overlay */
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

        /* Main content */
        .category_content {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 35px 20px 60px;
        }

        .category_box {
            background: rgba(255, 255, 255, 0.96);
            width: 95%;
            max-width: 1100px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.25);
        }

        .page_title {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            font-family: "Dancing Script", cursive;
            font-size: 42px;
            font-weight: bold;
        }

        .page_title span {
            color: #81b214;
        }

        /* GridView */
        .category_grid {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        .category_grid th {
            background-color: #81b214;
            color: white;
            padding: 14px 10px;
            font-size: 15px;
            text-transform: uppercase;
        }

        .category_grid td {
            padding: 12px 10px;
            border-bottom: 1px solid #ddd;
            color: #444;
            background-color: white;
            vertical-align: middle;
        }

        .category_grid tr:hover td {
            background-color: #f4f8ed;
        }

        .category_grid a {
            color: #81b214;
            font-weight: 600;
            text-decoration: none;
        }

        .category_grid a:hover {
            color: #527a08;
        }

        .category_grid input[type="submit"],
        .category_grid input[type="button"] {
            background-color: #81b214;
            color: white;
            border: none;
            padding: 7px 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        .category_grid input[type="submit"]:hover,
        .category_grid input[type="button"]:hover {
            background-color: #527a08;
        }

        .category_grid img {
            border-radius: 6px;
            object-fit: cover;
        }

        /* File upload */
        .category_grid input[type="file"] {
            max-width: 180px;
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

            .category_box {
                width: 100%;
                padding: 20px;
                overflow-x: auto;
            }

            .page_title {
                font-size: 34px;
            }

            .category_grid {
                min-width: 750px;
            }
        }

    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="edit_category_page">

            <!-- Background -->
            <div class="plant_bg">
                <img src="images/hero-bg.jpg" alt="Indoor Plants" />
            </div>

            <!-- Green overlay -->
            <div class="plant_overlay"></div>

            <!-- Header -->
            <header class="custom_header">

                <a href="AdminHome.aspx" class="logo">
                    VERDELLE
                </a>

                <div class="nav_links">
                    <a href="AdminHome.aspx">HOME</a>
                    
                </div>

            </header>


            <!-- Main Content -->
            <div class="category_content">

                <div class="category_box">

                    <h1 class="page_title">
                        Edit <span>Category</span>
                    </h1>

                    <asp:GridView
                        ID="EditGrid"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataKeyNames="Category_Id"
                        OnRowCancelingEdit="EditGrid_RowCancelingEdit"
                        OnRowEditing="EditGrid_RowEditing"
                        OnRowUpdating="EditGrid_RowUpdating"
                        CssClass="category_grid">

                        <Columns>
                            

    <asp:CommandField
        ShowEditButton="True"
        HeaderText="Action" />

    <asp:BoundField
        DataField="Category_Name"
        HeaderText="Category Name" />

    <asp:TemplateField HeaderText="Category Image">

        <EditItemTemplate>

            <asp:FileUpload
                ID="EditFileUpload"
                runat="server" />

        </EditItemTemplate>

        <ItemTemplate>

            <asp:Image
                ID="Editimage"
                runat="server"
                Height="70px"
                Width="100px"
                ImageUrl='<%# Eval("Category_Image") %>'
                AlternateText="Category Image" />

        </ItemTemplate>

    </asp:TemplateField>

    <asp:BoundField
        DataField="Category_Description"
        HeaderText="Category Description" />

    <asp:BoundField
        DataField="Category_Status"
        HeaderText="Category Status" />

</Columns>

                    </asp:GridView>

                </div>

            </div>

        </div>

    </form>

    <!-- JavaScript -->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>