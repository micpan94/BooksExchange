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
        body {
            background-image: url("adversmentJSP/img/lib1.jpg");
            background-size: inherit;
            font-family: 'Lobster', cursive;
        }

        #container{
            display: flex;
            width: 100%;
            flex-wrap: wrap;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

        .container{
            display: flex;
            border: black 4px solid;
            margin: 5px;
            padding: 2px;
            background: #5a6268;


        }
        .box {
            display: flex;
            border: black 4px solid;
            margin: 1px;
            padding: 1px;
            font-size: 24px;
        }

        .box img{
            width: 220px;
            height: 240px;
        }

        .boxTitle{

        }
        .elements{
            display: flex;
            flex-direction: column;
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
                        <a class="nav-link"><i class="fas fa-user"></i>Witaj <%=name%> ID: <%=id%>
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

            <%--            zakomentowany forumalrz do wyszukiwania--%>

            <%--            <form class="form-inline">--%>

            <%--                <input class="form-control mr-1" type="search" placeholder="Wyszukaj" aria-label="Wyszukaj">--%>
            <%--                <button class="btn btn-light" type="submit">Znajdź</button>--%>

            <%--            </form>--%>

        </div>

    </nav>

</header>


<div id="container">
    <div class="container"><h1>Aktualne ogłoszenia</h1></div>

    <c:forEach items="${advList}" var="element">

        <div class="container">


            <div class="box"><img src="adversmentJSP/img/<c:out value="${element.id}"></c:out>.jpg"></div>
            <div class="boxTitle"><h2>Sprzedam tanio Ojca Chrzestnego</h2></div>

                <div class="elements">
                    <div class="box"> Lokalizacja : <c:out value="${element.location}"></c:out></div>
                    <div class="box">Data : 24 Listopad</div>
                    <div class="box">Cena : <c:out value="${element.price}"></c:out>zł</div>
                    <div class="box">Rodzaj : <c:out value="${element.type}"></c:out></div>
                </div>




        </div>


    </c:forEach>

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
