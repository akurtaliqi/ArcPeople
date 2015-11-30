<%-- 
    Document   : aideFAQ
    Created on : 29 nov. 2015, 18:13:25
    Author     : ajtene.kurtaliq
--%>

<%@page import="servlets.HtmlHttpUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    /* Vérification que l'utilisateur est passé par le login et n'accède pas
     * directement à la page "index.jsp" par l'URL.
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
    </head>
    <body>
        <div role="main"  style=" margin-left: 20%;">

            <div class="row">


                <div class="col-md-8" style="background-color: white;
                     border-color: #e5e5e5; border-style: solid;
                     border-width: 1px; margin-left: 10px">
                    <div class="x_title" length="300">
                        <h4 style="text-align: left;">FAQ</h4>
                    </div>

                    <!--<form method="post" action="modifierPwd.jsp" name="profil" role="form" class="form-horizontal" accept-charset="utf-8" >-->

                    <div>
                        <table style="line-height: 45px; color:black;font-family:Helvetica; margin-left:30px;">
                            <tr>
                                <td style="font-weight: bold;">Qu’est-ce qu’un point ?<td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;">Un point est une valeur que vous récoltez lorsque vous ajoutez un nouvel utilisateur. Une fois un certain nombre de points récoltés au cours du mois, vous gagnerez une récompense.</td>
                            </tr>
                            </tr>
                            
                             <tr>
                                <td style="font-weight: bold;">Comment gagner des points ?</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;">Il suffit d’ajouter un utilisateur. Chaque utilisateur ajouté vous rapportera 1 point.</td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Modifier ou supprimer un utilisateur m’apporte-t-il des points ?</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;">Seul l’ajout d’un utilisateur apportera des points.</td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Combien de points dois-je atteindre pour obtenir une récompense ?</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;">Tous les 10 points, vous recevrez une récompense par mail.</td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Pourquoi ai-je perdu des points ?</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;">Chaque mois, le nombre de points que vous possédez se réinitialise.</td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Qu’est-ce qu’un niveau ?</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;">Un niveau atteste du fait que vous avez ajouté un certain nombre d’utilisateurs tout au long de l'utilisation de l'application.</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;">Vous débloquerez vos niveaux dans l’ordre suivant :</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;"><img src="bootstrap\\img\\Starter.png" alt="Starter Icon" style="width:100px;height:100px; margin-right: 15px;"/> Starter : Niveau débutant, vous possédez de 0 à 9 points.</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;"><img src="bootstrap\\img\\Trooper.png" alt="Starter Icon" style="width:100px;height:100px; margin-right: 15px;"/> Trooper : Niveau intermédiaire, vous possédez de 10 à 29 points.</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;"><img src="bootstrap\\img\\Sith.png" alt="Starter Icon" style="width:100px;height:100px; margin-right: 15px;"/> Sith : Niveau intermédiaire avancé, vous possédez de 30 à 99 points.</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;"><img src="bootstrap\\img\\Darth Vader.png" alt="Starter Icon" style="width:100px;height:100px; margin-right: 15px;"/> Darth Vader : Niveau avancé, vous possédez de 100 à 149 points.</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;"><img src="bootstrap\\img\\Darth Sidious.png" alt="Starter Icon" style="width:100px;height:100px; margin-right: 15px;"/> Niveau expert: Le rang suprême !  Vous possédez plus de 150 points.</td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">Mon niveau se réinitialise-t-il en même temps que mes points ?</td>
                            </tr>
                            <tr>
                                <td style="padding-left: 60px;">Mon niveau se réinitialise-t-il en même temps que mes points ?</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </br>
</body>
</html>
