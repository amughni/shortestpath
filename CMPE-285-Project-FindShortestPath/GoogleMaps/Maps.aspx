<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maps.aspx.cs" Inherits="CMPE_285_Project_FindShortestPath.Google_Maps.Maps" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAabirU2cPAJm-xMUu_3bt6yIcTjuhFVDc&sensor=false"></script>
<script>
    function codeAddress() {
        var address = document.getElementById("address").value;
        geocoder.geocode({ address: address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }</script>

</head>
<body onload="initialize()">
    <form id="form1" runat="server">
     <div id="map-canvas" style="width: 320px; height: 480px;"></div><div><input id="address" type="textbox" value="Sydney, NSW"><input type="button" value="Search City" onclick="codeAddress()"></div><script>
        var geocoder;
        var map;
        function initialize() {
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(-34.397, 150.644);
            var mapOptions = {
                zoom: 8,
                center: latlng
            }
            map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
        }</script>

    </form>
</body>
</html>
