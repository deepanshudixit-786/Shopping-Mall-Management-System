<!DOCTYPE html>
<html>
<head>
    <title>Shopping Mall Management</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        header {
            background: linear-gradient(90deg, #ff6347, #ff4500);
            color: white;
            text-align: center;
            padding: 20px 0;
        }
        header h1 {
            margin: 0;
            font-size: 2.5rem;
        }
        .content {
            text-align: center;
            padding: 50px 20px;
        }
        .content h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #333;
        }
        .content a {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            font-size: 1.2rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
            background-color: #ff4500;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        .content a:hover {
            background-color: #ff6347;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
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
    <div class="content">
        <h2>Get Started</h2>
        <a href="register.jsp">Register</a>
        <a href="login.jsp">Login</a>
    </div>
    <footer>
        <p>&copy; 2025 Shopping Mall. All rights reserved.</p>
    </footer>
</body>
</html>