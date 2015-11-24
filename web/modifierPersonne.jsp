<%-- 
    Document   : modifierPersonne
    Created on : 24 nov. 2015, 09:27:20
    Author     : ajtene.kurtaliq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    </head>
    <body>
        <%
            out.print(request.getParameter("id"));
        %>

        
        <form action="ServletFaireMAJPersonne" name="modifierPersonne" role="form" class="form-horizontal" method="get" accept-charset="utf-8" 
                style="background-color:white; padding-top:20px;padding-right:20px;padding-left:20px;">
            <fieldset>

                <!-- Form Name -->
                <legend>Modifier une personne</legend>
                
                 <div class="form-group">
                    <label class="col-md-4 control-label" for="nom" style="color:black; display:none;">Id</label>  
                    <div class="col-md-4">
                        <input id="nom" name="id" type="text" class="form-control input-md" value="<%= request.getParameter("id")%>" style="display:none">

                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="nom" style="color:black;">Nom</label>  
                    <div class="col-md-4">
                        <input id="nom" name="nom" type="text" class="form-control input-md" value="<%= request.getParameter("nom")%>">

                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-4 control-label" for="prenom" style="color:black;">Prénom</label>  
                    <div class="col-md-4">
                        <input id="prenom" name="prenom" type="text" class="form-control input-md" value="<%= request.getParameter("prenom")%>">

                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-4 control-label" for="adresse" style="color:black;">Adresse</label>  
                    <div class="col-md-4">
                        <input id="adresse" name="adresse" type="text" class="form-control input-md" value="<%= request.getParameter("adresse")%>">

                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-4 control-label" for="Ville" style="color:black;">Ville</label>  
                    <div class="col-md-4">
                        <input id="Ville" name="ville" type="text" class="form-control input-md" value="<%= request.getParameter("ville")%>">

                    </div>
                </div>

                <!-- Button -->

                <div class="form-group">
                    <div class="col-md-offset-0 col-md-12"><input  class="btn btn-default btn btn-default" type="submit" value="Enregistrer" style="alignment-baseline:right"/></div>
                </div>

            </fieldset>
        </form>

    </body>
</html>
