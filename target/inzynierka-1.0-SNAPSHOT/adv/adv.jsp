<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 20.11.2019
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link href="https://fonts.googleapis.com/css?family=Calistoga&display=swap" rel="stylesheet">

    <title>Ogloszenia</title>
    <link rel="stylesheet" href="cssB/bootstrap.min.css">
    <meta charset="utf-8">
    <meta name="author" content="Michał Pankiewicz">
    <meta http-equiv="X-Ua-Compatible" content="IE=edge">


    <style>

        body {
            font-family: 'McLaren', cursive;
            text-align: center;
            background-image: url("img/bck1.jpg");
            background-size: 100%;
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


        .slide img {
            width: 100%;
            height: 100%;
        }

        #r1:checked ~ .s1 {
            margin-left: 0;
        }

        #r2:checked ~ .s1 {
            margin-left: -20%;
        }

        #r3:checked ~ .s1 {
            margin-left: -40%;
        }

        #r4:checked ~ .s1 {
            margin-left: -60%;
        }

        #advClick {
            border: #3498db 2px solid;
            text-align: center;
            font-size: 22px;
            padding: 6px;
            margin: 4px;


        }

        #Logo {
            font-size: 46px;
            text-align: left;
        }


    </style>
</head>


<body>
<%--<c:forEach items="${tasks}" var="element">--%>
<%--    <div><c:out value="${element.id}"/>. <c:out value="${element.task}"></c:out>--%>
<%--        <button id="my-button"><a href="/delete?id=${element.id}">x</a></button>--%>
<%--    </div>--%>
<%--</c:forEach>--%>


<div id="container">

    <header>


        <nav class="navbar navbar-dark bg-jumpers navbar-expand-lg">

            <a class="navbar-brand" href="#">changebook.com</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                    aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="mainmenu">

                <ul class="navbar-nav mr-auto">


                    <li class="nav-item">
                        <a class="nav-link" href="#">BESTSELERY</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">RABATY</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/login">ZALOGUJ</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/register">NOWE KONTO</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">TEL 32 764 64 73</a>
                    </li>

                </ul>


            </div>

        </nav>

    </header>

    <div id="panel">

    </div>

    <div id="Logo">
        <h1>Aktualnie Ogłoszenia</h1>
    </div>
    <div id="advList">

        <c:forEach items="${advList}" var="element">
            <div id="advClick">

                <c:out value="${element.title}"></c:out>
                <c:out value="${element.price}"></c:out> zł

            </div>

        </c:forEach>

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
