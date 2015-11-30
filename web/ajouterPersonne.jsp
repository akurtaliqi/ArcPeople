<%-- 
    Document   : ajouterPersonne
    Created on : 24 nov. 2015, 16:13:11
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
        <title>Ajouter des personnes</title>
        <script src='nprogress.js'></script>
        <link rel='stylesheet' href='bootstrap/css/nprogress.css'/>
        <script src="/js/jquery-2.1.1.min.js"></script>
        <script src="bootstrap/js/nprogress.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/app.css" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" />
        <!--mise en forme ajtene-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/app.css" />
    </head>
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
    </script>

    <script type="text/javascript">

        $(document).ready(function () {

            window.setTimeout(function () {
                $(".alert").fadeTo(500, 0).slideUp(500, function () {
                    $(this).remove();
                });
            }, 5000);

        });
    </script>



    <body>
        <!-- page content -->
        <div role="main"  style=" margin-left: 20%;">

            <div class="row">

                <!-- debut du widget des personnes les plus actives en ajout -->
                <div class="col-md-8" style="background-color: white; 
                     border-color: #e5e5e5; border-style: solid; 
                     border-width: 1px; margin-left: 10px">
                    <div class="x_title" length="300">
                        <h4 style="text-align: left;">Ajouter une personne</h4>
                    </div>

                    <%
                        if (session.getAttribute("persAjoutee") != null) {
                    %>

                    <div  class="alert alert-success" role="alert" style="margin-left: 20px; margin-right: 20px; " >
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        <span class="sr-only">Error:</span>
                        La personne a été ajoutée avec succès !
                    </div>
                    <% } else if (session.getAttribute("persNonAjoutee") != null) {%>
                    <div class="alert alert-danger" role="alert" style="margin-left: 0px; margin-right: 0px;" >
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        <span class="sr-only">Error:</span>
                        Cette personne est déjà présente dans la liste des personnes !
                    </div>

                    <%}
                        session.setAttribute("persAjoutee", null);
                        session.setAttribute("persNonAjoutee", null);
                    %>

                    <form action="ServletCreationPersonne" name="ajouterPersonne" role="form" class="form-horizontal" method="get" accept-charset="utf-8">
                        <fieldset>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="nom">Nom</label>  
                                <div class="col-md-6">
                                    <input id="nom" name="nom" type="text" placeholder="Ex : Smith, Obama, etc." class="form-control input-md" required="">

                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="prenom">Prénom</label>  
                                <div class="col-md-6">
                                    <input id="prenom" name="prenom" type="text" placeholder="Ex : Marie, John, etc." class="form-control input-md" required="">

                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="adresse">Adresse</label>  
                                <div class="col-md-6">
                                    <input id="adresse" name="adresse" type="text" placeholder="Ex : Rue de la Promenade 4" class="form-control input-md" required="">

                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="ville">Ville</label>  
                                <div class="col-md-6">
                                    <input id="ville" name="ville" type="text" placeholder="Ex : 7500 Paris" class="form-control input-md" required="">

                                </div>
                            </div>

                            </br>
                            <div class="form-group" style="">
                                <div class="col-md-offset-0 col-md-10">
                                    <input  class="btn btn-primary" type="submit" value="Valider" style="float:right;"/></div>
                            </div>

                        </fieldset>
                    </form>
                    <br/>

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
