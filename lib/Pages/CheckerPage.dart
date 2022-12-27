// import 'package:bloodpressure/Components/Diastolic.dart';
// import 'package:bloodpressure/Components/Explaination.dart';
// import 'package:bloodpressure/Components/Pulse.dart';
// import 'package:bloodpressure/Components/SystolicNum.dart';
// import 'package:bloodpressure/Database/BpModel.dart';
// import 'package:bloodpressure/Pages/HistoryPage.dart';
// import 'package:bloodpressure/Pages/LandingPage.dart';
// import 'package:facebook_audience_network/ad/ad_native.dart';
// import 'package:flutter/material.dart';
//
// import '../Database/DbModel.dart';
//
// class CheckerPage extends StatefulWidget {
//   const CheckerPage({Key? key}) : super(key: key);
//
//   @override
//   State<CheckerPage> createState() => _CheckerPageState();
// }
//
// class _CheckerPageState extends State<CheckerPage> {
//   int _currentSys = 50;
//   int _currentDia = 50;
//   int _currentPulse = 20;
//   String bloodPressure = "Normal Blood Pressure";
//   Color currentColor = Colors.green;
//   String currentState = "normal";
//   History history = const History();
//   String text =
//       "Blood pressure numbers of less than 120/80 mm Hg are considered within the normal range. If your results fall into this category, stick with heart-healthy habits like following a balanced diet and getting regular exercise.";
//
//
//
//   @override
//   void initState() {
//     _showNativeAd();
//     super.initState();
//   }
//
//
//   Widget _currentAd = SizedBox(
//     width: 0.0,
//     height: 0.0,
//   );
//
//   _showNativeAd() {
//     setState(() {
//       _currentAd = _nativeAd();
//     });
//   }
//
//   Widget _nativeAd() {
//     return FacebookNativeAd(
//       //1316724952486390_1316726822486203
//       placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964952163583650",
//       adType: NativeAdType.NATIVE_AD_VERTICAL,
//       width: double.infinity,
//       height: 300,
//       backgroundColor: Colors.blue,
//       titleColor: Colors.white,
//       descriptionColor: Colors.white,
//       buttonColor: Colors.deepPurple,
//       buttonTitleColor: Colors.white,
//       buttonBorderColor: Colors.white,
//       listener: (result, value) {
//         print("Native Ad: $result --> $value");
//       },
//       keepExpandedWhileLoading: true,
//       expandAnimationDuraion: 1000,
//     );
//   }
//
//   // This function will be passed down to the Child widget.
//   void appendDia(int dia) {
//     setState(() {
//       _currentDia = dia;
//     });
//     print(_currentDia.toString());
//     calculateBloodPressure();
//   }
//
//   // This function will be passed down to the Child widget.
//   void appendPulse(int dia) {
//     setState(() {
//       _currentPulse = dia;
//     });
//     print(_currentPulse.toString());
//     calculateBloodPressure();
//   }
//
//   // This function will be passed down to the Child widget.
//   void appendSys(int dia) {
//     setState(() {
//       _currentSys = dia;
//     });
//     print(_currentSys.toString());
//     calculateBloodPressure();
//   }
//
//   calculateBloodPressure() {
//     print("current stat $bloodPressure");
//
//     if (_currentSys < 120 && _currentDia < 80) {
//       setState(() {
//         bloodPressure = "Normal Blood Pressure";
//         currentColor = Colors.green;
//         text =
//             "Blood pressure numbers of less than 120/80 mm Hg are considered within the normal range. If your results fall into this category, stick with heart-healthy habits like following a balanced diet and getting regular exercise.";
//       });
//     } else {
//       if (_currentSys > 119 && _currentSys < 130) {
//         if (_currentDia < 80) {
//           setState(() {
//             bloodPressure = "Elevated Blood Pressure";
//             currentColor = Colors.yellow.shade700;
//             currentState == "stage1";
//             text =
//                 "Elevated blood pressure is when readings consistently range from 120-129 systolic and less than 80 mm Hg diastolic. People with elevated blood pressure are likely to develop high blood pressure unless steps are taken to control the condition.";
//           });
//         }
//       }
//
//       if (_currentSys > 129 || _currentDia > 79) {
//         setState(() {
//           bloodPressure = "High Blood Pressure - Stage 1";
//           currentColor = Colors.orangeAccent.shade400;
//           currentState == "stage2";
//           text =
//               "Hypertension Stage 1 is when blood pressure consistently ranges from 130-139 systolic or 80-89 mm Hg diastolic. At this stage of high blood pressure, doctors are likely to prescribe lifestyle changes and may consider adding blood pressure medication based on your risk of atherosclerotic cardiovascular disease (ASCVD), such as heart attack or stroke.";
//         });
//       }
//
//       if (_currentSys > 139 || _currentDia > 89) {
//         setState(() {
//           bloodPressure = "High Blood Pressure - Stage 2";
//           currentColor = Colors.deepOrange.shade400;
//           currentState == "stage3";
//           text =
//               "Hypertension Stage 2 is when blood pressure consistently ranges at 140/90 mm Hg or higher. At this stage of high blood pressure, doctors are likely to prescribe a combination of blood pressure medications and lifestyle changes.";
//         });
//       }
//
//       if (_currentSys > 180 || _currentDia > 120) {
//         setState(() {
//           bloodPressure = "Dangerously High Blood Pressure";
//           currentColor = Colors.red.shade700;
//           currentState == "stage4";
//           text =
//               "This stage of high blood pressure requires medical attention. If your blood pressure readings suddenly exceed 180/120 mm Hg, wait five minutes and then test your blood pressure again. If your readings are still unusually high, contact your doctor immediately. You could be experiencing a hypertensive crisis.";
//         });
//       }
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushAndRemoveUntil<dynamic>(
//               context,
//               MaterialPageRoute<dynamic>(
//                 builder: (BuildContext context) => LandingPage(),
//               ),
//                   (route) => false,//if you want to disable back feature set to false
//             );
//           },
//           child: Icon(Icons.arrow_back_ios_new),
//         ),
//         elevation: 0.0,
//         centerTitle: true,
//         title: const Text(
//           "NEW RECORD",
//           style: TextStyle(
//               fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'saira'),
//         ),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                   child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15.0),
//                       color: currentColor,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Text(
//                         bloodPressure.toString(),
//                         style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white),
//                       ),
//                     )),
//               )),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SystolicNum(callback: appendSys),
//                     Diastolic(callback: appendDia),
//                     Pulse(callback: appendPulse),
//                   ],
//                 ),
//               ),
//               const Center(
//                 child: Text(
//                   "Explanation",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 25,
//                       color: Colors.blue,
//                       fontFamily: 'saira'),
//                 ),
//               ),
//               ExplainState(text: text),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 2,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     var bpInfo = BpInfo(
//                         sys: _currentSys.toString(),
//                         dia: _currentDia.toString(),
//                         pulse: _currentPulse.toString(),
//                         bpCondition: bloodPressure,
//                         creationDate: DateTime.now());
//                     addItem(bpInfo);
//                   },
//                   child: const Text(
//                     "Save Record",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment(0, 1.0),
//                 child: _currentAd,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // create a database object so we can access database functions
//   var db = DatabaseConnect();
//
//   // function to add BP
//   void addItem(BpInfo bpInfo) async {
//     await db.insertBpRecord(bpInfo);
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => const History()));
//   }
// }

