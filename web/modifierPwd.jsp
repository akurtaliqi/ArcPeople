<%-- 
    Document   : modefierPwd
    Created on : 20 nov. 2015, 13:23:13
    Author     : yasmine.mabrouk
--%>

<%@page import="Model.Users"%>
<%@page import="DAO.UsersDAO"%>
<%@page import="servlets.HtmlHttpUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    /* Vérification que l'utilisateur est passé par le login et n'accède pas
     * directement à la page "index.jsp" dans URL. En cas de fraude,
     * retour au login et on invalide la session en cours avec la servlet logout.
     */
    if (!HtmlHttpUtils.isAuthenticate(request)) {
        response.sendRedirect("ServletLogout");
    }
%>
<jsp:include page="bootstrap/template/headerApp.jsp">
    <jsp:param name="typePage" value="standard" />
</jsp:include>

<jsp:include page="bootstrap/template/Menu.jsp">
    <jsp:param name="url" value="<%=request.getServletPath()%>" />
</jsp:include>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/profil.css" />
        <title>JSP Page</title>
        <!-- Bootstrap core CSS -->

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">

        <!-- Custom styling plus plugins -->
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/chattemp.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/maps/jquery-jvectormap-2.0.1.css" />
        <link href="css/icheck/flat/blue.css" rel="stylesheet" />
        <link href="css/floatexamples.css" rel="stylesheet" type="text/css" />


        <script src="js/jquery.min.js"></script>
        <script src='nprogress.js'></script>
        <link rel='stylesheet' href='bootstrap/css/nprogress.css'/>
        <script src="/js/jquery-2.1.1.min.js"></script>
        <script src="bootstrap/js/nprogress.js"></script>
        <!--mise en forme ajtene-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/app.css" />

        <!--mise en forme ajtene-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/app.css" />
        <script type="text/javascript">

            $(document).ready(function () {

                window.setTimeout(function () {
                    $(".alert").fadeTo(1000, 0).slideUp(1000, function () {
                        $(this).remove();
                    });
                }, 5000);

            });
        </script>
    </head>
    <body>
        <!-- page content -->
        <div role="main"  style=" margin-left: 20%;">

            <div class="row">

                <!-- debut du widget des personnes les plus actives en ajout -->
                <div class="col-md-8" style="background-color: white; 
                     border-color: #e5e5e5; border-style: solid; 
                     border-width: 1px; margin-left: 10px">
                    <div class="x_title" length="300">
                        <h4 style="text-align: left;">Modifier mon mot de passe</h4>
                    </div>
                    <form method="post" action="ServletEditerProfil" name="modifierPwd" role="form" class="form-horizontal" accept-charset="utf-8"  >
                        <div class="form-group">
                            <label class="col-md-4 control-label" >Mot de passe actuel</label>
                            <div class="col-md-6">
                                <input id="Ancien mots passe" name="Ancien_mots_passe" type="password" placeholder="Mot de passe actuel" class="form-control input-md" required="required">

                            </div>
                        </div>

                        <%
                            if (session.getAttribute("editeProfilError1") != null) {
                        %>

                        <div class="alert alert-danger" role="alert" style="margin-left: 0px; margin-right: 0px;" >
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            Le mot de passe est incorrecte. Réessayez.
                        </div>
                        <% }
                            session.setAttribute("editeProfilError1", null);
                        %>
                        <!-- Password input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" >Nouveau mot de passe</label>
                            <div class="col-md-6">
                                <input id="passwordinput" name="pwd" type="password" placeholder="Nouveau mot de passe" class="form-control input-md" required="required">

                            </div>
                        </div>

                        <!-- Password input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" >Confirmer mot de passe </label>
                            <div class="col-md-6">
                                <input id="passwordinput" name="pwd2" type="password" placeholder="Confirmer le nouveau mot de passe" class="form-control input-md" required="required">

                            </div>
                        </div>
                        <%
                            if (session.getAttribute("editeProfilError2") != null) {
                        %>

                        <div class="alert alert-danger" role="alert" style="margin-left: 0px; margin-right: 0px;" >
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            Les mots de passe ne sont pas identiques. Réessayez.
                        </div>
                        <% }
                            session.setAttribute("editeProfilError2", null);
                        %>
                        <!-- Button -->
                        <br/>
                        <br/>
                        <div class="form-group">

                            <div class="col-md-10">
                                <a href="profil.jsp" > <input type="button" class="btn btn-default" value="Annuler" style="float:left;margin-left: 30px;"/></a>
                                <input  class="btn btn-primary" type="submit" value="Modifier" style="float:right; margin-right: 0px;"/></div>
                        </div>

                        </fieldset>
                </div>
                </form>
                <br/>
                <br/>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
