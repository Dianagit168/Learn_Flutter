import 'package:flutter/material.dart';
import 'package:flutter_learning/Component/tool_bar.dart';
import 'package:flutter_learning/Component/user_page_item.dart';
import 'package:flutter_learning/config/app_string.dart';
import 'package:flutter_learning/data/model/user.dart';
import 'package:flutter_learning/provider/user_provider.dart';
import 'package:flutter_learning/style/app_colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage({super.key});

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  late final Future<List<UserModel>> futureUser;
  final pageController = PageController(viewportFraction: 0.9);
  @override
  void initState() {
    super.initState();
    futureUser = context.read<UserProvider>().getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ToolBar(
          title: AppStrings.nearby,
        ),
        body: FutureBuilder(
          future: futureUser,
          builder: (context, snapshot) {
            final userInMap = snapshot.data;
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Stack(
              children: [
                FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(20.946052, 100.228822),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(
                      markers: userInMap!
                          .map(
                            (userMap) => Marker(
                              width: 200,
                              height: 70,
                              point: LatLng(userMap.address!.coordinates.lat,
                                  userMap.address!.coordinates.lng),
                              child: GestureDetector(
                                onTap: () {
                                  var page = 0;
                                  for (var i = 0; i < userInMap.length; i++) {
                                    if (userInMap[i].id == userMap.id) {
                                      page = i;
                                      break;
                                    }
                                  }
                                  pageController.animateToPage(page,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.easeIn);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      decoration: const BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      child: Text(userMap.firstName! +
                                          userMap.lastName!),
                                    ),
                                    const Icon(Icons.location_on_outlined)
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 250,
                    child: PageView(
                      // allowImplicitScrolling: true,
                      controller: pageController,
                      children: userInMap
                          .map(
                            (userPage) => UserPageItem(user: userPage),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
