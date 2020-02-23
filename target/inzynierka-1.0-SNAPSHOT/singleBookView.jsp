<%@ page import="Encje.Book" %><%--
  Created by IntelliJ IDEA.
  User: Michal.Pankiewicz
  Date: 1/15/2020
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><%
    Book book1 = (Book) request.getAttribute("book");
%>
    <title><%=book1.getTitle()%></title>
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

        body {
            background-image: url("img/index.jpg");
            text-align: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            color: white;
            font-size: 45px;
        }

        #container {
            width: 100%;
            display: flex;
            flex-direction: column;
        }

        .ideal {
            font-family: 'Lobster', cursive;
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
        .txtb img{
            width: 100%;
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
            font-size: 12px;
            margin-top: 6px;
        }

        .btn {
            display: inline-block;
            background: #09ff00;
            padding: 14px 0;
            color: white;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 8px;
            width: 100%;
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
        
        .btn {
            position: relative;
        }

        .submit-btn {
            background: #09ff00;
            padding: 20px 0;
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            border-radius: 3px;
            display: flex;
            justify-content: center;
        }

        .submit-btn input {
            background-color: Transparent;
            background-repeat:no-repeat;
            border: none;
            cursor:pointer;
            overflow: hidden;
            outline: none;
            font-family: 'Roboto';
            text-align: center;
            text-transform: uppercase;
            color: #FFF;
            user-select: none;
        }

        .btn:last-child {
            height: 80px;
        }

        .submit-btn:after {
            content: "";
            display: block;
            position: absolute;
            width: 100%;
            height: 10%;
            border-radius: 50%;
            background-color: darken(#f1c40f, 20%);
            opacity: 0.4;
            bottom: -30px;
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


                    <li class="nav-item">
                        <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/adv"><i
                                class="fas fa-money-check"></i>
                            <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Ogłoszenia</p></a></h3>
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
                                <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Witaj <%=name%> ID: <%=id%>
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
                        <h3><a class="nav-link" href="http://localhost:8090/inzynierka-1.0-SNAPSHOT/logout"><i
                                class="fas fa-sign-out-alt"></i>
                            <p style=" text-shadow: black 0.1em 0.1em 0.2em; ">Wyloguj</p></a></h3>
                    </li>

                    <% }%>

                </ul>

            </div>

        </nav>

    </header>

    <%
        Book book = (Book) request.getAttribute("book");
    %>
    <div class="contact-form">



        <div class="txtb">
            <img src="bookJpg/<%=book.getId()%>.jpg">

        </div>

        <div class="txtb">
            <label>Tytuł</label>
            <%=book.getTitle()%>
        </div>

        <div class="txtb">
            <label>Autor</label>
            <%=book.getAuthor()%>
        </div>

        <div class="txtb">
            <label>Data wydania</label>
            <%=book.getFirstRelease()%>
        </div>
        <div class="txtb">
            <label>Wydawnictwo</label>
            <%=book.getPublishingHouse()%>
        </div>
        <div class="txtb">
            <label>Gatunek literacki</label>
            <%=book.getType()%>
        </div>
        <div class="txtb">
            <label>Cena</label>
            <%=book.getPrice()%>zł
        </div>

<%--        button do dodawania --%>
        <div class="btn">
            <form action="" method="post">
                <%
                request.setAttribute("bookID",book.getId());
                %>
                <div class="submit-btn">
                    <input type="submit" name="bookID" value="Dodaj do koszyka"/>
                </div>
            </form>
        </div>


    </div>
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

</div>
<%--skrypty dla navbaru--%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.0/gsap.min.js"></script>
<script>

    $(document).ready(function () {
        const $button = document.querySelector('.submit-btn');
        $button.addEventListener('click', function() {
            const duration = 0.3,
                delay = 0.08;
            TweenMax.to($button, duration, {scaleY: 1.6, ease: Expo.easeOut});
            TweenMax.to($button, duration, {scaleX: 1.2, scaleY: 1, ease: Back.easeOut, easeParams: [3], delay: delay});
            TweenMax.to($button, duration * 1.25, {scaleX: 1, scaleY: 1, ease: Back.easeOut, easeParams: [6], delay: delay * 3 });
        });

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
<body>

</body>
</html>
