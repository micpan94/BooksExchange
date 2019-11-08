<%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 05.11.2019
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="Michał Pankiewicz">
    <meta http-equiv="X-Ua-Compatible" content="IE=edge">
    <link href="https://fonts.googleapis.com/css?family=McLaren&display=swap" rel="stylesheet">
    <title>Welcome</title>
    <link rel="stylesheet" href="cssB/bootstrap.min.css">
    <link rel="stylesheet" href="cssB/main.css">
    <link rel="stylesheet" href="css/fontello.css" type="text/css"/>
    <link rel="stylesheet" href="css/slider.css" type="text/css">


    <style>
        body {
            background-image: url("img/bck.png");
            font-family: 'McLaren', cursive;
            text-align: center;

        }

        h1 {
            font-size: 36px;
            font-weight: 400;
            color: #C0D06F;
            margin: 20px;
        }

        .jumpers {
            text-align: center;
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

        .login-bar {
            float: right;
        }


    </style>

</head>
<body>
<header>


    <%--    </div>--%>
    <nav class="navbar navbar-light bg-jumpers navbar-expand-lg">

        <a class="navbar-brand" href="#"><img src="img/logo.png" width="30" height="30"
                                              class="d-inline-block mr-1 align-bottom" alt="">changebook.com</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainmenu">

            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="#"> Start </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">BESTSELERY</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">RABATY</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link disabled" href="#">OGŁOSZENIA</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">ZALOGUJ</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">NOWE KONTO</a>
                </li>

            </ul>

            <form class="form-inline">

                <input class="form-control mr-1" type="search" placeholder="Wyszukaj" aria-label="Wyszukaj">
                <button class="btn btn-light" type="submit">Znajdź</button>

            </form>

        </div>

    </nav>

</header>


<h1>NOWOŚCI</h1>


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
