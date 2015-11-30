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
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    </head>
    <script type="text/javascript">

        $(document).ready(function () {

            window.setTimeout(function () {
                $(".alert").fadeTo(1000, 0).slideUp(1000, function () {
                    $(this).remove();
                });
            }, 5000);

        });
    </script>
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

        <div class="container" style="margin-top:10%;">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading" >
                            <h3 class="panel-title">Connexion</h3>
                        </div>
                        <div class="panel-body">

                            <%
                                String loginError = (String) session.getAttribute("loginError");
                                if (loginError != null) {
                            %>
                            <div class="alert alert-danger" role="alert" style="margin-left: 20px; margin-right: 20px;" >
                                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                <span class="sr-only">Error:</span>
                                Mot de passe ou nom d'utilisateur incorrect. Réessayez.
                            </div>
                            <%
                                    //effacer le message de session
                                    session.setAttribute("loginError", null);
                                }
                            %>
                            <form action="ServletLogin" name="login" role="form" class="form-horizontal" method="post" accept-charset="utf-8">
                                <div class="form-group">
                                    <label>Nom d'utilisateur</label>
                                    <input name="username" placeholder="Nom d'utilisateur" class="form-control" type="text" id="UserUsername" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Mot de passe</label>
                                    <input name="password" placeholder="Mot de passe" class="form-control" type="password" id="UserPassword" required="required"/>
                                </div>
                                </br>
                                <center><input  class="btn btn-primary btn-lg"  type="submit" value="Connexion"/></center>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>                
    </body>
</html>
<script>
    $("#b-100").click(function () {
        NProgress.done();
    });
</script>