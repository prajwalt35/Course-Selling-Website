<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Remove_Course.aspx.cs" Inherits="ASP_Net_MicroProject.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .logo-label {
            font-size: 22px;
            font-weight: bold;
            color: #4A3C8C;
            text-transform: uppercase;
            display: block;
            text-align: left;
            margin-left : 30px;
           margin-top:20px;
        }
        .show-data {
            width: 95%;
            padding:2rem;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
           margin:20px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }
        .show-data th {
            padding: 12px;
            text-align: left;
        }
        .show-data td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        .show-data tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .show-data tr:hover {
            background-color: #d1ecf1;
            cursor: pointer;
        }
        .edit_btn {
            background-color: #4CAF50;
            color: white;
            padding: 6px 12px;
            border: 2px solid green;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .edit_btn:hover {
            background-color: #45a049;
        }
        .delete_btn {
            background-color: #f44336;
            color: white;
            padding: 6px 12px;
            border: 2px solid red;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .delete_btn:hover {
            background-color: #d32f2f;
        }
    </style>


    <asp:Label ID="Label1" runat="server" CssClass="logo-label" Text="Remove Course"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Project_DBConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Products] ([Name], [Description], [Price], [ImageUrl]) VALUES (@Name, @Description, @Price, @ImageUrl)" SelectCommand="SELECT [Id], [Name], [Description], [Price], [ImageUrl] FROM [Products]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Description] = @Description, [Price] = @Price, [ImageUrl] = @ImageUrl WHERE [Id] = @Id">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="ImageUrl" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="ImageUrl" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" CssClass="show-data" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="ImageUrl" HeaderText="ImageUrl" SortExpression="ImageUrl" />
            
            <asp:CommandField ShowEditButton="True">
                <ControlStyle CssClass="edit_btn"></ControlStyle>
            </asp:CommandField>
            <asp:CommandField ShowDeleteButton="True">
                <ControlStyle CssClass="delete_btn"></ControlStyle>
            </asp:CommandField>

        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>

</asp:Content>
