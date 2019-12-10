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
    <link rel="stylesheet" href="bootstrapCSS/bootstrap.min.css">
    <link rel="stylesheet" href="cssB/main.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">



    <title>Panel logowania</title>
    <style>
        .jumpers img {
            width: 100%;
            height: auto;
        }

        .jumpers p {
            margin-bottom: 30px;
        }

        .jumpers figcaption {
            margin-top: 8px;
        }

        .navbar {
            min-height: 57px;
        }

        input[name="r"] {
            position: absolute;
            visibility: hidden;
        }


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
        .box h5{
            color: white;
            font-weight: 100;
            text-decoration: none;


        }
        a:visited{
            text-decoration: none;
            color: white;
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
            width: 240px;
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
<header>


    <nav class="navbar navbar-dark bg-jumpers navbar-expand-lg">
        <%--        ta linijka byla do loga --%>
        <%--        <img src="img/logo.png" width="30" height="30"class="d-inline-block mr-1 align-bottom" alt="">--%>
        <h3><a class="navbar-brand" href="#">changebook.com</a></h3>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainmenu">

            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT">Strona Główna</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="#">Bestselery</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="#">Promocje</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/adv">Ogłoszenia</a></h3>
                </li>


                <% if (session.getAttribute("name") != null) { %>
                <h3>
                    <li class="nav-item">
                        <%
                            String name = session.getAttribute("name").toString();
                            String id = session.getAttribute("user").toString();
                        %>
                        <a class="nav-link">Witaj <%=name%> ID: <%=id%>
                        </a>

                    </li>
                </h3>
                <% } else { %>
                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/login">Zaloguj</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/register">Nowe Konto</a>
                    </h3>
                </li>

                <% } %>


                <% if (session.getAttribute("name") != null) { %>
                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/add">Dodaj nowe
                        ogłoszenie</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/logout">Wyloguj</a></h3>
                </li>

                <% }%>

            </ul>

            <%--            zakomentowany forumalrz do wyszukiwania--%>

            <%--            <form class="form-inline">--%>

            <%--                <input class="form-control mr-1" type="search" placeholder="Wyszukaj" aria-label="Wyszukaj">--%>
            <%--                <button class="btn btn-light" type="submit">Znajdź</button>--%>

            <%--            </form>--%>

        </div>

    </nav>

</header>

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

    <h5>Nie masz konta ? <a href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/register">utwórz nowe</a></h5>

</form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>

<script src="js/bootstrap.min.js"></script>

<script>

    $(document).ready(function () {
        $('.dropdown').on('click', function (e) {
            var $el = $(this);
            var $parent = $(this).offsetParent(".dropdown-menu");
            if (!$(this).next().hasClass('show')) {
                $(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
            }
            var $subMenu = $(this).next(".dropdown-menu");
            $subMenu.toggleClass('show');

            $(this).parent("li").toggleClass('show');

            $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function (e) {
                $('.dropdown-menu .show').removeClass("show");
            });

            if (!$parent.parent().hasClass('navbar-nav')) {
                $el.next().css({"top": $el[0].offsetTop, "left": $parent.outerWidth() - 4});
            }

            return false;
        });
    });

</script>

</body>
</html>