import 'package:bloodpressure/Components/Diastolic.dart';
import 'package:bloodpressure/Components/Explaination.dart';
import 'package:bloodpressure/Components/Pulse.dart';
import 'package:bloodpressure/Components/SystolicNum.dart';
import 'package:bloodpressure/Database/BpModel.dart';
import 'package:bloodpressure/Pages/HistoryPage.dart';
import 'package:bloodpressure/Pages/LandingPage.dart';
import 'package:facebook_audience_network/ad/ad_native.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

import '../Database/DbModel.dart';

class CheckerPage extends StatefulWidget {
  const CheckerPage({Key? key}) : super(key: key);

  @override
  State<CheckerPage> createState() => _CheckerPageState();
}

class _CheckerPageState extends State<CheckerPage> {
  int _currentSys = 50;
  int _currentDia = 50;
  int _currentPulse = 20;
  String bloodPressure = "Normal Blood Pressure";
  Color currentColor = Colors.green;
  String currentState = "normal";
  History history = const History();
  String text =
      "Blood pressure numbers of less than 120/80 mm Hg are considered within the normal range. If your results fall into this category, stick with heart-healthy habits like following a balanced diet and getting regular exercise.";

  @override
  void initState() {
    FacebookAudienceNetwork.init();
    _loadInterstitialAd();
    _showNativeAd();
    super.initState();
  }

