import 'package:flutter/material.dart';
import 'detail_page.dart';

class FavoritesPage extends StatelessWidget {
  final List<Sport> favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Môn thể thao yêu thích'),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Chưa có môn thể thao yêu thích',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Hãy thêm môn thể thao bạn yêu thích!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final sport = favorites[index];
                return Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.sports,
                      color: Colors.blue,
                    ),
                    title: Text(
                      sport.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      sport.category,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(sport: sport),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}