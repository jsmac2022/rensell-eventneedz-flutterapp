// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:eventneedz/common/styles/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common_function.dart';

class AllInputDesign extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final controller;
  final floatingLabelBehavior;
  final prefixText;
  final fillColor;
  final enabled;
  final initialValue;
  final hintText;
  final labelText;
  final textInputAction;
  final prefixStyle;
  final validator;
  final errorText;
  final keyBoardType;
  final validatorFieldValue;
  final List<TextInputFormatter>? inputFormatterData;
  final FormFieldSetter<String>? onSaved;
  final obsecureText;
  final suffixIcon;
  final prefixIcon;
  final maxLength;
  final outlineInputBorderColor;
  final outlineInputBorder;
  final enabledBorderRadius;
  final enabledOutlineInputBorderColor;
  final focusedBorderColor;
  final hintTextStyleColor;
  final counterText;
  final cursorColor;
  final textStyleColors;
  final inputHeaderName;
  final autofillHints;
  final onEditingComplete;
  final textCapitalization;
  final keyboardType;
  final maxLines;
  final minLines;
  final boxshadow;
  final elevation;
  final widthtextfield;
  final inputHeaderTextStyle;
  final inputLableColor;

  const AllInputDesign({
    Key? key,
    this.textStyleColors,
    this.controller,
    this.floatingLabelBehavior,
    this.initialValue,
    this.cursorColor,
    this.prefixIcon,
    this.textInputAction,
    this.outlineInputBorder,
    this.enabledBorderRadius,
    this.enabled,
    this.prefixText,
    this.fillColor,
    this.prefixStyle,
    this.keyBoardType,
    this.obsecureText,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.validatorFieldValue,
    this.inputFormatterData,
    this.validator,
    this.onSaved,
    this.errorText,
    this.onChanged,
    this.maxLength,
    this.outlineInputBorderColor,
    this.enabledOutlineInputBorderColor,
    this.focusedBorderColor,
    this.hintTextStyleColor,
    this.counterText,
    this.inputHeaderName,
    this.onEditingComplete,
    this.autofillHints,
    this.textCapitalization,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.boxshadow,
    this.elevation,
    this.widthtextfield,
    this.inputHeaderTextStyle,
    this.inputLableColor,
  }) : super(key: key);

  @override
  _AllInputDesignState createState() => _AllInputDesignState();
}

class _AllInputDesignState extends State<AllInputDesign> {
  var cf = CommonFunctions();

  @override
  Widget build(BuildContext context) {
    return widget.inputHeaderName != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (widget.inputHeaderName != null)
                    ? widget.inputHeaderName
                    : '',
                style: (widget.inputHeaderTextStyle != null)
                    ? widget.inputHeaderTextStyle
                    : textstylesubtitle1(context)!
                        .copyWith(color: Colors.black87),
              ),
              sizedboxheight(3.0),
              myTextfieldWidget(context),
            ],
          )
        : myTextfieldWidget(context);
  }

  Widget myTextfieldWidget(BuildContext context) {
    double screensize = MediaQuery.of(context).size.width;
    return Material(
      borderRadius: widget.enabledBorderRadius ?? BorderRadius.circular(0),
      color: Colors.transparent,
      elevation: widget.elevation ?? 0,
      child: Container(
        width: widget.widthtextfield ?? screensize,
        decoration: BoxDecoration(
            borderRadius: widget.boxshadow != null
                ? BorderRadius.circular(0)
                : BorderRadius.circular(0),
            boxShadow: widget.boxshadow ??
                [
                  BoxShadow(
                    color: Colors.transparent,
                    // spreadRadius: 1,
                    // blurRadius: 1,
                    // offset: Offset(0, 3),
                  )
                ]),
        child: TextFormField(
          // expands: true,
          textAlignVertical: TextAlignVertical.center,

          minLines: widget.maxLines ?? 1,
          maxLines: widget.maxLines ?? 1,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          cursorColor: widget.cursorColor ?? colorblack,
          key: Key(cf.convertKey(widget.labelText)),
          onSaved: widget.onSaved,
          onEditingComplete: widget.onEditingComplete,
          style: TextStyle(
              color: widget.textStyleColors ?? Colors.black,
              // fontFamily: 'Nunito',
              fontWeight: FontWeight.w400,
              fontSize: screensize <= 350 ? 15 : 16),
          keyboardType: widget.keyBoardType,
          validator: widget.validator,
          controller: widget.controller,
          maxLength: widget.maxLength,
          enabled: widget.enabled,

          // initialValue: widget.initialValue == null ? '' : widget.initialValue,
          inputFormatters: widget.inputFormatterData,
          obscureText: widget.obsecureText ?? false,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          autofillHints: widget.autofillHints,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: widget.labelText ?? widget.hintText ?? '',

            labelStyle: textstylesubtitle1(context)!
                .copyWith(color: widget.inputLableColor ?? colorblack54),
            counterText: widget.counterText,
            filled: true,
            fillColor: widget.fillColor ?? colorWhite,
            hintText: (widget.hintText != null) ? widget.hintText : '',
            floatingLabelBehavior:
                widget.floatingLabelBehavior ?? FloatingLabelBehavior.never,
            hintStyle: TextStyle(
              color: widget.hintTextStyleColor ?? colorgrey,
              fontSize: 15,

              // fontFamily: 'Nunito',
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: widget.prefixIcon != null
                ? SizedBox(
                    width: 15,
                    height: 15,
                    child: widget.prefixIcon,
                  )
                : null,

            suffixIcon: widget.suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: widget.suffixIcon ,
                  )
                : null,
            prefixText: (widget.prefixText != null) ? widget.prefixText : null,
            prefixStyle: widget.prefixStyle,
            errorText: widget.errorText,
            // errorStyle: TextStyle(fontFamily: pCommonRegularFont),
            contentPadding: const EdgeInsets.all(10.0),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  widget.enabledBorderRadius ?? BorderRadius.circular(0),
              borderSide: BorderSide(
                  color: widget.focusedBorderColor ?? colorredlightbtn,
                  width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  widget.enabledBorderRadius ?? BorderRadius.circular(0),
              borderSide: BorderSide(
                  color: widget.enabledOutlineInputBorderColor ?? colorgrey,
                  width: 1.0),
            ),
            border: widget.outlineInputBorder ??
                OutlineInputBorder(
                  borderRadius:
                      widget.enabledBorderRadius ?? BorderRadius.circular(0),
                  borderSide: BorderSide(
                      color: widget.outlineInputBorderColor ?? colorredlightbtn,
                      width: 1.0),
                ),
          ),
        ),
      ),
    );
  }
}
