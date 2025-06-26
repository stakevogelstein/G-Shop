<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="copyright" content="" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <!-- Title Tag  -->
        <title>Shoes Shop</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <!-- Web Font -->
        <link
            href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
            rel="stylesheet"
            />

        <!-- StyleSheet -->

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css" />
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.min.css" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.css" />
        <!-- Fancybox -->
        <link rel="stylesheet" href="css/jquery.fancybox.min.css" />
        <!-- Themify Icons -->
        <link rel="stylesheet" href="css/themify-icons.css" />
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="css/niceselect.css" />
        <!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate.css" />
        <!-- Flex Slider CSS -->
        <link rel="stylesheet" href="css/flex-slider.min.css" />
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl-carousel.css" />
        <!-- Slicknav -->
        <link rel="stylesheet" href="css/slicknav.min.css" />

        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/responsive.css" />
    </head>
    <body>
        <!-- Header -->
        <header class="header shop">
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-12"></div>
                        <div class="col-lg-8 col-md-12 col-12">
                            <!-- Top Right -->
                            <div class="right-content">
                                <ul class="list-main">
                                    <c:if test="${sessionScope.user eq null}">
                                        <li><i class="ti-user"></i><a href="register.jsp">Register</a></li>
                                        <li><i class="ti-power-off"></i><a href="login">Login</a></li>
                                            </c:if>
                                            <c:if test="${sessionScope.user ne null}">
                                        <li> Welcome  
                                            <span style="color: orange">
                                                ${sessionScope.user.fullname}
                                            </span>
                                        </li>
                                        <li><i class="ti-power-off"></i><a href="logout">Logout</a></li>
                                            </c:if>

                                </ul>
                            </div>
                            <!-- End Top Right -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Topbar -->
            <div class="middle-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">

                            <div class="mobile-nav"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Inner -->
            <div class="header-inner">
                <div class="container">
                    <div class="cat-nav-head">
                        <div class="row">
                            <div class="col-lg-3"></div>

                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Header Inner -->
        </header>
        <!--/ End Header -->


        <!-- Jquery -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.0.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- Popper JS -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Color JS -->
        <script src="js/colors.js"></script>
        <!-- Slicknav JS -->
        <script src="js/slicknav.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="js/owl-carousel.js"></script>
        <!-- Magnific Popup JS -->
        <script src="js/magnific-popup.js"></script>
        <!-- Waypoints JS -->
        <script src="js/waypoints.min.js"></script>
        <!-- Countdown JS -->
        <script src="js/finalcountdown.min.js"></script>
        <!-- Nice Select JS -->
        <script src="js/nicesellect.js"></script>
        <!-- Flex Slider JS -->
        <script src="js/flex-slider.js"></script>
        <!-- ScrollUp JS -->
        <script src="js/scrollup.js"></script>
        <!-- Onepage Nav JS -->
        <script src="js/onepage-nav.min.js"></script>
        <!-- Easing JS -->
        <script src="js/easing.js"></script>
        <!-- Active JS -->
        <script src="js/active.js"></script>
    </body>
</html>
