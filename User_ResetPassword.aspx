<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User_ResetPassword.aspx.cs" Inherits="ASP_Net_MicroProject.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .cart-container {
            max-width: 400px;
            margin-right: 20px;
            margin-bottom : 150px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .cart-container h3 {
            color: #333;
            margin-bottom: 20px;
        }
        .cart-container input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .cart-container input:focus {
            border-color: #28a745;
            outline: none;
        }
        .cart-container button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
        }
        .cart-container button:hover {
            background-color: #218838;
        }
        .cart-container .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
        .cart-container .success-message {
            color: green;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>

    <div class="cart-container">
        <h3>Reset Your Password</h3>

        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="New Password"></asp:TextBox>
        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Confirm Password"></asp:TextBox> 
        <asp:Button ID="btnResetPassword" runat="server" CssClass="btn btn-success mt-3" Text="Reset Password" OnClick="btnResetPassword_Click" />
        
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
        <asp:Label ID="sucesslblMessage" runat="server" CssClass="success-message"></asp:Label>
    </div>

</asp:Content>
