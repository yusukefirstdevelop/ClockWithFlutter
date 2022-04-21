import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:uitraining/constants/theme_data.dart';
import 'package:uitraining/data.dart';
import 'package:uitraining/main.dart';

import '../models/alarm_info.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Alarm",
            style: TextStyle(
              fontFamily: "avenir",
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  // ignore: prefer_const_constructors
                  //DECORANDO O BOX DO ALARM
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      //Cor buscada na theme_data
                      colors: alarm.gradientColors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    // SOMBRA
                    boxShadow: [
                      BoxShadow(
                        color: alarm.gradientColors.last.withOpacity(0.4),
                        // borrão
                        blurRadius: 8,
                        //Space da parte de tras do box (a sombra)
                        spreadRadius: 4,
                        //posicao da onde a sombra vai ficar
                        offset: Offset(4, 4),
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Icon(
                            Icons.label,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Office",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "avenir"),
                          ),
                          Switch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        "Mon-Fri",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "avenir"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "07:00 AM",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "avenir",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                );
                //Box de adicionar o alarm
              }).followedBy([
                DottedBorder(
                  strokeWidth: 3,
                  color: Colors.white,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(24),
                  dashPattern: [5, 4],
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 70, 74, 103),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 8),
                      onPressed: () {
                        // scheduleAlarm();
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/add_alarm.png",
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Add Alarm",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "avenir"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                //Transformando em uma lista
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, AlarmInfo alarmInfo) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      // NEcessario fazer algumas mudancas nas pastas do ANDROID
      icon: 'chameleon',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('chameleon'),
    );

    // Necessario fazer algumas mudancas nas pastas do IOS
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(0, 'Office', alarmInfo.title,
        scheduledNotificationDateTime, platformChannelSpecifics);
  }

  // void onSaveAlarm() {
  //   DateTime scheduleAlarmDateTime;
  //   if (_alarmTime.isAfter(DateTime.now()))
  //     scheduleAlarmDateTime = _alarmTime;
  //   else
  //     scheduleAlarmDateTime = _alarmTime.add(Duration(days: 1));

  //   var alarmInfo = AlarmInfo(
  //     alarmDateTime: scheduleAlarmDateTime,
  //     gradientColorIndex: _currentAlarms.length,
  //     title: 'alarm',
  //   );
  //   _alarmHelper.insertAlarm(alarmInfo);
  //   scheduleAlarm(scheduleAlarmDateTime, alarmInfo);
  //   Navigator.pop(context);
  //   loadAlarms();
  // }

  // void deleteAlarm(int id) {
  //   _alarmHelper.delete(id);
  //   //unsubscribe for notification
  //   loadAlarms();
  // }
}
