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
    <title>Najlepsze ksiązki na miejscu</title>
    <link rel="stylesheet" href="bootstrapCSS/bootstrap.min.css">
    <link rel="stylesheet" href="cssB/main.css">
    <%--    // od stopki--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <%--    <link rel="stylesheet" href="style/style.css">--%>
    <link href="https://fonts.googleapis.com/css?family=Oleo+Script&display=swap" rel="stylesheet">


    <style>
        @font-face {
            font-family: "xd";
            src: url("font/HKGrotesk-Regular.otf");
        }
        *{
            font-family: xd;
        }
        html, body {
            background-image: url("img/index.jpg");
            background-size: cover;
            scroll-behavior: smooth;
            font-family: 'Lobster', cursive;
            text-align: center;
            /*  slider   */
            width: 100%;
            height: 100%;
            padding: 0;
            margin-left: 0;
            margin-right: 0;
            background-repeat: no-repeat;
            background-attachment: fixed;


        }

        /*// slider*/
        slider {
            display: block;
            width: 100%;
            height: 100px;
            overflow: hidden;
            position: absolute;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            border: black 2px solid;
            opacity: 75%;
        }

        #news {
            display: block;
            width: 100%;
            color: ghostwhite;
            font-size: 30px;
            position: absolute;
            padding-left: 25px;
            margin-right: 0;
            margin-top: 100px;
            text-shadow: black 0.1em 0.1em 0.2em;
            text-align: left;
            overflow: hidden;
        }

        #bestsellers {
            display: block;
            width: 100%;
            color: ghostwhite;
            padding-left: 25px;
            text-shadow: black 0.1em 0.1em 0.2em;
            font-size: 30px;
            margin-top: 50px;
            position: absolute;
            text-align: left;
            overflow: hidden;

        }

        #promotion {
            display: block;
            width: 100%;
            margin-top: 100px;
            color: ghostwhite;
            padding-left: 25px;
            text-shadow: black 0.1em 0.1em 0.2em;
            font-size: 30px;
            text-align: left;
        }

        #contact {
            display: block;
            width: 100%;
            margin-top: 100px;
            color: ghostwhite;
            padding-left: 25px;
            text-shadow: black 0.1em 0.1em 0.2em;
            font-size: 30px;
            text-align: left;
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
            text-shadow: 2px 2px black;
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
              background-color: black;
              position: fixed;
              bottom: 0;
              width: 100%;
             display: block;
              color: white;
              opacity: 60%;
              text-align: center;
              font-size: 20px;
              margin-top: 40px;
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

        .boxWrrapper {
            margin-top: 160px;
            width: 100%;
            height: auto;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            flex-flow: wrap;
            margin-left: 0;
            margin-right: 0;
            color: white;
            text-shadow: black 0.1em 0.1em 0.2em;

        }

        .boxWrrapper a {
            display: block;
            text-decoration: none;
            color: white;

        }
        .boxWrrapper a:visited,
        .boxWrrapper a:hover{
            color: #eaff9b;
            outline: none;
        }

        .boxWrrapper1 {
            margin-top: 10px;
            width: 100%;
            height: auto;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            flex-flow: wrap;
            margin-left: 0;
            margin-right: 0;
            color: white;
            text-shadow: black 0.1em 0.1em 0.2em;


        }

        #info {
            color: white;
            font-size: larger;
            text-align: left;
            text-shadow: black 0.1em 0.1em 0.2em;

        }

        .box {
            width: 15%;
            min-width: 240px;
            height: 380px;
            margin: 30px;
            box-sizing: border-box;
            background-color: white;
            opacity: 85%;
            font-size: 40px;
            border: white 4px solid;
            cursor: pointer;

        }

        .box img {
            width: 100%;
            height: 100%;
        }

        .box img:hover {
            opacity: 80%;
        }

        @media screen and(max-width: 1200px) {
            .box {
                width: 40%;
            }
        }

        @media screen and(max-width: 600px) {
            .box {
                width: 90%;
            }
        }


    </style>

    <style>
        @media (min-width: 415px) {
            slider {
                height: 80px;
            }
        }
        .ideal{
            font-family: 'Lobster', cursive;
        }


    </style>

