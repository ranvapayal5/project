<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adoption Request Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
        }
        h2 {
            color: #28a745;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .success-icon {
            font-size: 50px;
            color: #28a745;
        }
        a {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s ease-in-out;
        }
        a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="success-icon">&#10004;</div>
        <h2>Your adoption request has been successfully submitted!</h2>
        <a href="dashboard.jsp">Go back to Dashboard</a>
    </div>

</body>
</html>
