import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class LoadingPageState extends State<LoadingPage> {
  bool loading = true;
  double _logoOpacityLevel = 0.0;
  bool _minimumTimerExpired = false;
  bool _loadingSequenceCompleted = false;
  late final Timer _minimumDelayTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logoOpacityLevel = 1.0;
      setState(() {});
    });
    _loadSequence().then((_) {
      ///ToDo after initialization
    });
  }

  @override
  void dispose() {
    _minimumDelayTimer.cancel();
    super.dispose();
  }

  Future<dynamic> _loadSequence() async {
    try {
      _minimumDelayTimer = Timer(
        const Duration(milliseconds: 1800),
        _onMinimumTimerExpire,
      );

      await _initInternalServices();
      await _initConfig();

      _onLoadingSequenceCompleted();
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  void _onMinimumTimerExpire() {
    _minimumTimerExpired = true;
    _onDoneLoading();
  }

  void _onLoadingSequenceCompleted() {
    _loadingSequenceCompleted = true;
    _onDoneLoading();
  }

  Future<void> _onDoneLoading() async {
    if (_loadingSequenceCompleted && _minimumTimerExpired) {
      loading = false;
      _navigateToHome();
    }
  }

  Future<void> _navigateToHome() async {
    final bool isAuthorized =
        Preferences.instance.getString(PreferenceKeys.USER_TOKEN) != null;
    if (isAuthorized) {
      context.pushReplacement(
        const HomePage(),
      );

      return;
    }
    context.pushReplacement(
      const LoginPage(),
    );
  }

  Future<void> _initInternalServices() async {}

  Future<void> _initConfig() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: _logoOpacityLevel,
            child: Align(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  context.theme.primary,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  PngAsset.logo,
                  width: MediaQuery.of(context).size.width / 3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 4,
            child: LinearProgressIndicator(
              backgroundColor: context.theme.surfaceVariant,
              color: context.theme.primary,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({
    super.key,
  });

  @override
  State<LoadingPage> createState() => LoadingPageState();
}
