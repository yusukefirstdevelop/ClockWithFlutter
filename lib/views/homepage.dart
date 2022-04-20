// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uitraining/menu_info.dart';
import 'package:uitraining/views/clock_view.dart';
import 'clock_view.dart';
import "package:uitraining/data.dart";
import "package:uitraining/enums.dart";

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Pegando a data de hoje
    var now = DateTime.now();
    var formattedTime = DateFormat("HH:mm").format(now);
    var formattedDate = DateFormat("EEE, d MMM").format(now);
    var timezoneString = now.timeZoneOffset.toString().split(".").first;
    var offsetSign = "";
    if (!timezoneString.startsWith("-")) offsetSign = "+";

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          //Sidebar do app
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                  .toList()),
          //dividindo a tela verticalmente
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),

          // organizando o espaco ocupado
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (context, value, child) {
                if (value.menuType != MenuType.clock) return Container();
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                  alignment: Alignment.center,
                  //CHAMANDO O RELOGIO CRIADO NO clock_view
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Clock",
                          style: const TextStyle(
                              fontFamily: "avenir",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 24),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Hora e minutos
                            Text(
                              formattedTime,
                              style: TextStyle(
                                  fontFamily: "avenir",
                                  color: Colors.white,
                                  fontSize: 64),
                            ),
                            // dia , mes , dia da semana de hoje
                            Text(
                              formattedDate,
                              style: TextStyle(
                                  fontFamily: "avenir",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Align(
                          alignment: Alignment.center,
                          // child: ClockView(size: 250),
                          child: ClockView(
                            size: MediaQuery.of(context).size.height / 2,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          children: [
                            Text(
                              "Timezone",
                              style: TextStyle(
                                  fontFamily: "avenir",
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.language,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "UTC" + offsetSign + timezoneString,
                                  style: TextStyle(
                                      fontFamily: "avenir",
                                      color: Colors.white,
                                      fontSize: 24),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildMenuButton(MenuInfo currentMenuInfo) {
  //   return
  // }

  // Criando um componete reusavel
  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (context, value, child) {
        return FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType
              ? Color(0xFF242634)
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                currentMenuInfo.imageSource.toString(),
                scale: 1.5,
              ),
              SizedBox(height: 16),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(
                    fontFamily: 'avenir', color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}
