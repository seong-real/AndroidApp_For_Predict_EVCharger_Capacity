import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmap_ui_sdk/event/data/sdkStatus/tmap_sdk_status.dart';
import 'package:tmap_ui_sdk/tmap_ui_sdk_manager.dart';
import 'package:tmap_ui_sdk/widget/tmap_view_widget.dart';
import 'package:tmap_raster_flutter_sample/config/drive_route_data.dart';

class DrivePage extends StatefulWidget {
  const DrivePage({super.key});

  @override
  State<DrivePage> createState() => _DrivePageState();
}

class _DrivePageState extends State<DrivePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TmapUISDKManager().startTmapSDKStatusStream(onStatusListener);
  }

  void onStatusListener(TmapSDKStatus status) {
    switch (status) {
      case TmapSDKStatus.dismissReq:
        onDismiss(); // 운행이 종료되면 화면을 닫는다.
        break;
      default:
        break;
    }
  }

  void onDismiss() {
    if (context.mounted) {
      Navigator.of(context).popUntil((route) {
        return route.settings.name == '/';
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    TmapUISDKManager().stopTmapSDKStatusStream();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          await TmapUISDKManager().stopDriving();
          return true;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
            bottom: false,
            child: Container(
              color: Colors.white,
              child: Consumer<DriveRouteData>(
                  builder: (context, drive, child) =>
                      TmapViewWidget(data: drive.getRouteRequestData())),
            ),
          ),
        ));
  }
}
