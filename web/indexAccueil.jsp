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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


<%
    /* Vérification que l'utilisateur est passé par le login et n'accède pas
     * directement à la page "index.jsp" par l'URL.
     */
    if (!HtmlHttpUtils.isAuthenticate(request)) {
        response.sendRedirect("ServletLogout");
    }
%>

<!-- Menu -->

<jsp:include page="bootstrap/template/headerApp.jsp">
    <jsp:param name="typePage" value="standard" />
</jsp:include>

<jsp:include page="bootstrap/template/Menu.jsp">
    <jsp:param name="url" value="<%=request.getServletPath()%>" />
</jsp:include>

<!-- Fin Menu -->

<body class="nav-md" style ="background-color: whitesmoke">
    <!-- page content -->
    <div class="right_col" role="main"  style=" margin-left: 100px; margin-right: 10%">

        <div class="row">

            <!-- debut du widget des personnes les plus actives en ajout -->
            <div class="col-md-3 col-sm-12 col-xs-12" style="background-color: white; 
                 border-color: #e5e5e5; border-style: solid; 
                 border-width: 1px; margin-left: 10px">
                <div>
                    <div class="x_title" length="300">
                        <h2 >Top 5 des utilisateurs</h2>

                        <%
                            AjoutDAO adao = new AjoutDAO();
                            UsersDAO udao = new UsersDAO();
                            ArrayList<Ajout> addings = adao.top5Additions();

                            out.println("" + "");
                        %>

                        <ul class="nav navbar-right panel_toolbox">
                            <li><a href="#"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>

                        <div class="clearfix"></div>
                    </div>

                    <ul class="list-unstyled top_profiles scroll-view">

                        <li class="media event">
                            <%
                                String username1 = udao.selectById(addings.get(0).getAjout_users()).getUsername();
                            %>
                            <a class="pull-left border-aero profile_thumb">

                                <i>
                                    <img src="bootstrap/img/<%=username1%>.png" 
                                         height="50px" width="50px" 
                                         style="border-radius: 50%; margin-left: -13px; margin-top: -10px;">
                                </i>
                            </a>
                            <div class="media-body">

                                <a class="title" href="#">
                                    <%
                                        out.println(username1.toUpperCase());
                                    %>
                                </a> 
                                <p> <small>
                                        <% out.println(addings.get(0).getNbTotalGroupes());%> Points
                                    </small>
                                </p>
                            </div>
                        </li>

                        <li class="media event">
                            <%
                                String username2 = udao.selectById(addings.get(1).getAjout_users()).getUsername();
                            %>
                            <a class="pull-left border-green profile_thumb">
                                <i>
                                    <img src="bootstrap/img/<%=username2%>.png" 
                                         height="50px" width="50px" 
                                         style="border-radius: 50%; margin-left: -13px; margin-top: -10px">
                                </i>
                            </a>
                            <div class="media-body">
                                <a class="title" href="#">
                                    <%
                                        out.println(username2.toUpperCase());
                                    %>
                                </a>
                                <p> <small><% out.println(addings.get(1).getNbTotalGroupes()); %> Points</small>
                                </p>
                            </div>
                        </li>

                        <li class="media event">
                            <%
                                String username3 = udao.selectById(addings.get(2).getAjout_users()).getUsername();
                            %>
                            <a class="pull-left border-blue profile_thumb">
                                <i>
                                    <img src="bootstrap/img/<%=username3%>.png" 
                                         height="50px" width="50px" 
                                         style="border-radius: 50%; margin-left: -13px; margin-top: -10px;">
                                </i>
                            </a>
                            <div class="media-body">
                                <a class="title" href="#">
                                    <%
                                        out.println(username3.toUpperCase());
                                    %>
                                </a>
                                <p> <small><% out.println(addings.get(2).getNbTotalGroupes()); %> Points</small>
                                </p>
                            </div>
                        </li>

                        <li class="media event">
                            <%
                                String username4 = udao.selectById(addings.get(3).getAjout_users()).getUsername();
                            %>
                            <a class="pull-left border-blue profile_thumb">
                                <i>
                                    <img src="bootstrap/img/<%=username4%>.png" 
                                         height="50px" width="50px" 
                                         style="border-radius: 50%; margin-left: -13px; margin-top: -10px;">
                                </i>
                            </a>
                            <div class="media-body">
                                <a class="title" href="#">
                                    <%
                                        out.println(username4.toUpperCase());
                                    %>
                                </a>
                                <p> <small><% out.println(addings.get(3).getNbTotalGroupes()); %> Points</small>
                                </p>
                            </div>
                        </li>

                        <li class="media event">
                            <%
                                String username5 = udao.selectById(addings.get(4).getAjout_users()).getUsername();
                            %>
                            <a class="pull-left border-blue profile_thumb">
                                <i>
                                    <img src="bootstrap/img/<%=username5%>.png" 
                                         height="50px" width="50px" 
                                         style="border-radius: 50%; margin-left: -13px; margin-top: -10px;">
                                </i>
                            </a>
                            <div class="media-body">
                                <a class="title" href="#">
                                    <%
                                        out.println(username5.toUpperCase());
                                    %>
                                </a>
                                <p> <small><% out.println(addings.get(4).getNbTotalGroupes());%> Points</small>
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- fin du widget -->


            <!-- debut du widget pour le tchat -->
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
























            <!--<div class="col-md-4 col-sm-6 col-xs-12" style="background-color: white; 
                 border-color: #e5e5e5; border-style: solid; 
                 border-width: 1px; margin-left: 10px">

                <div class="x_title">
                    <h2>Remarques </h2>

                    <div class="clearfix"></div>
                </div>
                <form action="ServletAddCommentaire">


                    <div class="panel-body" style="border-radius: 0px">
                        <ul class="chat">

            <%                                /* HttpSession s = request.getSession();

                 Connection con = (Connection) s.getAttribute("conn");

                 Services comms = new Services();

                 Vector<Commentaire> vcomm = comms.selectComments(con);

                 for (int i = 0; i < vcomm.size(); i++) {*/

            %>
                        
            <li class="left clearfix"><span class="chat-img pull-left">
                    <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                </span>
                <div class="chat-body clearfix">
                    <div class="header">
                        <strong class="primary-font" style="color:black">
            <%                                                /* Users u = udao.selectById(vcomm.get(i).getUsers_numero());
                 out.println(u.getUsername().toUpperCase());*/
            %>
        </strong>
    </div>
    <p>
            <%                                            //out.println(vcomm.get(i).getCommentaire());
            %>
        </p>
    </div>
