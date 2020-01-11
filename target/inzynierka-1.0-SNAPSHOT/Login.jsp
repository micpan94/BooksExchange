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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">


    <title>Panel logowania</title>
    <style>
        @font-face {
            font-family: "xd";
            src: url("font/HKGrotesk-Regular.otf");
        }
        *{
            font-family: xd;
        }

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
            text-align: center;
            background-image: url("img/index.jpg");
            background-size: cover;
            font-family: 'Lobster', cursive;
            display: flex;
            justify-content: center;
            height: 100%;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        #container{
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            width: 100%;
            height: 100%;
            justify-content: space-between;
        }

        .box {
            width: 330px;
            padding: 40px;
            background: #191919;
            text-align: center;
            align-self: center;
            opacity: 80%;
            color: white;
            margin-top: 40px;
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
            width: 240px;
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
            background-color: black;
            color: white;
            opacity: 60%;
            text-align: center;
            font-size: 20px;
            width: 100%;
            align-self: end;

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

<div id="container">
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
                        <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT"><i
                                class="fas fa-home"></i><p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Strona Główna</p></a></h3>
                    </li>

                    <li class="nav-item">
                        <h3><a class="nav-link" href="#bestsellers"><i class="fas fa-book"></i><p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Bestsellery</p></a></h3>
                    </li>

                    <li class="nav-item">
                        <h3><a class="nav-link" href="#promotion"><i class="fas fa-percent"></i><p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Promocje</p></a></h3>
                    </li>

                    <li class="nav-item">
                        <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/adv"><i
                                class="fas fa-money-check"></i><p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Ogłoszenia</p></a></h3>
                    </li>


                    <% if (session.getAttribute("name") != null) { %>
                    <h3>
                        <li class="nav-item">
                            <%
                                String name = session.getAttribute("name").toString();
                                String id = session.getAttribute("user").toString();
                            %>
                            <a class="nav-link"><i class="fas fa-user"></i><p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Witaj <%=name%> ID: <%=id%></p>
                            </a>

                        </li>
                    </h3>
                    <% } else { %>

                    <li class="nav-item">
                        <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/register"><i
                                class="fas fa-child"></i>
                            <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Nowe Konto</p></a>
                        </h3>
                    </li>

                    <% } %>


                    <% if (session.getAttribute("name") != null) { %>
                    <li class="nav-item">
                        <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/add"><i
                                class="fas fa-plus"></i><p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Dodaj nowe
                            ogłoszenie</p></a></h3>
                    </li>

                    <li class="nav-item">
                        <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/logout"><i
                                class="fas fa-sign-out-alt"></i><p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Wyloguj</p></a></h3>
                    </li>

                    <% }%>

                </ul>

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

        <h5>Nie masz konta ? <a href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/register"><p style="color: red">utwórz nowe</p></a></h5>

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
