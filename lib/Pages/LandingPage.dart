import 'package:bloodpressure/Pages/CheckerPage.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: pageIndex == 0 ?  FloatingActionButton(
          // isExtended: true,
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  const CheckerPage()));
          },
          // isExtended: true,
          child:  const Icon(Icons.add,
          size: 30,),
        ): null,
      ),
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
                        size: 25,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 25,
                      ),
              ),
              const Text(
                "TRACKER",
                style: TextStyle(
                    fontFamily: 'saira',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                fontSize: 12),
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
                        size: 25,
                      )
                    : const Icon(
                        Icons.work_history_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
              ),
              Text(
                "HISTORY",
                style: TextStyle(
                    fontFamily: 'saira',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                fontSize: 12),
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
                        size: 25,
                      )
                    : const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 25,
                      ),
              ),
              const Text(
                "INFO",
                style: TextStyle(
                    fontFamily: 'saira',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
