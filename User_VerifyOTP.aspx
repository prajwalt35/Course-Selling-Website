<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User_VerifyOTP.aspx.cs" Inherits="ASP_Net_MicroProject.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .cart-container {
            max-width: 400px;
            margin-right: 100px;
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
            text-align: center;
            letter-spacing: 3px;
        }
        .cart-container input:focus {
            border-color: #ff9800;
            outline: none;
        }
        .cart-container button {
            background-color: #ff9800;
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
            background-color: #e68900;
        }
        .cart-container .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>

    <div class="cart-container">
        <h3>Enter OTP</h3>

        <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control" Placeholder="Enter OTP"></asp:TextBox>
        <asp:Button ID="btnVerifyOTP" runat="server" CssClass="btn btn-warning mt-3" Text="Verify OTP" OnClick="btnVerifyOTP_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
    </div>

</asp:Content>
