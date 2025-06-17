import 'package:carsnow/widgets/button.dart';
import 'package:carsnow/widgets/c_appbar.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectTrip extends StatefulWidget {
  const SelectTrip({super.key});

  @override
  State<SelectTrip> createState() => _SelectTripState();
}

class _SelectTripState extends State<SelectTrip> {
  DateTime _pickupDateTime = DateTime(2023, 8, 10, 5, 0);
  DateTime _returnDateTime = DateTime(2023, 8, 17, 22, 0);
  DateTime _focusedDay = DateTime.now().isAfter(DateTime.utc(2023, 8, 31))
      ? DateTime.utc(2023, 8, 31)
      : DateTime.now();

  bool _isSelectingPickup = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(FontAwesomeIcons.angleLeft, color: Colors.white),
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              _pickupDateTime = DateTime(2023, 8, 10, 5, 0);
              _returnDateTime = DateTime(2023, 8, 17, 22, 0);
              _focusedDay = DateTime.now();
            });
          },
          icon: Icon(Icons.restore_rounded, color: Colors.white),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildDateTimePicker(
                    title: 'Pickup',
                    dateTime: _pickupDateTime,
                    isPickup: true,
                  ),
                ),
                Icon(FontAwesomeIcons.arrowRight),
                SizedBox(width: 10), // Space between columns
                Expanded(
                  child: _buildDateTimePicker(
                    title: 'Return',
                    dateTime: _returnDateTime,
                    isPickup: false,
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: TableCalendar(
                    firstDay: DateTime.utc(2023, 8, 1),
                    lastDay: DateTime.utc(2023, 8, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(
                      day,
                      _isSelectingPickup ? _pickupDateTime : _returnDateTime,
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        if (_isSelectingPickup) {
                          _pickupDateTime = DateTime(
                            selectedDay.year,
                            selectedDay.month,
                            selectedDay.day,
                            _pickupDateTime.hour,
                            _pickupDateTime.minute,
                          );
                        } else {
                          _returnDateTime = DateTime(
                            selectedDay.year,
                            selectedDay.month,
                            selectedDay.day,
                            _returnDateTime.hour,
                            _returnDateTime.minute,
                          );
                        }
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarFormat: CalendarFormat.month,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Divider(),
                CustomButton(onPressed: () {}, text: 'Save'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimePicker({
    required String title,
    required DateTime dateTime,
    required bool isPickup,
  }) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelectingPickup = isPickup;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16.0),
                    SizedBox(width: 8.0),
                    Text(
                      DateFormat('dd MMM, EEE').format(dateTime),
                      style: AppTextStyles.headerBold(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () async {
                    TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(dateTime),
                    );

                    if (selectedTime != null) {
                      setState(() {
                        if (isPickup) {
                          _pickupDateTime = DateTime(
                            dateTime.year,
                            dateTime.month,
                            dateTime.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                        } else {
                          _returnDateTime = DateTime(
                            dateTime.year,
                            dateTime.month,
                            dateTime.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                        }
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.access_time, size: 16.0),
                      SizedBox(width: 8.0),
                      Text(
                        DateFormat('hh:mm a').format(dateTime),
                        style: AppTextStyles.bodyRegular(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
