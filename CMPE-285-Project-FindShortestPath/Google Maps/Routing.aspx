<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Routing.aspx.cs" Inherits="CMPE_285_Project_FindShortestPath.Google_Maps.Routing" %>

<!DOCTYPE html>

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
    <script>
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var map, trafficLayer, map2, trafficLayer2;

        function initialize() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var chicago = new google.maps.LatLng(41.850033, -87.6500523);
            var mapOptions = {
                zoom: 7,
                center: chicago
            };
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            trafficLayer = new google.maps.TrafficLayer();

            map2 = new google.maps.Map(document.getElementById('map-canvas2'), mapOptions);
            trafficLayer2 = new google.maps.TrafficLayer();

            directionsDisplay.setMap(map);
            trafficLayer.setMap(map);

            directionsDisplay.setMap(map2);
            trafficLayer2.setMap(map2);
        }

        function calcRoute(mpn) {
            var start = document.getElementById('start').value;
            var end = document.getElementById('end').value;
            var m;
            if (mpn == "1") {
                m = map;
            }
            else {
                m = map2;

            }
                

            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.TravelMode.DRIVING,
                provideRouteAlternatives: true
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    //directionsDisplay.setDirections(response);

                    for (var i = 0, len = response.routes.length; i < len; i++) {
                        //response.routes[i].legs[0].duration.value;
                        new google.maps.DirectionsRenderer({
                            map: m,
                            directions: response,
                            routeIndex: i
                        });
                    }
                }
            });



        }
        function calcRoutes()
        {
            calcRoute('1');
            calcRoute('2');
        }
        

    </script>

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
                                <li><a href="#">Features</a></li>
                                <li><a href="#">Contact</a></li>
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
            <div class="container">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <div id="panel">
                                    <b>Start: </b>
                                    <select style="background-color:#333" id="start" onchange="calcRoutes();">
                                        <option value="san jose, ca">San Jose</option>
                                        <option value="santa clara, ca">Santa Clara</option>
                                        <option value="joplin, mo">Joplin, MO</option>
                                        <option value="oklahoma city, ok">Oklahoma City</option>
                                        <option value="amarillo, tx">Amarillo</option>
                                        <option value="gallup, nm">Gallup, NM</option>
                                        <option value="flagstaff, az">Flagstaff, AZ</option>
                                        <option value="winona, az">Winona</option>
                                        <option value="kingman, az">Kingman</option>
                                        <option value="barstow, ca">Barstow</option>
                                        <option value="san bernardino, ca">San Bernardino</option>
                                        <option value="los angeles, ca">Los Angeles</option>
                                    </select>
                                    <b>End: </b>
                                    <select style="background-color:#333" id="end" onchange="calcRoutes();">
                                        <option value="san jose, ca">San Jose</option>
                                        <option value="santa clara, ca">Santa Clara</option>
                                        <option value="joplin, mo">Joplin, MO</option>
                                        <option value="oklahoma city, ok">Oklahoma City</option>
                                        <option value="amarillo, tx">Amarillo</option>
                                        <option value="gallup, nm">Gallup, NM</option>
                                        <option value="flagstaff, az">Flagstaff, AZ</option>
                                        <option value="winona, az">Winona</option>
                                        <option value="kingman, az">Kingman</option>
                                        <option value="barstow, ca">Barstow</option>
                                        <option value="san bernardino, ca">San Bernardino</option>
                                        <option value="los angeles, ca">Los Angeles</option>
                                    </select>
                                </div>

                            </div>
                            <div class="col-md-4"></div>

                        </div>
                        <div class="row">

                            <div class="col-md-5">
                                <h4>Google Approach</h4>
                                <div class="mapCanvas" id="map-canvas"></div>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="col-md-5">
                                <h4>Non Google Approach</h4>
                                <div class="mapCanvas" id="map-canvas2"></div>
                            </div>

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
