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

<link href="css/temporairedyhia.css" rel="stylesheet" />
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


    <div class="detailBox">
        <div class="titleBox">
            <label>Comment Box</label>
            <button type="button" class="close" aria-hidden="true">&times;</button>
        </div>
        <div class="actionBox" style="background-color: white">
            <ul class="commentList">
                <li>
                    <div class="commenterImage">
                        <img src="http://lorempixel.com/50/50/people/6" />
                    </div>
                    <div class="commentText">
                        <p><b>TERMINE</b></p>
                        <p class="">Hello this is a test comment.</p> 
                        <!-- <span class="date sub-text">on March 5th, 2014</span>-->

                    </div>
                </li>
                <br />
                
                
            </ul>
            <div class="panel-footer" style="background-color: white">
                <div class="input-group" style="background-color: white">

                    <input name ="commentaire" id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />

                    <span class="input-group-btn">

                        <button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
                    </span>

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