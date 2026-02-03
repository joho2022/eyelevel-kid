import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:eyelevel_kid/core/utils/ad_helper.dart';

class InlineBannerAd extends StatefulWidget {
  const InlineBannerAd({super.key});

  @override
  State<InlineBannerAd> createState() => _InlineBannerAdState();
}

class _InlineBannerAdState extends State<InlineBannerAd> {
  BannerAd? _bannerAd;
  AdSize? _adSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAd();
    });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  Future<void> _loadAd() async {
    if (!mounted) return;

    final screenWidth = MediaQuery.of(context).size.width.truncate();

    final availableWidth = screenWidth - 42;
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      availableWidth,
    );

    if (size == null) {
      return;
    }

    if (mounted) {
      setState(() {
        _adSize = size;
      });
    }

    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.largeBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) {
            setState(() {
              _bannerAd = ad as BannerAd;
            });
          }
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint("Ad failed to load with error: $err");
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    if (_adSize == null) {
      return const SizedBox();
    }

    return SizedBox(
      width: _adSize!.width.toDouble(),
      height: _adSize!.height.toDouble(),
      child: _bannerAd != null ? AdWidget(ad: _bannerAd!) : const SizedBox(),
    );
  }
}
