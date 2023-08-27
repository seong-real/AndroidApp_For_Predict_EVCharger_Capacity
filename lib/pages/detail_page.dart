import 'package:flutter/material.dart';
import 'package:tmap_raster_flutter_sample/models/station_info.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailScreen extends StatelessWidget {
  final StationInfo stationInfo;

  const DetailScreen({super.key, required this.stationInfo});

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
          '충전소 상세정보',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              null;
            },
            icon: const Icon(Icons.star_border_outlined),
            iconSize: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              null;
            },
            icon: const Icon(Icons.upload_outlined),
            iconSize: 30,
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stationInfo.name,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter'),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '전기차충전소',
                style: TextStyle(fontSize: 16, color: Colors.black26),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.blue, width: 1.0)),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_2_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '충전 시작하기',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 13)),
              const Icon(
                Icons.place,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                stationInfo.address,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 13)),
              Icon(
                Icons.schedule_outlined,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '24시간영업',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            indent: 13,
            endIndent: 13,
            thickness: 1,
            color: Colors.grey.shade400,
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 13)),
              const Icon(
                Icons.edit_note_outlined,
                color: Colors.blue,
                size: 28,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '정보 수정 요청  >',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 8,
            color: Colors.grey.shade300,
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 13)),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Plug ',
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF47726)),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Issue',
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE51937)),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '충전소 상태 예측',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 500.0,
              enableInfiniteScroll: false,
              initialPage: 0,
              viewportFraction: 0.97,
              enlargeCenterPage: true,
            ),
            items: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('image/frame.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    left: 20,
                    child: Container(
                      width: 350,
                      height: 290,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF7F7F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '20분 뒤',
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${stationInfo.name}의',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                style:
                                    DefaultTextStyle.of(context).style.copyWith(
                                          fontSize: 15, //
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          letterSpacing: -1.0,
                                          wordSpacing: -7.0,
                                        ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: '20분 뒤 상태는 ',
                                  ),
                                  TextSpan(
                                    text: '여유',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue),
                                  ),
                                  TextSpan(text: '일 것이라 예측됩니다.')
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                style:
                                    DefaultTextStyle.of(context).style.copyWith(
                                          fontSize: 15, //
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          letterSpacing: -1.0,
                                          wordSpacing: -7.0,
                                        ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: '이전 4시간동안 사용된 평균 충전기 수는',
                                  ),
                                  TextSpan(
                                    text: '여유',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue),
                                  ),
                                  TextSpan(text: '대이고')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 5,
                    right: 10,
                    child: Image(
                      image: AssetImage('image/adot.png'),
                      width: 100,
                      height: 160,
                    ),
                  ),
                  const Positioned(
                      bottom: 5,
                      left: 20,
                      child: Image(
                        image: AssetImage('image/station.png'),
                        width: 230,
                        height: 100,
                      ))
                ],
              ),
              Container(
                color: Colors.grey.shade200,
                child: const Center(child: Text('40분 뒤')),
              ),
              Container(
                color: Colors.grey.shade200,
                child: const Center(child: Text('Page 3')),
              ),
              Container(
                color: Colors.grey.shade200,
                child: const Center(child: Text('Page 4')),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: null,
                style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(90, 50)),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 228, 228, 228)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                child: const Text('출발'),
              ),
              const SizedBox(
                width: 15,
              ),
              TextButton(
                onPressed: null,
                style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(90, 50)),
                  backgroundColor: const MaterialStatePropertyAll(
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
                width: 15,
              ),
              TextButton(
                onPressed: null,
                style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(130, 50)),
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xFF0065ff)),
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
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
