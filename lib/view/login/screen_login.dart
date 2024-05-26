import 'package:flutter/material.dart';
import 'package:ontrend_task/utils/color_consts.dart';
import 'package:ontrend_task/view/home/screen_home.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.height * 0.35,
                  child: Image.asset('assets/delivery-man.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                _CustomTextFormField(
                  hintText: 'Email or Phone',
                  visibilityIcon: false,
                  obscureText: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                _CustomTextFormField(
                  hintText: 'Password',
                  visibilityIcon: true,
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: kBlueColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.062,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenHome(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenHome(),
                            ));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: kBlueColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool visibilityIcon;
  final bool obscureText;
  _CustomTextFormField({
    required this.hintText,
    required this.visibilityIcon,
    required this.obscureText,
  });

  final visibilityNotifier = ValueNotifier(true);

  void toggleVisibility() {
    visibilityNotifier.value = !visibilityNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.3),
              spreadRadius: 0.5,
              blurRadius: 5,
            )
          ],
        ),
        child: ValueListenableBuilder(
            valueListenable: visibilityNotifier,
            builder: (context, newValue, _) {
              return TextFormField(
                obscureText: newValue ? obscureText : false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  contentPadding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 14,
                  ),
                  suffixIcon: visibilityIcon
                      ? IconButton(
                          onPressed: () {
                            toggleVisibility();
                          },
                          icon: Icon(
                            newValue ? Icons.visibility : Icons.visibility_off,
                          ),
                        )
                      : const SizedBox(),
                ),
              );
            }));
  }
}
