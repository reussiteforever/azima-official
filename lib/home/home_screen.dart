import 'package:azima/home/sliding_screen.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:azima/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: BackdropScaffold(
        backgroundColor: backgroundColor,
        appBar: BackdropAppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          // leading: const Icon(
          //   Icons.menu,
          //   color: primaryColor,
          // ),
          elevation: 0,
          title: AspectRatio(
            aspectRatio: 8,
            child: SvgPicture.asset(
              "assets/images/azima-color.svg",
              semanticsLabel: 'Azima Logo',
            ),
          ),
          centerTitle: true,
          actions: const <Widget>[
            BackdropToggleButton(
              icon: AnimatedIcons.home_menu,
              color: backgroundColor,
            )
          ],
        ),
        backLayer: const Center(
          child: Text("Back Layer"),
        ),
        frontLayer: SlidingUpPanelExample(),
        stickyFrontLayer: true,
        
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      children: [
        const Text("Menu"),
        // AspectRatio(
        //   aspectRatio: 2,
        //   child: SvgPicture.asset("assets/images/azima-color.svg",
        //       semanticsLabel: 'Azima Logo'),
        // ),
        OutlinedButton(onPressed: () {}, child: const Text("Download App")),
      ],
    );
  }

  Widget _body() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(40.441589, -80.010948),
        zoom: 13,
        maxZoom: 15,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png"),
        MarkerLayerOptions(markers: [
          Marker(
              point: LatLng(40.441753, -80.011476),
              builder: (ctx) => const Icon(
                    Icons.location_on,
                    color: secondColor,
                    size: 48.0,
                  ),
              height: 60),
        ]),
      ],
    );
  }
}
