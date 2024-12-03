import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/global.dart';
import 'common/routes/pages.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const Frontend());
}

class Frontend extends StatelessWidget {
  const Frontend({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]
    );

    Global.init();

    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          minTextAdapt: true,
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            title: '',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppPages.generateRouteSettings,
          )
      )
    );
  }
}