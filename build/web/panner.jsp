<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.CartItem, model.Product, java.text.DecimalFormat" %>
    
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
                            <!-- Logo -->
                            <div class="logo">
                                <a href="index.jsp"
                                   ><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa7CyFK15ki2VLVQhGEScXmZDIChG13ilI9g&s" alt="logo"
                                      width="80px"
                                      style="transform: translateY(-20px)"
                                      /></a>
                            </div>
                            <!--/ End Logo -->
                            <!-- Search Form -->
                            <div class="search-top">
                                <div class="top-search">
                                    <a href="#0"><i class="ti-search"></i></a>
                                </div>
                                <!-- Search Form -->
                                <div class="search-top">
                                    <form class="search-form">
                                        <input
                                            type="text"
                                            placeholder="Search here..."
                                            name="search"
                                            />
                                        <button value="search" type="submit">
                                            <i class="ti-search"></i>
                                        </button>
                                    </form>
                                </div>
                                <!--/ End Search Form -->
                            </div>
                            <!--/ End Search Form -->
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <select onchange="handleFilterByBrand(this.value)">
                                        <option value="all">All</option>
                                        <c:forEach items="${brands}" var="b">
                                            <option value="${b.id}"
                                                    <c:if test="${bid == b.id}">selected</c:if>
                                                    >${b.name}</option>
                                        </c:forEach>
                                    </select>

                                    <script>
                                        function handleFilterByBrand(brandId) {
                                            if (brandId === 'all')
                                                window.location.href = 'customer';
                                            else
                                                window.location.href = 'customer?service=filter-by-brand&bid=' + brandId;
                                        }
                                    </script>
                                    <form action="customer">
                                        <input 
                                            name="search"
                                            placeholder="Search Products Here....."
                                            type="search"
                                            value=${requestScope.search}
                                            >
                                        <input 
                                            type="hidden"
                                            name="service"
                                            value="filter-by-search"
                                            >
                                        <button class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->
                                <!--                                <div class="sinlge-bar">
                                                                    <a href="customer" class="single-icon"
                                                                       ><i class="fa fa-heart-o" aria-hidden="true"></i
                                                                        ></a>
                                                                </div>-->
                                <div class="sinlge-bar">
                                    <a href="user-profile" class="single-icon"
                                       ><i class="fa fa-user-circle-o" aria-hidden="true"></i
                                        ></a>
                                </div>
                                <c:if test="${sessionScope.user ne null}">
                                    <div class="sinlge-bar shopping">
                                        <a href="cart.jsp" class="single-icon">
                                            <i class="ti-bag">
                                            </i>
                                            <span class="total-count">
                                                <%
                                                int numberProductsInCart = 0;
                                                java.util.Enumeration ens = session.getAttributeNames();

                                                        while (ens.hasMoreElements()) {

                                                                String id = ens.nextElement().toString();

                                                                if (!id.equals("user") && !id.equals("fullname") && !id.equals("numberProductsInCart")) {
                                                                    //numberProductsInCart++;

                                                                    CartItem cartItem = (CartItem) session.getAttribute(id); 
                                                                    Product product = cartItem.getProduct();
                                                                    int quantity = cartItem.getQuantity();
                                                                    numberProductsInCart += quantity;

                                                    }
                                                }
                                                session.setAttribute("numberProductsInCart", numberProductsInCart);
                                                %>

                                                ${sessionScope.numberProductsInCart} 
                                            </span></a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Inner -->
            <div class="header-inner">
                <div class="container">
                    <div class="cat-nav-head">
                        <div class="row">
                            <div class="col-lg-5"></div>
                            <div class="col-lg-6 col-12">
                                <div class="menu-area">
                                    <!-- Main Menu -->
                                    <nav class="navbar navbar-expand-lg">
                                        <div class="navbar-collapse">
                                            <div class="nav-inner">
                                                <ul class="nav main-menu menu navbar-nav">
                                                    <li class="active"><a href="customer">Home</a></li>
                                                    <li><a href="introduct.jsp">About us</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </nav>
                                    <!--/ End Main Menu -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Header Inner -->
        </header>
        <!--/ End Header -->

        <!-- Slider Area -->
        <section class="hero-slider">
            <!-- Single Slider -->
            <div class="single-slider"
                 style="background-image: url('https://www.shutterstock.com/image-photo/glasses-sale-banner-eyeglass-frames-260nw-2138000423.jpg');">
                <div class="container">
                    <div class="row no-gutters">
                        <div class="col-lg-9 offset-lg-3 col-12">
                            <div class="text-inner">
                                <div class="row">
                                    <div class="col-lg-7 col-12">
                                        <div class="hero-text">
                                            <h1><span>UP TO 50% OFF </span>Shoes For Everyone</h1>
                                            <p>
                                                Maboriosam in a nesciung eget magnae <br />
                                                dapibus disting tloctio in the find it pereri <br />
                                                odiy maboriosm.
                                            </p>
                                            <div class="button">
                                                <a href="#product-section" class="btn" style="transition: color 0.5s ease">Shop Now!</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Single Slider -->
        </section>
        <!--/ End Slider Area -->

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
