import 'package:bloodpressure/Pages/GenralStatsPage.dart';
import 'package:bloodpressure/Pages/HistoryPage.dart';
import 'package:bloodpressure/Pages/InformationPage.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int pageIndex = 0;

  final pages = [
    const GeneralStats(),
    const History(),
    const InformationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 30,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      ),
              ),
              Text(
                "TRACKER",
                style: TextStyle(
                    fontFamily: 'saira',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                        Icons.work_history,
                        color: Colors.white,
                        size: 30,
                      )
                    : const Icon(
                        Icons.work_history_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
              ),
              Text(
                "HISTORY",
                style: TextStyle(
                    fontFamily: 'saira',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 30,
                      )
                    : const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 30,
                      ),
              ),
              Text(
                "INFO",
                style: TextStyle(
                    fontFamily: 'saira',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
