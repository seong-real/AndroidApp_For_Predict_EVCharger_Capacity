import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  //final Future<List<StationInfo>> stations = ApiService.getStationInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "충전소 목록",
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),

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
