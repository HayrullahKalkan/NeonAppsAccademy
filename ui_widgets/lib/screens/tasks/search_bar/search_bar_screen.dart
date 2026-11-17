import 'package:flutter/material.dart';

import '../../../data/character_data.dart';
import '../../../models/character_model.dart';

class SearchbarScreen extends StatefulWidget {
  const SearchbarScreen({super.key});

  @override
  State<SearchbarScreen> createState() => _SearchbarScreenState();
}

class _SearchbarScreenState extends State<SearchbarScreen> {
  String searchText = '';
  String searchType = 'name';

  List<CharacterModel> get filteredCharacters {
    return characters.where((character) {
      final query = searchText.trim().toLowerCase();

      final value = searchType == 'name' ? character.name : character.surname;

      return value.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = filteredCharacters;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchBar Challenge'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'name', label: Text('Name')),
                ButtonSegment(value: 'surname', label: Text('Surname')),
              ],
              selected: {searchType},
              onSelectionChanged: (selection) {
                setState(() {
                  searchType = selection.first;
                });
              },
            ),

            const SizedBox(height: 20),

            SearchBar(
              hintText: searchType == 'name'
                  ? 'Search by name...'
                  : 'Search by surname...',
              leading: const Icon(Icons.search),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),

            const SizedBox(height: 20),

            Text('${results.length} results found'),

            const SizedBox(height: 12),

            Expanded(
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Surname')),
                      DataColumn(label: Text('City')),
                    ],
                    rows: results.map((character) {
                      return DataRow(
                        cells: [
                          DataCell(Text(character.name)),
                          DataCell(Text(character.surname)),
                          DataCell(Text(character.city)),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
