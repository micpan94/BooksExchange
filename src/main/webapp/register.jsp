<%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 09.11.2019
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register now</title>


    <style>

        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-image: url("login.jpg");
            color: white;

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
        }

        .box h1 {
            color: white;
            text-transform: uppercase;
            font-weight: 500;
            font-family: 'Yeon Sung', cursive;
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
            background: #2ecc71;
        }

    </style>
</head>
<body>

<form class="box" method="post">
    <h1>Rejestracja</h1>
    <%--    <input type="text" name="login" placeholder="your login">--%>
    <%--    <input type="text" name="mail" placeholder="your email">--%>
    <%--    <input type="password" name="password" placeholder="password">--%>

    <%--    <input type="submit" value="create new account">--%>

    <div id="container">

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
                <%--&lt;%&ndash;&ndash;%&gt; last name error--%>
                <%
                    if (request.getAttribute("password_error") != null) {
                %>
                <li>Błędne hasło</li>
                <%
                    }
                %>
                <%--           dob erereo--%>

                <%
                    if (request.getAttribute("email_error") != null) {
                %>
                <li>Błedny adres email</li>
                <%
                    }
                %>
                <%
                    if (request.getAttribute("succes") != null){
                %>
                <li>Udało się stworzyć konto!</li>
                <%
                    }
                %>
            </ul>
        </fieldset>

        <%
            }
        %>


        <fieldset>
            <form action="AddUser" method="post">
                <div class="inputField">
                    <input name="login" type="text" id="first-name" placeholder="Login">
                </div>

                <div class="inputField">
                    <input name="password" type="password" id="last-name" placeholder="Hasło">
                </div>

                <div class="inputField">
                    <input name="email" type="text" id="dob" placeholder="Email">
                </div>

                <div class="inputField" id="submitField">
                    <input id="submitBtn" type="submit" value="Stwórz nowe konto">
                </div>
            </form>
        </fieldset>



    </div>


</form>

</body>
</html>
