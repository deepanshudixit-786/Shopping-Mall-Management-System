<!DOCTYPE html>
<html>
<head>
    <title>Login - Shopping Mall</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(90deg, #ff6347, #ff4500);
            color: white;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
            color: #333;
        }
        .container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ff4500;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        input {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 1rem;
        }
        button {
            padding: 10px;
            background-color: #ff4500;
            color: white;
            font-size: 1rem;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        button:hover {
            background-color: #ff6347;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        }
        .link {
            text-align: center;
            margin-top: 10px;
        }
        .link a {
            color: #ff4500;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
        <div class="link">
            <p>Don't have an account? <a href="register.jsp">Register</a></p>
        </div>
    </div>
</body>
</html>