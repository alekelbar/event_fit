import 'package:flutter/material.dart';

class PublishWall extends StatelessWidget {
  const PublishWall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white70),
                iconSize: MaterialStatePropertyAll(35)),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blueGrey.shade500, Colors.green.shade300],
        )),
        child: const Center(
          child: Text("Texto centrado"),
        ),
      ),
    );
  }
}
