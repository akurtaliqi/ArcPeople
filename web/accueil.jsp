<%@page import="Model.Commentaire"%>
<%@page import="java.util.Vector"%>
<%@page import="Model.Users"%>
<%@page import="DAO.UsersDAO"%>
<%@page import="DAO.CommentaireDAO"%>
<%@page import="Model.Personne"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<jsp:include page="bootstrap/template/headerApp.jsp">
    <jsp:param name="typePage" value="standard" />
</jsp:include>

<jsp:include page="bootstrap/template/Menu.jsp">
    <jsp:param name="url" value="<%=request.getServletPath()%>" />
</jsp:include>

<link href="bootstrap/css/chat.css" rel="stylesheet" />
<script src='nprogress.js'></script>
<link rel='stylesheet' href='nprogress.css'/>
<script src="/js/jquery-2.1.1.min.js"></script>
<script src="/js/nprogress.js"></script>
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
                        <span class="glyphicon glyphicon-comment"></span> Remarques
                        <div class="btn-group pull-right">
                            <a type="button" class="btn btn-default btn-xs" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                <span class="glyphicon glyphicon-chevron-down"></span>
                            </a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <ul class="chat">
                            <%
                                CommentaireDAO cdao = new CommentaireDAO();
                                UsersDAO udao = new UsersDAO();
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
                                                Long usernumber;
                                                String username;
                                                
                                                usernumber = vcomm.get(i).getUsers_numero();
                                
                                                
                                                u = udao.selectById(usernumber);

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
                            %>
                        </ul>
                    </div>


                    <div class="panel-footer">
                        <div class="input-group">
                            <form action="ServletAddCommentaire">
                                <input name ="commentaire" id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />

                                <span class="input-group-btn">

                                    <button class="btn btn-warning btn-sm" id="btn-chat">
                                        Send</button>
                                </span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#b-100").click(function () {
            NProgress.done();
        });
    </script>
</body>
</html>
