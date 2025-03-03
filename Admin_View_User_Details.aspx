<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_View_User_Details.aspx.cs" Inherits="ASP_Net_MicroProject.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <asp:Label ID="Label1" runat="server" Text="View User Details"></asp:Label>--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        .user-card {
            margin-right: 500px;
            margin-bottom: 100px;
            width: 50%;
            height: 550px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            text-align: center;
        }
        .profile-pic {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007bff;
            background: white;
            padding: 4px;
        }
        .card-body {
            padding: 20px;
        }
        .card-body i {
            color: #007bff;
            margin-right: 5px;
        }
        .cart{
            margin: auto;
            margin-left: 100px;
            width: 500px;
        }
        table td{
            text-align:left;
        }
        table{
            height: 200px;
            width : 100%;
            background: #fff;
        }
        .heading{
            padding-left: 110px;
        }
        .contents{
            padding-left: 10px;
            padding-right: 70px;
        }
        .card-footer {
            background: #f8f9fa;
            padding: 15px;
        }
    </style>
</head>
<body>

<div class="container d-flex ">
    <div class="card user-card cart">
        <div class="card-body">
            <!-- Profile Picture -->
            <img src="\images\user_icon.jpg" alt="User Photo" class="profile-pic">
            <h4 class="mt-3">
                <asp:Label ID="User_Name" runat="server" Text="username"></asp:Label>
            </h4>
        </div>
        
        <!-- User Details -->
        <div>
            <table class="profile_data">
                <tr>
                    <td class="heading"><i class="fas fa-user"></i> <strong>Username:</strong></td>
                    <td class="contents"><asp:Label ID="Label1" runat="server" Text="username"></asp:Label></td>
                </tr>
                <tr>
                    <td class="heading"><i class="fas fa-lock"></i> <strong>Password:</strong></td>
                    <td class="contents"><asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                </tr>
                <tr>
                    <td class="heading"><i class="fas fa-envelope"></i> <strong>Email:</strong></td>
                    <td class="contents"><asp:Label ID="Label3" runat="server" Text="Email"></asp:Label></td>
                </tr>
                <tr>
                    <td class="heading"><i class="fas fa-phone"></i> <strong>Mobile:</strong></td>
                    <td class="contents"><asp:Label ID="Label4" runat="server" Text="Mobile"></asp:Label></td>
                </tr>
                <tr>
                    <td class="heading"><i class="fas fa-child"></i> <strong> Age:</strong></td>
                    <td class="contents"><asp:Label ID="Label5" runat="server" Text="Age"></asp:Label></td>
                </tr>
            </table>
        </div>
        
        <div class="card-footer">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Edit Profile" OnClick="Button1_Click" />
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

</asp:Content>
