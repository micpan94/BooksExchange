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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <link rel="stylesheet" href="bootstrapCSS/bootstrap.min.css">
    <link rel="stylesheet" href="cssB/main.css">
    <title>Dodaj nowe ogłoszenie</title>
    <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Calistoga|Girassol&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

    <style>

        body {
            margin: 0;
            padding: 0;
        !important;
            font-family: 'Lobster', cursive;

        }

        body {
            background-image: url("adversmentJSP/img/lib1.jpg");
        }

        .box {
            width: 340px;
            padding: 20px;
            position: absolute;
            /*// tutaj zmienialem*/
            top: 55%;
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
            font-weight: 300;
            font-family: 'Calistoga', cursive;


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


<body>
<form class="box" method="post" enctype="multipart/form-data">
    <%
        if (request.getAttribute("errors") != null) {
    %>
    <fieldset>
        <ul>
            <%--            // first name erero--%>
            <%
                if (request.getAttribute("price_error") != null) {
            %>
            <li>Błędna cena</li>
            <%
                }
            %>

            <%
                if (request.getAttribute("title_password") != null) {
            %>
            <li>tytuł może zawierać maksymalnie 200 znaków!</li>

            <%
                }
            %>


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
        <option>biznes</option>
        <option>dla dzieci</option>
        <option>fantastyka</option>
        <option>historia</option>
        <option>informatyka</option>
        <option>komiks</option>
        <option>kryminal</option>
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
    <h4>Wybierz zdjęcia</h4>
    <input type="file" name="multiPartServlet">
    <input type="submit" name="" value="Dodaj">

</form>

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

                <li class="nav-item">
                    <h3><a class="nav-link" href="#"><i class="fas fa-book"></i>Bestselery</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="#"><i class="fas fa-percent"></i>Promocje</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/adv"><i
                            class="fas fa-money-check"></i>Ogłoszenia</a></h3>
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
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/login">Zaloguj</a></h3>
                </li>

                <li class="nav-item">
                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/register">Nowe Konto</a>
                    </h3>
                </li>

                <% } %>


                <% if (session.getAttribute("name") != null) { %>
                <%--                <li class="nav-item">--%>
                <%--                    <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/add">Dodaj nowe--%>
                <%--                        ogłoszenie</a></h3>--%>
                <%--                </li>--%>

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
