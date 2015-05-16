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
        //var directionsDisplay,directionsDisplay1, directionsDisplay2;
        var directionsDisplay = [];
        var directionsDisplay1 = [];
        var directionsDisplay2 = [];
        var minresponse1=999999999;
        var minresponse2 = 999999999;
        var minvalue1;
        var minvalue2;
        //var hospitalcoordinates = ["37.3588482,-121.8420857"];
        var hospitals = [{ name: "Santa Clara Urgent Care", address: "Santa Clara Urgent Care 1825 Civic Center Dr # 7" },
            { name: "Kaiser Permanente ", address: "Kaiser Permanente Santa Clara Medical Center 700 Lawrence Expy" },
            { name: "Santa Clara Valley Medical Center ", address: "Santa Clara Valley Medical Center 751 S Bascom Ave" },
            { name: "Regional Medical Center ", address: "Regional Medical Center of San Jose 225 N Jackson Ave" }];
        var directionsService = new google.maps.DirectionsService();
        var map, trafficLayer, map2, trafficLayer2;

        function initialize() {
            //directionsDisplay1 = new google.maps.DirectionsRenderer();
            //directionsDisplay2 = new google.maps.DirectionsRenderer();
            var chicago = new google.maps.LatLng(41.850033, -87.6500523);
            var mapOptions = {
                zoom: 7,
                center: chicago
            };
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            trafficLayer = new google.maps.TrafficLayer();


            map2 = new google.maps.Map(document.getElementById('map-canvas2'), mapOptions);
            trafficLayer2 = new google.maps.TrafficLayer();

            //directionsDisplay1.setMap(map);
            trafficLayer.setMap(map);

            //directionsDisplay2.setMap(map2);
            trafficLayer2.setMap(map2);
            populateendddl();
        }
        function populateendddl() {
            var select = document.getElementById("end");
            for (var i = 0; i < hospitals.length; i++) {
                var opt = hospitals[i];
                var el = document.createElement("option");
                el.textContent = opt.name;
                el.value = opt.address;
                select.appendChild(el);
            }
        }
        function calcRoute(mpn) {
            var start = document.getElementById('start').value;
            var end = document.getElementById('end').value;
            

            var m;
            var alt;
            if (mpn == "1") {
                document.getElementById("route1").innerHTML = "";
                m = map;
                directionsDisplay = directionsDisplay1;
                alt = true;
            }
            else {
                alt = false;
                m = map2;
                directionsDisplay = directionsDisplay2;
            }

            for (var j = 0; j < hospitals.length; j++) {

                //alert(hospitals[j].address);
                var request = {
                    origin: start,
                    destination: hospitals[j].address,
                    travelMode: google.maps.TravelMode.DRIVING,
                    provideRouteAlternatives: alt,
                    durationInTraffic: true,
                    avoidHighways: alt,
                    optimizeWaypoints: alt
                };
                
                directionsService.route(request, function (response, status) {
                    console.log(response);

                    if (status == google.maps.DirectionsStatus.OK) {
                        //directionsDisplay.setDirections(response);

                        if (mpn == "1") {
                            for (var k = 0; k < directionsDisplay1.length; k++) {
                                directionsDisplay1[k].setMap(null);
                            }
                        }
                        else {
                            document.getElementById("route2").innerHTML = "";
                            for (var k = 0; k < directionsDisplay2.length; k++) {
                                directionsDisplay2[k].setMap(null);
                            }
                        }
                        //alert("calling time out");
                        for (var i = 0, len = response.routes.length; i < len; i++) {
                            //response.routes[i].legs[0].duration.value;

                            if (mpn == "1") {
                                if (response.routes[i].legs[0].distance.value < minvalue1)
                                {
                                    minvalue2 = response.routes[i].legs[0].distance.value
                                    minresponse1 = response;
                                    document.getElementById("route1").innerHTML = "";
                                }

                                directionsDisplay1[i] = new google.maps.DirectionsRenderer({
                                    map: m,
                                    directions: response,
                                    routeIndex: i
                                });
                                document.getElementById("route1").innerHTML += ("<p>Route " + parseInt(i + 1) + " Duration: " + response.routes[i].legs[0].duration.text + ", Distance: " + response.routes[i].legs[0].distance.text + " </p>");

                            }
                            else {
                                //alert("adding new route to map");
                                if (response.routes[i].legs[0].duration.value < minvalue2) {
                                    minvalue2 = response.routes[i].legs[0].duration.value
                                    minresponse2 = response;
                                }
                                directionsDisplay2[i] = new google.maps.DirectionsRenderer({
                                    map: m,
                                    directions: response,
                                    routeIndex: i
                                });
                                document.getElementById("route2").innerHTML += ("<p>Route " + parseInt(i + 1) + " Duration: " + response.routes[i].legs[0].duration.text + ", Distance: " + response.routes[i].legs[0].distance.text + " </p>");
                            }
                        }
                    }
                });
            }


        }
        function calcRoutes() {
            calcRoute('1');
            timeout();

        }
        function timeout() {

            //directionsDisplay2.setMap(null);
            calcRoute('2');
            setTimeout(function () { timeout() }, 10000);
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
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div id="panel">
                            <b>Start: </b>
                            <select style="background-color: #333" id="start" onchange="calcRoutes();">
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
                            <select style="background-color: #333" id="end" onchange="calcRoutes();">
                            </select>
                        </div>

                    </div>
                    <div class="col-md-2"></div>

                </div>
                <div class="row">

                    <div class="col-md-5">
                        <h4>Google Approach</h4>
                        <div class="mapCanvas" id="map-canvas"></div>
                        <div id="route1">
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <h4>Non Google Approach</h4>
                        <div class="mapCanvas" id="map-canvas2"></div>
                        <div id="route2">
                        </div>
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
