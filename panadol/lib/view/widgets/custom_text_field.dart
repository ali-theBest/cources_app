import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

import 'package:panadol/models/constants/enums.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.inputType,
    required this.fieldsType,
    required this.height,
    required this.width,
    required this.prefixIcon,
    required this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final String label;
  final TextInputType inputType;
  final FieldsType fieldsType;
  final double height;
  final double width;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  

  

  @override
  void dispose() {
    // TODO: implement dispose
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          textDirection: widget.fieldsType == FieldsType.phoneNumber
              ? TextDirection.ltr
              : null,
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.fieldsType == FieldsType.phoneNumber
                ? widget.prefixIcon
                : null,
            hintStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white,
            filled: true,
            constraints: BoxConstraints(
              minHeight: widget.height * .06,
              maxHeight: widget.height * .07,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
/*
  Widget? textFieldPrefix({
    required FieldsType fieldType,
    required void Function()? onPressed,
  }) {
    if (fieldType == FieldsType.phoneNumber) {
      return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          width: 50,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.black,
                width: .2,
              ),
            ),
          ),
          child: DropdownButton<Country?>(
            alignment: Alignment.bottomLeft,
            underline: Container(),
            iconSize: 20,
            value: countriesCodes.first,
            isExpanded: true,
            focusColor: Colors.white,
            items: countriesCodes
                .map(
                  (value) => DropdownMenuItem<Country?>(
                    value: value,
                    child: Text(
                      '$value',
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          ),
        ),
      );
    } else {
      return null;
    }
  }*/
}
