import 'package:auto_route/annotations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/fields/general_text_field.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import '../../components/fields/name_text_field.dart';

@RoutePage()
class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Project",
                      style: kSerzif(context),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Create",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: kNeutral400),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                DottedBorder(
                  strokeWidth: 2,
                  color: kNeutral300,
                  dashPattern: const [30, 1],
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(30),
                  child: InkResponse(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      height: MediaQuery.sizeOf(context).height / 7,
                      child: Text(
                        "Add Cover",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: kNeutral1000),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "Name",
                  style: Theme.of(context).textTheme.titleMedium
                ),
                const SizedBox(
                  height: 6,
                ),
                NameField(
                  controller: _nameTextController,
                  text: "Input",
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.titleMedium
                ),
                const SizedBox(
                  height: 6,
                ),
                GeneralField(
                  controller: _descriptionTextController,
                  rows: 5,
                  hintText: "Write your description here...",
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "Collaborator",
                  style: Theme.of(context).textTheme.titleMedium
                ),
                const SizedBox(
                  height: 6,
                ),
                GestureDetector(
                  onTap: () {
                    print("open bottom sheet");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: context.isDarkMode ? kNeutral900 : kNeutral100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Invite a collaborator",
                          style:Theme.of(context).textTheme.titleMedium
                        ),
                        SvgPicture.asset("assets/icons/arrow-down.svg", colorFilter: ColorFilter.mode(context.isDarkMode ? kNeutral100 : kNeutral900, BlendMode.srcIn))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "Due date",
                  style: Theme.of(context).textTheme.titleMedium
                ),
                const SizedBox(
                  height: 6,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SfDateRangePicker(
                          todayHighlightColor: kPrimary400,
                          selectionColor: kPrimary400,
                          selectionTextStyle: Theme.of(context).textTheme.titleMedium,
                          onSelectionChanged: _onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.single,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: context.isDarkMode ? kNeutral900 : kNeutral100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select date",
                          style: Theme.of(context).textTheme.titleMedium
                        ),
                        SvgPicture.asset(
                          "assets/icons/calendar.svg",
                          colorFilter: ColorFilter.mode(
                              context.isDarkMode ? kNeutral100 : kNeutral900,
                              BlendMode.srcIn),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
