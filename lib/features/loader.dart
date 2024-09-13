import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/util/exports.dart';

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

  Future<void> _navigateToHome() async {}

  Future<void> _initInternalServices() async {}

  Future<void> _initConfig() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: _logoOpacityLevel,
            child: Align(
              child: Image.network(
                'https://i.imgur.com/IWvwaJz.png',
                width: 196,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 4,
            child: LinearProgressIndicator(
              backgroundColor: context.theme.black,
              color: Colors.blue,
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
