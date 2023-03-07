import 'dart:async';

import 'package:final_ledy_taxi_app/ui/pages/home/slidinAppPanels/location_search_panel.dart';
import 'package:final_ledy_taxi_app/ui/pages/home/slidinAppPanels/panal_location.dart';
import 'package:final_ledy_taxi_app/ui/pages/home/slidinAppPanels/user_lc_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../showAlerDialog/aler_diolog.dart';
import 'drower/myDrower.dart';

class AddresPage extends StatefulWidget {
  const AddresPage({super.key, required this.myNumber});
  final String myNumber;
  @override
  State<AddresPage> createState() => _AddresPageState();
}

class _AddresPageState extends State<AddresPage> {
  final _panelController = PanelController();
  double locationPanelHeight = 200.h;
  double userAddressPanelHeight = 300.h;
  double locationSearchPanelHeight = 580.h;
  double _flbHeight = 200.h;
  double? _sldUpHeight;

  final CameraPosition _initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _sldUpHeight = locationPanelHeight;
    Future.delayed(Duration.zero, () => _showCongratulation());
  }

  _showCongratulation() {
    showDialog(
        context: context,
        builder: (context) {
          Timer(Duration(seconds: 3), () => Navigator.pop(context));
          return CongratulationDialog();
        });
  }

  _opens(BuildContext ctx) {
    Scaffold.of(ctx).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrower(
        userNum: widget.myNumber,
      ),
      body: Builder(builder: (context) {
        return Stack(
          children: [
            SlidingUpPanel(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              defaultPanelState: PanelState.OPEN,
              controller: _panelController,
              onPanelSlide: (position) {
                _flbHeight = position * _sldUpHeight!;
                setState(() {});
              },
              padding: EdgeInsets.only(top: 10),
              maxHeight: _sldUpHeight!,
              minHeight: 0,
              panelBuilder: (sc) => _getPanel(sc),
              body: GoogleMap(
                initialCameraPosition: _initialLocation,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Positioned(
              bottom: _flbHeight + 20,
              right: 20,
              child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                onPressed: () {
                  _goToTheLake();
                },
                child: SizedBox(
                  height: 26.h,
                  width: 26.w,
                  child: Image.asset(
                    'assets/icons/lacation.png',
                    // fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _opens(context);
              },
              child: SizedBox(
                // margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                height: 150.h,
                width: 80.w,
                child: Image.asset(
                  'assets/icons/menyu_ic.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  _changePanel(double height) {
    _panelController.close().then((_) {
      _sldUpHeight = height;
      Future.delayed(
          Duration(milliseconds: 100), () => _panelController.open());
    });
  }

  _getPanel(ScrollController sc) {
    if (_sldUpHeight == locationPanelHeight) {
      return LocationPanel(funcbtn: () => _changePanel(userAddressPanelHeight));
    } else if (_sldUpHeight == userAddressPanelHeight) {
      return UserLcPanel(
          funcBtn: () => _changePanel(locationSearchPanelHeight));
    } else if (_sldUpHeight == locationSearchPanelHeight) {
      return LocationSerchPanalSc(controller: sc);
    } else if (3 == 3) {}
    // return LocationPanel();
  }

  static const CameraPosition _kLake = CameraPosition(
      bearing: 200.8334901395799,
      target: LatLng(
        41.2706149,
        69.2006371,
      ),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
