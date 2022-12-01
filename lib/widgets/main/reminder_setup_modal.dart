import 'package:flutter/material.dart';
import 'package:pillendar_app/i18n.dart';
import 'package:pillendar_app/models/reminder.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/utils/Utils.dart';

enum ReminderSetupModalReason { create, edit }

class ReminderSetupModal extends StatefulWidget {
  ReminderSetupModalReason reason;
  Reminder? reminder;

  ReminderSetupModal({required this.reason, this.reminder, super.key});

  @override
  // ignore: no_logic_in_create_state
  State<ReminderSetupModal> createState() {
    if (reason == ReminderSetupModalReason.edit && reminder != null) {
      return _ReminderSetupModalState.withReminder(
          reason: reason, reminder: reminder);
    } else {
      return _ReminderSetupModalState(reason: reason);
    }
  }
}

class _ReminderSetupModalState extends State<ReminderSetupModal> with Utils {
  DateTime? initialDosisDatetime;
  String? pillName;
  int? dosisTimeInHours = 0;
  int? cycles = 0;
  ReminderSetupModalReason reason;
  Reminder? reminder;

  _ReminderSetupModalState({required this.reason});
  _ReminderSetupModalState.withReminder({
    required this.reason,
    required this.reminder,
  }) {
    pillName = reminder!.name;
    cycles = reminder!.cycles;
    dosisTimeInHours = reminder!.dosisTimeInHours;
    initialDosisDatetime = reminder!.startDay;
  }

  final _formKey = GlobalKey<FormState>();

  String get initialDosisDatetimeString {
    return initialDosisDatetime != null
        ? initialDosisDatetime.toString().substring(0, 10)
        : "";
  }

  void modalLogicCreate(BuildContext context) {
    if (_formKey.currentState!.validate() && initialDosisDatetime != null) {
      Reminder reminder = Reminder(
        startDay: initialDosisDatetime!,
        dosisTimeInHours: dosisTimeInHours!,
        name: pillName!,
        cycles: cycles!,
      );
      showToast(context, "CREA EL REMINDER");
    }
  }

  void modalLogicEdit(BuildContext context) {
    if (_formKey.currentState!.validate() && initialDosisDatetime != null) {
      Reminder reminder = Reminder(
        startDay: initialDosisDatetime!,
        dosisTimeInHours: dosisTimeInHours!,
        name: pillName!,
        cycles: cycles!,
      );
      showToast(context, "MODIFICA EL REMINDER");
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.reason == ReminderSetupModalReason.create
        ? i18n.getText("Create_reminder_modal_title_create")
        : i18n.getText("Create_reminder_modal_title_edit");
    bool isCreateReason = ReminderSetupModalReason.create == reason;

    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyle.heading_2,
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(AppStyleConstants.separation),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                i18n.getText("Create_reminder_modal_datepicker_text"),
                style: AppTextStyle.text,
              ),
              ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(1999),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365 * 10),
                    ),
                    initialDate: DateTime.now(),
                    currentDate: DateTime.now(),
                  ).then((date) {
                    setState(() {
                      initialDosisDatetime = date;
                    });
                  });
                },
                child: Text(
                    "${i18n.getText("Create_reminder_modal_datepicker_button")} - $initialDosisDatetimeString"),
              ),
              const SizedBox(
                height: AppStyleConstants.separation,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: pillName,
                validator: (v) {
                  pillName = v;
                  if (v == null || v.isEmpty) {
                    return i18n.getText(
                        "Create_reminder_modal_input_pillname_incorrect");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText:
                      i18n.getText("Create_reminder_modal_input_pillname_hint"),
                  label: Text(
                    i18n.getText("Create_reminder_modal_input_pillname_label"),
                    style: const TextStyle(color: AppColors.darkPrimary),
                  ),
                  icon: const Icon(
                    Icons.medication,
                    color: AppColors.darkPrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: AppStyleConstants.separation,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: dosisTimeInHours.toString(),
                validator: (v) {
                  if (v == null || v.isEmpty || int.parse(v) <= 0) {
                    return i18n.getText(
                        "Create_reminder_modal_input_dosis_time_in_hours_incorrect");
                  } else {
                    dosisTimeInHours = int.parse(v);
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: i18n.getText(
                      "Create_reminder_modal_input_dosis_time_in_hours_hint"),
                  label: Text(
                    i18n.getText(
                        "Create_reminder_modal_input_dosis_time_in_hours_label"),
                    style: const TextStyle(color: AppColors.darkPrimary),
                  ),
                  icon: const Icon(
                    Icons.watch_later,
                    color: AppColors.darkPrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: AppStyleConstants.separation,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: cycles.toString(),
                validator: (v) {
                  if (v == null || v.isEmpty || int.parse(v) <= 0) {
                    return i18n.getText(
                        "Create_reminder_modal_input_cycles_incorrect");
                  } else {
                    cycles = int.parse(v);
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText:
                      i18n.getText("Create_reminder_modal_input_cycles_hint"),
                  label: Text(
                    i18n.getText("Create_reminder_modal_input_cycles_label"),
                    style: const TextStyle(color: AppColors.darkPrimary),
                  ),
                  icon: const Icon(
                    Icons.replay,
                    color: AppColors.darkPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => isCreateReason
                  ? modalLogicCreate(context)
                  : modalLogicEdit(context),
              child: Text(
                i18n.getText("Create_reminder_modal_confirm_action"),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                i18n.getText("Create_reminder_modal_cancel_action"),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
