<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User_Cart.aspx.cs" Inherits="ASP_Net_MicroProject.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>
        <style>
            .cart-container {
                max-width: 800px;
                margin: auto;
                margin-right: 300px;
                margin-bottom: 10px;
                padding: 20px;
            }
            .cart-item {
                display: flex;
                align-items: center;
                justify-content: space-between;
                background: #fff;
                padding: 15px;
                width: 900px;
                margin-bottom: 10px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .cart-item img {
                width: 150px;
                height: 80px;
                object-fit: cover;
                border-radius: 5px;
            }
            .cart-details {
                flex-grow: 1;
                margin-left: 15px;
            }
            .cart-actions {
                text-align: right;
            }
            .btn-remove {
                background-color: red;
                color: white;
                border: none;
                padding: 8px 12px;
                cursor: pointer;
                border-radius: 5px;
            }
            .btn-remove:hover {
                background-color: darkred;
            }
            .cart-total{
                margin-left: 400px;
                width:70%;
                padding-left:160px;

            }

            .cart-total-span{
                color:green;
}
        </style>
    </head>
    <body>

        <div class="cart-container">
            <h2>Your Shopping Cart</h2>
            <asp:Literal ID="ltlCartItems" runat="server"></asp:Literal>
        </div>

    </body>
    </html>

</asp:Content>
