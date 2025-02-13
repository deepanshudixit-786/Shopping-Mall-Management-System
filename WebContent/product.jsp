<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String brand = request.getParameter("brand");
    if (brand == null) {
        brand = "All Brands";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= brand %> Products - Shopping Mall</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        header {
            background-color: #008CBA;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .product {
            display: inline-block;
            width: 30%;
            margin: 10px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .product img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .product-info {
            padding: 10px;
            text-align: center;
        }
        .product-info h3 {
            font-size: 1.2rem;
            margin-bottom: 5px;
        }
        .product-info p {
            margin: 5px 0;
            color: #555;
        }
        .product-info button {
            background-color: #008CBA;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .product-info button:hover {
            background-color: #4CAF50;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <header>
        <h1>Products for <%= brand %></h1>
    </header>
    <div class="container">
        <% if (brand.equalsIgnoreCase("amazon")) { %>
            <div class="product">
                <img src="images/amazon-shirt.jpg" alt="Amazon Shirt">
                <div class="product-info">
                    <h3>Amazon Shirt</h3>
                    <p>Price: ₹999</p>
                    <form action="CartServlet" method="post">
                        <input type="hidden" name="product" value="Amazon Shirt">
                        <input type="hidden" name="price" value="999">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </div>
        <% } else if (brand.equalsIgnoreCase("myntra")) { %>
            <div class="product">
                <img src="images/myntra.jpeg" alt="Myntra Dress">
                <div class="product-info">
                    <h3>Myntra Dress</h3>
                    <p>Price: ₹1499</p>
                    <form action="CartServlet" method="post">
                        <input type="hidden" name="product" value="Myntra Dress">
                        <input type="hidden" name="price" value="1499">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </div>
        <% } else { %>
            <p>No products available for this brand.</p>
        <% } %>
    </div>
</body>
</html>