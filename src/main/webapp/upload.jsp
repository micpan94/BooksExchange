<%--
  Created by IntelliJ IDEA.
  User: PanczoPC
  Date: 03.12.2019
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload a file</title>
</head>
<body>

<h1>upload a file</h1>
<fieldset>
    <legend>Upload file</legend>
    <form  method="post" enctype="multipart/form-data">
        <label for="filename"> select file:</label>
        <input id="filename" type="file" name="fileName" size="30"/><br/>
        <input id="filename2" type="file" name="fileName" size="30"/><br/>
        <input id="filename3" type="file" name="fileName" size="30"/><br/>
        <input type="submit" value="upload" />

    </form>

</fieldset>


</body>
</html>
