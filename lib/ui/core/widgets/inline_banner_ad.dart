import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:eyelevel_kid/core/utils/ad_helper.dart';

class InlineBannerAd extends StatefulWidget {
  const InlineBannerAd({super.key});

  @override
  State<InlineBannerAd> createState() => _InlineBannerAdState();
}

class _InlineBannerAdState extends State<InlineBannerAd>
    with TickerProviderStateMixin {
  BannerAd? _bannerAd;
  AdSize? _adSize;
  bool _isLoaded = false;

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
    final availableWidth = screenWidth - 40;

    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      availableWidth,
    );

    if (!mounted || size == null) return;

    final bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) return;

          setState(() {
            _bannerAd = ad as BannerAd;
            _adSize = size;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('==== 배너 광고 로드 실패 ====');
          debugPrint('$err');
          ad.dispose();
        },
      ),
    );

    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    final bannerHeight = (_isLoaded && _bannerAd != null && _adSize != null)
        ? _adSize!.height.toDouble() + 32
        : 0.0;

    return ClipRect(
      child: AnimatedSize(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOutCubic,
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: bannerHeight,
          child: bannerHeight == 0
              ? const SizedBox.shrink()
              : Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: _adSize!.width.toDouble(),
              height: _adSize!.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
          ),
        ),
      ),
    );
  }
}