import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eos_advance_login/theme/light_theme.dart';
import 'package:eos_advance_login/theme/foundation/app_theme.dart';
import 'package:eos_advance_login/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  late final AppTheme theme = LightTheme();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: theme.color.surface,
        body: SafeArea(
          child: Column(
            children: [
              // EOS 로고 표시
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 40, bottom: 24),
                child: Image.asset(
                  'assets/images/eos_logo.png',
                  width: 360,
                  height: 144,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // 이메일 입력 필드
                    _buildTextField(
                      controller: _emailController,
                      labelText: '이메일',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    // 비밀번호 입력 필드
                    _buildTextField(
                      controller: _passwordController,
                      labelText: '비밀번호',
                      prefixIcon: Icons.lock_outline,
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: theme.color.subtext,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    // 로그인 버튼
                    _buildButton(
                      text: '로그인',
                      onPressed: () => _handleEmailLogin(context),
                      backgroundColor: theme.color.primary,
                      textColor: theme.color.onPrimary,
                    ),
                    const SizedBox(height: 16),
                    // 비밀번호 찾기 & 회원가입 링크
                    _buildAccountActions(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: theme.typo.body1,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: theme.typo.subtitle2.copyWith(color: theme.color.subtext),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.color.hint, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.color.inactive, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.color.primary, width: 2),
        ),
        filled: true,
        fillColor: theme.color.background.withOpacity(0.3),
        prefixIcon: Icon(prefixIcon, color: theme.color.primary),
        suffixIcon: suffixIcon,
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: theme.typo.subtitle1.copyWith(color: textColor),
        ),
      ),
    );
  }

  Widget _buildAccountActions() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextButton(
        onPressed: () {},
    child: Text(
    '비밀번호 재설정',
    style: theme.typo.body1.copyWith(color: theme.color.subtext),
    ),
    ),
    Container(
    height: 16,
    width: 1,
    color: theme.color.hint,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    ),
    TextButton(
    onPressed: () {},
    child: Text(
    '회원가입',
    style: theme.typo.body1.copy
