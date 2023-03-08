class Lecture {
  final String name;
  final List<Section> lectureSections;
  const Lecture({
    required this.name,
    required this.lectureSections,
  });
}

class Section {
  final String name;
  final Duration sectionDuration;
  const Section({
    required this.name,
    required this.sectionDuration,
  });
}

const List<Lecture> lecs = [
  Lecture(
    name: 'lec1',
    lectureSections: [
      Section(
        name: 'sec11',
        sectionDuration: Duration(
          hours: 1,
          minutes: 1,
        ),
      ),
      Section(
        name: 'sec12',
        sectionDuration: Duration(
          hours: 1,
          minutes: 2,
        ),
      ),
      Section(
        name: 'sec13',
        sectionDuration: Duration(
          hours: 1,
          minutes: 3,
        ),
      ),
    ],
  ),
  Lecture(
    name: 'lec2',
    lectureSections: [
      Section(
        name: 'sec21',
        sectionDuration: Duration(
          hours: 2,
          minutes: 1,
        ),
      ),
      Section(
        name: 'sec22',
        sectionDuration: Duration(
          hours: 2,
          minutes: 2,
        ),
      ),
      Section(
        name: 'sec23',
        sectionDuration: Duration(
          hours: 2,
          minutes: 3,
        ),
      ),
    ],
  )
];
