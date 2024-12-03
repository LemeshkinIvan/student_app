import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/pages/auth/bloc/auth_cubit.dart';
import 'package:frontend/pages/document/bloc/document_library_cubit.dart';
import 'package:frontend/pages/schedule/bloc/schedule_cubit.dart';
import 'package:frontend/pages/schedule_updated/bloc/updated_schedule_cubit.dart';
import 'package:frontend/pages/schedule_updated/schedule_updated_page.dart';
import 'package:frontend/pages/auth/auth_page.dart';
import 'package:frontend/pages/document/document_library_page.dart';
import 'package:frontend/pages/schedule/schedule_page.dart';
import 'package:frontend/pages/service/bloc/service_cubit.dart';
import 'package:frontend/pages/service/service_page.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: const AuthPage(),
        bloc: BlocProvider(create: (_) => AuthCubit())
      ),
      PageEntity(
        route: AppRoutes.service,
        page: const ServicePage(),
        bloc: BlocProvider(create: (_) => ServiceCubit())
      ),
      PageEntity(
        route: AppRoutes.documentLibrary,
        page: const DocumentLibraryPage(),
        bloc: BlocProvider(create: (_) => DocumentCubit())
      ),
      PageEntity(
        route: AppRoutes.schedule,
        page: const SchedulePage(),
        bloc: BlocProvider(create: (_) => ScheduleCubit())
      ),
      PageEntity(
        route: AppRoutes.updatedSchedule,
        page: const ScheduleUpdatedPage(),
        bloc: BlocProvider(create: (_) => UpdatedScheduleCubit())
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static PageRoute generateRouteSettings(RouteSettings settings){
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => result.first.page,
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, animation, __, child) {
              const beginOffset =
              Offset(1.0, 0.0); // Slide from right to left
              const endOffset = Offset.zero; // Slide to the center
              var offsetTween =
              Tween<Offset>(begin: beginOffset, end: endOffset);
              var offsetAnimation = animation
                  .drive(CurveTween(curve: Curves.easeInOut))
                  .drive(offsetTween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            settings: settings
        );
      }
    }
    return MaterialPageRoute(
        builder: (_) => const AuthPage(), settings: settings
    );
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
