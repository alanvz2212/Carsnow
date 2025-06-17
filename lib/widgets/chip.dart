import 'package:flutter/material.dart';

class FilterOptionsChips extends StatefulWidget {
  const FilterOptionsChips({super.key});

  @override
  State<FilterOptionsChips> createState() => _FilterOptionsChipsState();
}

class _FilterOptionsChipsState extends State<FilterOptionsChips> {
  Set<int> selectedChips = Set();

  final List<Map<String, dynamic>> options = [
    {'label': 'Filter', 'icon': Icons.filter_alt},
    {'label': 'Sort', 'icon': Icons.sort},
    {'label': 'Budget', 'icon': Icons.attach_money},
    {'label': 'Discounts', 'icon': Icons.percent},
    {'label': 'Fuel Type', 'icon': Icons.local_gas_station},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(options.length, (index) {
          bool isSelected = selectedChips.contains(index);
          return Padding(
            padding: const EdgeInsets.only(right: 6.0), // Space between chips
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedChips.remove(index); // Deselect the chip
                  } else {
                    selectedChips.clear(); // Deselect all other chips
                    selectedChips.add(index); // Select the current chip
                  }
                });
              },
              child: Chip(
                backgroundColor: isSelected
                    ? const Color(0xFF3b0578)
                    : Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Row(
                  children: [
                    Icon(
                      options[index]['icon'],
                      size: 18,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      options[index]['label'],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
