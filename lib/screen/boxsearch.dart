import 'package:flutter/material.dart';
import 'package:weather_app/model.dart';
import 'package:weather_app/client.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController
      textEditingController; // Parameter TextEditingController
  final Function(String) onSearch;

  // Konstruktor dengan parameter TextEditingController
  const SearchBox({
    Key? key,
    required this.textEditingController,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter, // Posisi box search di bagian atas tengah
      child: Container(
        width: 400, // Lebar box search
        height: 40, // Tinggi box search
        margin: EdgeInsets.only(top: 24), // Jarak dari atas
        decoration: BoxDecoration(
          color: Colors.white, // Warna latar belakang putih
          borderRadius: BorderRadius.circular(20), // Sudut melengkung
        ),
        padding: EdgeInsets.symmetric(horizontal: 16), // Padding horizontal
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey[600]), // Icon search
            SizedBox(width: 8), // Jarak antara icon dan text field
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: "Search...", // Placeholder text
                  border: InputBorder.none, // Menghilangkan border
                ),
                onSubmitted: onSearch,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
