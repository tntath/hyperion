import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class LandPage extends StatelessWidget {
  const LandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: const LatLng(40.5952467, 22.9486122),
        zoom: 16,
      ),
      nonRotatedChildren: const [
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution("OpenStreetMap Contibutors"),
          ],
        )
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://a.tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: "com.example.app",
        ),
        PolygonLayer(
          polygons: [
            Polygon(
              points: [
                const LatLng(40.59905555555556, 22.957),
                const LatLng(40.603, 22.950777777777777),
                const LatLng(40.59169444444445, 22.949944444444444),
              ],
              color: Colors.pink,
              isFilled: true,
              borderColor: Colors.black,
              borderStrokeWidth: 5,
            ),
          ],
        ),
      ],
    );
  }
}
