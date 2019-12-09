<%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 09.11.2019
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">



    <title>Panel logowania</title>
    <style>

        body {
            margin: 0;
            padding: 0;
            background-image: url("img/index.jpg");
            background-size: cover;
            !important;font-family: 'Lobster', cursive;


        }

        .box {
            width: 300px;
            padding: 40px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #191919;
            text-align: center;
            opacity: 80%;
            color: white;
        }

        .box h1 {
            color: white;
            font-weight: 500;
        }

        .box input[type = "text"], .box input[type = "password"] {
            border: 0;
            background: none;
            display: block;
            margin: 20px auto;
            text-align: center;
            border: 2px solid #3498db;
            padding: 14px 10px;
            width: 200px;
            outline: none;
            color: white;
            border-radius: 24px;
            transition: 0.25s;
        }

        .box input[type = "text"]:focus, .box input[type = "password"]:focus {
            width: 280px;
            border-color: #2ecc71;
        }

        .box input[type="submit"] {
            border: 0;
            background: none;
            display: block;
            margin: 20px auto;
            text-align: center;
            border: 2px solid #2ecc71;
            padding: 14px 40px;
            outline: none;
            color: white;
            border-radius: 24px;
            transition: 0.25s;
            cursor: pointer;
        }

        .box input[type="submit"]:hover {
            /*background: #2ecc71;*/
            background: black;
            color: white;
        }

    </style>
</head>
<body>

<form class="box" method="post">
    <%
        if (request.getAttribute("errors") != null) {
    %>
    <fieldset>
        <ul>
            <%--            // first name erero--%>
            <%
                if (request.getAttribute("login_error") != null) {
            %>
            <li>Błędna nazwa użytkownika</li>
            <%
                }
            %>

            <%
                if (request.getAttribute("wrong_password") != null) {
            %>
            <li>Błędne Hasło</li>

            <%
                }
            %>
            <%--&lt;%&ndash;&ndash;%&gt; last name error--%>

        </ul>
    </fieldset>

    <%
        }
    %>


    <h1>Zaloguj się</h1>
    <input type="text" name="login" placeholder="login">
    <input type="password" name="password" placeholder="haslo">
    <input type="submit" name="" value="Login">

</form>

</body>
</html>
