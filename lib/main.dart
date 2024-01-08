import 'package:config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rio_tudo/rio_tudo.dart';
import 'dart:async';
import 'package:uni_links/uni_links.dart';

bool _initialURILinkHandled = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SetupGetItLoadInterface? _modules;

  try {
    _modules = await _loadSetup();
  } catch (e) {}

  runApp(RioTudoApp(
    modules: _modules!,
  ));
}

Future<SetupGetItLoadInterface> _loadSetup() async {
  SetupGetItLoadInterface setupGetit = SetupGetit();
  await setupGetit.setupServices([RioTudoSetupModule()]);
  return setupGetit;
}

/*class RioTudoApp extends StatelessWidget {
  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;

  StreamSubscription? _sub;

  SetupGetItLoadInterface modules;
  RioTudoApp({super.key, required this.modules});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: modules.routes!,
      title: 'Rio Tudo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.primaryColor),
        useMaterial3: true,
      ),
      home: const SubCategoryScreen(),
    );
  }
}*/

// ...

class RioTudoApp extends StatefulWidget {
  SetupGetItLoadInterface modules;
  RioTudoApp({super.key, required this.modules});

  @override
  State<RioTudoApp> createState() => _RioTudoAppState();
}

class _RioTudoAppState extends State<RioTudoApp> {
  Uri? _initialURI;
  Uri? _currentURI;
  Object? _err;

  StreamSubscription? _streamSubscription;

  Future<void> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final initialLink = await getInitialUri();
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      if (initialLink != null) {
        print("foi");
      }
      setState(() {
        _initialURI = initialLink;
      });
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  void _incomingLinkHandler() {
    // 1
    if (!kIsWeb) {
      // 2
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (!mounted) {
          return;
        }
        debugPrint('Received URI: $uri');
        setState(() {
          _currentURI = uri;
          _err = null;
        });
        // 3
      }, onError: (Object err) {
        if (!mounted) {
          return;
        }
        debugPrint('Error occurred: $err');
        setState(() {
          _currentURI = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    /*initUniLinks();
 _incomingLinkHandler();*/
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: widget.modules.routes!,
      title: 'Rio Tudo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.primaryColor),
        useMaterial3: true,
      ),
      home: HomeScreen(
        presenterHomeScreen: makeHomePresenter(),
      ),
    );
  }
}
