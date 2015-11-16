<%-- 
    Document   : login
    Created on : 6 janv. 2010, 14:19:14
    Author     : termine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html lang="fr">
    <head>

        <meta charset="utf-8">
        <title>Arc'People - Connexion</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Connexion à mon application">
        <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
        <!-- ci-dessous notre fichier CSS -->
        <link rel="stylesheet" type="text/css" href="bootstrap/css/app.css" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:400,700,300" />
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src='nprogress.js'></script>
        <link rel='stylesheet' href='bootstrap/css/nprogress.css'/>
        <script src="/js/jquery-2.1.1.min.js"></script>
        <script src="bootstrap/js/nprogress.js"></script>
    </head>
    <body>
        <script>
            $('body').show();
            $('.version').text(NProgress.version);
            NProgress.start();
            setTimeout(function () {
                NProgress.done();
                $('.fade').removeClass('out');
            }, 1000);
            $("#b-0").click(function () {
                NProgress.start();
            });
            $("#b-40").click(function () {
                NProgress.set(0.4);
            });
            $("#b-inc").click(function () {
                NProgress.inc();
            });
            $("#b-100").click(function () {
                NProgress.done();
            });
        </script>
        <table id="page-table"><tr><td id="page-td">
                    <div id="global">

                        <div class="container" >
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-form">

                                        <div class="main">


                                            <h1></h1><br /><br /><br />
                                            <h1>Connexion</h1>
                                            <h2>Gest'People : Enjoy your work </h2>

                                            <form action="ServletLogin" name="login" role="form" class="form-horizontal" method="post" accept-charset="utf-8">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <%--
                                                       <span class="input-group-addon">
                                                           <img src="bootstrap/img/iconPassword.png" width="30px">
                                                       </span>
                                                        --%>
                                                        <input name="username" placeholder="Idenfiant" class="form-control" type="text" id="UserUsername" required="required"/>
                                                    </div>
                                                </div> 

                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <%--
                                                        <span class="input-group-addon">
                                                            <img src="bootstrap/img/iconPassword.png" width="30px">
                                                        </span>
                                                        --%>
                                                        <input name="password" placeholder="Mot de passe" class="form-control" type="password" id="UserPassword" required="required"/>
                                                    </div>
                                                </div> 


                                                <%
                                                    String loginError = (String) session.getAttribute("loginError");
                                                    if (loginError != null) {
                                                %>
                                                <label class="label-fontcolor-red">Nom d'utilisateur ou mot de passe incorrect !</label>
                                                <%
                                                        //effacer le message de session
                                                        session.setAttribute("loginError", null);
                                                    }
                                                %>

                                                <div class="form-group">
                                                    <div class="col-md-offset-0 col-md-12"><input  class="btn btn-default btn btn-default" type="submit" value="Connexion"/></div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </body>
    <script>
        $("#b-100").click(function () {
            NProgress.done();
        });
    </script>
</html>