import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/common/routes/names.dart';
import 'package:frontend/common/widgets/text_field.dart';
import 'package:frontend/main.dart';

class AuthPage extends StatefulWidget{
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h
              ),
              child: buildBigText()
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.w,
                  vertical: 10.h
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 15.h
                      ),
                      child: Text(
                          "Введите учетные данные, "
                              "чтобы воспользоваться приложением"),
                    ),
                    SizedBox(height: 25.h),
                    buildEntryField("Введите эл.почту", controllerEmail),
                    buildEntryField("Введите пароль", controllerPassword),
                    buildSubmitButton(),
                    SizedBox(height: 75.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 15.h
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Еще нет учетки? "),
                          InkWell(
                            child: const Text(
                              'Зарегистрируйтесь!',
                              style: TextStyle(
                                  color: Colors.blue,
                              )
                            ),
                            onTap: () {
                              navigatorKey.currentState?.pushNamed(
                                  AppRoutes.registration);
                            }
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              )
            )
          ]
        ),
      )
    );
  }

  Widget buildSubmitButton(){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30.h,
        horizontal: 24.w
      ),
      child: SizedBox(
          width: 300.w,
          height: 60.h,
          child: ElevatedButton(
            onPressed: (){
              if (controllerEmail.text.isNotEmpty
                  && controllerPassword.text.isNotEmpty){
                navigatorKey.currentState?.pushNamed(
                    AppRoutes.service
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                          "Не все поля заполнены",
                          style: TextStyle(
                              fontSize: 22
                          ),
                        )
                    )
                );
              }
            },
            child: const Text("ВОЙТИ"),
          )
      )
    );
  }

  Widget buildEntryField(String hint, TextEditingController controller){
    return Padding (
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 10.h
      ),
      child: SizedBox(
        width: 200.w,
        child: CustomTextField(
            onTap: (){},
            isReadOnly: false,
            controller: controller,
            hint: hint,
            type: TextInputType.text,
            onChanged: (){},
            filter: null,
            length: 12
        ),
      )
    );
  }

  Widget buildBigText(){
    return Text(
      "ДОБРО ПОЖАЛОВАТЬ!",
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold
      )
    );
  }
}
