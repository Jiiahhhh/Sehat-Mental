import 'package:flutter/material.dart';
import 'package:submission_1/model/penyakit.dart';

class DetailPage extends StatefulWidget {
  final Penyakit issue;

  DetailPage({required this.issue});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.issue.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited;
              });
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => _showImageDialog(context),
                    child: Image.asset(
                      widget.issue.image,
                      fit: BoxFit.cover,
                      height: constraints.maxHeight,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _buildContent(),
                ),
              ],
            );
          } else {
            // Layout untuk mobile
            return Column(
              children: [
                // Gambar dengan ukuran 1/3 dari layar
                GestureDetector(
                  onTap: () => _showImageDialog(context),
                  child: Container(
                    height: constraints.maxHeight / 3,
                    width: constraints.maxWidth,
                    child: Image.asset(
                      widget.issue.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Konten
                Expanded(child: _buildContent()),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
      children: [
        // Judul Penyakit
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            widget.issue.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Cards
        buildCard('Deskripsi', widget.issue.description),
        buildCard('Penyebab', widget.issue.causes.join('\n\n')),
        buildCard('Solusi', widget.issue.solutions.join('\n\n')),
      ],
    );
  }

  Widget buildCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            child: InteractiveViewer(
              boundaryMargin: EdgeInsets.all(20),
              minScale: 0.1,
              maxScale: 2,
              child: Image.asset(widget.issue.image),
            ),
          ),
        );
      },
    );
  }
}
