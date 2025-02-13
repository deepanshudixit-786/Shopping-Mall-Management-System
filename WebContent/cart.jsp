<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart - Shopping Mall</title>
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
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        table th {
            background-color: #f4f4f4;
        }
        .empty-cart {
            text-align: center;
            padding: 20px;
            color: #666;
        }
    </style>
</head>
<body>
    <header>
        <h1>Your Cart</h1>
    </header>
    <div class="container">
        <h2>Items in Your Cart</h2>
        <%
            @SuppressWarnings("unchecked")
            ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
            
            if (cart == null || cart.isEmpty()) {
        %>
            <div class="empty-cart">
                <p>Your cart is empty</p>
            </div>
        <%
            } else {
        %>
            <table>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                </tr>
                <%
                    int total = 0;
                    try {
                        for (String item : cart) {
                            if (item != null && item.contains(" - ₹")) {
                                String[] parts = item.split(" - ₹");
                                if (parts.length == 2) {
                                    String productName = parts[0];
                                    int price = Integer.parseInt(parts[1].trim());
                                    total += price;
                %>
                                <tr>
                                    <td><%= productName %></td>
                                    <td>₹<%= price %></td>
                                </tr>
                <%
                            }
                        }
                    }
                } catch (NumberFormatException e) {
                    out.println("<tr><td colspan='2'>Error processing cart items</td></tr>");
                }
                %>
                <tr>
                    <th>Total</th>
                    <th>₹<%= total %></th>
                </tr>
            </table>
        <%
            }
        %>
    </div>
</body>
</html>