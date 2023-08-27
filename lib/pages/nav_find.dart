import 'package:flutter/material.dart';
import 'package:tmap_raster_flutter_sample/models/station_info.dart';
import 'dart:math';

class NavFind extends StatefulWidget {
  const NavFind({super.key});

  @override
  State<NavFind> createState() => _NavFindState();
}

class _NavFindState extends State<NavFind> {
  //final Future<List<StationInfo>> stations = ApiService.getStationInfo();

  List<StationInfo> stationlist = [
    StationInfo(
        address: "서울시",
        name: "보라매전기차",
        sid: 1,
        occupancy_20: 0.95,
        occupancy_40: 0.88,
        occupancy_60: 0.65,
        occupancy_120: 0.33),
    StationInfo(
        address: "서울아님",
        name: "보라기전기차",
        sid: 2,
        occupancy_20: 0.95,
        occupancy_40: 0.88,
        occupancy_60: 0.65,
        occupancy_120: 0.33),
    StationInfo(
        address: "서울시립",
        name: "보라색전기차",
        sid: 3,
        occupancy_20: 0.95,
        occupancy_40: 0.88,
        occupancy_60: 0.65,
        occupancy_120: 0.33),
    StationInfo(
        address: "서울시라고",
        name: "보라전기차",
        sid: 4,
        occupancy_20: 0.95,
        occupancy_40: 0.88,
        occupancy_60: 0.65,
        occupancy_120: 0.33),
    StationInfo(
        address: "서울시라고",
        name: "보라전기차",
        sid: 4,
        occupancy_20: 0.95,
        occupancy_40: 0.88,
        occupancy_60: 0.65,
        occupancy_120: 0.33),
    StationInfo(
        address: "서울시라고",
        name: "보라전기차",
        sid: 4,
        occupancy_20: 0.95,
        occupancy_40: 0.88,
        occupancy_60: 0.65,
        occupancy_120: 0.33),
  ];

  List<String> sortOptions = ['추천순', '거리순'];
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
        body: Column(
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
                        // 정렬 변경에 따른 작업 수행
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
                itemCount: stationlist.length,
                padding: const EdgeInsets.only(left: 10),
                itemBuilder: (context, index) {
                  final random = Random();
                  var randomNumber = random.nextInt(2) + 1;
                  var randomNumber2 = random.nextInt(10) + 1;
                  var station = stationlist[index];
                  if (index < 3) {
                    return ListTile(
                        title: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  station.name,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: '급속 ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromARGB(
                                                255, 9, 171, 225)),
                                      ),
                                      TextSpan(
                                        text:
                                            '$randomNumber 대 가능 ㆍ $randomNumber2시간 전 사용',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Color.fromARGB(
                                                255, 9, 171, 225)),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  station.address,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
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
                            const SizedBox(
                              width: 18,
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
                            station.name,
                            style: const TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w600),
                          ),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                  text: '급속 ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(255, 9, 171, 225)),
                                ),
                                TextSpan(
                                  text:
                                      '$randomNumber 대 가능 ㆍ $randomNumber2시간 전 사용',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 9, 171, 225)),
                                )
                              ],
                            ),
                          ),
                          Text(
                            station.address,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
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
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      const Size(70, 30)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color.fromARGB(255, 228, 228, 228)),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
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
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      const Size(110, 30)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color(0xFF0065ff)),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
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
