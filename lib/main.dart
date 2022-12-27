import 'package:bloodpressure/Database/BpModel.dart';
import 'package:bloodpressure/Database/DbModel.dart';
import 'package:bloodpressure/Pages/LandingPage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Pressure Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int pageIndex = 0;
//
//   final pages = [
//     const Page1(),
//     const Page2(),
//     const Page3(),
//     const Page4(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffC4DFCB),
//       appBar: AppBar(
//         leading: Icon(
//           Icons.menu,
//           color: Theme.of(context).primaryColor,
//         ),
//         title: Text(
//           "Geeks For Geeks",
//           style: TextStyle(
//             color: Theme.of(context).primaryColor,
//             fontSize: 25,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: pages[pageIndex],
//       bottomNavigationBar: buildMyNavBar(context),
//     );
//   }
//
//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 0;
//               });
//             },
//             icon: pageIndex == 0
//                 ? const Icon(
//                     Icons.home_filled,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.home_outlined,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 1;
//               });
//             },
//             icon: pageIndex == 1
//                 ? const Icon(
//                     Icons.work_rounded,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.work_outline_outlined,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 2;
//               });
//             },
//             icon: pageIndex == 2
//                 ? const Icon(
//                     Icons.widgets_rounded,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.widgets_outlined,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 3;
//               });
//             },
//             icon: pageIndex == 3
//                 ? const Icon(
//                     Icons.person,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.person_outline,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Page1 extends StatelessWidget {
//   const Page1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 1",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page2 extends StatelessWidget {
//   const Page2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 2",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page3 extends StatelessWidget {
//   const Page3({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 3",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page4 extends StatelessWidget {
//   const Page4({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 4",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }


//
//
//
//
//
//
// class UnityAdsExampleApp extends StatelessWidget {
//   const UnityAdsExampleApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Unity Ads Example',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Unity Ads Example'),
//         ),
//         body: const SafeArea(
//           child: UnityAdsExample(),
//         ),
//       ),
//     );
//   }
// }
//
// class UnityAdsExample extends StatefulWidget {
//   const UnityAdsExample({Key? key}) : super(key: key);
//
//   @override
//   _UnityAdsExampleState createState() => _UnityAdsExampleState();
// }
//
// class _UnityAdsExampleState extends State<UnityAdsExample> {
//   bool _showBanner = false;
//   Map<String, bool> placements = {
//     AdManager.interstitialVideoAdPlacementId: true,
//     AdManager.rewardedVideoAdPlacementId: true,
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     UnityAds.init(
//       gameId: AdManager.gameId,
//       testMode: true,
//       onComplete: () {
//         print('Initialization Complete');
//         _loadAds();
//       },
//       onFailed: (error, message) => print('Initialization Failed: $error $message'),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _showBanner = !_showBanner;
//                   });
//                 },
//                 child: Text(_showBanner ? 'Hide Banner' : 'Show Banner'),
//               ),
//               ElevatedButton(
//                 onPressed: placements[AdManager.rewardedVideoAdPlacementId] == true
//                     ? () => _showAd(AdManager.rewardedVideoAdPlacementId)
//                     : null,
//                 child: const Text('Show Rewarded Video'),
//               ),
//               ElevatedButton(
//                 onPressed: placements[AdManager.interstitialVideoAdPlacementId] == true
//                     ? () => _showAd(AdManager.interstitialVideoAdPlacementId)
//                     : null,
//                 child: const Text('Show Interstitial Video'),
//               ),
//             ],
//           ),
//           if (_showBanner)
//             UnityBannerAd(
//               placementId: AdManager.bannerAdPlacementId,
//               onLoad: (placementId) => print('Banner loaded: $placementId'),
//               onClick: (placementId) => print('Banner clicked: $placementId'),
//               onFailed: (placementId, error, message) =>
//                   print('Banner Ad $placementId failed: $error $message'),
//             ),
//         ],
//       ),
//     );
//   }
//
//   void _loadAds() {
//     for (var placementId in placements.keys) {
//       _loadAd(placementId);
//     }
//   }
//
//   void _loadAd(String placementId) {
//     UnityAds.load(
//       placementId: placementId,
//       onComplete: (placementId) {
//         print('Load Complete $placementId');
//         setState(() {
//           placements[placementId] = true;
//         });
//       },
//       onFailed: (placementId, error, message) => print('Load Failed $placementId: $error $message'),
//     );
//   }
//
//   void _showAd(String placementId) {
//     setState(() {
//       placements[placementId] = false;
//     });
//     UnityAds.showVideoAd(
//       placementId: placementId,
//       onComplete: (placementId) {
//         print('Video Ad $placementId completed');
//         _loadAd(placementId);
//       },
//       onFailed: (placementId, error, message) {
//         print('Video Ad $placementId failed: $error $message');
//         _loadAd(placementId);
//       },
//       onStart: (placementId) => print('Video Ad $placementId started'),
//       onClick: (placementId) => print('Video Ad $placementId click'),
//       onSkipped: (placementId) {
//         print('Video Ad $placementId skipped');
//         _loadAd(placementId);
//       },
//     );
//   }
// }
//
// class AdManager {
//   static String get gameId {
//     if (defaultTargetPlatform == TargetPlatform.android) {
//       return '5092495';
//     }
//     if (defaultTargetPlatform == TargetPlatform.iOS) {
//       return '5092495';
//     }
//     return '';
//   }
//
//   static String get bannerAdPlacementId {
//     return 'Banner_Android';
//   }
//
//   static String get interstitialVideoAdPlacementId {
//     return 'Interstitial_Android';
//   }
//
//   static String get rewardedVideoAdPlacementId {
//     return 'Rewarded_Android';
//   }
// }