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
        <link rel="stylesheet" type="text/css" href="bootstrap/css/profil.css" />
        <title>JSP Page</title>
        <script src='nprogress.js'></script>
        <link rel='stylesheet' href='bootstrap/css/nprogress.css'/>
        <script src="/js/jquery-2.1.1.min.js"></script>
        <script src="bootstrap/js/nprogress.js"></script>

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
    <center>

        <form method="post" action="modifierPwd.jsp" name="profil" role="form" class="form-horizontal" accept-charset="utf-8" 
              style="background-color:white; padding-top:20px;padding-right:20px;padding-left:20px;padding-bottom:20px; width:35%;">
            <fieldset>
                <legend style="text-align: left;">Voir mon profil</legend>
                <%
                    if (session.getAttribute("pwdModifier") != null) {
                %>

                <div  class="alert alert-success" role="alert" style="margin-left: 0px; margin-right: 20px; " >
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span class="sr-only">Error:</span>
                    Votre mot de passe a été modifié avec succès  !
                </div>
                <% }
                    session.setAttribute("pwdModifier", null);
                %>
                <div style="padding-left: 100px;">
                    <br/>

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
                            <td>Niveau</td>
                            <td><%=niveau%></td> 
                        </tr>
                    </table> 
                </div>
        </form>
    </center>
</body>

</html>
