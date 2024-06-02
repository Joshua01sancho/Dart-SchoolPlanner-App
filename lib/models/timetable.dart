class Timetable {
  String subject;
  String location;
  String startTime;
  String endTime;
  String dayOfWeek;

  Timetable({
    required this.subject,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
  });
}
class Timetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimetableScreen(),
    );
  }
}

class TimetableScreen extends StatefulWidget {
  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  List<Timetable> timetable = [];

  void _addSubject(Timetable subject) {
    setState(() {
      timetable.add(subject);
    });
  }

  void _deleteSubject(Timetable subject) {
    setState(() {
      timetable.remove(subject);
    });
  }

  void _showAddSubjectDialog() {
    String subject = '';
    String location = '';
    String startTime = '';
    String endTime = '';
    String dayOfWeek = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Subject'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Subject'),
                onChanged: (value) {
                  subject = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Location'),
                onChanged: (value) {
                  location = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Start Time'),
                onChanged: (value) {
                  startTime = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'End Time'),
                onChanged: (value) {
                  endTime = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Day of Week'),
                onChanged: (value) {
                  dayOfWeek = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                _addSubject(Timetable(
                  subject: subject,
                  location: location,
                  startTime: startTime,
                  endTime: endTime,
                  dayOfWeek: dayOfWeek,
                ));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: ListView.builder(
        itemCount: timetable.length,
        itemBuilder: (context, index) {
          final subject = timetable[index];
          return ListTile(
            title: Text(subject.subject),
            subtitle: Text('${subject.dayOfWeek} | ${subject.startTime} - ${subject.endTime}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteSubject(subject);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddSubjectDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
