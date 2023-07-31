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
        decoration: BoxDecoration(
            color: DesignSystemPaletterColorApp.secondaryColorWhite,
            border: Border.all(
                width: 4, color: DesignSystemPaletterColorApp.secondaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              autofillHints: ["AutoFillHints 1", "AutoFillHints 2"],
              autofocus: true,
              style: const TextStyle(
                  decorationThickness: 0,
                  color: DesignSystemPaletterColorApp.fontColorDefault,
                  fontSize: 18),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: DesignSystemPaddingApp.pd12,
                      top: DesignSystemPaddingApp.pd4,
                      bottom: DesignSystemPaddingApp.pd4),
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: DesignSystemPaletterColorApp.secondaryColor,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: LabelsApp.hintTextSearch,
                  hintStyle: const TextStyle(
                      color: DesignSystemPaletterColorApp.fontColorHintText,
                      fontSize: 16)),
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
