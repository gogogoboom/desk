import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';

class RangeDateAlert extends StatefulWidget {
  const RangeDateAlert({Key? key}) : super(key: key);

  @override
  _RangeDateAlertState createState() => _RangeDateAlertState();
}

GlobalKey<FormState> myFormKey = GlobalKey();

class _RangeDateAlertState extends State<RangeDateAlert> {
  DateTimeRange? myDateRange;

  void _submitForm() {
    final FormState? form = myFormKey.currentState;
    form!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Range Form Example'),
      ),
      body: SafeArea(
        child: Form(
          key: myFormKey,
          child: Column(
            children: <Widget>[
              SafeArea(
                child: DateRangeField(
                  initialValue: DateTimeRange(
                    start: DateTime.now(),
                    end: DateTime.now().add(
                      const Duration(days: 5),
                    ),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Date Range',
                    prefixIcon: Icon(Icons.date_range),
                    hintText: 'Please select a start and end date',
                    border: OutlineInputBorder(),
                  ),
                  validator: (DateTimeRange? value) {
                    if (value!.start.isBefore(DateTime.now())) {
                      return 'Please enter a later start date';
                    }
                    return null;
                  },
                  onSaved: (DateTimeRange? value) {
                    setState(() {
                      myDateRange = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
              if (myDateRange != null)
                Text('Saved value is: ${myDateRange.toString()}')
            ],
          ),
        ),
      ),
    );
  }
}
