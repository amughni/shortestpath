<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="CMPE_285_Project_FindShortestPath.Services.Appointment" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link href="../Include/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        html, body, .mapCanvas {
            height: 400px;
        }

        #panel {
        }
    </style>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAabirU2cPAJm-xMUu_3bt6yIcTjuhFVDc&sensor=false"></script>
    <title>Cover Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="/include/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/include/css/cover.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body onload="initialize()">

    <div class="site-wrapper">

        <div class="site-wrapper-inner">

            <div class="cover-container">

                <div class="masthead clearfix">
                    <div class="inner">
                        <h3 class="masthead-brand">Cover</h3>
                        <nav>
                            <ul class="nav masthead-nav">
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="#">Appointment</a></li>
                                <li><a href="#">Doctor</a></li>
                                <li><a href="#">Parking</a></li>
                                <li><a href="#">Patient</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>

                <div class="inner cover">
                </div>

                <div class="mastfoot">
                    <div class="inner">
                        <p>Build and managed by Team 3</p>
                    </div>
                </div>

            </div>
            <div id="viewAppointment" class="container">
               <table runat="server" id="tblViewAppointments">

               </table>
            </div>



            <div id="addAppointment" class="container">
                <div class="row">
                    <div class="col-md-3">Doctor ID</div>
                    <div class="col-md-3"><asp:TextBox ID="doctorid" runat="server" ></asp:TextBox></div>
                    <div class="col-md-3">Patient Name</div>
                    <div class="col-md-3"><asp:TextBox ID="patientName" runat="server" ></asp:TextBox></div>
                </div>

                <div class="row">
                    <div class="col-md-3">Time</div>
                    <div class="col-md-3"><asp:TextBox ID="time" runat="server" ></asp:TextBox></div>
                </div>
            </div>


        </div>

    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
