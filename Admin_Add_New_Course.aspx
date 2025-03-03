<%@ Page Title="Add New Course" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Add_New_Course.aspx.cs" Inherits="ASP_Net_MicroProject.WebForm1" %>

<%--unobtrusiveValidationMode="none"--%>
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
                    <h3><i class="fas fa-book"></i> Add New Course</h3>
                </div>

                <form>
                    <!-- Course Name -->
                    <div class="mb-3">
                        <label for="courseName" class="form-label">Course Name</label><span style="color: #FF0000"> *</span>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCourse" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-book"></i></span>
                            <asp:TextBox ID="txtCourse" runat="server" placeholder="Enter course name" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Course Description -->
                    <div class="mb-3">
                        <label for="courseDescription" class="form-label">Course Description</label><span style="color: #FF0000"> *</span>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCoursedescription" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-align-left"></i></span>
                            <asp:TextBox ID="txtCoursedescription" runat="server" placeholder="Enter course description" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Course Price -->
                    <div class="mb-3">
                        <label for="coursePrice" class="form-label">Course Price</label><span style="color: #FF0000"> *</span>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtprice" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                            <asp:TextBox ID="txtprice" runat="server" placeholder="Enter course Price" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Image -->
                    <div class="mb-3">
                        <label for="coursePrice" class="form-label">Course Image</label><span style="color: #FF0000"> *</span>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtimg" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                            <asp:TextBox ID="txtimg" runat="server" placeholder="Enter image" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Add Button -->
                    <div class="d-grid">
                        <asp:Button ID="course_submit" runat="server" Text="Add Course" CssClass="btn btn-custom" OnClick="course_submit_Click"/> 
                    </div>

                    <!-- Label -->
                    <asp:Label ID="successmsg" runat="server" Text="Msg" ForeColor="#00CC00"></asp:Label>
                </form>
            </div>
        </div>    
    </div>
</asp:Content>
