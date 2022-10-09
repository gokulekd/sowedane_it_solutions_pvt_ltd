import 'package:flutter/material.dart';
import 'package:sowedane_it_solutions_pvt_ltd/constant/colors.dart';

class CommenTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const CommenTextFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          filled: true,
          fillColor: kTextfield,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
