<%@ page import="Encje.Advertisement" %><%--
  Created by IntelliJ IDEA.
  User: Michal.Pankiewicz
  Date: 1/14/2020
  Time: 12:34 PM
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
    <link rel="stylesheet" href="bootstrapCSS/bootstrap.min.css">
    <link rel="stylesheet" href="cssB/main.css">
    <%--    // od stopki--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <%--    <link rel="stylesheet" href="style/style.css">--%>
    <link href="https://fonts.googleapis.com/css?family=Oleo+Script&display=swap" rel="stylesheet">
    <title>changebook.com</title>
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
            background-size: inherit;
            font-family: 'Lobster', cursive;
            background-repeat: no-repeat;
            background-attachment: fixed;

        }

        #container {
            display: flex;
            width: 100%;
            height: 100%;
            flex-direction: column;
            align-items: center;
            margin-bottom: 250px;
        }


        #photo img {
            max-width: 100%;
            height: 100%;
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

        header {
            align-self: flex-start;
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
            margin-bottom: 300px;
            padding-bottom: 110px;
        }

        .contact-form label {
            text-align: left;
        }

        .contact-form h1 {
            margin-top: 0;
            font-weight: 200;
            color: #eaff9b;

        }

        .txtb {
            border: 1px solid gray;
            margin: 8px 0;
            padding: 12px 18px;
            border-radius: 8px;
            word-wrap: break-word;
        }
        .txtb a {
            text-decoration:  none;
            color: lightyellow;
            font-style: italic;
        }
        .txtb a:visited{
            color: #5a6268;
        }
        .txtb a:hover{
            color: yellow;
        }

        .txtb img {
            width: 100%;
            min-height: 240px;
            max-height: 340px;
        }

        .txtb label {
            display: block;
            text-align: left;
            color: #eaff9b;
            text-transform: uppercase;
            font-size: 16px;


        }

        .txtb input, .txtb textarea {
            width: 100%;
            border: none;
            background: none;
            outline: none;
            font-size: 18px;
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
    <div class="contact-form">
        <%
            Advertisement advertisement = (Advertisement) request.getAttribute("ADV");
            String stan = "nowy";
            if (!advertisement.getNew()) {
                stan = "używany";
            }
        %>



        <div class="txtb">
            <img src="adversmentJSP/img/<%=advertisement.getId()%>.jpg">
            <%=advertisement.getTitle()%>
        </div>

        <div class="txtb">
            <label>Kontakt telefoniczny</label>
            <%= advertisement.getClient().getTelephoneNr()%>
            <%=advertisement.getClient().getFirstName()%>
        </div>

        <div class="txtb">
            <label>Szczegóły</label>
            <%=advertisement.getContent()%>
        </div>

        <div class="txtb">
            <label>Stan</label>
            <%=stan%>
        </div>

        <div class="txtb">
            <label>Rodzaj</label>
            <%=advertisement.getType()%>
        </div>

        <div class="txtb">
            <label>Lokalizacja</label>
            <%=advertisement.getLocation()%>
        </div>

        <div class="txtb">
            <label>Cena</label>
            <%=advertisement.getPrice()%>zł
        </div>

        <div class="txtb">
            <label>Kontakt email</label>
            <a href="mailto:<%=advertisement.getClient().getEmail()%>?Subject=<%=advertisement.getTitle()%>" target="_top">Wyślij zapytanie</a>
        </div>

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
<%--skrypty dla navbaru--%>
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
