<%@page import="Model.Graphe"%>
<%@page import="DAO.GraphesDAO"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="Model.Niveau"%>
<%@page import="Model.Ajout"%>
<%@page import="DAO.AjoutDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DBDataSource"%>
<%@page import="servlets.HtmlHttpUtils"%>
<%@page import="Model.Users"%>
<%@page import="Model.Commentaire"%>
<%@page import="java.util.Vector"%>
<%@page import="services.Services"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

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


<%
    /* Vérification que l'utilisateur est passé par le login et n'accède pas
     * directement à la page "index.jsp" par l'URL.
     */
    if (!HtmlHttpUtils.isAuthenticate(request)) {
        response.sendRedirect("ServletLogout");
    }

    Connection con = DBDataSource.getJDBCConnection();

    AjoutDAO adao = new AjoutDAO();
    UsersDAO udao = new UsersDAO();
    ArrayList<Ajout> addings = adao.top5Additions(con);
    ArrayList<Users> users = udao.selectAll(con);

    GregorianCalendar gcal = new GregorianCalendar();
    int daysInMonth = gcal.getActualMaximum(GregorianCalendar.DAY_OF_MONTH);

    Long pk;
    int points;

    

%>
<!-- Menu -->

<jsp:include page="bootstrap/template/headerApp.jsp">
    <jsp:param name="typePage" value="standard" />
</jsp:include>

<jsp:include page="bootstrap/template/Menu.jsp">
    <jsp:param name="url" value="<%=request.getServletPath()%>" />
</jsp:include>

<!-- Fin Menu -->
<!-- Variable globale -->

