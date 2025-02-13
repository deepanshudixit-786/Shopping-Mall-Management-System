<!DOCTYPE html>
<html>
<head>
    <title>Shopping Mall - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #0073e6;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .brand {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 20px;
        }
        .brand img {
            width: 200px;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Shopping Mall</h1>
    </header>
    <div class="container"></div>
        <h2>Top Brands</h2>
        <div class="brands">
    <h2>Top Brands</h2>
    <div class="brand-list">
        <a href="product.jsp?brand=amazon">
            <img src="images/amazon.png" alt="Amazon">
        </a>
        <a href="product.jsp?brand=flipkart">
            <img src="images/flipkart.png" alt="Flipkart">
        </a>
        <a href="product.jsp?brand=myntra">
            <img src="images/myntra.png" alt="Myntra">
        </a>
        <a href="product.jsp?brand=snapdeal">
            <img src="images/snapdeal.png" alt="Snapdeal">
        </a>
        <a href="product.jsp?brand=ebay">
            <img src="images/ebay.png" alt="eBay">
        </a>
    </div>
</div>
        
    <footer>
        <p>&copy; 2025 Shopping Mall. All rights reserved.</p>
    </footer>
</body>
</html>