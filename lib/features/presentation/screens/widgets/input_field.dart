import 'package:flutter/material.dart';

class InputField extends StatefulWidget{
  final FocusNode focusNode;
  final TextEditingController textController;
  final String label;
  final Icon icons;
   const InputField({
    Key? key,
     required this.focusNode,
     required this.textController,
     required this.label,
     required this.icons,
  }) : super(key: key);
  State<InputField> createState() => _InputFieldState();
}
 class _InputFieldState extends State<InputField> {
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;


  }
  @override
  Widget build(BuildContext context) {
    BorderRadius kBorderRadius = BorderRadius.circular(5.5);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.00),
      child: TextFormField(
        obscureText: _passwordVisible,
        controller: widget.textController,
        autofocus: false,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(widget.focusNode);
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: kBorderRadius),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: kBorderRadius),
            hintStyle: const TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.transparent,
            hintText: widget.label,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              icon: Icon(
                _passwordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              // iconSize: kDefaultPadding,
            ),
          prefixIcon: widget.icons
           ),
      ),
    );
  }
}