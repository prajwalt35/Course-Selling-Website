<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Home.aspx.cs" Inherits="ASP_Net_MicroProject.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .dashboard {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            width: 100%;
            margin-right : 300px;
            margin-bottom: 50px;
        }
        .card {
            width: 22%;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: #fff;
            font-size: 18px;
        }
        .card i {
            font-size: 70px;
            opacity: 0.5;
        }
        .card p {
            margin: 0;
            font-size: 18px;
        }
        .card span {
            font-size: 28px;
            font-weight: bold;
        }
        .info {
            display: flex;
            flex-direction: column;
        }
        .info a {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }
        .card:nth-child(1) { background: #00bcd4; }
        .card:nth-child(2) { background: #4caf50; }
        .card:nth-child(3) { background: #ff9800; }
        .card:nth-child(4) { background: #f44336; }
        
        @media (max-width: 800px) {
            .card { width: 45%; margin-bottom: 20px; }
        }
        @media (max-width: 500px) {
            .card { width: 100%; }
        }

        .userdata_gridview{
            width: 100%;
            margin-bottom : 300px;
        }
    </style>
</head>
<body>
    <h2>Dashboard</h2>
    <div class="dashboard">
        <div class="card">
            <table>
                <tr>
                    <td>
                        <div class="info">
                            <span>
                                <asp:Label ID="Label1" runat="server" Text="count"></asp:Label>
                            </span>
                            <p>Courses</p>
                        </div>
                    </td>
                    <td>
                        <i class="fas fa-book"></i>
                    </td>
                </tr>
            </table>
        </div>

        <div class="card">
            <table>
                <tr>
                    <td>
                        <div class="info">
                            <span>
                                <asp:Label ID="Label2" runat="server" Text="count"></asp:Label>
                            </span>
                            <p>Total Users</p>
                        </div>
                    </td>
                    <td>
                        <i class="fas fa-users"></i>
                    </td>
                </tr>
            </table>
        </div>
        <div class="card">
            <table>
                <tr>
                    <td>
                        <div class="info">
                            <span>1</span>
                            <p>Active Users</p>
                        </div>
                    </td>
                    <td>
                        <i class="fas fa-user-check"></i>
                    </td>
                </tr>
            </table>
        </div>
        <div class="card">
            <table>
                <tr>
                    <td>
                        <div class="info">
                            <span>1</span>
                            <p>Total Profilt</p>
                        </div>
                    </td>
                    <td>
                        <i class="fas fa-dollar-sign"></i>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <h2>Recent Registered</h2>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OnSelecting="ObjectDataSource1_Selecting" SelectMethod="GetUsers" TypeName="ASP_Net_MicroProject.Project_Data_Access_Layer"></asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" CssClass="userdata_gridview" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Passsword" HeaderText="Passsword" SortExpression="Passsword" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
            <asp:BoundField DataField="Mobileno" HeaderText="Mobileno" SortExpression="Mobileno" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />

    </asp:GridView>
</body>
</html>

</asp:Content>
