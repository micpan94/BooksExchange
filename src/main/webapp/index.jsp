<%@ page import="Encje.Client" %>
<%@ page import="Encje.ClientDao" %><%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 05.11.2019
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="Michał Pankiewicz">
    <meta http-equiv="X-Ua-Compatible" content="IE=edge">
    <link href="https://fonts.googleapis.com/css?family=McLaren&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oleo+Script+Swash+Caps&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/1c89e44ac5.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
    <title>Welcome</title>
    <link rel="stylesheet" href="bootstrapCSS/bootstrap.min.css">
    <link rel="stylesheet" href="cssB/main.css">
    <%--    // od stopki--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <%--    <link rel="stylesheet" href="style/style.css">--%>
    <link href="https://fonts.googleapis.com/css?family=Oleo+Script&display=swap" rel="stylesheet">



    <style>
        html, body {
            background-image: url("img/index.jpg");
            background-size: cover;
        !important;
            font-family: 'Lobster', cursive;
            text-align: center;
            /*  slider   */
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0px;
        }

        /*// slider*/
        slider {
            display: block;
            width: 100%;
            height: 80px;
            overflow: hidden;
            position: absolute;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            border: black 2px solid;

        }

        slider > * {
            position: absolute;
            display: block;
            width: 100%;
            height: 100%;
            background: #1f1f1f;
            animation: slide 24s infinite;
            overflow: hidden;
        }

        slide:nth-child(1) {
            left: 0%;
            animation-delay: -2s;
            background-image: url("slider/1.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        slide:nth-child(2) {
            animation-delay: 4s;
            background-image: url("slider/2.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        slide:nth-child(3) {
            animation-delay: 10s;
            background-image: url("slider/3.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        slide:nth-child(4) {
            animation-delay: 16s;
            background-image: url("slider/4.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        slide p {
            font-family: 'Oleo Script', cursive;
            font-size: 28px;
            text-align: center;
            margin-top: 6px;
            margin-bottom: 2px;
            padding: 5px;
            display: inline-block;
            width: 100%;
            color: #fff;
        }

        @keyframes slide {
            0% {
                left: 100%;
                width: 100%;
            }
            5% {
                left: 0%;
            }
            25% {
                left: 0%;
            }
            30% {
                left: -100%;
                width: 100%;
            }
            30.0001% {
                left: -100%;
                width: 0%;
            }
            100% {
                left: 100%;
                width: 0%;
            }
        }


        h1 {
            font-size: 36px;
            font-weight: 400;
            color: #C0D06F;
            margin: 20px;
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

        #footer {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            padding: 0;
            background-color: black;
            display: block;
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
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT"><i class="fas fa-home"></i>Strona Główna</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="#"><i class="fas fa-book"></i>Bestselery</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="#"><i class="fas fa-percent"></i>Promocje</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/adv"><i class="fas fa-money-check"></i>Ogłoszenia</a></h3>
                </li>


                <% if (session.getAttribute("name") != null) { %>
                <h3>
                    <li class="nav-item">
                        <%
                            String name = session.getAttribute("name").toString();
                            String id = session.getAttribute("user").toString();
                        %>
                        <a class="nav-link"><i class="fas fa-user"></i>Witaj <%=name%> ID: <%=id%>
                        </a>

                    </li>
                </h3>
                <% } else { %>
                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/login"><i class="fas fa-sign-in-alt"></i>Zaloguj</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/register"><i class="fas fa-child"></i>Nowe Konto</a>
                    </h3>
                </li>

                <% } %>


                <% if (session.getAttribute("name") != null) { %>
                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/add"><i class="fas fa-plus"></i>Dodaj nowe
                        ogłoszenie</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/logout"><i class="fas fa-sign-out-alt"></i>Wyloguj</a></h3>
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

<slider>
    <slide><p>Utwórz nowe konto, dołacz do naszej społecznosci</p></slide>
    <slide><p>Jestesmy juz w Katowicach i Chorzowie!</p></slide>
    <slide><p>Sprawdz aktualne promocje</p></slide>
    <slide><p>Sprzedawaj ksiazki w swojej okolicy</p></slide>


</slider>

</body>
</html>
