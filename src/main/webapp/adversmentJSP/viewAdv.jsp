<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 29.11.2019
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sprawdź najnowsze ogłoszenia</title>
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
        @font-face {
            font-family: "xd";
            src: url("font/HKGrotesk-Regular.otf");
        }
        *{
            font-family: xd;
        }

        body {
            background-image: url("img/index.jpg");
            background-size: inherit;
            font-family: 'Lobster', cursive;
        }

        #container {
            display: flex;
            width: 100%;
            height: 100%;
            flex-direction: column;
            align-items: center;
            padding-bottom: 200px;
        }

        .box {
            display: flex;
            min-height: 230px ;
            justify-content: space-between;
            color: white;
            border: #1d2124 2px solid;
            padding: 2px;
            margin-top: 2px;
        }

        #photo img {
            max-width: 100%;
            height: 100%;
        }

        #info {
            display: flex;
            flex-direction: column;
        }

        .element {
            border: white 2px solid;
            margin: 1px;
            word-break: break-all;
            padding: 10px;
        }

        .element a{
            text-decoration: none;
            color: #eaff9b ;
        }
        .element a:visited{
            color: white;
        }
        .element a:hover{
            text-shadow: #1e7e34;
            color: #2ecc71;
        }
        #news{
            align-self: flex-start;
            color: white;
        }
        #footer {
            background-color: black;
            display: block;
            color: white;
            opacity: 60%;
            text-align: center;
            font-size: 20px;
            margin-top: 40px;
            width: 100%;
            position: fixed;
            bottom: 0;
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
        #logo1{
            font-family: 'Lobster', cursive;
        }

    </style>
</head>
<body>
<header>


    <nav class="navbar navbar-dark bg-jumpers navbar-expand-lg">
        <%--        ta linijka byla do loga --%>
        <%--        <img src="img/logo.png" width="30" height="30"class="d-inline-block mr-1 align-bottom" alt="">--%>
        <h3><a class="navbar-brand" href="#" ><p id="logo1">changebook.com</p></a></h3>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainmenu">


            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT"><i
                            class="fas fa-home"></i>Strona Główna</a></h3>
                </li>

                <% if (session.getAttribute("name") != null) { %>
                <h3>
                    <li class="nav-item">
                        <%
                            String name = session.getAttribute("name").toString();
                            String id = session.getAttribute("user").toString();
                        %>
                        <a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/myprofile"><i class="fas fa-user"></i>Witaj <%=name%> ID: <%=id%>
                        </a>

                    </li>
                </h3>
                <% } else { %>
                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/login"><i
                            class="fas fa-sign-in-alt"></i>Zaloguj</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/register"><i
                            class="fas fa-child"></i>Nowe Konto</a>
                    </h3>
                </li>

                <% } %>


                <% if (session.getAttribute("name") != null) { %>
                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/add"><i
                            class="fas fa-plus"></i>Dodaj nowe
                        ogłoszenie</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/logout"><i
                            class="fas fa-sign-out-alt"></i>Wyloguj</a></h3>
                </li>

                <% }%>

            </ul>
        </div>

    </nav>

</header>
<div id="container">
    <div id="news"><h2>Ogłoszenia</h2></div>
    <form method="post">
        <label>Wybierz miasto</label>
        <select name="city">
            <option>Katowice</option>
            <option>Sosnowiec</option>
            <option>Dąbrowa Górnicza</option>
            <option>Chorzów</option>
        </select>
        <input type="submit" value="Submit">
    </form>

    <style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            grid-gap: 30px;
            grid-auto-rows: 1fr;
            width: 100%;
            padding: 0 20px;
            padding-bottom: 200px;
        }

        .grid-container__element {
            display: flex;
            flex-direction: column;
        }
        #photo{
            background-color: black;
            height: 200px;
            display: flex;
            justify-content: center;
        }
    </style>

    <ul class="grid-container">
        <c:forEach items="${advList}" var="element">
            <li class="box grid-container__element">
                <div id="photo"><img src="adversmentJSP/img/<c:out value="${element.id}"></c:out>.jpg"></div>
                <div id="info">
                    <div class="element"><c:out value="${element.title}"></c:out></div>
                    <div class="element"><c:out value="${element.price}"></c:out>zł</div>
                    <div class="element"><c:out value="${element.location}"></c:out></div>
                    <div class="element" style="color:lightgoldenrodyellow"><a href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/adversment?id=<c:out value="${element.id}"></c:out>" style="color:lightgoldenrodyellow">Sprawdź Szczegóły</a></div>
                </div>
            </li>
        </c:forEach>
    </ul>


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

<%--obsluga panelu gornego --%>
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
<%----%>
</body>
</html>
