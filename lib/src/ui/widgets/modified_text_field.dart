import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Creates a TextField with properties in addition to the basic TextField
/// Widget. The Widget exposes a sub-set of properties available in the base
/// TextFeild Widget as per the requirements of the underline project.
///
/// The [label] must not be null
///
class ModifiedTextField extends StatelessWidget {
  const ModifiedTextField({
    TextEditingController textController,
    @required this.label,
    this.width,
    this.padding,
    this.borderColour,
    this.focusedBorderColour,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.keyboardType,
    this.inputFormatter,
    this.onSubmitted,
    this.focusNode,
    this.autoFocus,
    this.obscureText,
  }) : _textController = textController;

  final TextEditingController _textController;
  final double width;
  final String label;
  final EdgeInsets padding;
  final Color borderColour;
  final Color focusedBorderColour;
  final Widget suffixIcon;
  final Icon prefixIcon;
  final Function onChanged;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatter;
  final Function onSubmitted;
  final FocusNode focusNode;
  final bool autoFocus;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      padding: this.padding,
      margin: EdgeInsets.only(right: 10.0),
      child: TextFormField(
        controller: _textController,
        keyboardType: this.keyboardType,
        inputFormatters: this.inputFormatter,
        cursorColor: Colors.black45,
        style: TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          prefixIcon: this.prefixIcon,
          labelText: this.label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: this.suffixIcon,
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: this.borderColour != null
                  ? this.borderColour
                  : Colors.black54,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: this.focusedBorderColour != null
                  ? this.focusedBorderColour
                  : Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onChanged: this.onChanged,
        onFieldSubmitted: this.onSubmitted,
        focusNode: this.focusNode,
        autofocus: this.autoFocus ?? false,
        obscureText: this.obscureText ?? false,
      ),
    );
  }
}
