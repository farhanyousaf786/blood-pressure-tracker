import 'dart:math';

import 'package:bloodpressure/AddManager/adManager.dart';
import 'package:facebook_audience_network/ad/ad_native.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

import '../Database/DbModel.dart';
import '../Pages/LandingPage.dart';
import '../main.dart';

class MaxMinCard extends StatefulWidget {
  final List data;

  const MaxMinCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<MaxMinCard> createState() => _MaxMinCardState();
}

class _MaxMinCardState extends State<MaxMinCard> {
  late List<int> sysList = [];
  late List<int> diaList = [];
  late List<int> pulseList = [];
  late bool isLoading = true;

  @override
  void initState() {
    getStats();
    FacebookAudienceNetwork.init();

    _showNativeBannerAd();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });

    Future.delayed(const Duration(seconds: 60), () {
      _showAd(AdManager.interstitialVideoAdPlacementId);
    });

    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: true,
      onComplete: () {
        _loadAds();
      },
      onFailed: (error, message) =>
          print('Initialization Failed: $error $message'),
    );
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
      placementId: "1316724952486390_1316726292486256",
      // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      height: 110,
      listener: (result, value) {
        print("Native Banner Ad: $result --> $value");
      },
    );
  }

  getStats() {
    // loop into whole list
    for (int i = 0; i < widget.data.length; i++) {
      //convert string data into int so we can insert it into int list and track it easily
      var sys = int.parse(widget.data[i].sys);
      var dia = int.parse(widget.data[i].dia);
      var pulse = int.parse(widget.data[i].pulse);

      //insert data into each int list
      sysList.add(sys);
      diaList.add(dia);
      pulseList.add(pulse);
    }

    print(sysList.reduce(max));
    print(diaList.reduce(min));
    print(pulseList.reduce(min));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: Text(
            "Loading Data...",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
                fontFamily: 'bal'),
          ))
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
                                  "High",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red.shade900,
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
                                    sysList.reduce(max).toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontFamily: 'bal'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
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
                                      diaList.reduce(max).toString(),
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
                                    pulseList.reduce(max).toString(),
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
                    const SizedBox(
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
                                  "Low",
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
                                    sysList.reduce(min).toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontFamily: 'bal'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
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
                                      diaList.reduce(min).toString(),
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
                                    pulseList.reduce(min).toString(),
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
                    GestureDetector(
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
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UnityBannerAd(
                        placementId: AdManager.bannerAdPlacementId,
                        onLoad: (placementId) =>
                            print('Banner loaded: $placementId'),
                        onClick: (placementId) =>
                            print('Banner clicked: $placementId'),
                        onFailed: (placementId, error, message) => print(
                            'Banner Ad $placementId failed: $error $message'),
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
                      height: MediaQuery.of(context).size.height / 2,
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Map<String, bool> placements = {
    AdManager.interstitialVideoAdPlacementId: true,
    AdManager.rewardedVideoAdPlacementId: true,
  };

  void _loadAds() {
    for (var placementId in placements.keys) {
      _loadAd(placementId);
    }
  }

  void _loadAd(String placementId) {
    UnityAds.load(
      placementId: placementId,
      onComplete: (placementId) {
        print('Load Complete $placementId');
        setState(() {
          placements[placementId] = true;
        });
      },
      onFailed: (placementId, error, message) =>
          print('Load Failed $placementId: $error $message'),
    );
  }

  void _showAd(String placementId) {
    setState(() {
      placements[placementId] = false;
    });
    UnityAds.showVideoAd(
      placementId: placementId,
      onComplete: (placementId) {
        print('Video Ad $placementId completed');
        _loadAd(placementId);
      },
      onFailed: (placementId, error, message) {
        print('Video Ad $placementId failed: $error $message');
        _loadAd(placementId);
      },
      onStart: (placementId) => print('Video Ad $placementId started'),
      onClick: (placementId) => print('Video Ad $placementId click'),
      onSkipped: (placementId) {
        print('Video Ad $placementId skipped');
        _loadAd(placementId);
      },
    );
  }
}
