import 'package:flutter/material.dart';
import 'package:pillendar_app/firebase/firebase_db_controller.dart';
import 'package:pillendar_app/i18n.dart';
import 'package:pillendar_app/models/reminder.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/widgets/generics/center_panel.dart';

class ReminderForm extends StatefulWidget {
  static Reminder? reminder;

  const ReminderForm({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<ReminderForm> createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> with Utils {
  DateTime? initialDosisDatetime;
  String? pillName;
  int? dosisTimeInHours = 0;
  int? cycles = 0;

  final _formKey = GlobalKey<FormState>();
  String get initialDosisDatetimeString {
    return initialDosisDatetime != null
        ? initialDosisDatetime.toString().substring(0, 10)
        : "";
  }

  _ReminderFormState() {
    if (ReminderForm.reminder != null) {
      initialDosisDatetime = ReminderForm.reminder!.startDay;
      pillName = ReminderForm.reminder!.name;
      dosisTimeInHours = ReminderForm.reminder!.dosisTimeInHours;
      cycles = ReminderForm.reminder!.cycles;
    }
  }

  void modalLogicCreate(BuildContext context) {
    if (_formKey.currentState!.validate() && initialDosisDatetime != null) {
      Reminder reminder = Reminder(
        startDay: initialDosisDatetime!,
        dosisTimeInHours: dosisTimeInHours!,
        name: pillName!,
        cycles: cycles!,
      );
      FirebaseDBController.getInstance().createData(reminder, context).then(
        (value) {
          goToPreviosPath(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = ReminderForm.reminder == null
        ? i18n.getText("Create_reminder_modal_title_create")
        : i18n.getText("Create_reminder_modal_title_edit");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CenterPanelWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.heading_2,
                textAlign: TextAlign.center,
              ),
              Form(
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
                        height: AppStyleConstants.separation / 2,
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
                          hintText: i18n.getText(
                              "Create_reminder_modal_input_pillname_hint"),
                          label: Text(
                            i18n.getText(
                                "Create_reminder_modal_input_pillname_label"),
                            style:
                                const TextStyle(color: AppColors.darkPrimary),
                          ),
                          icon: const Icon(
                            Icons.medication,
                            color: AppColors.darkPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppStyleConstants.separation / 2,
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
                            style:
                                const TextStyle(color: AppColors.darkPrimary),
                          ),
                          icon: const Icon(
                            Icons.watch_later,
                            color: AppColors.darkPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppStyleConstants.separation / 2,
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
                          hintText: i18n.getText(
                              "Create_reminder_modal_input_cycles_hint"),
                          label: Text(
                            i18n.getText(
                                "Create_reminder_modal_input_cycles_label"),
                            style:
                                const TextStyle(color: AppColors.darkPrimary),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => modalLogicCreate(context),
                    child: Text(
                      i18n.getText("Create_reminder_modal_confirm_action"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ReminderForm.reminder = null;
                      goToPreviosPath(context);
                    },
                    child: Text(
                      i18n.getText("Create_reminder_modal_cancel_action"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
