import 'package:bloodpressure/Components/MaxMinCard.dart';
import 'package:bloodpressure/Database/DbModel.dart';
import 'package:bloodpressure/Pages/LandingPage.dart';
import 'package:facebook_audience_network/ad/ad_native.dart';
import 'package:flutter/material.dart';

class GeneralStats extends StatefulWidget {
  const GeneralStats({Key? key}) : super(key: key);

  @override
  State<GeneralStats> createState() => _GeneralStatsState();
}

class _GeneralStatsState extends State<GeneralStats> {
  @override
  void initState() {
    _showNativeBannerAd();
    setState(() {});
    super.initState();
  }

  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );

  _showNativeBannerAd() {
    setState(() {
      _currentAd = _nativeBannerAd();
    });
  }

  Widget _nativeBannerAd() {
    return FacebookNativeAd(
      placementId: "1316724952486390_1316746842484201",
      // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      height: 110,
      listener: (result, value) {
        print("Native Banner Ad: $result --> $value");
      },
    );
  }

  var db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.question_mark_sharp),
            )
          ],
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "TRACKER",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'saira'),
          ),
        ),
        body: FutureBuilder(
          future: db.getBpRecord(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            var data = snapshot.data;
            var dataLength = data!.length;
            return dataLength == 0
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red.shade200,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 1.01,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 8, bottom: 8),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Highest Recoded",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'bal'),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Systolic",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.red.shade900,
                                                fontFamily: 'bal'),
                                          ),
                                          Text(
                                            "0",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontFamily: 'bal'),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Diastolic",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.red.shade900,
                                                  fontFamily: 'bal'),
                                            ),
                                            Text(
                                              "0",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontFamily: 'bal'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Pulse",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.red.shade900,
                                                fontFamily: 'bal'),
                                          ),
                                          Text(
                                            "0",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontFamily: 'bal'),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.shade200,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 1.01,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 8, bottom: 8),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Lowest Recoded",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blue.shade900,
                                              fontFamily: 'bal'),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Systolic",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.blue.shade900,
                                                fontFamily: 'bal'),
                                          ),
                                          Text(
                                            "0",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontFamily: 'bal'),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Diastolic",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.blue.shade900,
                                                  fontFamily: 'bal'),
                                            ),
                                            Text(
                                              "0",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontFamily: 'bal'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Pulse",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.blue.shade900,
                                                fontFamily: 'bal'),
                                          ),
                                          Text(
                                            "0",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontFamily: 'bal'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) =>
                                        LandingPage(),
                                  ),
                                  (route) =>
                                      false, //if you want to disable back feature set to false
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green.shade600,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Refresh Stats ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontFamily: 'bal'),
                                      ),
                                      Icon(
                                        Icons.refresh,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment(0, 1.0),
                                child: _currentAd,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : MaxMinCard(
                    data: data,
                  );
          },
        ));
  }
}
