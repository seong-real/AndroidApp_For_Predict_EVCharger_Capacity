import 'package:flutter/material.dart';
import 'package:tmap_raster_flutter_sample/models/station_info.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tmap_raster_flutter_sample/models/detail_info.dart';
import 'package:tmap_raster_flutter_sample/services/api_time.dart';

class DetailScreen extends StatelessWidget {
  final StationInfo stationInfo;
  final Future<DetailInfo> timestation;

  DetailScreen({
    super.key,
    required this.stationInfo,
  }) : timestation = TimeApiService.getStationInfo(stationInfo.sid);

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
      body: FutureBuilder(
        future: timestation,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
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
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13)),
                    const Icon(
                      Icons.place,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      stationInfo.address,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13)),
                    const Icon(
                      Icons.ev_station,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '지난 4시간 동안 사용된 평균 충전기 수 : ${snapshot.data?.charAvg4}/${snapshot.data?.fast}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
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
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13)),
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
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade500),
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
                    height: 380.0,
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
                            height: 230,
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
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${stationInfo.name}의 20분 뒤 상태는',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                          ),
                                      children: <TextSpan>[
                                        if (stationInfo.occupancy_20 == 0)
                                          const TextSpan(
                                            text: '여유',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 87, 195, 90)),
                                          ),
                                        if (stationInfo.occupancy_20 == 1)
                                          const TextSpan(
                                            text: '보통',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 243, 224, 56)),
                                          ),
                                        if (stationInfo.occupancy_20 == 2)
                                          const TextSpan(
                                            text: '혼잡',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red),
                                          ),
                                        const TextSpan(text: ' 일 것이라 예측됩니다.')
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    '지난 한 달간 이 시간 사용된',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            letterSpacing: -1.0,
                                            wordSpacing: -7.0,
                                          ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: '평균 충전기 수는',
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${snapshot.data?.charAvg20} /  ${snapshot.data?.fast} ',
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const TextSpan(text: '대입니다.')
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
                          right: 20,
                          child: Image(
                            image: AssetImage('image/adothand.png'),
                            width: 100,
                            height: 160,
                          ),
                        ),
                        const Positioned(
                            bottom: 5,
                            left: 10,
                            child: Image(
                              image: AssetImage('image/charger.png'),
                              width: 250,
                              height: 110,
                            ))
                      ],
                    ),
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
                            height: 230,
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
                                    '40분 뒤',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${stationInfo.name}의 40분 뒤 상태는',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                          ),
                                      children: <TextSpan>[
                                        if (stationInfo.occupancy_40 == 0)
                                          const TextSpan(
                                            text: '여유',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 87, 195, 90)),
                                          ),
                                        if (stationInfo.occupancy_40 == 1)
                                          const TextSpan(
                                            text: '보통',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 243, 224, 56)),
                                          ),
                                        if (stationInfo.occupancy_40 == 2)
                                          const TextSpan(
                                            text: '혼잡',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red),
                                          ),
                                        const TextSpan(text: ' 일 것이라 예측됩니다.')
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    '지난 한 달간 이 시간 사용된',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            letterSpacing: -1.0,
                                            wordSpacing: -7.0,
                                          ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: '평균 충전기 수는',
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${snapshot.data?.charAvg40} /  ${snapshot.data?.fast} ',
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const TextSpan(text: '대입니다.')
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
                          right: 20,
                          child: Image(
                            image: AssetImage('image/adothand.png'),
                            width: 100,
                            height: 160,
                          ),
                        ),
                        const Positioned(
                            bottom: 5,
                            left: 10,
                            child: Image(
                              image: AssetImage('image/charger.png'),
                              width: 250,
                              height: 110,
                            ))
                      ],
                    ),
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
                            height: 230,
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
                                    '60분 뒤',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${stationInfo.name}의 60분 뒤 상태는',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                          ),
                                      children: <TextSpan>[
                                        if (stationInfo.occupancy_60 == 0)
                                          const TextSpan(
                                            text: '여유',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 87, 195, 90)),
                                          ),
                                        if (stationInfo.occupancy_60 == 1)
                                          const TextSpan(
                                            text: '보통',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 243, 224, 56)),
                                          ),
                                        if (stationInfo.occupancy_60 == 2)
                                          const TextSpan(
                                            text: '혼잡',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red),
                                          ),
                                        const TextSpan(text: ' 일 것이라 예측됩니다.')
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    '지난 한 달간 이 시간 사용된',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            letterSpacing: -1.0,
                                            wordSpacing: -7.0,
                                          ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: '평균 충전기 수는',
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${snapshot.data?.charAvg60} /  ${snapshot.data?.fast} ',
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const TextSpan(text: '대입니다.')
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
                          right: 20,
                          child: Image(
                            image: AssetImage('image/adothand.png'),
                            width: 100,
                            height: 160,
                          ),
                        ),
                        const Positioned(
                            bottom: 5,
                            left: 10,
                            child: Image(
                              image: AssetImage('image/charger.png'),
                              width: 250,
                              height: 110,
                            ))
                      ],
                    ),
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
                            height: 230,
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
                                    '120분 뒤',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${stationInfo.name}의 120분 뒤 상태는',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                          ),
                                      children: <TextSpan>[
                                        if (stationInfo.occupancy_120 == 0)
                                          const TextSpan(
                                            text: '여유',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 87, 195, 90)),
                                          ),
                                        if (stationInfo.occupancy_120 == 1)
                                          const TextSpan(
                                            text: '보통',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 243, 224, 56)),
                                          ),
                                        if (stationInfo.occupancy_120 == 2)
                                          const TextSpan(
                                            text: '혼잡',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red),
                                          ),
                                        const TextSpan(text: ' 일 것이라 예측됩니다.')
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    '지난 한 달간 이 시간 사용된',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            letterSpacing: -1.0,
                                            wordSpacing: -7.0,
                                          ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: '평균 충전기 수는',
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${snapshot.data?.charAvg120} /  ${snapshot.data?.fast} ',
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const TextSpan(text: '대입니다.')
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
                          right: 20,
                          child: Image(
                            image: AssetImage('image/adothand.png'),
                            width: 100,
                            height: 160,
                          ),
                        ),
                        const Positioned(
                            bottom: 5,
                            left: 10,
                            child: Image(
                              image: AssetImage('image/charger.png'),
                              width: 250,
                              height: 110,
                            ))
                      ],
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
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(130, 50)),
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
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