  bool _isInterstitialAdLoaded = false;

  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "1316724952486390_1316726395819579",
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          _isInterstitialAdLoaded = true;

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  _showInterstitialAd() {
    if (_isInterstitialAdLoaded == true)
      FacebookInterstitialAd.showInterstitialAd();
    else
      print("Interstial Ad not yet loaded!");
  }

  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );

  _showNativeAd() {
    setState(() {
      _currentAd = _nativeAd();
    });
  }

  Widget _nativeAd() {
    return FacebookNativeAd(
      //1316724952486390_1316726822486203
      placementId: "1316724952486390_1316726822486203",
      adType: NativeAdType.NATIVE_AD_VERTICAL,
      width: double.infinity,
      height: 300,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        print("Native Ad: $result --> $value");
      },
      keepExpandedWhileLoading: true,
      expandAnimationDuraion: 1000,
    );
  }

  // This function will be passed down to the Child widget.
  void appendDia(int dia) {
    setState(() {
      _currentDia = dia;
    });
    print(_currentDia.toString());
    calculateBloodPressure();
  }

  // This function will be passed down to the Child widget.
  void appendPulse(int dia) {
    setState(() {
      _currentPulse = dia;
    });
    print(_currentPulse.toString());
    calculateBloodPressure();
  }

  // This function will be passed down to the Child widget.
  void appendSys(int dia) {
    setState(() {
      _currentSys = dia;
    });
    print(_currentSys.toString());
    calculateBloodPressure();
  }

  calculateBloodPressure() {
    print("current stat $bloodPressure");

    if (_currentSys < 120 && _currentDia < 80) {
      setState(() {
        bloodPressure = "Normal Blood Pressure";
        currentColor = Colors.green;
        text =
            "Blood pressure numbers of less than 120/80 mm Hg are considered within the normal range. If your results fall into this category, stick with heart-healthy habits like following a balanced diet and getting regular exercise.";
      });
    } else {
      if (_currentSys > 119 && _currentSys < 130) {
        if (_currentDia < 80) {
          setState(() {
            bloodPressure = "Elevated Blood Pressure";
            currentColor = Colors.yellow.shade700;
            currentState == "stage1";
            text =
                "Elevated blood pressure is when readings consistently range from 120-129 systolic and less than 80 mm Hg diastolic. People with elevated blood pressure are likely to develop high blood pressure unless steps are taken to control the condition.";
          });
        }
      }

      if (_currentSys > 129 || _currentDia > 79) {
        setState(() {
          bloodPressure = "High Blood Pressure - Stage 1";
          currentColor = Colors.orangeAccent.shade400;
          currentState == "stage2";
          text =
              "Hypertension Stage 1 is when blood pressure consistently ranges from 130-139 systolic or 80-89 mm Hg diastolic. At this stage of high blood pressure, doctors are likely to prescribe lifestyle changes and may consider adding blood pressure medication based on your risk of atherosclerotic cardiovascular disease (ASCVD), such as heart attack or stroke.";
        });
      }

      if (_currentSys > 139 || _currentDia > 89) {
        setState(() {
          bloodPressure = "High Blood Pressure - Stage 2";
          currentColor = Colors.deepOrange.shade400;
          currentState == "stage3";
          text =
              "Hypertension Stage 2 is when blood pressure consistently ranges at 140/90 mm Hg or higher. At this stage of high blood pressure, doctors are likely to prescribe a combination of blood pressure medications and lifestyle changes.";
        });
      }

      if (_currentSys > 180 || _currentDia > 120) {
        setState(() {
          bloodPressure = "Dangerously High Blood Pressure";
          currentColor = Colors.red.shade700;
          currentState == "stage4";
          text =
              "This stage of high blood pressure requires medical attention. If your blood pressure readings suddenly exceed 180/120 mm Hg, wait five minutes and then test your blood pressure again. If your readings are still unusually high, contact your doctor immediately. You could be experiencing a hypertensive crisis.";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                var bpInfo = BpInfo(
                    sys: _currentSys.toString(),
                    dia: _currentDia.toString(),
                    pulse: _currentPulse.toString(),
                    bpCondition: bloodPressure,
                    creationDate: DateTime.now());
                addItem(bpInfo);
              },
              child: Center(
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontFamily: 'bal',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => LandingPage(),
              ),
              (route) =>
                  false, //if you want to disable back feature set to false
            );
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "NEW RECORD",
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'saira'),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: currentColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        bloodPressure.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )),
              )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SystolicNum(callback: appendSys),
                    Diastolic(callback: appendDia),
                    Pulse(callback: appendPulse),
                  ],
                ),
              ),
              const Center(
                child: Text(
                  "Explanation",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.blue,
                      fontFamily: 'saira'),
                ),
              ),
              ExplainState(text: text),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    var bpInfo = BpInfo(
                        sys: _currentSys.toString(),
                        dia: _currentDia.toString(),
                        pulse: _currentPulse.toString(),
                        bpCondition: bloodPressure,
                        creationDate: DateTime.now());
                    addItem(bpInfo);
                  },
                  child: const Text(
                    "Save Record",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment(0, 1.0),
                  child: _currentAd,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // create a database object so we can access database functions
  var db = DatabaseConnect();

  // function to add BP
  void addItem(BpInfo bpInfo) async {
    await db.insertBpRecord(bpInfo);

    _showInterstitialAd();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const History()));
  }
}
