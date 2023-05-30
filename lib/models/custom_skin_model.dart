import 'package:flutter/material.dart';

class ModelsDropdown extends StatefulWidget {
  final String? selectedBrand;
  final void Function(String?) onModelSelected;

  ModelsDropdown({required this.selectedBrand, required this.onModelSelected});

  @override
  _ModelsDropdownState createState() => _ModelsDropdownState();
}

class _ModelsDropdownState extends State<ModelsDropdown> {
  String? _selectedModel;

  final _models = {
    'Apple': [
      'iPhone 14 Pro Max',
      'iPhone 14 Pro',
      'iPhone 14 Plus',
      'iPhone 14'
    ],
    'Samsung': [
      'S23 Ultra',
      'S23 Plus',
      'S23',
      'S22 Ultra',
      'S22 Plus',
      'S22',
      'S21 Ultra',
      'S21 FE',
    ],
    'Oneplus': ['11R', '11', '10 Pro', '10 T', '10R', '9R', '9 Pro', '9RT'],
    'Nothing': ['Nothing 1'],
    'Oppo': [
      'Reno 6 Pro',
      'Reno 6',
      'Reno 7 Pro',
      'Reno 7',
    ],
    'IQOO': [
      'Neo 6',
      '7 5G',
      '9',
      '9SE',
    ],
    'Realme': [
      'GT Master Edition',
      'X7 Max',
      'X3',
      'X2 Pro',
    ],
    'Vivo': [
      'X80 Pro',
      'X80',
      'X70 Pro',
      'X50',
    ],
    'Mi': [
      'Note 8 Pro',
      'Note 9 Pro',
      'Note 10 Pro Max',
      'Note 11 Pro Plus',
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<String>? models = _models[widget.selectedBrand!];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: DropdownButton<String>(
          value: _selectedModel,
          onChanged: (value) {
            setState(() {
              _selectedModel = value;
            });
            widget.onModelSelected(value);
          },
          items: models!
              .map<DropdownMenuItem<String>>(
                  (model) => DropdownMenuItem<String>(
                        value: model,
                        child: Text(model),
                      ))
              .toList(),
          hint: Text(' Select Model'),
        ),
      ),
    );
  }
}
