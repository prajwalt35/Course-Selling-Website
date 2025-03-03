<%@ Page Language="C#" unobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ASP_Net_MicroProject.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <!-- Add Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
               
        body {
            background-color: #f8f9fa;
        }
        /* Top Bar Styling */
        .top-bar {
          background-color: #f8f9fa;
          padding: 10px 0;
          font-size: 14px;
          color: #6c757d;
        }

        .top-bar span {
          padding-left: 250px;
        }

        .top-bar a {
          text-decoration: none;
          color: inherit;
        }

        /* Logo Styling */
        .navbar-brand {
          font-size: 28px;
          font-weight: bold;
        }

        .navbar-brand span {
          color: #28a745;
        }

        .navbar-nav .nav-link {
          text-transform: uppercase;
          font-size: 15px;
          margin: 0 5px;
        }

        .navbar .cart-badge {
          position: absolute;
          top: -5px;
          right: -10px;
          background-color: #28a745;
          color: #fff;
          font-size: 12px;
          padding: 3px 6px;
          border-radius: 50%;
        }
        /* Register Cart Code Start */
        .card {
            margin: auto;
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 20px;
            max-width: 500px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            margin-bottom: 1px;
        }
        .rolefield{
            border : 0.5px solid black;
            border-radius: 5px;
        }
        .custom-btn{
            margin-left:140px;
        }
        /* Register Cart Code End */

        /* Footer Code Start*/
        .f_box{
          border: 2px solid black;
          width: 100%;
        }

        footer ul {
          padding: 0;
        }

        footer ul li {
          margin-bottom: 10px;
        }

        footer ul li i {
          margin-right: 10px;
        }

        footer .news-item {
          display: flex;
          align-items: start;
        }

        footer .news-item img {
          border-radius: 5px;
          width: 60px;
          height: 60px;
          object-fit: cover;
        }

        footer h4,
        footer h5 {
          margin-bottom: 20px;
        }

        .btn{
          margin-top: 30px;
        }
        /* Footer Code End */
