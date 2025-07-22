import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/theme/app_color_pallet.dart';
import 'package:tiny_toes_gallery_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:tiny_toes_gallery_app/features/auth/presentation/widgets/auth_field.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColorPallet.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight - 100),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      color: AppColorPallet.textGreen.withValues(alpha: 40),
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),

                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColorPallet.textFieldBorder,
                          offset: Offset(0, 6),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/logo.png",
                        filterQuality: FilterQuality.high,
                        height: 150,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  Text(
                    "Welcome Tiny Toes",
                    style: TextStyle(
                      color: AppColorPallet.textAsh,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 30),

                  AuthField(hintText: "User Name"),

                  const SizedBox(height: 20),

                  AuthField(hintText: "Password", isObscureText: true),

                  const SizedBox(height: 30),

                  AuthButton(buttonText: 'Sign In'),

                  const Spacer(),

                  Text(
                    "Secure access for authorized users only.",
                    style: TextStyle(
                      color: AppColorPallet.textAsh,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
