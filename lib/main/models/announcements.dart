import 'package:pdteam/main/main.dart';

import 'package:html/dom.dart';

class Announcements {
  final List<Announcement> announcements;

  Announcements({this.announcements});

  factory Announcements.fromHtml(Document doc) {
    Element announceElem = doc.getElementById('divWorkGroupMessage');
    final titles = announceElem.querySelectorAll('h5').map<String>((header) {
      return header.innerHtml;
    }).toList();
    final bodies = announceElem.querySelectorAll('p').map<String>((paragraph) {
      return paragraph.innerHtml;
    }).toList();
    int numAnnouncements = titles.length;
    var announcements = new List<Announcement>();
    for (var i = 0; i < numAnnouncements; i++) {
      announcements.add(Announcement(title: titles[i], body: bodies[i]));
    }
    return Announcements(announcements: announcements);
  }
}
