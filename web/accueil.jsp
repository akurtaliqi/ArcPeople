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
    <h1>hello world!</h1>

</body>
</html>
<script>
    $("#b-100").click(function () {
        NProgress.done();
    });
</script>
