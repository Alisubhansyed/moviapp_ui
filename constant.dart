import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Widget KhScapcer(double value) {
  return SizedBox(
    height: value,
  );
}

Widget KWScapcer(double value) {
  return SizedBox(
    width: value,
  );
}

TextStyle secondaryText = TextStyle(
  color: Colors.grey,
  fontSize: 15,
);

fuc() async {
  final response = await http.get(Uri.parse(
    'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/lookup',
  ));
}
