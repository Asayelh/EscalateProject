import 'package:esclate/config/config.dart';
import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12.0),
    child: CircularProgressIndicator(
      backgroundColor: escalate.blueColor,
      valueColor: AlwaysStoppedAnimation(escalate.cyanColor),
    ),
  );
}

linerProgress() {
  Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.lightGreenAccent),
    ),
  );
}
