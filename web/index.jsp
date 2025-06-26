<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>G-Shop - Figurine Store</title>
    <link rel="stylesheet" href="./style.css">
    <link rel="stylesheet" href="./animation.css">
</head>
<body>
    <header class="animated-header">
        <div class="logo">
            <img src="images/logo.png" alt="G-Shop Logo">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="showProduct.jsp">Products</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="UserProfile.jsp">Profile</a></li>
            </ul>
        </nav>
        <div class="search-bar">
            <form action="showProduct.jsp" method="GET">
                <input type="text" name="query" placeholder="Search products...">
                <select name="category">
                    <option value="">All Categories</option>
                    <option value="figurine">Figurines</option>
                    <option value="tools">Tools</option>
                </select>
                <select name="sort">
                    <option value="price_asc">Price: Low to High</option>
                    <option value="price_desc">Price: High to Low</option>
                    <option value="newest">Newest</option>
                </select>
                <select name="tag">
                    <option value="">All Tags</option>
                    <option value="limited">Limited Edition</option>
                    <option value="exclusive">Exclusive</option>
                </select>
                <button type="submit">Search</button>
            </form>
        </div>
    </header>
    <main>
        <section class="banner animated-banner">
            <img src="images/banner.jpg" alt="Shop Banner">
        </section>
        <section class="featured-products">
            <h2>Featured Products</h2>
            <div class="product-list">
                <c:forEach var="product" items="${featuredProducts}">
                    <div class="product-item animated-product">
                        <img src="${product.image_url}" alt="${product.name}">
                        <h3>${product.name}</h3>
                        <p>${product.price} USD</p>
                        <a href="productDetail.jsp?id=${product.id}" class="btn">View Details</a>
                    </div>
                </c:forEach>
            </div>
        </section>
        <section class="new-products">
            <h2>New Arrivals</h2>
            <div class="product-list">
                <c:forEach var="product" items="${newProducts}">
                    <div class="product-item animated-product">
                        <img src="${product.image_url}" alt="${product.name}">
                        <h3>${product.name}</h3>
                        <p>${product.price} USD</p>
                        <a href="productDetail.jsp?id=${product.id}" class="btn">View Details</a>
                    </div>
                </c:forEach>
            </div>
        </section>
        <section class="best-sellers">
            <h2>Best Sellers</h2>
            <div class="product-list">
                <c:forEach var="product" items="${bestSellers}">
                    <div class="product-item animated-product">
                        <img src="${product.image_url}" alt="${product.name}">
                        <h3>${product.name}</h3>
                        <p>${product.price} USD</p>
                        <a href="productDetail.jsp?id=${product.id}" class="btn">View Details</a>
                    </div>
                </c:forEach>
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2025 G-Shop. All rights reserved.</p>
    </footer>
</body>
</html>
