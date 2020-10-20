import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamatics/generated/codegen_loader.g.dart';
import 'package:gamatics/presentation/bloc/page_view/page_view_bloc.dart';
import 'package:gamatics/presentation/pages/landing_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('hi')],
      startLocale: Locale('en'),
      path: 'assets/translations',
      assetLoader: CodegenLoader(),
      fallbackLocale: Locale('en'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            elevation: 8,
            backgroundColor: Colors.white),
      ),
      home: BlocProvider(
          create: (context) => PageViewBloc(pageLength: 4),
          child: LandingPage()),
    );
  }
}
