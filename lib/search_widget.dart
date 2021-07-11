import 'package:flutter/material.dart';
import 'package:shared_widget/text_form_field_widget.dart';

class SearchWidget extends StatelessWidget {
  final Color bgColor;
  final double? width, height;
  final String hintText;
  final TextEditingController searchcontroller;
  final void Function(String?)? onChanged;
  final void Function()? ontap;
  const SearchWidget({
    Key? key,
    required this.searchcontroller,
    required this.bgColor,
    required this.width,
    this.height,
    required this.hintText,
    this.onChanged,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      width: width,
      height: height ?? 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: bgColor.withOpacity(0.15),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Center(
        child: TextFormFieldWidget(
          controller: searchcontroller,
          onChanged: onChanged,
          radius: 32.0,
          bordercolor: Colors.white,
          hintText: '$hintText ...',
          suffixIcon: Container(
            height: height ?? 40,
            decoration: new BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(8.0),
                bottomEnd: Radius.circular(8.0),
                topStart: Radius.circular(0.0),
                bottomStart: Radius.circular(0.0),
              ),
            ),
            child: InkWell(
              onTap: ontap,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
