<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="font-weight-semi-bold text-uppercase mb-3 text-center">
            Products Manager
        </h1>

        <!--Insert a new product-->
        <a class="btn btn-block btn-primary my-3 py-3" 
           style="transform: translateX(25vw); width: 25%; color: #fff"
           href="manageProduct?service=requestInsert"
           >
            Insert a new Product
        </a>

        <c:if test="${showSearchProduct ne null}">
            <!--Search product by name-->
            <div
                class="d-flex align-items-center justify-content-between mb-4"
                >
                <form action="manageProduct" id="searchByName">
                    <input type="hidden" name="service" value="searchByKeywords"/>
                    <div class="input-group">
                        <input
                            type="text"
                            class="form-control"
                            placeholder="Search by name"
                            name="keywords"
                            value="${keywords}"
                            />
                        <div class="input-group-append">
                            <button class="search-button btn btn-primary" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>            
            </div>
        </c:if>

        <c:if test="${notFoundProduct ne null}">
            <h4 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                ${notFoundProduct}
            </h4>
        </c:if>

        <c:if test="${deleteDone ne null}">
            <h4 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                ${deleteDone}
            </h4>
        </c:if>

        <!--List all Product-->
        <c:if test="${not empty allProducts}">


            <div class="col-lg-12 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Unit Price</th>
                            <th>Quantity In Stock</th>
                            <th>Release Date</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>                                       
                    <tbody class="align-middle">
                        <c:forEach items="${allProducts}" var="product">
                            <tr>
                                <td class="align-middle">${product.id}</td>
                                <td class="align-middle">
                                    <img src="${product.image_url}" alt="" style="width: 50px" />
                                    ${product.name}</td>
                                <td class="align-middle">${product.price}</td>
                                <td class="align-middle">${product.quantity}</td>
                                <td class="align-middle">${product.release_date}</td>
                                <td><a href="manageProduct?service=requestUpdate&productId=${product.id}">Update</a></td>
                                <td><a href="manageProduct?service=requestDelete&productId=${product.id}" onclick="return confirmDelete(${product.id})">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <script>
                function confirmDelete(productId) {
                    return confirm("Are you sure you want to delete this Product (ID = " + productId + ") ?");
                }
            </script>
        </c:if>
        <!--List all Product End-->

        <!--Update Product-->
        <c:if test="${UpdateDone ne null}">
            <h3 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                ${UpdateDone}
            </h3>
        </c:if>
        <c:if test="${productUpdate ne null}">
            <h1 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                Update Product 
            </h1>
            <form action="manageProduct" id="updateProduct">
                <input type="hidden" name="service" value="sendUpdateDetail" />
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="productId">ID</label>
                            <input type="text" class="form-control" id="productId" name="id" value="${productUpdate.id}" readonly />
                        </div>
                        <div class="form-group">
                            <label for="productName">Product Name</label>
                            <input type="text" class="form-control" id="productName" name="name" value="${productUpdate.name}" size="55" />
                        </div>
                        <div class="form-group">
                            <label for="releaseDate">Release Date</label>
                            <input type="text" class="form-control" id="releaseDate" name="release_date" value="${productUpdate.release_date}" size="8" />
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="unitPrice">Unit Price</label>
                            <input type="number" class="form-control" id="unitPrice" name="price" value="${productUpdate.price}" style="width: 80px" />
                        </div>
                        <div class="form-group">
                            <label for="quantityInStock">Quantity In Stock</label>
                            <input type="number" class="form-control" id="quantityInStock" name="quantity" value="${productUpdate.quantity}" style="width: 80px" />
                        </div>

                    </div>
                </div>
                <button class="btn btn-primary" onclick="document.getElementById('updateProduct').submit();">Update</button>
            </form>
        </c:if>
        <!--Update Product End-->

        <!--Insert Product-->
        <c:if test="${InsertDone ne null}">
            <h3 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                ${InsertDone}
            </h3>
        </c:if>
        <c:if test="${insertProduct ne null}">
            <h1 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                Insert a new Product 
            </h1>
            <form action="manageProduct" id="insertProduct">
                <input type="hidden" name="service" value="sendInsertDetail" />
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="productName">Product Name</label>
                            <input type="text" class="form-control" id="productName" name="name" />
                        </div>
                        <div class="form-group">
                            <label for="unitPrice">Unit Price</label>
                            <input type="number" class="form-control" id="unitPrice" name="price" />
                        </div>
                        <div class="form-group">
                            <label for="quantityInStock">Quantity In Stock</label>
                            <input type="number" class="form-control" id="quantityInStock" name="quantity" />
                        </div>
                        <div class="form-group">
                            <label for="description">Description</label>
                            <input type="text" class="form-control" id="description" name="description" />
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="imageUrl">Image Url</label>
                            <input type="text" class="form-control" id="imageUrl" name="image_url" />
                        </div>
                        <div class="form-group">
                            <label for="brand">Brand</label> <br>
                            <select class="form-control" id="brand" name="brand">
                                <c:forEach items="${allBrands}" var="brand">
                                    <option value="${brand.id}">${brand.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label for="releaseDate">Release Date</label> <br>
                            <input type="text" class="form-control" id="releaseDate" name="release_date" />
                        </div>
                        <button class="btn btn-primary" onclick="document.getElementById('insertProduct').submit();">Add</button>
                    </div>
                </div>
            </form>
        </c:if>
        <!--Insert Product End-->

    </body>
</html>
