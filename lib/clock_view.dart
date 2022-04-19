import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    // Centro da tela do dispositivo
    //Largura dividudo por dois
    var centerX = size.width / 2;
    //Altura dividido por dois
    var centerY = size.height / 2;
    // calculo do centro da altura e do centro da largura
    var center = Offset(centerX, centerY);
    //Raio do circulo
    var radius = (min(centerX, centerY) - 10);

    //Cirsulo do relogio
    var fillBrush = Paint()..color = Color(0xFF444974);

    //Borda do relogio
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    //Centro do relogio
    var centerfillBrush = Paint()..color = Color(0xFFEAECFF);

    //agulha dos segundos
    var secHandBrush = Paint()
      ..color = Colors.orange.shade300
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    // agulhas dos minutos
    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    //agulhas das horas
    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.pink, Colors.lightBlue])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    //pontos de fora
    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    //Desenhando apartir dos dados acima
    canvas.drawCircle(center, (radius - 40), fillBrush);
    canvas.drawCircle(center, (radius - 40), outlineBrush);

    //Posicao da agulha dos segundos
    var secHandleX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandleY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandleX, secHandleY), secHandBrush);

    //Posicao da agulha dos minutos
    var minHandleX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandleY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandleX, minHandleY), minHandBrush);

    //Posicao da agulha das hora
    var hourHandleX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandleY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandleX, hourHandleY), hourHandBrush);

    canvas.drawCircle(center, 8, centerfillBrush);

    // pontos que ficaram fora do relogio
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 12;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
