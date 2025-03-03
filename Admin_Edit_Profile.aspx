<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Edit_Profile.aspx.cs" Inherits="ASP_Net_MicroProject.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <style>
        /* main contents starts */
        .main-content {
            margin-right: 250px;
            padding: 30px;
        }
        .form-container {
            max-width: 700px;
            margin: 10px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            border-radius: 8px;
        }
        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border: none;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        /* main Contents end */
    </style>
    <div class="main-content">
        <div class="container">
            <div class="form-container">
                <div class="form-header">
                    <h3><i class="fas fa-user-edit"></i> Update Profile</h3>
                </div>

                <form>
                    <!-- New Password -->
                    <div class="mb-3">
                        <label for="courseName" class="form-label">New Password</label><span style="color: #FF0000"> *</span>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <asp:TextBox ID="txtpassword" runat="server" placeholder="Enter New Password" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- New Email -->
                    <div class="mb-3">
                        <label for="courseDescription" class="form-label">Enter New Email</label><span style="color: #FF0000"> *</span>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <asp:TextBox ID="txtemail" runat="server" placeholder="Enter New Email" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- New Age -->
                    <div class="mb-3">
                        <label for="coursePrice" class="form-label">Enter Age</label><span style="color: #FF0000"> *</span>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <asp:TextBox ID="txtage" runat="server" placeholder="Enter Age" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- New Phone no -->
                    <div class="mb-3">
                        <label for="coursePrice" class="form-label">Enter New Mobile Number</label><span style="color: #FF0000"> *</span>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                            <asp:TextBox ID="txtMobileno" runat="server" placeholder="Enter New Mobile Number" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Update Button -->
                    <div class="d-grid">
                        <asp:Button ID="course_submit" runat="server" Text="Save Changes" CssClass="btn btn-custom" OnClick="course_submit_Click"/> 
                    </div>

                    <!-- Label -->
                    <asp:Label ID="successmsg" runat="server" Text="Msg" ForeColor="#00CC00"></asp:Label>
                </form>
            </div>
        </div>    
    </div>

</asp:Content>
