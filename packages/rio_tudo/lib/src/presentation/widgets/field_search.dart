import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FieldSearch extends StatefulWidget {
  const FieldSearch({super.key});

  @override
  State<FieldSearch> createState() => _FieldSearchState();
}

class _FieldSearchState extends State<FieldSearch> {
  List<String> teste = ["teste1"];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: const EdgeInsets.only(left: DesignSystemPaddingApp.pd10),
        decoration: BoxDecoration(
            color: DesignSystemPaletterColorApp.secondaryColorWhite,
            border: Border.all(width: 4, color: DesignSystemPaletterColorApp.secondaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              autofillHints: ["AutoFillHints 1", "AutoFillHints 2"],
              autofocus: true,
              style: const TextStyle(color: DesignSystemPaletterColorApp.fontColorDefault, fontSize: 14),
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: DesignSystemPaletterColorApp.secondaryColor,
                  border: InputBorder.none,
                  hintText: LabelsApp.hintTextSearch,
                  hintStyle: const TextStyle(color: DesignSystemPaletterColorApp.fontColorHintText, fontSize: 16)),
            ),
            suggestionsCallback: (value) {
              return teste.toList();
            },
            itemBuilder: (context, String suggestion) {
              return Container();
            },
            onSuggestionSelected: (value) {}));
  }
}
