<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="ASP_Net_MicroProject.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
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
        /*Navbar Code End*/

        /* Forgotpassword Code Start */
        .card {
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            padding: 20px;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            margin-bottom: 15px;
        }
        .reset_btn{
            width: 40%;
            margin-left : 90px;
        }
        .correct_label{
            margin: auto;
            margin-left : 65px;
            color: green;
        }
        /* Forgotpassword Code End */


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
        
        <!-- Forgot Password Card Start -->
        <div class="container">
            <div class="card">
                <h3 class="card-title text-center">Forgot Password</h3>
                <div class="card-body">
                    <!-- Email Input -->
                    <asp:TextBox 
                        ID="txtEmail" 
                        runat="server" 
                        CssClass="form-control" 
                        placeholder="Enter your email"></asp:TextBox>

                    <!-- Reset Button -->
                    <asp:Button 
                        ID="btnReset" 
                        runat="server" 
                        Text="Send Reset Link" 
                        CssClass="btn btn-primary reset_btn" 
                        OnClick="btnReset_Click" />

                    <!-- Message Label -->
                    <asp:Label 
                        ID="lblMessage" 
                        runat="server" 
                        CssClass="mt-2 correct_label"></asp:Label>
                </div>
            </div>
        </div>
        <!-- Forgot Password Card End -->

    
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
