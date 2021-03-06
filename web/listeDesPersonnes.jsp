<%-- 
    Document   : listeDesPersonnes
    Created on : Nov 12, 2015, 5:39:35 PM
    Author     : ajtene.kurtaliq
--%>

<%@page import="DAO.PersonneDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Personne"%>
<%@page import="java.util.Vector"%>
<%@page import="servlets.HtmlHttpUtils"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>

<%
    /* Vérification que l'utilisateur est passé par le login et n'accède pas
     * directement à la page "index.jsp" par l'URL.
     */
    if (!HtmlHttpUtils.isAuthenticate(request)) {
        response.sendRedirect("ServletLogout");
    }
%>

<%! HttpSession session;
    private ArrayList<Personne> listePers;
%>
<%  session = request.getSession(true);
    listePers = new ArrayList<Personne>();

    // Initialiser la liste de client ou la récupérer de la session
    if (session.getAttribute("personnes") == null) {
        listePers.addAll(PersonneDAO.findAll());
    } else {
        listePers.addAll((ArrayList) session.getAttribute("personnes"));

    }

%> 

<jsp:include page="bootstrap/template/Menu.jsp">
    <jsp:param name="url" value="<%=request.getServletPath()%>" />
</jsp:include>

<html>
    <head>
        <!--mise en forme ajtene-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>

        <!--dropdown menu-->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"/>

        <title>Liste des personnes</title>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/app.css" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
        <!-- DATATABLE-->
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.6/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.6/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/plug-ins/1.10.10/i18n/French.json"></script>
        <!-- DATATABLE-->

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
        <script>
            jQuery(document).ready(function () {
                $('#lstPersonnes').DataTable({
                    "pageLength": 10,
                    "language": {
                        "sProcessing": "Traitement en cours...",
                        "sSearch": "Rechercher&nbsp;:",
                        "sLengthMenu": "Afficher _MENU_ &eacute;l&eacute;ments",
                        "sInfo": "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                        "sInfoEmpty": "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
                        "sInfoFiltered": "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                        "sInfoPostFix": "",
                        "sLoadingRecords": "Chargement en cours...",
                        "sZeroRecords": "Aucun &eacute;l&eacute;ment &agrave; afficher",
                        "sEmptyTable": "Aucune donnée disponible dans le tableau",
                        "oPaginate": {
                            "sFirst": "Premier",
                            "sPrevious": "Pr&eacute;c&eacute;dent",
                            "sNext": "Suivant",
                            "sLast": "Dernier"
                        },
                        "oAria": {
                            "sSortAscending": ": activer pour trier la colonne par ordre croissant",
                            "sSortDescending": ": activer pour trier la colonne par ordre décroissant"
                        }
                    }

                });
            });


        </script>
    </head>

    <body>
        <br/>
        <br/>
        <div id="wrap">
            <div class="container">
                <table id="lstPersonnes" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Adresse</th>
                            <th>Ville</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Personne pers : listePers) { %> 

                        <tr class="lignePersonne" id="<% out.print(pers.getId());%>">
                            <td>  <%= pers.getNom()%> </td>
                            <td>  <%= pers.getPrenom()%> </td>  
                            <td>  <% out.print(pers.getAdresse()); %> </td>
                            <td>  <% out.print(pers.getVille());%> </td>
                            <td class=" dt-body-center"><a class="btn btn-default btn-sm glyphicon glyphicon-pencil" title="Modifier" href="modifierPersonne.jsp?id=<%= pers.getId()%>&nom=<%= pers.getNom()%>&prenom=<%= pers.getPrenom()%>&adresse=<%= pers.getAdresse()%>&ville=<%= pers.getVille()%>"></a>
                                <a class="btn btn-default btn-sm glyphicon glyphicon-remove" data-toggle="modal" data-taget="myModal" title="Supprimer" href="ServletFaireEffacementPersonne?id=<%= pers.getId()%>" onclick="return(confirm('Etes-vous sûr de vouloir supprimer cette personne ?'))"></a>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>


    </body>
</html>
<script>
    $("#b-100").click(function () {
        NProgress.done();
    });
</script>