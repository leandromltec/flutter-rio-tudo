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
  List<String> listDistrict = ["Copacabana", "Ipanema", "Leblon", "Gávea"];

  String? userSelected;

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
            noItemsFoundBuilder: (context) => SizedBox(
                  height: 50,
                  child: _widgetSuggestion(LabelsApp.textDistrictNofound),
                ),
            suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            textFieldConfiguration: TextFieldConfiguration(
              autofillHints: ["AutoFillHints 1", "AutoFillHints 2"],
              autofocus: false,
              style: DesignSystemTextStyleApp.textHintSubCategoryScreen,
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
                  hintStyle:
                      DesignSystemTextStyleApp.textHintSubCategoryScreen),
            ),
            suggestionsCallback: (value) {
              return getSuggestions(value);
            },
            itemBuilder: (context, String suggestion) {
              return _widgetSuggestion(suggestion);
            },
            onSuggestionSelected: (suggestion) {
              setState(() {
                //_suggestionSelectedControler.text = suggestion;
              });
            }));
  }

  Widget _widgetSuggestion(String suggestion) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(
            left: DesignSystemPaddingApp.pd16,
            top: DesignSystemPaddingApp.pd8,
            bottom: DesignSystemPaddingApp.pd2),
        child: Text(suggestion,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: DesignSystemTextStyleApp.textHintSubCategoryScreen),
      ),
    );
  }

  List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(listDistrict);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