</head>
<body>
<header>


    <nav class="navbar navbar-dark bg-jumpers navbar-expand-lg">
        <h3><a class="navbar-brand" href="#"><p class="ideal">changebook.com</p></a></h3>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainmenu">

            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT"><i
                            class="fas fa-home"></i>
                        <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Strona Główna</p></a></h3>
                </li>

<%--                <li class="nav-item">--%>
<%--                    <h3><a class="nav-link" href="#bestsellers"><i class="fas fa-book"></i>--%>
<%--                        <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Bestsellery</p></a></h3>--%>
<%--                </li>--%>

<%--                <li class="nav-item">--%>
<%--                    <h3><a class="nav-link" href="#promotion"><i class="fas fa-percent"></i>--%>
<%--                        <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Promocje</p></a></h3>--%>
<%--                </li>--%>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/adv"><i
                            class="fas fa-money-check"></i>
                        <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Ogłoszenia</p></a></h3>
                </li>
                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/info"><i class="fas fa-info"></i>
                        <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Kontakt</p></a></h3>
                </li>


                <% if (session.getAttribute("name") != null) { %>
                <h3>
                    <li class="nav-item">
                        <%
                            String name = session.getAttribute("name").toString();
                            String id = session.getAttribute("user").toString();
                        %>
                        <a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/myprofile"><i class="fas fa-user"></i>
                            <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Mój profil
                            </p>
                        </a>

                    </li>
                </h3>
                <% } else { %>
                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/login"><i
                            class="fas fa-sign-in-alt"></i>
                        <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Zaloguj</p></a></h3>
                </li>

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
                            class="fas fa-plus"></i>
                        <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Dodaj nowe
                            ogłoszenie</p></a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/advlist"><i class="fas fa-clipboard-list"></i>
                        <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Moje ogłoszenia</p></a></h3>

                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/logout"><i
                            class="fas fa-sign-out-alt"></i>
                        <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Wyloguj</p></a></h3>
                </li>

                <% }%>

            </ul>

        </div>

    </nav>

</header>

<slider>
    <slide><p>Utwórz nowe konto, dołacz do naszej społecznosci</p></slide>
    <slide><p>Jestesmy juz w Katowicach i Chorzowie!</p></slide>
    <slide><p>Sprawdz aktualne promocje</p></slide>
    <slide><p>Sprzedawaj ksiazki w swojej okolicy</p></slide>


</slider>

<div id="news">CO NOWEGO | KSIĄŻKI</div>

<div class="boxWrrapper">
    <a href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/book?bookId=1" class="box"><img src="books/holownia.jpg">49zł</a>
    <div class="box"><img src="books/puzo.jpg">59zł</div>
    <div class="box"><img src="books/tusk.jpg">29zł</div>
    <div class="box"><img src="books/witcher.jpg">89zł</div>

</div>

<div id="bestsellers">NAJLEPIEJ SPRZEDAWANE</div>

<div class="boxWrrapper">
    <div class="box"><img src="books/wada.jpg">19,99zł</div>
    <div class="box"><img src="books/greta.jpg">9,99zł</div>
    <div class="box"><img src="books/sweden.jpg">34,99zł</div>

</div>

<div id="promotion">AKTUALNE PROMOCJE</div>


<div class="boxWrrapper1">
    <div class="box"><img src="books/cezar.jpg">-30%</div>
    <div class="box"><img src="books/stranger.jpg">-40%</div>

</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>


<div id="footer">
    <div class="social-buttons">
        <a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
        <a href="https://twitter.com/?lang=pl"><i class="fab fa-twitter"></i></a>
        <a href="https://www.instagram.com/?hl=pl"><i class="fab fa-instagram"></i></a>
        <a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
        <a href="https://www.linkedin.com/"><i class="fab fa-linkedin-in"></i></a>
    </div>
</div>

<%--skrypty dla nav-baru--%>
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
