<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Encje.Client" %>
<%@ page import="Encje.Advertisement" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Collection" %><%--
  Created by IntelliJ IDEA.
  User: Michal.Pankiewicz
  Date: 1/11/2020
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twoje zamówienia</title>
    <meta charset="UTF-8">
    <meta name="author" content="Michał Pankiewicz">
    <meta http-equiv="X-Ua-Compatible" content="IE=edge">
    <link href="https://fonts.googleapis.com/css?family=McLaren&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oleo+Script+Swash+Caps&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/1c89e44ac5.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
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

        * {
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

        #container {
            display: flex;
            flex-direction: column;
            padding-bottom: 120px;
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

        .ideal {
            font-family: 'Lobster', cursive;
        }

        header {
            align-self: flex-start;
        }

        .contact-form {
            width: 85%;
            max-width: 600px;
            background: black;
            padding: 30px 40px;
            box-sizing: border-box;
            border-radius: 8px;
            opacity: 80%;
            color: white;
            text-align: center;
            box-shadow: 0 0 20px #000000b3;
            font-family: "Montserrat", sans-serif;
            align-self: center;
            word-wrap: break-word;
        }

        .contact-form p {
            font-size: 20px;
        }

        .contact-form h1 {
            margin-top: 0;
            font-weight: 200;
        }

        .txtb {
            border: 1px solid gray;
            margin: 8px 0;
            padding: 12px 18px;
            border-radius: 8px;
        }

        .txtb label {
            display: block;
            text-align: left;
            color: #333;
            text-transform: uppercase;
            font-size: 14px;
        }

        .txtb input, .txtb textarea {
            width: 100%;
            border: none;
            background: none;
            outline: none;
            font-size: 18px;
            margin-top: 6px;
        }

        .button {
            border-radius: 4px;
            background-color: black;
            text-decoration: none;
            color: black;
            border: 3px white solid;
            font-size: 14px;
            margin-top: 15px;
            cursor: pointer;
        }

        .button a {
            text-decoration: none;
            color: white;
        }

    </style>


</head>
<body>
<div id="container">
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
                        <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/info"><i
                                class="fas fa-info"></i>
                            <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Kontakt</p></a></h3>
                    </li>


                    <% if (session.getAttribute("name") != null) { %>
                    <h3>
                        <li class="nav-item">
                            <%
                                String name = session.getAttribute("name").toString();
                                String id = session.getAttribute("user").toString();
                            %>
                            <a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/myprofile"><i
                                    class="fas fa-user"></i>
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
                        <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/advlist"><i
                                class="fas fa-clipboard-list"></i>
                            <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Dodane ogłoszenia</p></a></h3>

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


    <div class="contact-form">
        <h1>Twoje zamówienia</h1>
        <% Collection<Advertisement> clientOrders = (Collection<Advertisement>) request.getAttribute("orders");
            Client client = (Client) session.getAttribute("client");
            if (clientOrders.size() > 0) {
        %>

        <c:forEach items="${orders}" var="element">
            <div class="txtb">
                <p> Szczegóły zamówienia nr: <c:out value="${element.id}"></c:out> <span class="inx"></span></p>
                Dane do wysyłki
                <p><c:out value="${element.address}"></c:out></p>
                Kod pocztowy
                <p><c:out value="${element.postCode}"></c:out></p>
                Dane osobowe
                <p><%=client.getFirstName()%> <%=client.getLastName()%></p>
                Numer dla kuriera
                <p><%=client.getTelephoneNr()%></p>
                Rodzaj płatnosci
                <p>Przelew bankowy</p>
                Dane do przelewu
                <p>mBank S.A. 82 1020 5226 0000 6102 0417 7895</p>
                <p>Changebook.com ul.Fabryczna 16B 41-303 Dąbrowa Górnicza</p>
                <p>Ważne informacje</p>
                W tytule przelewu należy wpisac numer zamówienia, wysyłka po zaksięgowaniu wpłaty, przesyłka kurierem gratis
                <p>Razem do zapłaty<p>
                <p style="color: #09ff00"><c:out value="${element.totalPrice}"></c:out> zł</p>


            </div>
        </c:forEach>
        <% } else { %>
        <p>Aktualnie nie masz żadnych zamówien</p>
        <%
            }
        %>
    </div>


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
