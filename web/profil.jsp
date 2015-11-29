<%-- 
    Document   : profil
    Created on : 17 nov. 2015, 10:14:15
    Author     : yasmine.mabrouk
--%>

<%@page import="Model.Niveau"%>
<%@page import="DAO.NiveauDAO"%>
<%@page import="DAO.AjoutDAO"%>
<%@page import="servlets.HtmlHttpUtils"%>
<%@page import="java.awt.Image"%>
<%@page import="Model.Users"%>
<%@page import="DAO.UsersDAO"%>
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
<%
    HttpSession s = request.getSession(true);
    String username = (String) s.getAttribute("username");

    UsersDAO userDao = new UsersDAO();
    Users user = userDao.select(username);

    String name = user.getUsername();
    String mail = user.getEmail();
    String niveau;

    NiveauDAO nivDao = new NiveauDAO();

    niveau = nivDao.getNiveauById(user.getId()).getLibelle();
    String src = "bootstrap\\img\\" + niveau + ".png";
    AjoutDAO ajoutDao = new AjoutDAO();
    int nbPoint = ajoutDao.countAjout(user.getId());

    s.setAttribute("nbPoints", nbPoint);
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/app.css" />

        <script type="text/javascript">

            $(document).ready(function () {

                window.setTimeout(function () {
                    $(".alert").fadeTo(500, 0).slideUp(500, function () {
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
                <div class="col-md-8 col-sm-12 col-xs-12" style="background-color: white; 
                     border-color: #e5e5e5; border-style: solid; 
                     border-width: 1px; margin-left: 10px">
                    <div class="x_title" length="300">
                        <h4 style="text-align: left;">Voir mon profil</h4>
                    </div>

                    <form method="post" action="modifierPwd.jsp" name="profil" role="form" class="form-horizontal" accept-charset="utf-8" >
                        <%
                            if (session.getAttribute("pwdModifier") != null) {
                        %>

                        <div  class="alert alert-success" role="alert" style="margin-left: 20px; margin-right: 20px; " >
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            Votre mot de passe a été modifié avec succès  !
                        </div>
                        <% }
                            session.setAttribute("pwdModifier", null);
                        %>
                        <div>
                            <table style="border-color:white; font-size: 16px; line-height: 45px; ">
                                <tr>
                                    <td>
                                        <img  class= "Imagee" src="<%=src%>" alt= "ImageProfil" class= "img-thumbnail" width="100px" height="100px" style="float:left; margin-bottom: 35px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nom d'utilisateur :</td>
                                    <td><%=name%></td> 
                                </tr>
                                <tr>
                                    <td>Adresse e-mail :</td>
                                    <td><%=mail%></td> 
                                </tr>
                                <tr>
                                    <td>Mot de passe :</td>
                                    <td>********</td> 
                                    <td>
                                        <input type="submit" value="Modifier le mot de passe" class="btn btn-primary btn-group"></input>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nombre de points :</td>
                                    <td><%=nbPoint%></td> 
                                </tr>
                                <tr>
                                    <td>Niveau :</td>
                                    <td><%=niveau%></td> 
                                </tr>
                            </table> 
                        </div>
                    </form>
                    <br/>

                </div>
            </div>
        </div>
    </div>
</body>

</html>
