<%@page import="servlets.HtmlHttpUtils"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Commentaire"%>
<%@page import="java.util.Vector"%>
<%@page import="Model.Users"%>
<%@page import="DAO.UsersDAO"%>
<%@page import="DAO.CommentaireDAO"%>
<%@page import="Model.Personne"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


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

<link href="bootstrap/css/chat.css" rel="stylesheet" />
<script src='nprogress.js'></script>
<link rel='stylesheet' href='bootstrap/css/nprogress.css'/>
<script src="/js/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/nprogress.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
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
<body style="background-color:white">
    <div class="container" style="float:left">
        <div class="row">
            <div class="col-md-5">
                <div class="panel panel-primary">
                    <div class="panel-heading" id="accordion">
                        <span class="glyphicon glyphicon-comment"></span> Commentaires
                        <!--div class="btn-group pull-right">
                            <a type="button" class="btn btn-default btn-xs" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                <span class="glyphicon glyphicon-chevron-down"></span>
                            </a>
                        </div-->
                    </div>
                    <div class="panel-body">
                        <ul class="chat">
                            <%
                                CommentaireDAO cdao = new CommentaireDAO();
                                UsersDAO udao = new UsersDAO();

                                Connection con = udao.newConnection();

                                Users u = new Users();
                                Vector<Commentaire> vcomm = new Vector();
                                vcomm = cdao.selectAll();

                                for (int i = 0; i < vcomm.size(); i++) {
                            %>
                            <li class="left clearfix"><span class="chat-img pull-left">
                                    <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                                </span>
                                <div class="chat-body clearfix">
                                    <div class="header">
                                        <strong class="primary-font" style="color:black">
                                            <%
                                                u = udao.selectById(con, vcomm.get(i).getUsers_numero());
                                                out.println(u.getUsername().toUpperCase());
                                            %>
                                        </strong> <small class="pull-right text-muted">

                                            <span class="glyphicon glyphicon-time"></span>12 mins ago</small>
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
                                udao.closeConnection(con);
                            %>
                        </ul>
                    </div>


                    <div class="panel-footer">
                        <div class="input-group">
                            <form action="ServletAddCommentaire">
                                <input name ="commentaire" id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />

                                <span class="input-group-btn">

                                    <button class="btn btn-warning btn-sm" id="btn-chat">Send</button>
                                </span>
                            </form>
                        </div>
                    </div>
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