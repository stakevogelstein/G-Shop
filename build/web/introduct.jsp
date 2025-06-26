<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to G-Shop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        header {
            background: #333;
            color: #fff;
            padding-top: 30px;
            min-height: 70px;
            border-bottom: #0779e4 3px solid;
        }
        header a {
            color: #fff;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 16px;
        }
        header ul {
            padding: 0;
            list-style: none;
        }
        header ul li {
            display: inline;
            padding: 0 20px 0 20px;
        }
        #showcase {
            min-height: 400px;
            background: url('shop-image.jpg') no-repeat 0 -400px;
            text-align: center;
            color: #fff;
        }
        #showcase h1 {
            margin-top: 100px;
            font-size: 55px;
            margin-bottom: 10px;
        }
        #showcase p {
            font-size: 20px;
        }
        .section {
            padding: 20px;
            margin: 20px 0;
            background: #fff;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .section h2 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>Welcome to G-Shop</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="customer">Products</a></li>

                </ul>
            </nav>
        </div>
    </header>
    <div id="showcase">
        <div class="container">
            <h1>Discover the Best Deals</h1>
            <p>Exclusive products, unbeatable prices, exceptional quality.</p>
        </div>
    </div>
    <div class="container">
        <div class="section">
            <h2>About G-Shop</h2>
            <p>G-Shop is your one-stop destination for all things fabulous. Founded in 2025, we have quickly become a leading name in the retail industry, renowned for our commitment to quality, variety, and customer satisfaction. Whether you're shopping for the latest fashion trends, innovative gadgets, or essential household items, we have something for everyone.</p>
        </div>
        <div class="section">
            <h2>Why Shop with Us?</h2>
            <ul>
                <li><strong>Wide Range of Products:</strong> From electronics to fashion, we offer an extensive selection of products that cater to all your needs.</li>
                <li><strong>Unmatched Quality:</strong> We prioritize quality and ensure that every product meets our high standards before it reaches you.</li>
                <li><strong>Competitive Prices:</strong> Our competitive pricing strategy means you get the best value for your money.</li>
                <li><strong>Exceptional Customer Service:</strong> Our friendly and knowledgeable customer service team is always ready to assist you.</li>
                <li><strong>Fast & Reliable Delivery:</strong> Enjoy swift and reliable delivery services that bring your purchases to your doorstep in no time.</li>
            </ul>
        </div>
        <div class="section">
            <h2>Join Our Community</h2>
            <p>At G-Shop, we believe in creating a community of happy and satisfied customers. Join our newsletter to stay updated on the latest deals, special offers, and exciting events. Follow us on social media to become a part of our vibrant community where you can share your shopping experiences, give feedback, and participate in fun contests.</p>
            <c:if test="${user ne null}">
                <p><a href="login.jsp">Sign Up Now</a></p>
            </c:if>
        </div>
        <div class="section">
            <h2>Our Story</h2>
            <p>G-Shop started as a small online store with a big dream. Our founders, passionate about bringing quality products to a wider audience, worked tirelessly to build a platform that prioritizes customer needs and satisfaction. Over the years, we have grown into a trusted brand with a loyal customer base. Our journey is driven by our mission to provide the best shopping experience, and we are constantly evolving to meet the ever-changing needs of our customers.</p>
        </div>
    </div>
    <footer>
        <div class="container">
            <p>&copy; 2024 G-Shop. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
