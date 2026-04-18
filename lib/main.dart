import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Share/HomePageScreen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:patient_jamm_sante/l10n/app_localizations.dart';
 
Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://bcf81bb1453723a335da6e64ce34c5f1@o4510801178460160.ingest.us.sentry.io/4510801180229632';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: (){
      logAppStart();
      runApp(SentryWidget(child: const MyApp()));
    }
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      home: HomePageScreen(),
    );
  }
}

void logAppStart(){
  Sentry.addBreadcrumb(
    Breadcrumb(
      message: 'App Started',
      level: SentryLevel.info,
      timestamp: DateTime.now()
    )
  );
}
