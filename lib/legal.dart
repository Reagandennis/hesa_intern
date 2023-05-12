import 'package:flutter/material.dart';

class LegalPage extends StatefulWidget {
  const LegalPage({Key? key}) : super(key: key);

  @override
  _LegalPageState createState() => _LegalPageState();
}

class _LegalPageState extends State<LegalPage> {
  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Legal Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus, lorem at ultrices fringilla, quam odio ultricies felis, sed bibendum dolor neque eu sapien. Praesent sollicitudin nibh a justo malesuada, in commodo velit efficitur. Nam elementum justo mauris, at varius nisl eleifend et. Nunc eleifend erat vel tortor rhoncus, ut lobortis lorem malesuada. Donec auctor elit quis velit malesuada consequat. Fusce eu sagittis quam. Suspendisse potenti. Duis eget diam vel velit iaculis egestas ac eu leo. Fusce posuere dolor vel risus laoreet rhoncus. Nulla facilisi. Fusce sollicitudin vel ex in aliquet.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              CheckboxListTile(
                title: const Text(
                  'I accept the terms and conditions',
                  style: TextStyle(fontSize: 16.0),
                ),
                value: _isChecked,
                onChanged: _toggleCheckbox,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _isChecked
              ? () {
                  // Code to proceed to the next screen after user agrees to terms and conditions
                  Navigator.of(context).pop();
                }
              : null,
          child: const Icon(Icons.arrow_forward),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
