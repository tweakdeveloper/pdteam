import 'package:flutter/material.dart';

import 'package:pdteam/schedule/schedule.dart';

class ColorsKey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorDescriptions = List<ColorDescription>();
    for (var key in RosterAppsColors.keys) {
      colorDescriptions.add(
        ColorDescription(
          color: RosterAppsColors[key],
          description: RosterAppsDescriptions[key],
        ),
      );
    }
    return Column(children: colorDescriptions);
  }
}
