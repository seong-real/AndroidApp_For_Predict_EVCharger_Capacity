import 'package:flutter/material.dart';
import 'package:tmap_raster_flutter_sample/models/dest_station_info.dart';
import 'package:tmap_raster_flutter_sample/services/dest_api_service.dart';

class NavFind extends StatefulWidget {
  const NavFind({super.key});

  @override
  State<NavFind> createState() => _NavFindState();
}

class _NavFindState extends State<NavFind> {
  final Future<List<DestStationInfo>> deststations =
      DestApiService.getStationInfo();

  List<String> sortOptions = ['추천순', '거리순', '여유순'];
  String selectedSortOption = '거리순';

  @override
  void initState() {
    super.initState();
  }

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
            "도착지 주변 충전소",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        body: FutureBuilder(
          future: deststations,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DestStationInfo> sortedStations = List.from(snapshot.data!);

              if (selectedSortOption == '추천순') {
                sortedStations.sort((a, b) {
                  double aScore = a.occupancy_40 / a.distance;
                  double bScore = b.occupancy_40 / b.distance;
                  return bScore.compareTo(aScore);
                });
              } else if (selectedSortOption == '거리순') {
                sortedStations.sort((a, b) => a.distance.compareTo(b.distance));
              } else if (selectedSortOption == '여유순') {
                sortedStations
                    .sort((a, b) => a.occupancy_40.compareTo(b.occupancy_40));
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.sort),
                        const SizedBox(width: 3),
                        DropdownButton<String>(
                          value: selectedSortOption,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSortOption = newValue!;
                            });
                          },
                          items: sortOptions
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.only(left: 10),
                      itemBuilder: (context, index) {
                        var deststation = snapshot.data![index];

                        if ((index < 3) & (selectedSortOption == '추천순')) {
                          return ListTile(
                              title: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        deststation.name,
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      if (deststation.occupancy0 == 0)
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
                                      if (deststation.occupancy0 == 1)
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
                                      if (deststation.occupancy0 == 2)
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
                                        deststation.address,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade600),
                                      ),
                                      Text(
                                        '${deststation.distance.toStringAsFixed(2)}Km',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade600),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextButton(
                                            onPressed: null,
                                            style: ButtonStyle(
                                              fixedSize:
                                                  MaterialStateProperty.all<
                                                      Size>(const Size(70, 30)),
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          255, 228, 228, 228)),
                                              shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            child: const Text('경유'),
                                          ),
                                          const SizedBox(
                                            width: 25,
                                          ),
                                          TextButton(
                                            onPressed: null,
                                            style: ButtonStyle(
                                              fixedSize: MaterialStateProperty
                                                  .all<Size>(
                                                      const Size(110, 30)),
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                      Color(0xFF0065ff)),
                                              shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            child: const Text(
                                              '도착',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Image(
                                    image: AssetImage('image/adothelp.png'),
                                    width: 85,
                                    height: 123,
                                  ),
                                ],
                              ),
                              subtitle: null);
                        } else {
                          return ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  deststation.name,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                if (deststation.occupancy0 == 0)
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
                                if (deststation.occupancy0 == 1)
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
                                if (deststation.occupancy0 == 2)
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
                                  deststation.address,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade600),
                                ),
                                Text(
                                  '${deststation.distance.toStringAsFixed(2)}Km',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade600),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: null,
                                      style: ButtonStyle(
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                                const Size(70, 30)),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Color.fromARGB(
                                                    255, 228, 228, 228)),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      child: const Text('경유'),
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    TextButton(
                                      onPressed: null,
                                      style: ButtonStyle(
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                                const Size(110, 30)),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Color(0xFF0065ff)),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        '도착',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [],
                            ),
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 2,
                        );
                      },
                    ),
                  ),
                ],
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
