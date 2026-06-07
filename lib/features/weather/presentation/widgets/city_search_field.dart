import 'package:flutter/material.dart';

class CitySearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const CitySearchField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Search City'),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(onPressed: onSearch, child: const Icon(Icons.search)),
      ],
    );
  }
}
