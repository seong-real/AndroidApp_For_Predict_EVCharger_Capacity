import 'package:flutter/material.dart';

import 'package:tmap_raster_flutter_sample/models/station_info.dart';

import 'package:tmap_raster_flutter_sample/pages/detail_page.dart';
import 'package:tmap_raster_flutter_sample/services/api_service.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<StationInfo>> station = ApiService.getStationInfoFromCSV();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 4,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            "주변 전기차충전소",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        body: FutureBuilder(
          future: station,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  var station = snapshot.data![index];

                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          station.name,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (station.occupancy0 == 0)
                          const Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 20,
                              ),
                              Text(
                                '여유',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              )
                            ],
                          ),
                        if (station.occupancy0 == 1)
                          const Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Text(
                                '보통',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.yellow),
                              )
                            ],
                          ),
                        if (station.occupancy0 == 2)
                          const Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.red,
                                size: 20,
                              ),
                              Text(
                                '혼잡',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                              )
                            ],
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          station.address,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600),
                        ),
                        Text(
                          '${station.distance.toStringAsFixed(2)}Km',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade800),
                        )
                      ],
                    ),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 220,
                        ),
                        SizedBox(
                          width: 80,
                          height: 40,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(stationInfo: station),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 228, 228, 228)),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                '자세히',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2,
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
