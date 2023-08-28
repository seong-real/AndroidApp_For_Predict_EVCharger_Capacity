import 'package:flutter/material.dart';

import 'package:tmap_raster_flutter_sample/models/station_info.dart';
import 'dart:math';

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

  Future<List<StationInfo>> station = ApiService.getStationInfo();

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
                  final random = Random();
                  var station = snapshot.data![index];
                  var randomNumber = random.nextInt(2) + 1;
                  var randomNumber2 = random.nextInt(5) + 1;
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          station.name,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                text: '급속 ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 9, 171, 225)),
                              ),
                              TextSpan(
                                text:
                                    '$randomNumber 대 가능 ㆍ $randomNumber2시간 전 사용',
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 9, 171, 225)),
                              )
                            ],
                          ),
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
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600),
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
        )

        /*body: FutureBuilder(
        future: stations,
        builder: (context, snapshot) {
          return ListView.separated(
              itemBuilder: (context, index) {
                var station = snapshot.data![index];
                return Text(station.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 30,
                  ),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length);
        },
      ),*/
        );
  }
}
