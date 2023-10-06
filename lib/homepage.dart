import 'package:flutter/material.dart';
import 'package:submission_1/model/penyakit.dart';
import 'package:submission_1/detailpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Penyakit> filteredSakit = sakit;
  String searchKey = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sehat Mental'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _showExitDialog(context);
            },
          ),
        ],
      ),
      body: ListView(
        // Menggunakan ListView sebagai root
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchKey = value.toLowerCase();
                  filteredSakit = sakit
                      .where((element) =>
                          element.title.toLowerCase().contains(searchKey))
                      .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Menghindari konflik dengan scroll utama
            itemCount: filteredSakit.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(issue: filteredSakit[index]),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        filteredSakit[index].image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredSakit[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              filteredSakit[index].description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(issue: filteredSakit[index]),
                                  ),
                                );
                              },
                              child: const Text("Read more"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Keluar dari aplikasi
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}
