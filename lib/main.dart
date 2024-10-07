import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      theme: ThemeData.dark(),
      home: NetflixHomeScreen(),
    );
  }
}

class NetflixHomeScreen extends StatelessWidget {
  final List<Map<String, String>> seriesTop10 = [
    {"image": "assets/circo_digital.jpg", "title": "Circo Digital"},
    {"image": "assets/ninguem_quer.jpg", "title": "Ninguém Quer"},
    {"image": "assets/monstros.jpg", "title": "Monstros"},
    {"image": "assets/o_amor_mora_ao_lado.jpg", "title": "O Amor Mora ao Lado"},
    {"image": "assets/prison_break.jpg", "title": "Prison Break"},
    {"image": "assets/heartstopper.jpg", "title": "Heartstopper"},
  ];

  final List<Map<String, String>> moviesTop10 = [
    {"image": "assets/o_poco_2.jpg", "title": "O Poço 2"},
    {"image": "assets/prisioneiro_do_caos.jpg", "title": "Prisioneiro do Caos"},
    {"image": "assets/my_first_murder.jpg", "title": "My First Murder"},
    {"image": "assets/bem_vindo_selva.jpg", "title": "Bem-vindo à Selva"},
    {"image": "assets/o_poco.jpg", "title": "O Poço"},
  ];

  Widget buildSection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: 120,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        item["image"]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item["title"]!,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Netflix Clone'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          buildSection('Brasil: Top 10 em séries hoje', seriesTop10),
          buildSection('Brasil: Top 10 em filmes hoje', moviesTop10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Séries Dramáticas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Additional sections can be added here
        ],
      ),
    );
  }
}
