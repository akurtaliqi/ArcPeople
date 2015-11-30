<%-- 
    Document   : index
    Created on : 4 janv. 2010, 11:23:22
    Author     : termine
--%>

<%@page import="Model.Ajout"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.AjoutDAO"%>
<%@page import="DAO.DBDataSource"%>
<%@page import="DAO.UsersDAO"%>
<%@page import="Model.Users"%>
<%@page import="Model.Commentaire"%>
<%@page import="java.util.Vector"%>
<%@page import="services.Services"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<jsp:include page="bootstrap/template/headerApp.jsp">
    <jsp:param name="typePage" value="standard" />
</jsp:include>


<jsp:include page="bootstrap/template/Menu.jsp">
    <jsp:param name="url" value="<%=request.getServletPath()%>" />
</jsp:include>

<%

    Connection con = DBDataSource.getJDBCConnection();

    AjoutDAO adao = new AjoutDAO();
    UsersDAO udao = new UsersDAO();
    ArrayList<Ajout> addings = adao.top5Additions();
    ArrayList<Users> users = udao.selectAll();

    String niveau;
    Long pk;
    int points;

%>


<link href="css/chattemp.css" rel="stylesheet" />

<html>
    <body>

        <div class="row">

            <div class



                 <!-- debut du widget des personnes les plus actives en ajout -->
                 <div class="col-md-4 col-sm-12 col-xs-12" style="background-color: white; 
                 border-color: #e5e5e5; border-style: solid; 
                 border-width: 1px; margin-left: 12px">
                    <div>
                        <div class="x_title" length="300">
                            <h4><img src="images/win.PNG" height="30px" width="30px"> Top 5 des consultants</h4>

                            <%  out.println("" + ""); %>

                            <div class="clearfix"></div>
                        </div>

                        <ul class="list-unstyled top_profiles scroll-view">
                            <!-- Affiche le top 5 des utilisateurs -->    
                            <%
                                Users user = new Users();
                                for (int i = 0; i < 5; i++) {
                                    pk = addings.get(i).getAjout_users();
                                    points = addings.get(i).getNbTotalGroupes();
                                    niveau = user.getNiveau();
                                    int j = 0;
                                    while (j <= users.size()) {
                                        if (pk == users.get(j).getId()) {
                                            user = users.get(j);
                                            j = users.size() + 1;
                                        }
                                        j++;
                                    }
                                    out.println(user.getUsername() + points);%>
                            <li class="media event">
                                <a class="pull-left border-aero profile_thumb">
                                    <i>
                                        <img src="bootstrap/img/<%=niveau%>.png" 
                                             height="50px" width="50px" 
                                             style="border-radius: 50%; margin-left: -13px; margin-top: -10px;">
                                    </i>
                                </a>
                                <div class="media-body">
                                    <a class="title" href="#">
                                        <%
                                            out.println(user.getUsername().toUpperCase());
                                        %>
                                    </a> 
                                    <p> 
                                        <small><b>
                                                <% out.println(addings.get(i).getNbTotalGroupes());%> Points
                                            </b></small> <br />
                                        <small>
                                            <%
                                            out.println(niveau); %> 
                                        </small>
                                    </p>
                                </div>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
                <!-- fin du widget -->





            </div>
    </body>
</html>
