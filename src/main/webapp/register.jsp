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
    <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="bootstrapCSS/bootstrap.min.css">
    <link rel="stylesheet" href="cssB/main.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

    <style>

        body {
            margin: 0;
            padding: 0;
            font-family: 'Lobster', cursive;
            background-image: url("img/index.jpg");
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
            font-weight: 500;
        }

        .box input[type = "text"], .box input[type = "password"] {
            border: 0;
            background: none;
            display: block;
            margin: 20px auto;
            text-align: center;
            border: 2px solid rosybrown;
            padding: 14px 10px;
            width: 200px;
            outline: none;
            color: white;
            border-radius: 24px;
            transition: 0.25s;
        }

        .box input[type = "text"]:focus, .box input[type = "password"]:focus {
            width: 260px;
            border-color: white;
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
            background: black;
            color: white;
            border: 2px solid white;


        }
        #footer {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            padding: 0;
            background-color: black;
            color: white;
            opacity: 60%;
            text-align: center;
            font-size: 20px;

        }

        .social-buttons a {
            display: inline-flex;
            text-decoration: none;
            font-size: 15px;
            width: 60px;
            height: 60px;
            color: #fff;
            justify-content: center;
            align-items: center;
            position: relative;
            margin: 0 8px;
        }

        .social-buttons a::before {
            content: "";
            position: absolute;
            width: 40px;
            height: 40px;
            background: linear-gradient(45deg, white, black);
            border-radius: 50%;
            z-index: -1;
            transition: 0.3s ease-in;
        }

        .social-buttons a:hover::before {
            transform: scale(0);
        }

        .social-buttons a i {
            transition: 0.3s ease-in;
        }

        .social-buttons a:hover i {
            background: linear-gradient(45deg, black, white);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            transform: scale(2.2);
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
                    if (request.getAttribute("succes") != null) {
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

<div id="footer">
    <div class="social-buttons">
        <a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
        <a href="https://twitter.com/?lang=pl"><i class="fab fa-twitter"></i></a>
        <a href="https://www.instagram.com/?hl=pl"><i class="fab fa-instagram"></i></a>
        <a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
        <a href="https://www.linkedin.com/"><i class="fab fa-linkedin-in"></i></a>
    </div>


</div>

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
