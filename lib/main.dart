import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Country {
  final String countryName;
  final String isoCode;

  Country({required this.countryName, required this.isoCode});
}

List<Country> countries = [
  Country(countryName: 'Afghanistan', isoCode: 'AF'),
  Country(countryName: 'Albania', isoCode: 'AL'),
  Country(countryName: 'Algeria', isoCode: 'DZ'),
  Country(countryName: 'Andorra', isoCode: 'AD'),
  Country(countryName: 'Angola', isoCode: 'AO'),
  Country(countryName: 'Antigua and Barbuda', isoCode: 'AG'),
  Country(countryName: 'Argentina', isoCode: 'AR'),
  Country(countryName: 'Armenia', isoCode: 'AM'),
  Country(countryName: 'Australia', isoCode: 'AU'),
  Country(countryName: 'Austria', isoCode: 'AT'),
  Country(countryName: 'Azerbaijan', isoCode: 'AZ'),
  Country(countryName: 'Bahamas', isoCode: 'BS'),
  Country(countryName: 'Bahrain', isoCode: 'BH'),
  Country(countryName: 'Bangladesh', isoCode: 'BD'),
  Country(countryName: 'Barbados', isoCode: 'BB'),
  Country(countryName: 'Belarus', isoCode: 'BY'),
  Country(countryName: 'Belgium', isoCode: 'BE'),
  Country(countryName: 'Belize', isoCode: 'BZ'),
  Country(countryName: 'Benin', isoCode: 'BJ'),
  Country(countryName: 'Bhutan', isoCode: 'BT'),
  Country(countryName: 'Bolivia', isoCode: 'BO'),
  Country(countryName: 'Bosnia and Herzegovina', isoCode: 'BA'),
  Country(countryName: 'Botswana', isoCode: 'BW'),
  Country(countryName: 'Brazil', isoCode: 'BR'),
  Country(countryName: 'Brunei', isoCode: 'BN'),
  Country(countryName: 'Bulgaria', isoCode: 'BG'),
  Country(countryName: 'Burkina Faso', isoCode: 'BF'),
  Country(countryName: 'Burundi', isoCode: 'BI'),
  // Add more countries...
];

Country? selectedCountry;

class CountrySelectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField<Country>(
      textFieldConfiguration: TextFieldConfiguration(
        decoration: InputDecoration(labelText: 'Select a country'),
      ),
      suggestionsCallback: (pattern) => _getCountries(pattern),
      itemBuilder: (context, Country suggestion) {
        return ListTile(
          title: Text(suggestion.countryName),
        );
      },
      onSuggestionSelected: (Country? suggestion) {
        if (suggestion != null) {
          selectedCountry = suggestion;
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a country';
        }
        return null;
      },
    );
  }

  // Method to filter the countries based on the search pattern
  List<Country> _getCountries(String query) {
    var lowercaseQuery = query.toLowerCase();

    return countries.where((country) {
      return country.countryName.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Country Selection')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CountrySelectionWidget(),
        ),
      ),
    );
  }
}