<body class="nav-md" style ="background-color: whitesmoke">

    <!-- page content -->
    <div class="right_col" role="main"  style=" margin-left: 100px; margin-right: 10%">

        <div class="row">

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

                                int j = 0;
                                while (j <= users.size()) {
                                    if (pk == users.get(j).getId()) {
                                        user = users.get(j);
                                        j = users.size() + 1;
                                    }
                                    j++;
                                }
                        %>
                        <li class="media event">
                            <a class="pull-left border-aero profile_thumb">
                                <i>
                                    <img src="bootstrap/img/<%=user.getNiveau()%>.png" 
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
                                            out.println(user.getNiveau()); %> 
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


            <!-- debut du widget pour le tchat -->
            <div class="col-md-7" 
                 style="background-color: white; border-color: #e5e5e5; border-style: solid; 
                 border-width: 1px; margin-left: 10px; width:63%">

                <div class="x_title" length="300">

                    <h4><img src="images/comm.png" height="30px" width="30px"> Commentaires</h4></span>

                </div>
                <div class="panel-body" style=" height: 281px; ">
                    <ul class="chat">
                        <%
                            Services comms = new Services();

                            Vector<Commentaire> vcomm = comms.selectComments(con);

                            for (int i = 0; i < vcomm.size(); i++) {

                        %>
                        <li ><span class="chat-img pull-left">
                                <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" style="margin-right:10px;"/>
                            </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font"> 
                                        <%                                            pk = vcomm.get(i).getUsers_numero();
                                            int j = 0;
                                            while (j <= users.size()) {
                                                if (pk == users.get(j).getId()) {
                                                    user = users.get(j);
                                                    j = users.size() + 1;
                                                }
                                                j++;
                                            }

                                            out.println(user.getUsername().toUpperCase());
                                        %>
                                    </strong> 
                                    <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span><% out.println(vcomm.get(i).getDateAjout()); %>
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

                <form action="ServletAddCommentaire" method="POST"  style = "margin-top: 2%">

                    <div class="panel-footer" style="background-color: white; margin-top: -30px;">


                        <div class="input-group" style="border-top:0px; border-top-style:none;">
                            <span class="input-group-btn">
                                <input name="commentaire" id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
                                <button class="btn btn-primary btn-sm" id="btn-chat">
                                    Send</button>
                            </span>
                        </div> 
                    </div>
                </form>
            </div>

            <!-- Fin du widget de chat -->


        </div>


        <br /><br />





        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="dashboard_graph x_panel">
                    <div class="row x_title" style="margin-left: 5px; margin-right: 5px;">
                        <div class="col-md-6">
                            <h3>Evolution globale de l'activité</h3>
                        </div>
                        <div class="col-md-6">
                            <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                                <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                <span>December 2015</span> <b class="caret"></b>
                            </div>
                        </div>
                    </div>
                    <div class="x_content">
                        <div class="demo-container" style="height:250px">
                            <div id="placeholder3xx3" class="demo-placeholder" style="width: 100%; height:250px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- footer content -->
        <footer style="background-color: whitesmoke">
            <div class="">
                <p class="pull-right">Arc'People Corporation | All rights reserved
                    <span class="lead"> <i class="fa fa-paw"></i> </span>
                </p>
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->

    </div>
    <!-- /page content -->

    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
        </ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>

    <script src="js/bootstrap.min.js"></script>

    <!-- chart js -->
    <script src="js/chartjs/chart.min.js"></script>
    <!-- bootstrap progress js -->
    <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- icheck -->
    <script src="js/icheck/icheck.min.js"></script>
    <!-- gauge js -->
    <script type="text/javascript" src="js/gauge/gauge.min.js"></script>
    <script type="text/javascript" src="js/gauge/gauge_demo.js"></script>
    <!-- daterangepicker -->
    <script type="text/javascript" src="js/moment.min2.js"></script>
    <script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>
    <!-- sparkline -->
    <script src="js/sparkline/jquery.sparkline.min.js"></script>

    <script src="js/custom.js"></script>
    <!-- skycons -->
    <script src="js/skycons/skycons.js"></script>

    <!-- flot js -->
    <!--[if lte IE 8]><script type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
    <script type="text/javascript" src="js/flot/jquery.flot.js"></script>
    <script type="text/javascript" src="js/flot/jquery.flot.pie.js"></script>
    <script type="text/javascript" src="js/flot/jquery.flot.orderBars.js"></script>
    <script type="text/javascript" src="js/flot/jquery.flot.time.min.js"></script>
    <script type="text/javascript" src="js/flot/date.js"></script>
    <script type="text/javascript" src="js/flot/jquery.flot.spline.js"></script>
    <script type="text/javascript" src="js/flot/jquery.flot.stack.js"></script>
    <script type="text/javascript" src="js/flot/curvedLines.js"></script>
    <script type="text/javascript" src="js/flot/jquery.flot.resize.js"></script>


    <!-- Petits charts au dessus du grand grand graphe ci-dessous -->
    <!-- C'est vraiment la galère ces charts !!!!!! -->
    <script>
        $('document').ready(function () {
            $(".sparkline_one").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 5, 6, 7, 5, 4, 3, 5, 6], {
                type: 'bar',
                height: '40',
                barWidth: 9,
                colorMap: {
                    '7': '#a1a1a1'
                },
                barSpacing: 2,
                barColor: '#336699'
            });

            $(".sparkline_two").sparkline([2, 4, 3, 4, 5, 4, 5, 4, 3, 4, 5, 6, 7, 5, 4, 3, 5, 6], {
                type: 'line',
                width: '200',
                height: '40',
                lineColor: '#336699',
                fillColor: 'rgba(223, 223, 223, 0.57)',
                lineWidth: 2,
                spotColor: '#336699',
                minSpotColor: '#336699'
            });




        })
    </script>


    <!-- flot Grand Chart du bas de page d'accueil -->
    <script>
        //random data
        var d1 = [
            [0, 1], [1, 9], [2, 6], [3, 10], [4, 5], [5, 17], [6, 6], [7, 10], [8, 7],
            [9, 11], [10, 35], [11, 9], [12, 12], [13, 5], [14, 3], [15, 4], [16, 9],
            [17, 9], [18, 9], [19, 9], [20, 9], [21, 9], [22, 9], [23, 9], [24, 9], [25, 9],
            [26, 9], [27, 9], [28, 9], [29, 9], [30, 9]
        ];
        
        <%            
            Services datas = new Services();
            ArrayList<Graphe> bigChartDatas = datas.getDatas(con, daysInMonth);
        %>

        var d2 = [
            <%
                for (int i = 0; i < bigChartDatas.size(); i++) {
                    int nbAjouts = bigChartDatas.get(i).getNbAjouts();%> 
                    [<%=i%>, <%=nbAjouts%>],
                <%}
            %>
        ];


        //flot options
        var options = {
            series: {
                curvedLines: {
                    apply: true,
                    active: true,
                    monotonicFit: true
                }
            },
            colors: ["#336699"],
            grid: {
                borderWidth: {
                    top: 0,
                    right: 0,
                    bottom: 1,
                    left: 1
                },
                borderColor: {
                    bottom: "#7F8790",
                    left: "#7F8790"
                }
            }
        };
        var plot = $.plot($("#placeholder3xx3"), [{
                label: "Registrations",
                data: d2,
                lines: {
                    fillColor: "rgba(150, 202, 89, 0.12)"
                }, //#96CA59 rgba(150, 202, 89, 0.42)
                points: {
                    fillColor: "#fff"
                }
            }], options);
    </script>
    <!-- /flot -->





</body>

<% con.close();%>

< /html>