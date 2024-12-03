import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/common/values/colors.dart';
import 'package:frontend/common/widgets/app_bar.dart';
import 'package:frontend/main.dart';
import 'package:frontend/pages/service/content/service_body_part_content.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  SearchController controller = SearchController();
  bool isEnabled = false;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: CustomAppBar(
          title: "Главная",
          leading: const SizedBox(),
          backgroundColor: null,
          actions:  [
            IconButton(
                onPressed: (){
                  navigatorKey.currentState?.pop();
                },
                icon: const Icon(Icons.exit_to_app_outlined)
            )
          ],
          onPressed: null,
          leadingColor: AppColors.black,
          line: true,
          controller: scrollController,
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            child: Column(
              children: [
                //const AccountContent(),
                const ServiceBodyPartContent(),
                SizedBox(height: 100.h),
              ]
            ),
          )
      )
  );

  @override
  void dispose(){
    super.dispose();
  }
}