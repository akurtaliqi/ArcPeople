<%-- 
    Document   : profil
    Created on : 17 nov. 2015, 10:14:15
    Author     : yasmine.mabrouk
--%>

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
    username = username;
    String src = "bootstrap\\img\\" + username + ".png";
%>

<%
    UsersDAO userDao = new UsersDAO();
    Users user = userDao.select(username);
    //test user1
    // car userDao.select(username) retourne tjrs  null 
    String name = user.getUsername();
    String mail = user.getEmail();

    AjoutDAO ajoutDao = new AjoutDAO();
    int nbPoint = ajoutDao.countAjout(user.getId());
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
        <script src='nprogress.js'></script>
        <link rel='stylesheet' href='bootstrap/css/nprogress.css'/>
        <script src="/js/jquery-2.1.1.min.js"></script>
        <script src="bootstrap/js/nprogress.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    </head>

    <body>
        <center>

            <form action="ModifierPwd" name="ajouterPersonne" role="form" class="form-horizontal" method="get" accept-charset="utf-8" 
                  style="background-color:white; padding-top:20px;padding-right:20px;padding-left:20px;padding-bottom:20px; width:700px;">
                <fieldset>
                    <legend style="text-align: left;">Voir mon profil</legend>
                    <%
                        if (session.getAttribute("pwdModifier") != null) {
                    %>

                    <div  class="alert alert-success" role="alert" style="margin-left: 500px; margin-right: 20px; " >
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        <span class="sr-only">Error:</span>
                        Votre mot de passe a été modifié avec succès
                    </div>
                    <% }
                        session.setAttribute("pwdModifier", null);
                    %>
                    <div style="padding-left: 150px;">
                        <img  class= "Imagee" src="<%=src%>" alt= "ImageProfil" class= "img-thumbnail" width="100px" height="100px" style="float:left;" />
                        
                     

                        <table style="width:90%; border-color:white;float: left; ">
                            <tr>
                                <td>Nom d'utilisateur</td>
                                <td><%=name%></td> 
                                <td></td>
                            </tr>
                            <tr>
                                <td>Adresse E-mail</td>
                                <td><%=mail%></td> 
                                <td></td>
                            </tr>
                            <tr>
                                <td>Mot de passe</td>
                                <td>********</td> 
                                <td><div class="col-md-4">
                                        <input type="submit" value="Modifier MDP" class="btn btn-primary btn-xs" style="float:left;"></input>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Nombre de point</td>
                                <td><%=nbPoint%></td> 
                                <td></td>
                            </tr>
                        </table> 
                    </div>
                    </div> 
            </form>
        </center>
    </body>

</html>
