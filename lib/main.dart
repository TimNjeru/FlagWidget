import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flag Picker',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flag Picker'),
        ),
        body: FlagPicker(),
      ),
    );
  }
}

class FlagPicker extends StatefulWidget {
  const FlagPicker({
    Key? key,
  }) : super(key: key);

  @override
  _FlagPickerState createState() => _FlagPickerState();
}

class _FlagPickerState extends State<FlagPicker> {
  // A model class for the country data

  // A list of country objects with sample data
  List<Country> countries = [
    Country('Kenya', 'KE', 'KE'),
    Country('India', 'IN', 'IN'),
    Country('Australia', 'AU', 'AU'),
    Country('France', 'FR', 'FR'),
    Country('Japan', 'JP', 'JP'),
    // Add more countries as you wish
  ];

  // A variable to store the user input
  String query = '';

  Widget countryItem(Country country) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          country.flag,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      title: Text(
        country.name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        country.code,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // A text field to take the user input
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter country name or code',
          ),
          onChanged: (value) {
            setState(() {
              query = value;
            });
          },
        ),
        // A list view to display the filtered list of countries
        Expanded(
          child: ListView(
            children: countries
                // Filter the countries by name or code containing the query
                .where((country) =>
                    country.name.toLowerCase().contains(query.toLowerCase()) ||
                    country.code.toLowerCase().contains(query.toLowerCase()))
                // Map each country to a custom list tile widget
                .map((country) => countryItem(country))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class Country {
  final String name;
  final String code;
  final String flag;

  Country(this.name, this.code, this.flag);
}
