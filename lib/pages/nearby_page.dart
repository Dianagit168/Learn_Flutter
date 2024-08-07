import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/tool_bar.dart';
import 'package:flutter_learning/config/app_string.dart';
import 'package:flutter_learning/style/app_colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ToolBar(
          title: AppStrings.nearby,
        ),
        body: FlutterMap(
          options:
              const MapOptions(initialCenter: LatLng(50.5, 30.51), minZoom: 10),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(
              markers: [
                Marker(
                    width: 100,
                    height: 70,
                    point: const LatLng(50.5, 30.51),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: const Text('data'),
                        ),
                        const Icon(Icons.location_on_outlined)
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}