</li>
            <%                                //}
                                //udao.closeConnection(con);
%>
        </ul>
    </div>
    <div class="panel-footer" style="background-color: white">
        <div class="input-group" style="background-color: white">

            <input name ="commentaire" id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />

            <span class="input-group-btn">

                <button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
            </span>

        </div>
    </div>
</form>
</div> -->
            <!-- fin du widget --> 





        </div>
        <br /><br />

        <div class="">

            <div class="row top_tiles" style="margin: 10px 0;">
                <div class="col-md-3 col-sm-3 col-xs-6 tile">
                    <div class="left"></div>
                    <div class="right">
                        <span>Nombre d'utilisateurs</span>
                        <h2>231,809</h2>
                        <span class="sparkline_one" style="height: 160px;">
                            <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                        </span>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 tile">
                    <span>Total Commentaires</span>
                    <h2>$ 231,809</h2>
                    <span class="sparkline_one" style="height: 160px;">
                        <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                    </span>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 tile">
                    <span>Total Ajouts</span>
                    <h2>231,809</h2>
                    <span class="sparkline_two" style="height: 160px;">
                        <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                    </span>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6 tile">
                    <span>Total Sessions</span>
                    <h2>231,809</h2>
                    <span class="sparkline_one" style="height: 160px;">
                        <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                    </span>
                </div>
            </div>
            <br />


        </div>

        <br /><br />

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="dashboard_graph x_panel">
                    <div class="row x_title">
                        <div class="col-md-6">
                            <h3>Network Activities <small>Graph title sub-title</small></h3>
                        </div>
                        <div class="col-md-6">
                            <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                                <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
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

    <!-- flot -->

    <script>
        //random data
        var d1 = [
            [0, 1], [1, 9], [2, 6], [3, 10], [4, 5], [5, 17], [6, 6], [7, 10], [8, 7], [9, 11], [10, 35], [11, 9], [12, 12], [13, 5], [14, 3], [15, 4], [16, 9]
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
                data: d1,
                lines: {
                    fillColor: "rgba(150, 202, 89, 0.12)"
                }, //#96CA59 rgba(150, 202, 89, 0.42)
                points: {
                    fillColor: "#fff"
                }
            }], options);
    </script>
    <!-- /flot -->
    <!--  -->
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

            var doughnutData = [
                {
                    value: 30,
                    color: "#455C73"
                },
                {
                    value: 30,
                    color: "#9B59B6"
                },
                {
                    value: 60,
                    color: "#BDC3C7"
                },
                {
                    value: 100,
                    color: "#336699"
                },
                {
                    value: 120,
                    color: "#3498DB"
                }
            ];
            var myDoughnut = new Chart(document.getElementById("canvas1").getContext("2d")).Doughnut(doughnutData);


        })
    </script>
    <!-- -->
    <!-- datepicker -->
    <script type="text/javascript">
        $(document).ready(function () {

            var cb = function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                //alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
            }

            var optionSet1 = {
                startDate: moment().subtract(29, 'days'),
                endDate: moment(),
                minDate: '01/01/2012',
                maxDate: '12/31/2015',
                dateLimit: {
                    days: 60
                },
                showDropdowns: true,
                showWeekNumbers: true,
                timePicker: false,
                timePickerIncrement: 1,
                timePicker12Hour: true,
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                opens: 'left',
                buttonClasses: ['btn btn-default'],
                applyClass: 'btn-small btn-primary',
                cancelClass: 'btn-small',
                format: 'MM/DD/YYYY',
                separator: ' to ',
                locale: {
                    applyLabel: 'Submit',
                    cancelLabel: 'Clear',
                    fromLabel: 'From',
                    toLabel: 'To',
                    customRangeLabel: 'Custom',
                    daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                    monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                    firstDay: 1
                }
            };
            $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
            $('#reportrange').daterangepicker(optionSet1, cb);
            $('#reportrange').on('show.daterangepicker', function () {
                console.log("show event fired");
            });
            $('#reportrange').on('hide.daterangepicker', function () {
                console.log("hide event fired");
            });
            $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
                console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
            });
            $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
                console.log("cancel event fired");
            });
            $('#options1').click(function () {
                $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
            });
            $('#options2').click(function () {
                $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
            });
            $('#destroy').click(function () {
                $('#reportrange').data('daterangepicker').remove();
            });
        });
    </script>
    <!-- /datepicker -->

    <!-- moris js -->
    <script src="js/moris/raphael-min.js"></script>
    <script src="js/moris/morris.js"></script>
    <script>
        $(function () {
            var day_data = [
                {
                    "period": "Jan",
                    "Hours worked": 80
                },
                {
                    "period": "Feb",
                    "Hours worked": 125
                },
                {
                    "period": "Mar",
                    "Hours worked": 176
                },
                {
                    "period": "Apr",
                    "Hours worked": 224
                },
                {
                    "period": "May",
                    "Hours worked": 265
                },
                {
                    "period": "Jun",
                    "Hours worked": 314
                }
            ];
            Morris.Bar({
                element: 'graph_bar',
                data: day_data,
                hideHover: 'always',
                xkey: 'period',
                barColors: ['#336699', '#34495E', '#ACADAC', '#3498DB'],
                ykeys: ['Hours worked', 'sorned'],
                labels: ['Hours worked', 'SORN'],
                xLabelAngle: 60
            });
        });
    </script>
    <!-- skycons -->
    <script>
        var icons = new Skycons({
            "color": "#73879C"
        }),
                list = [
                    "clear-day", "clear-night", "partly-cloudy-day",
                    "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                    "fog"
                ],
                i;

        for (i = list.length; i--; )
            icons.set(list[i], list[i]);

        icons.play();
    </script>
    <script>

        var opts = {
            lines: 12, // The number of lines to draw
            angle: 0, // The length of each line
            lineWidth: 0.4, // The line thickness
            pointer: {
                length: 0.75, // The radius of the inner circle
                strokeWidth: 0.042, // The rotation offset
                color: '#1D212A' // Fill color
            },
            limitMax: 'false', // If true, the pointer will not go past the end of the gauge
            colorStart: '#336699', // Colors
            colorStop: '#336699', // just experiment with them
            strokeColor: '#F0F3F3', // to see which ones work best for you
            generateGradient: true
        };
        var target = document.getElementById('foo2'); // your canvas element
        var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
        gauge.maxValue = 5000; // set max gauge value
        gauge.animationSpeed = 32; // set animation speed (32 is default value)
        gauge.set(3200); // set actual value
        gauge.setTextField(document.getElementById("gauge-text2"));
    </script>
</body>

</html>