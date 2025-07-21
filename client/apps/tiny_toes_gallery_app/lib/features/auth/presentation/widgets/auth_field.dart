import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final bool isObscureText;

  const AuthField({
    super.key,
    required this.hintText,
    this.isObscureText = false,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(
            widget.isObscureText ? Icons.lock_outline : Icons.person_outline,
          ),
          suffixIcon: widget.isObscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
