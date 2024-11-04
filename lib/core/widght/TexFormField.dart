
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/core/colors.dart';


class TextformFieldWidght extends StatelessWidget {
  TextformFieldWidght(
      {super.key,
      this.HintText,
      // required this.icon,
      required this.controller,
      required this.onSaved,
      this.validator,
      this.focusNode,
      this.keyboardType,
      this.maxLines = 1});
  final String? HintText;
  // final Widget icon;
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      // textDirection: SharedPreferenceValue.GetLocal()=='en'?TextDirection.ltr:TextDirection.rtl ,
      // onTap:  () => focusNode?.unfocus(),
      onEditingComplete: () => focusNode?.unfocus(),
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      maxLines: maxLines,
      onFieldSubmitted: (value) {

        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
          isDense: true,
          filled: true,

          fillColor: Colors.white,
          hintText: HintText ?? '',
          // prefixIcon: icon,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff3C8DBC))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB7B7B7))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFBF9F4))
              //
              )),
    );
  }
}

class textFormFieldWidghtWithIcon extends StatelessWidget {
  textFormFieldWidghtWithIcon(
      {super.key,
        this.HintText,
        // required this.icon,
        required this.controller,
         this.onSaved,
         this.onChanged,
        this.validator,
        this.focusNode,
        this.keyboardType,
        this.suffix,
        this.prefix,
        required this.obscureText,
        this.maxLines = 1});
  final String? HintText;
  // final Widget icon;
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textDirection: SharedPreferenceValue.GetLocal()=='en'?TextDirection.ltr:TextDirection.rtl ,
      // onTap:  () => focusNode?.unfocus(),
      onEditingComplete: () => focusNode?.unfocus(),
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
      obscureText: obscureText,
      // textInputAction: TextInputAction. ,
      onFieldSubmitted: (value) {

        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(

         suffixIcon:suffix??const SizedBox() ,
         prefixIcon:prefix??const SizedBox() ,
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
          isDense: true,
          filled: true,

           fillColor: Colors.white,
          hintText: HintText ?? '',
          // prefixIcon: icon,
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary)),
          enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color:AppColors.primary)),
          border:  OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary)
            //
          )),
    );
  }
}
class TextformFieldWidghtwithCounter extends StatelessWidget {
  TextformFieldWidghtwithCounter(
      {Key? key,
      this.HintText,
      required this.controller,
      required this.onSaved,
      this.validator,
      this.focusNode,
      this.keyboardType,
      this.maxLines = 1,
      required this.onPressedIncrement,
      required this.onPressedDecrement})
      : super(key: key);

  final String? HintText;
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;
  final void Function()? onPressedIncrement;
  final void Function()? onPressedDecrement;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      maxLines: maxLines,
      onFieldSubmitted: (value) {

        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: HintText ?? '',
        suffixIcon: Column(
          children: [
            GestureDetector(
                onTap: onPressedIncrement,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container( color: const Color(0xffE9E9ED),
                      // decoration: ShapeDecoration(
                      //     color: Colors.red,
                      //     shape: CircleBorder(),),
                      child: const Icon(Icons.arrow_drop_up,)),
                )),
            GestureDetector(
                onTap: onPressedDecrement,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Container(color: const Color(0xffE9E9ED),child: const Icon(Icons.arrow_drop_down)),
                )),

            // IconButton(
            //     icon:
            //     onPressed:onPressedIncrement
            // ),
            // IconButton(
            //   icon:
            //   onPressed: () {
            //
            //   },
            // ),
          ],
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff3C8DBC)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffB7B7B7)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFBF9F4)),
        ),
      ),
    );
  }
}
