import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";
import "package:http/http.dart" as http;

import "dart:convert" as convert;

class Commandes extends StatefulWidget {
  @override
  State<Commandes> createState() => _CommandesState();
}

class _CommandesState extends State<Commandes> {
  final String apiKey = "exhHETBl3wCmdiUGotaFn5DjrXpy6SFL";

  @override
  Widget build(BuildContext context) {
    final LatLng tomtomHQ = new LatLng(5.4011252, -3.9575344);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "hauOOra",
      home: Scaffold(
        body: Center(
            child: Stack(
          children: <Widget>[
            FlutterMap(
              options: MapOptions(center: tomtomHQ, zoom: 13.0),
              layers: [
                new TileLayerOptions(
                  urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                      "{z}/{x}/{y}.png?key=exhHETBl3wCmdiUGotaFn5DjrXpy6SFL",
                  additionalOptions: {"apiKey": apiKey},
                ),
                new MarkerLayerOptions(
                  markers: [
                    new Marker(
                      width: 40.0,
                      height: 40.0,
                      point: new LatLng(5.4011252, -3.9575344),
                      builder: (BuildContext context) => const Icon(
                          Icons.location_on,
                          size: 40.0,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  "assets/images/tt_logo.png",
                  width: 30,
                  height: 30,
                ))
          ],
        )),
      ),
    );
  }

  Future<http.Response> getCopyrightsJSONResponse() async {
    var url = "https://api.tomtom.com/map/1/copyrights.json?key=$apiKey";
    var response = await http.get(Uri.parse(url));
    return response;
  }

  String parseCopyrightsResponse(http.Response response) {
    if (response.statusCode == 200) {
      StringBuffer stringBuffer = StringBuffer();
      var jsonResponse = convert.jsonDecode(response.body);
      parseGeneralCopyrights(jsonResponse, stringBuffer);
      parseRegionsCopyrights(jsonResponse, stringBuffer);
      return stringBuffer.toString();
    }
    return "Can't get copyrights";
  }

  void parseRegionsCopyrights(jsonResponse, StringBuffer sb) {
    List<dynamic> copyrightsRegions = jsonResponse["regions"];
    copyrightsRegions.forEach((element) {
      sb.writeln(element["country"]["label"]);
      List<dynamic> cpy = element["copyrights"];
      cpy.forEach((e) {
        sb.writeln(e);
      });
      sb.writeln("");
    });
  }

  void parseGeneralCopyrights(jsonResponse, StringBuffer sb) {
    List<dynamic> generalCopyrights = jsonResponse["generalCopyrights"];
    generalCopyrights.forEach((element) {
      sb.writeln(element);
      sb.writeln("");
    });
    sb.writeln("");
  }
}
