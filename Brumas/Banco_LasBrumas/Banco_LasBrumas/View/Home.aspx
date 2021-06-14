<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Proyecto_Banco.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
  <meta name="description" content="Mobile Application HTML5 Template">

  <meta name="copyright" content="MACode ID, https://www.macodeid.com/">

  <title>Banco las Brumas</title>

  

  <link rel="stylesheet" href="css/maicons.css">

  <link rel="stylesheet" href="vendor/animate/animate.css">

  <link rel="stylesheet" href="vendor/owl-carousel/css/owl.carousel.min.css">

  <link rel="stylesheet" href="css/bootstrap.css">

  <link rel="stylesheet" href="css/mobster.css">

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light navbar-floating">
  <div class="container">
    <a class="navbar-brand" href="#">
     <img src="img\Logo.png" alt="" width="200">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarToggler">
      <ul class="navbar-nav ml-lg-5 mt-3 mt-lg-0">
        <li class="nav-item dropdown active">
       
          <%--<div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item active" href="index.html">Homepage </a>--%>
           
          </div>
      </ul>
      <div class="ml-auto my-2 my-lg-0">
        <button class="btn btn-dark rounded-pill" onclick="location.href='M3_Login.aspx'"">Login</button>
          <button class="btn btn-dark rounded-pill" onclick="location.href='Register_client.aspx'"">Register</button>
      </div>
    </div>
  </div>
</nav>
  
<div class="page-hero-section bg-image hero-home-1" style="background-image: url(img/bg_hero_1.svg);">
  <div class="hero-caption pt-5">
    <div class="container h-100">
      <div class="row align-items-center h-100">
        <div class="col-lg-6 wow fadeInUp">
		
          <h1 class="mb-4">Banco las Brumas</h1>
          <p class="mb-4">True to your trust your finances, such as transfers and payments.</p>
		  <p class="mb-4">Office locacion: Cartago,Costa Rica.</p>
		  <p class="mb-4">Phone: +506 8502 6198.</p>
		  <p class="mb-4">Office locacion: San Jose,Costa Rica.</p>
		  <p class="mb-4">Phone: +506 8411 1103.</p>
		  
		  
        </div>
        <div class="col-lg-6 d-none d-lg-block wow zoomIn">
          <div class="img-place mobile-preview shadow floating-animate">
            <img src="img/app_preview_1.png" alt="">
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<div class="page-footer-section bg-dark fg-white">
  <div class="container">
    <div class="row mb-5 py-3">
      <div class="col-sm-6 col-lg-2 py-3">
        <h5 class="mb-3">Company</h5>
        <ul class="menu-link">
          <li><a href="#" class="">About us</a></li>
          <li><a href="#" class="">Mision</a></li>
		  <li><a href="#" class="">Vision</a></li>
        </ul>
      </div>
      <div class="col-md-6 col-lg-4 py-3">
        <h5 class="mb-3">Contact</h5>
        <ul class="menu-link">
          <li><a href="#" class="">Contact Us</a></li>
          <li><a href="#" class="">lasbrumas@hotmail.com</a></li>
          <li><a href="#" class="">support@lasbreumas.com</a></li>
          <li><a href="#" class="">+808 2537 2390</a></li>
        </ul>
      </div>
      <div class="col-md-6 col-lg-4 py-3">
        <h5 class="mb-3">Subscribe</h5>
        <form method="POST">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Your email..">
            <div class="input-group-append">
              <button type="submit" class="btn btn-primary"><span class="mai-send"></span></button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <hr>

  <div class="container">
    <div class="row">
      <div class="col-12 col-md-6 py-2">
        <img src="favicon-light.png" alt="" width="40">
        <!-- Please don't remove or modify the credits below -->
        <p class="d-inline-block ml-2">Copyright &copy; <a href="https://www.macodeid.com/" class="fg-white fw-medium">MACode ID</a>. All rights reserved</p>
      </div>
      <div class="col-12 col-md-6 py-2">
        <ul class="nav justify-content-end">
          <li class="nav-item"><a href="#" class="nav-link">Terms of Use</a></li>
          <li class="nav-item"><a href="#" class="nav-link">Privacy Policy</a></li>
          <li class="nav-item"><a href="#" class="nav-link">Cookie Policy</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>

<script src="js/jquery-3.5.1.min.js"></script>

<script src="js/bootstrap.bundle.min.js"></script>

<script src="vendor/owl-carousel/js/owl.carousel.min.js"></script>

<script src="vendor/wow/wow.min.js"></script>

<script src="js/mobster.js"></script>

</body>
</html>




