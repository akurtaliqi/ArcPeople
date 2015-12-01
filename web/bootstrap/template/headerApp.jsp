<%-- 
    Document   : header
    Created on : 18 oct. 2013, 15:28:03
    Author     : Dyhia Dib - Ajtene Kurtaliqi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <%
            if (request.getParameter("typePage").equals("standard")) {
        %>

        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

        <!-- Common styles -->
        <link href="bootstrap/css/common.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="bootstrap/css/index.css" rel="stylesheet" />

        <link href="bootstrap/js/libs/bootstrapdatatable/css/datatables.css" rel="stylesheet" />

        <script src="bootstrap/js/libs/jquery-1.9.0/jquery.min.js"></script>
        <script src="bootstrap/js/libs/twitter-bootstrap-3.0.0/bootstrap.js"></script>
        <script src="bootstrap/js/libs/datatables-1.9.4/jquery.dataTables.min.js"></script>
        <script src="bootstrap/js/libs/bootstrapdatatable/js/datatables.js"></script>
        <script src="bootstrap/js/libs/bootbox/bootbox.min.js"></script>
        <script src="bootstrap/js/include/tpl-header-normal-inc.js"></script>

        <%  } else if (request.getParameter("typePage").equals("login")) {
        %>
        <title>Formulaire de connexion</title>

        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- Common styles -->
        <link href="bootstrap/css/common.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="bootstrap/css/signin.css" rel="stylesheet">

        <script src="bootstrap/js/libs/jquery-1.9.0/jquery.min.js"></script>
        <script src="bootstrap/js/libs/twitter-bootstrap-3.0.0/bootstrap.js"></script>
        <script src="bootstrap/js/libs/jquery-validate-1.10.0/jquery.validate.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="bootstrap/js/include/tpl-header-login-inc.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
        <link href="bootstrap/css/chat.css" rel="stylesheet" />
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Arc'People </title>

        <!-- Bootstrap core CSS -->

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">

        <!-- Custom styling plus plugins -->
        <link href="css/custom.css" rel="stylesheet">
        <link href="bootstrap/css/chat.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/maps/jquery-jvectormap-2.0.1.css" />
        <link href="css/icheck/flat/blue.css" rel="stylesheet" />
        <link href="css/floatexamples.css" rel="stylesheet" type="text/css" />


        <script src="js/jquery.min.js"></script>

    </head>
    <% }%>