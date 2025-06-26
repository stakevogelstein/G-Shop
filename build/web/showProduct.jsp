<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dal.ProductDAO, java.util.Vector, model.Product" %>
<%
    ProductDAO productDAO = new ProductDAO();
    Vector<Product> products = productDAO.getAll();
    request.setAttribute("products", products);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>G-Shop - Product Details</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/logo.png" alt="G-Shop Logo">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="showProduct.jsp">Products</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="about.jsp">About Us</a></li>
            </ul>
        </nav>
    </header>

    <section class="product-details">
        <c:choose>
            <c:when test="${not empty product}">
                <div class="product">
                    <img src="${product.image_url}" alt="${product.name}">
                    <h2>${product.name}</h2>
                    <p>${product.description}</p>
                    <p>Price: $${product.price}</p>
                    <button class="btn">Add to Cart</button>
                </div>
            </c:when>
            <c:otherwise>
                <p>Product not found.</p>
            </c:otherwise>
        </c:choose>
    </section>

    <footer>
        <p>&copy; 2025 G-Shop. All rights reserved.</p>
    </footer>
</body>
</html>
