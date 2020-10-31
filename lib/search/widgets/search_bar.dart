import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    this.onChanged,
    this.trailing,
  }) : super(key: key);

  final ValueSetter<String> onChanged;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('searchBar_textField'),
      style: GoogleFonts.nunito(),
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: trailing,
        hintText: 'search here',
        hintStyle: GoogleFonts.nunito(),
      ),
      onChanged: onChanged,
    );
  }
}
