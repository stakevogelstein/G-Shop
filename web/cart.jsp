<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.CartItem, model.Product, java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="zxx">
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
        <title>Glasses Authentic Cart</title>
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
    <body class="js">
        
        <!-- Header -->
        <header class="header shop">
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-12">
                            <!-- Top Left -->
                            <div class="top-left">
                                <ul class="list-main">
                                    <li></li>
                                    <li></li>
                                </ul>
                            </div>
                            <!--/ End Top Left -->
                        </div>
                        <div class="col-lg-8 col-md-12 col-12">
                            <!-- Top Right -->
                            <div class="right-content">
                                <ul class="list-main">                                   
                                    <c:if test="${sessionScope.user ne null}">
                                        <li>
                                            <c:if test="${sessionScope.user ne null}">
                                                <a class="navbar-brand" href="#!">Welcome ${user.fullname}</a>
                                            </c:if>
                                            <i class="ti-power-off"></i><a href="logout">Logout</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                            <!-- End Top Right -->
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!--/ End Header -->

        <!-- Breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <ul class="bread-list">
                            <li>
                                <a href="customer">Home<i class="ti-arrow-right"></i></a>
                            </li>
                            <li class="active"><a href="cart.jsp">Cart</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <c:if test="${showBill eq null}">

            <!-- Shopping Cart -->
            <div class="shopping-cart section">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <table class="table shopping-summery">
                                <thead>
                                    <tr class="main-hading">
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th class="text-center">
                                            <i class="ti-trash remove-icon"></i>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                            double total_raw = 0;
                                            java.util.Enumeration enms = session.getAttributeNames();

                                            while (enms.hasMoreElements()) {

                                                String id = enms.nextElement().toString();

                                                if (!id.equals("user") && !id.equals("fullname") && !id.equals("numberProductsInCart")) {
                                                    CartItem cartItem = (CartItem) session.getAttribute(id); 
                                                    Product product = cartItem.getProduct();
                                                    int quantity = cartItem.getQuantity();
                                    %>
                                <form action="cart" id="add-cart">
                                    <input type="hidden" name="service" value="update"/>
                                </form>
                                <tr>
                                    <td class="image">
                                        <img src="<%= product.getImage_url()%>" alt="" style="width: 50px" />
                                        <%= product.getName()%>
                                    </td>
                                    <td class="price">
                                        <span><%= product.getPrice()%></span>
                                    </td>
                                    <td class="qty">
                                        <div class="input-group">   
                                            <input
                                                type="number"
                                                name="p<%= id%>"
                                                class="input-number"
                                                data-min="1"
                                                data-max="100"
                                                value="<%= quantity%>"
                                                form="add-cart"
                                                />
                                        </div>
                                    </td>
                                    <td class="total-amount">
                                        <span><%= Math.round((product.getPrice() * quantity) * 10) / 10.0 %></span>
                                    </td>
                                    <td class="action">
                                        <a href="cart?service=removeItem&id=<%= id%>"><i class="ti-trash remove-icon"></i></a>
                                    </td>
                                </tr>
                                <%      total_raw += (product.getPrice() * quantity);
                                        }
                                    }
                                DecimalFormat df = new DecimalFormat("#.0");
                                String total = df.format(total_raw);
                                %>
                                </tbody>
                            </table>
                            <button class="btn btn-block btn-primary my-3 py-3" 
                                    style="float: left; width: 15%;"
                                    onclick="document.getElementById('add-cart').submit();" >
                                Update
                            </button>
                            <a href="cart?service=removeAll">
                                <button class="btn btn-block btn-primary my-3 py-3"
                                        style="float: right; width: 15%;" >
                                    Remove all
                                </button>
                            </a>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-12">
                            <div class="total-amount">
                                <div class="row">
                                    <div class="col-lg-8 col-md-5 col-12">
                                        <div class="left"></div>
                                    </div>
                                    <div class="col-lg-4 col-md-7 col-12">
                                        <div class="right">
                                            <ul>
                                                <li>Cart Subtotal<span>$<%= total%></span></li>
                                                <li>Shipping<span>Free</span></li>
                                                <li class="last">You Pay<span>$<%= total%></span></li>
                                            </ul>
                                            <div class="button5">
                                                <a href="cart?service=checkOut" class="btn">Checkout</a>
                                                <a href="customer" class="btn">Continue shopping</a>
                                                <c:if test="${checkOutDone ne null}">
                                                    <div class="card-header bg-secondary border-0 text-center">
                                                        Checkout Done! See your <a href="cart?service=showBill&billId=${BillId}">Bill? (click here)</a>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Shopping Cart -->
        </c:if>

        <!--show bill detail--> 
        <c:if test="${showBill ne null}">
            <h1 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                Your Bill Here!
            </h1>
            <div class="d-flex justify-content-center">
                <div class="col-lg-8 table-responsive mb-5 overflow-hidden">

                    <table class="table table-bordered text-center mb-0">
                        <thead class="text-dark" style="background-color: #F7941D">
                            <tr>
                                <th>Created Date</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>SubTotal</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <c:set var="total" value="0" />
                            <c:forEach var="billDetail" items="${billDetails}">
                                <tr>
                                    <td class="align-middle">${billDetail.created_date}</td>
                                    <td class="align-middle">
                                        <img src="${billDetail.image_url}" alt="" style="width: 50px" />
                                        ${billDetail.productName}
                                    </td>
                                    <td class="align-middle">${billDetail.productQuantity}</td>
                                    <td class="align-middle">${Math.round(billDetail.subTotal)*1.0}</td>
                                </tr>
                                <c:set var="subtotal" value="${billDetail.subTotal}" />
                                <c:set var="total" value="${total + subtotal}" />
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="col-lg-4">
                    <div class="card border-secondary mb-5">
                        <div class="card-header border-0" style="background-color: #F7941D">
                            <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Subtotal</h6>
                                <h6 class="font-weight-medium">$${Math.round(total)*1.0}</h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping</h6>
                                <h6 class="font-weight-medium">$0</h6>
                            </div>
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">$${Math.round(total)*1.0}</h5>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </c:if>

        <!-- Start Shop Services Area  -->
        <section class="shop-services section mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-rocket"></i>
                            <h4>Free shiping</h4>
                            <p>Orders over $100</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-reload"></i>
                            <h4>Free Return</h4>
                            <p>Within 30 days returns</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-lock"></i>
                            <h4>Sucure Payment</h4>
                            <p>100% secure payment</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-tag"></i>
                            <h4>Best Peice</h4>
                            <p>Guaranteed price</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Newsletter -->



        <!-- Start Shop Newsletter  -->
        <section class="shop-newsletter section">
            <div class="container">
                <div class="inner-top">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2 col-12">
                            <!-- Start Newsletter Inner -->

                            <!-- End Newsletter Inner -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Newsletter -->
        <!-- Start Footer Area -->
        <footer class="footer">
            <!-- End Footer Top -->
            <div class="copyright">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-lg-6 col-12">
                                <div class="left">
                                    <p>
                                        Copyright © 2024 - All Rights Reserved.

                                    </p>
                                    <p>
                                        Designed by Pham Khanh Toan - HE173035
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="right">
                                    <img src="images/payments.png" alt="#" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /End Footer Area -->

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
        <!-- Fancybox JS -->
        <script src="js/facnybox.min.js"></script>
        <!-- Waypoints JS -->
        <script src="js/waypoints.min.js"></script>
        <!-- Countdown JS -->
        <script src="js/finalcountdown.min.js"></script>
        <!-- Nice Select JS -->
        <script src="js/nicesellect.js"></script>
        <!-- Ytplayer JS -->
        <script src="js/ytplayer.min.js"></script>
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

