import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import '../../../constants/colors.dart';

class CreateTaskBottomSheet extends StatefulWidget {
   CreateTaskBottomSheet({super.key});

  @override
  State<CreateTaskBottomSheet> createState() => _CreateTaskBottomSheetState();
}

class _CreateTaskBottomSheetState extends State<CreateTaskBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode ();

  final _nameTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();
  int _currentPomodoroValue = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height/3.2 ,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
        ],
        color: Theme.of(context).bottomSheetTheme
            .backgroundColor,
      ),
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).bottomSheetTheme
                    .backgroundColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 36,
                    ),
                    Text(
                        'New Task',
                        style: Theme.of(context).textTheme.titleMedium
                    ),
                    InkWell(
                      onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            //TODO: Create Task
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  content: Text(
                                      'Please enter valid information')),
                            );
                            //AutoRouter.of(context).pop();
                          }
                        },


                      child: Text(
                        'Create',
                        style:  GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kPrimary500),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child:  Divider(),
                ),
                Form(
                  key: _formKey,
                    child: Column(
                  children: [
                    TextFormField(
                      controller: _nameTextEditingController,
                      focusNode: _focusNode,
                      cursorColor: kPrimary500,
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.titleSmall?.color,
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "I'm working on...",
                        hintStyle: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSecondaryContainer
                        ),
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                      ),
                    ),
                    TextFormField(
                      controller: _descriptionTextEditingController,
                      cursorColor: kPrimary500,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).textTheme.titleSmall?.color,
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'Please enter a valid description';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Write a description of your task...",
                        hintStyle: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onSecondaryContainer
                        ),
                        errorBorder: InputBorder.none,
                        border: InputBorder.none
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Pomodoros | ",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                        ),
                        NumberPicker(
                          value: _currentPomodoroValue,
                          minValue: 1,
                          maxValue: 30,
                          step: 1,
                          itemHeight: 25,
                          itemWidth: 37,
                          haptics: true,
                          selectedTextStyle: Theme.of(context).textTheme.titleSmall,
                          textStyle:Theme.of(context).textTheme.titleSmall,
                          axis: Axis.horizontal,
                          onChanged: (value) =>
                              setState(() => _currentPomodoroValue = value),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.transparent,
                            //backgroundBlendMode: BlendMode.screen,
                            border: Border.all(color: Colors.black26),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
