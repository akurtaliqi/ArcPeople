<%-- 
    Document   : index
    Created on : 4 janv. 2010, 11:23:22
    Author     : termine
--%>

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

<link href="css/chattemp.css" rel="stylesheet" />

<html>
    <body>

        <!--<div class="container">-->
        <!--<div class="row">-->
        <div class="col-md-5" style="background-color: white; border-color: #e5e5e5; border-style: solid; 
             border-width: 1px; margin-left: 10px">
            <!-- <div class="panel panel-primary"> -->
            <div class="panel-heading">
                <span class="glyphicon glyphicon-comment"></span> Chat
                <div class="btn-group pull-right">
                    <!--<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </button>-->

                </div>
            </div>
            <div class="panel-body">
                <ul class="chat">
                    <%
                        UsersDAO udao = new UsersDAO();

                        HttpSession s = request.getSession();

                        Connection con = (Connection) s.getAttribute("conn");

                        Services comms = new Services();

                        Vector<Commentaire> vcomm = comms.selectComments(con);

                        for (int i = 0; i < vcomm.size(); i++) {

                    %>
                    <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                        </span>
                        <div class="chat-body clearfix">
                            <div class="header">
                                <strong class="primary-font">
                                    <%                                        Users u = udao.selectById(vcomm.get(i).getUsers_numero());
                                        out.println(u.getUsername().toUpperCase());
                                    %>
                                </strong> 
                                <small class="pull-right text-muted">
                                    <span class="glyphicon glyphicon-time"></span>12 mins ago
                                </small>
                            </div>
                            <p>
                                <%
                                    out.println(vcomm.get(i).getCommentaire());
                                %>
                            </p>
                        </div>
                    </li>
                    <%
                        }
                        
                    %>
                </ul>
            </div>
            <div class="panel-footer">
                <div class="input-group">
                    <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
                    <span class="input-group-btn">
                        <button class="btn btn-warning btn-sm" id="btn-chat">
                            Send</button>
                    </span>
                </div>
            </div>
            <!--</div>-->
        </div>
        <!--</div>-->
        <!--</div>-->

    </body>
</html>
