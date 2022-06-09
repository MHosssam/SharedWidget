import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimePickerWidget extends StatefulWidget {
  @override
  _DatetimePickerWidgetState createState() => _DatetimePickerWidgetState();
}

class _DatetimePickerWidgetState extends State<DatetimePickerWidget> {
  DateTime? dateTime = DateTime.now();

  TextEditingController? _dateTimeCtrl;

  @override
  void initState() {
    _dateTimeCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dateTimeCtrl?.dispose();
  }

  String getText() {
    if (dateTime == null) {
      return 'Select DateTime';
    } else {
      return DateFormat('HH:mm - dd/MM/yyyy').format(dateTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: _dateTimeCtrl,
      validator: (String? val) {
        if (val!.isEmpty) {
          return 'Validate Field Required';
        }
        return null;
      },
      onTap: () => pickDateTime(context),
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
            height: 1.9,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
      decoration: InputDecoration(
        hintText: getText(),
        contentPadding: EdgeInsetsDirectional.only(start: 8),
        suffixIcon: Container(
          width: 16,
          height: 16,
          margin: EdgeInsetsDirectional.only(end: 8),
          padding: EdgeInsets.all(3),
          child: Icon(
            Icons.calendar_month,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    final time = await pickTime(context);
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    return newDate ?? DateTime.now();
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : initialTime,
      builder: (BuildContext context, Widget? child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).colorScheme.primary,
            onPrimary: Theme.of(context).colorScheme.onPrimary,
            surface: Theme.of(context).colorScheme.background,
            onSurface: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: child!,
      ),
    );
    return newTime ?? TimeOfDay.now();
  }
}
