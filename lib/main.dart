import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Share/HomePageScreen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
 
Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://bcf81bb1453723a335da6e64ce34c5f1@o4510801178460160.ingest.us.sentry.io/4510801180229632';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRateyyywyyeyye
      // Setting to 1.0 will profile 100% of sampled transactions:
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