</style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Bar -->
          <div class="top-bar text-center">
            Welcome to <strong>SkillPort</strong>, we hope you will enjoy our Courses and have a good experience
            <span>
              <a href="mailto:info@example.com">Email: skillport@gmail.com</a> | Call: +96 8925 1970
            </span>
          </div>

          <!-- Navbar -->
          <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
            <div class="container">
              <a class="navbar-brand" href="#"><span>Skill</span>Port</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                  <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                  <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                  <li class="nav-item"><a class="nav-link" href="Main_Course.html">Courses</a></li>
                  <li class="nav-item"><a class="nav-link" href="Contact.html">Contact</a></li>
                  <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-search"></i></a></li>
                </ul>
              </div>
            </div>
          </nav>
        
        <!-- Register Code Start -->
        <div class="container">
          <div class="card">
              <h3 class="card-title text-center">Register</h3>
              <div class="card-body">
              
                  <!-- Username -->
                  <asp:TextBox 
                      ID="txtUsername" 
                      runat="server" 
                      CssClass="form-control" 
                      placeholder="Username"></asp:TextBox>
                  <asp:RequiredFieldValidator 
                      ID="RequiredFieldValidator1" 
                      runat="server" 
                      ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUsername" ForeColor="Red" Font-Italic="True">Required</asp:RequiredFieldValidator>

                  <!-- Password -->
                  <asp:TextBox 
                      ID="txtPassword" 
                      runat="server" 
                      CssClass="form-control" 
                      TextMode="Password" 
                      placeholder="Password"></asp:TextBox>
                   <asp:RequiredFieldValidator 
                       ID="RequiredFieldValidator2" 
                       runat="server" 
                       ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPassword" ForeColor="Red" Font-Italic="True">Required</asp:RequiredFieldValidator>

                  <!-- Confirm Password -->
                  <asp:TextBox 
                      ID="txtConfirmPassword" 
                      runat="server" 
                      CssClass="form-control" 
                      TextMode="Password" 
                      placeholder="Confirm Password"></asp:TextBox>
                  <asp:RequiredFieldValidator 
                       ID="RequiredFieldValidator3" 
                       runat="server" 
                       ErrorMessage="RequiredFieldValidator" ControlToValidate="txtConfirmPassword" ForeColor="Red" Font-Italic="True">Required</asp:RequiredFieldValidator>
              
                  <!-- Email -->
                  <asp:TextBox 
                      ID="txtEmail" 
                      runat="server" 
                      CssClass="form-control" 
                      placeholder="Email"></asp:TextBox>
                  <asp:RequiredFieldValidator 
                       ID="RequiredFieldValidator5" 
                       runat="server" 
                       ErrorMessage="RequiredFieldValidator" 
                       ControlToValidate="txtEmail" 
                       ForeColor="Red" 
                       Font-Italic="True">Required</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator 
                      ID="RegularExpressionValidator1" 
                      runat="server" 
                      ErrorMessage="RegularExpressionValidator" 
                      ControlToValidate="txtEmail" 
                      ForeColor="Red" 
                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Italic="True">Please Enter Correct Email</asp:RegularExpressionValidator>

                  <!-- Age -->
                  <asp:TextBox 
                      ID="txtage" 
                      runat="server" 
                      CssClass="form-control" 
                      placeholder="Enter Age"></asp:TextBox>
                  <asp:RequiredFieldValidator 
                      ID="RequiredFieldValidator7" 
                      runat="server" 
                      ErrorMessage="RequiredFieldValidator" 
                      Font-Italic="True" 
                      ForeColor="Red" ControlToValidate="txtage">Required</asp:RequiredFieldValidator>

                  <!-- Mobile no -->
                  <asp:TextBox 
                      ID="txtmobileno" 
                      runat="server" 
                      CssClass="form-control" 
                      placeholder="Enter Mobile Number"></asp:TextBox>
                  <asp:RequiredFieldValidator 
                      ID="RequiredFieldValidator6" 
                      runat="server" 
                      ErrorMessage="RequiredFieldValidator" 
                      ControlToValidate="txtmobileno" 
                      Font-Italic="True" 
                      ForeColor="Red">Required</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator 
                      ID="RegularExpressionValidator2" 
                      runat="server" 
                      ErrorMessage="RegularExpressionValidator" 
                      ValidationExpression="\d{10}" 
                      ForeColor="Red" 
                      ControlToValidate="txtmobileno">Number Must be 10 Digits</asp:RegularExpressionValidator>
              
                  <!-- Fullname -->
                 <asp:TextBox 
                     ID="txtfull_name" 
                     runat="server" 
                     CssClass="form-control" 
                     placeholder="Enter Full Name (First & Last Name)"></asp:TextBox>


                  <br />
                  <!-- Register Button -->
                  <asp:Button 
                      ID="btnRegister" 
                      runat="server" 
                      Text="Register" 
                      CssClass="btn btn-primary w-40 custom-btn" 
                      OnClick="btnRegister_Click" Width="150px" />&nbsp;
              
                  <!-- Message Label --><asp:Label 
                      ID="lblMessage" 
                      runat="server" 
                      CssClass="text-danger mt-3"></asp:Label>
              </div>
          </div>
      </div>
     <!-- Register Code End -->
        
     <!-- Footer Code Start -->
     <footer class="bg-dark text-white pt-5 pb-3 f_box">
        <div class="container">
          <div class="row">
            <!-- Company Info -->
            <div class="col-md-3">
              <h4 class="text-success">SkillPort</h4>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac honcus risus atiner Pellentesque risus.
              </p>
              <ul class="list-unstyled">
                <li><i class="bi bi-geo-alt-fill"></i> Dindori Road, Nashik</li>
                <li><i class="bi bi-envelope-fill"></i> SkillPort123@gmail.com</li>
                <li><i class="bi bi-telephone-fill"></i> +96 8925 1970</li>
              </ul>
            </div>

            <!-- Quick Links -->
            <div class="col-md-2 text-center">
              <h5>Quick Link</h5>
              <ul class="list-unstyled">
                <li><a href="#" class="text-white text-decoration-none">Home</a></li>
                <li><a href="#" class="text-white text-decoration-none">About</a></li>
                <li><a href="#" class="text-white text-decoration-none">Courses</a></li>
                <li><a href="#" class="text-white text-decoration-none">Contact</a></li>
                <li><a href="#" class="text-white text-decoration-none">Guide</a></li>
              </ul>
            </div>

            <!-- Pricing -->
            <div class="col-md-2 text-center">
              <h5>Pricing</h5>
              <ul class="list-unstyled">
                <li><a href="#" class="text-white text-decoration-none">Overview</a></li>
                <li><a href="#" class="text-white text-decoration-none">Premium Plans</a></li>
                <li><a href="#" class="text-white text-decoration-none">Monthly Plans</a></li>
                <li><a href="#" class="text-white text-decoration-none">Offers</a></li>
              </ul>
            </div>

            <!-- Pricing -->
            <div class="col-md-3 text-center">
              <h5>Latest Courses</h5>
              <ul class="list-unstyled">
                <li><a href="#" class="text-white text-decoration-none">Java Full stack</a></li>
                <li><a href="#" class="text-white text-decoration-none">.Net Full stack</a></li>
                <li><a href="#" class="text-white text-decoration-none">Software Testing</a></li>
                <li><a href="#" class="text-white text-decoration-none">MERN stack</a></li>
              </ul>
            </div>

            <!-- Stay Connected -->
            <div class="col-md-2">
              <h5>Stay Connected</h5>
              <ul class="list-unstyled">
                <li><a href="#" class="text-white text-decoration-none"><i class="bi bi-facebook"></i> Facebook</a></li>
                <li><a href="#" class="text-white text-decoration-none"><i class="bi bi-twitter"></i> Twitter</a></li>
                <li><a href="#" class="text-white text-decoration-none"><i class="bi bi-pinterest"></i> Pinterest</a></li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
      <!-- Footer Code End -->
    </form>
</body>
</html>
