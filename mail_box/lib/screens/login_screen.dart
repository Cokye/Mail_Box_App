import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:mail_box/screens/main_screen.dart';

const users = {
  'admin@gmail.com': 'admin',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    await Future.delayed(loginTime);
    if (!users.containsKey(data.name)) {
      return 'User not exists';
    }
    if (users[data.name] != data.password) {
      return 'Password does not match';
    }
    return null; // Login successful
  }

  Future<String?> _signupUser(SignupData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    await Future.delayed(loginTime);
    // Aquí podrías agregar lógica para registrar al usuario
    return null; // Sign up successful
  }

  Future<String?> _recoverPassword(String name) async {
    debugPrint('Name: $name');
    await Future.delayed(loginTime);
    if (!users.containsKey(name)) {
      return 'User not exists';
    }
    return null; // Recovery email sent
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Mail Box',
      logo: const AssetImage('assets/images/logo_mail.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: Color(0xff243945), // Cambia el color primario según tu diseño
        accentColor: Color(0xff3b8d9e), // Cambia el color de acento si lo deseas
      ),
    );
  }
}
