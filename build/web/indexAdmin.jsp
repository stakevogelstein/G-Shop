<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Glasses Authentic</title>
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
        <link rel="stylesheet" href="style.css" />
        <link rel="stylesheet" href="css/responsive.css" />
    </head>
    <body>
        <!-- Header -->
        <%@include file="pannerAdmin.jsp" %>

        <!-- Body -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <!--Left Menu-->
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Admin Manager</h6>
                    </a>
                    <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                            <a href="manageCustomer" class="nav-item nav-link">Customer Manager</a>
                            <a href="manageProduct" class="nav-item nav-link">Product Manager</a>
                            <a href="manageBill" class="nav-item nav-link">Bill Manager</a>

                    </nav>
                </div>
                <!--End Left Menu-->


                <!--Right Content-->   
                <div class="col-lg-9">

                    <!--Customer Manager-->
                    <c:if test="${manageCustomer ne null}">
                        <c:if test="${not empty allCustomers}">
                            <%@include file="CustomerManager.jsp" %>
                        </c:if>
                    </c:if>

                    <!--Customer Manager End-->

                    <!--Product Manager-->
                    <c:if test="${manageProduct ne null}">
                        <%@include file="ProductManager.jsp" %>

                    </c:if>
                    <!--Product Manager End-->

                    <c:if test="${manageBill ne null}">
                        <%@include file="BillManager.jsp" %>
                    </c:if>

                </div>
                <!--End Right Content-->

            </div>
        </div>

        <!-- Footer -->
        <%@include file="footer.jsp" %>
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
