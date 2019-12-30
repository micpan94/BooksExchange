<%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 28.12.2019
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="responsiveslides.min.js"></script>
    <title>slider test</title>

    <script>
        $(function() {
            $(".rslides").responsiveSlides();
        });
    </script>

    <style>
        .rslides {
            position: relative;
            list-style: none;
            overflow: hidden;
            width: 100%;
            padding: 0;
            margin: 0;
        }

        .rslides li {
            -webkit-backface-visibility: hidden;
            position: absolute;
            display: none;
            width: 100%;
            left: 0;
            top: 0;
        }

        .rslides li:first-child {
            position: relative;
            display: block;
            float: left;
        }

        .rslides img {
            display: block;
            height: auto;
            float: left;
            width: 100%;
            border: 0;
        }

    </style>

</head>
<body>

<div>
    <ul class="rslides">
        <li><img src="sliderBeta/xd.jpg" alt=""></li>
        <li><img src="sliderBeta/amsterdam.jpg.jpg" alt=""></li>
    </ul>

</div>





</body>
</html>
