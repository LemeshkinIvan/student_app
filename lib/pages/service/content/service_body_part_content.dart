import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/common/routes/names.dart';
import 'package:frontend/common/values/colors.dart';
import 'package:frontend/common/widgets/modal.dart';
import 'package:frontend/main.dart';
import 'package:frontend/pages/document/bloc/document_library_cubit.dart';
import 'package:frontend/pages/document/bloc/document_library_state.dart';
import 'package:frontend/pages/moke/moke.dart';
import 'package:frontend/pages/service/content/big_button.dart';

class ServiceBodyPartContent extends StatefulWidget {
  const ServiceBodyPartContent({super.key});

  @override
  State<ServiceBodyPartContent> createState() => _ServiceBodyPartContentState();
}

class _ServiceBodyPartContentState extends State<ServiceBodyPartContent> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w
                ),
                child: GestureDetector(
                  onTap: (){
                    navigatorKey.currentState?.pushNamed(AppRoutes.schedule);
                  },
                  child: Container(
                    height: 200.h,
                    width: 135.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("/icons/schedule_static.png"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        width: 0.1.w,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          "Расписание", textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 5.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black
                          ),
                        ),
                      )
                    )
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 12.w
                ),
                child: GestureDetector(
                    onTap: (){
                      navigatorKey.currentState?.pushNamed(
                          AppRoutes.updatedSchedule);
                    },
                    child: Container(
                        height: 200.h,
                        width: 135.w,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("/icons/schedule_updated.webp"),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            width: 0.1.w,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Text(
                                "Изменения в расписании", textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 5.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black
                                ),
                              ),
                            )
                        )
                    )
                ),
              ),
            ]
          ),
          SizedBox(height: 25.h),
          BigButton("Мои документы", "/icons/document_lib.jpg",
            (){navigatorKey.currentState?.pushNamed(AppRoutes.documentLibrary);},
            width: 310.w,
            heightPadding: 20.h,
            height: 220.h,
          ),
          BigButton("Заказать документы",
            "/icons/order.webp", (){buildModalDocumentOrder();},
            width: 310.w,
            heightPadding: 20.h,
            height: 220.h,
          )
        ]
      )
    );
  }

  void buildModalDocumentOrder(){
    Document selectedObject = documents[0];
    String selectedFilter = documents[0].name;

    // bloc update
    buildDefaultModal(
      context,
      Container(
        width: 200.w,
        height: 340.h,
        child: Column(
          children: [
            Text("Заказ документа",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 6.h
              ),
              child: SizedBox(
                width: 200.w,
                height: 70.h,
                child: BlocBuilder<DocumentCubit, DocumentState>(
                    builder: (context, state){
                      var type = state.selectedDocumentType;
                      return DropdownButton(
                    onChanged: (value){
                      setState(() {
                        selectedFilter = value!;
                        context.read<DocumentCubit>()
                            .setSelectedDocumentType(selectedFilter);

                        selectedObject = documents.firstWhere(
                                (i) => i.name == selectedFilter
                        );
                      });
                    },
                    value: type,
                    items: documents.map(
                            (e) => DropdownMenuItem(
                          value: e.name,
                          child: Text(e.name),
                        )
                    ).toList(),
                  );
                })
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 10.h
              ),
              child: InkWell(
                  child: const Text(
                      'Подробнее о документе',
                      style: TextStyle(
                        color: Colors.blue,
                      )
                  ),
                  onTap: () {
                    buildDescriptionModal(selectedObject.description);
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 35.h
              ),
              child: SizedBox(
                width: 180.w,
                height: 55.h,
                child: ElevatedButton(
                  onPressed: (){
                    navigatorKey.currentState?.pop();
                  },
                  child: const Text("Заказать"),
                ),
              )
            )
          ],
        ),
      )
    );
  }

  void buildDescriptionModal(String content){
    buildDefaultModal(
        context,
        Column(
        children: [
          Expanded(
            child: SizedBox(
              width: 130.w,
              child: Text(content),
            )
          )
        ],
      )
    );
  }
}