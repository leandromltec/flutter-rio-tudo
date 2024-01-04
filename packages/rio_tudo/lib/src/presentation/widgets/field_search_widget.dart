import 'package:config/config.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../rio_tudo.dart';

class FieldSearch extends StatefulWidget {
  final SubCategoryPresenter presenterSubCategory;

  // ignore: use_key_in_widget_constructors
  const FieldSearch({required this.presenterSubCategory});

  @override
  State<FieldSearch> createState() => _FieldSearchState();
}

class _FieldSearchState extends State<FieldSearch> {
  String? userSelected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.presenterSubCategory.listDistrictNotifier!,
        builder: (_, __, ___) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: DesignSystemPaletterColorApp.secondaryColorWhite,
                  border: Border.all(
                      width: 4,
                      color: DesignSystemPaletterColorApp.secondaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: TypeAheadField(
                  noItemsFoundBuilder: (context) => Container(
                        margin:
                            const EdgeInsets.all(DesignSystemPaddingApp.pd4),
                        padding: const EdgeInsets.only(
                            left: DesignSystemPaddingApp.pd4),
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
                        suffixIconColor:
                            DesignSystemPaletterColorApp.secondaryColor,
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
                    widget.presenterSubCategory.getItemsSubCategoryByDistrict(
                        districtSelected: suggestion);
                    setState(() {
                      //_suggestionSelectedControler.text = suggestion;
                    });
                  }));
        });
  }

  Widget _widgetSuggestion(String suggestion) {
    return Container(
      margin: const EdgeInsets.all(DesignSystemPaddingApp.pd6),
      padding: const EdgeInsets.only(left: DesignSystemPaddingApp.pd10),
      child: Flexible(
        child: Text(suggestion,
            maxLines: 1,
            style: DesignSystemTextStyleApp.textHintSubCategoryScreen),
      ),
    );
  }

  List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(widget.presenterSubCategory!.listDistrictNotifier!.value!);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
