<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User_View_Course.aspx.cs" Inherits="ASP_Net_MicroProject.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course List</title>
        <style>
            .course-content{
                margin: auto;
                display:flex;
                padding:2rem;
              
            }
            .container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
            }
            .card {
                background: white;
                border-radius: 10px;
                padding: 15px;
                width: 250px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .card img {
                width: 100%;
                height: 120px;
                object-fit: cover;
                border-radius: 10px;
            }
            .card h3 {
                margin: 10px 0;
                font-size: 1.2em;
            }
            .card p {
                font-size: 0.9em;
                color: gray;
            }
            .price {
                font-size: 1.1em;
                color: green;
                font-weight: bold;
            }
            .btn-cart {
                display: flex;
                align-items: center;
                width: 70%;
                margin-left : 30px;
                background-color: #28a745;
                color: white;
                font-size: 16px;
                padding: 10px 15px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: 0.3s ease;
                text-decoration: none;
            }
            .btn-cart i {
                margin-right: 8px;
                font-size: 20px;
            }
            .btn-cart:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <div class="course-content">
            <div class="container">
                <asp:Literal ID="ltlCourses" runat="server"></asp:Literal>
            </div>
        </div>

    </body>
    </html>
</asp:Content>
