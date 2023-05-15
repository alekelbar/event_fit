import 'package:event_fit/data/publish_seed.dart';
import 'package:flutter/material.dart';

class PublishWall extends StatelessWidget {
  const PublishWall({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                iconSize: MaterialStatePropertyAll(35)),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blueGrey.shade500, Colors.green.shade300],
        )),
        child: ListView.builder(
          itemCount: publishData.length,
          itemBuilder: (context, index) {
            final publish = publishData[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            publish.name,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      publish.siteDescription,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Image.network(
                      publish.imageUrl,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.people)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.place)),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
