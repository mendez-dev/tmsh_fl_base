import 'package:flutter/material.dart';
class DetailPage extends StatelessWidget {
  final int id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Page"),),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 240,
                child: Container(
                  height: 240,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: Container(width: 125, height: 189, color: Colors.red,))
            ],

          ),
          Container(
            height: 400,
          )
        ],
      ),
   );
  }
}