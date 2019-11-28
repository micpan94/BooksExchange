<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 26.11.2019
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj nowe ogłoszenie</title>
    <style>

        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-image: url("login.jpg");

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

        .box h2 {
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

        .box select {
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

        .box textarea {
            resize: none;
            background: none;
            display: block;
            margin: 20px auto;
            text-align: center;
            border: 2px solid #3498db;
            padding: 14px 10px;
            width: 280px;
            outline: none;
            color: white;
            border-radius: 24px;
            transition: 0.25s;


        }


    </style>

</head>

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


    <h2>Nowe Ogłoszenie </h2>
    <input type="text" name="title" placeholder="tytuł">
    <input type="text" name="price" placeholder="cena">
    <label for="type">Rodziaj</label>
    <select id="type" name="type">
        <option>biznes,ekonomia,marketing</option>
        <option>dla dzieci</option>
        <option>fantastyka,horror</option>
        <option>historia</option>
        <option>informatyka</option>
        <option>komiks</option>
        <option>kryminal,thriller</option>
        <option>kuchnia</option>
        <option>lektury szkolne</option>
        <option>literatura obca</option>
        <option>literatura polska</option>
        <option>nauki scisle</option>
        <option>prawo</option>
        <option>religia</option>
        <option>sztuka</option>
        <option>turystyka</option>
        <option>zdrowie</option>
    </select>
    <label for="selectx">Stan</label>
    <select id="selectx" name="state">
        <option>Nowa</option>
        <option>Używana</option>
    </select>
    <h2>Opis</h2>
    <textarea name="content" rows="6" id="textarea"
              placeholder="Napisz kilka słów na temat swojego ogłoszenia.."></textarea>
    <h2>Dodaj zdjęcie</h2>

    <input type="file" name="file" id="file">


    <input type="submit" name="" value="Dodaj">

</form>

</body>
</html>
