import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:country_calling_code_picker/picker.dart';

class MyFormDropDownButton extends StatelessWidget {
  const MyFormDropDownButton({
    Key? key,
    required this.dropItems,
    required this.value,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);
  final List<Country> dropItems;
  final Country? value;
  final void Function(Country?)? onChanged;
  final String? Function(Country?)? validator;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Country>(
      icon: const Icon(Icons.arrow_drop_down),
      alignment: Alignment.bottomLeft,
      iconSize: 20,
      isExpanded: true,
      focusColor: Colors.white,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
      value: value,
      items: dropItems
          .map(
            (value) => DropdownMenuItem<Country>(
              value: value,
              child: Image.asset(
                value.flag,
                package: countryCodePackageName,
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
