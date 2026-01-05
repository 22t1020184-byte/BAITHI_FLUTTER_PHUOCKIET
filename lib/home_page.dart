import 'package:flutter/material.dart';
// Import Sport từ file riêng
import 'detail_page.dart';
import 'favorites_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Sport> sports = [];
  List<Sport> favoriteSports = [];
  String searchText = '';
  String selectedCategory = 'Tất cả';

  final List<String> categories = ['Tất cả', 'Đồng đội', 'Cá nhân', 'Cá nhân/Đôi'];

  @override
  void initState() {
    super.initState();
    _loadSports();
  }

  void _loadSports() {
    sports = [
      Sport(
        id: '1',
        name: 'Bóng đá',
        description: 'Môn thể thao đồng đội phổ biến nhất thế giới. Hai đội gồm 11 cầu thủ thi đấu để ghi bàn vào khung thành đối phương.',
        imageUrl: 'https://images.unsplash.com/photo-1551958219-acbc608c6377?fm=jpg&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c29jY2VyfGVufDB8fDB8fHww&ixlib=rb-4.1.0&q=60&w=3000',
        category: 'Đồng đội',
        popularity: 5,
        benefits: ['Tăng sức bền', 'Cải thiện tim mạch', 'Rèn tinh thần đồng đội'],
        rules: 'Mỗi đội 11 người, thi đấu 90 phút chia 2 hiệp',
        equipment: 'Bóng, giày, trang phục, tất',
      ),
      Sport(
        id: '2',
        name: 'Bóng rổ',
        description: 'Môn thể thao đồng đội với mục tiêu ném bóng vào rổ đối phương để ghi điểm.',
        imageUrl: 'https://images.unsplash.com/photo-1627627256672-027a4613d028?fm=jpg&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmFza2V0JTIwYmFsbHxlbnwwfHwwfHx8MA%3D%3D&ixlib=rb-4.1.0&q=60&w=3000',
        category: 'Đồng đội',
        popularity: 4,
        benefits: ['Tăng chiều cao', 'Cải thiện phản xạ', 'Phát triển thể lực'],
        rules: 'Mỗi đội 5 người, thi đấu 4 hiệp mỗi hiệp 10 phút',
        equipment: 'Bóng rổ, giày, rổ và bảng',
      ),
      Sport(
        id: '3',
        name: 'Cầu lông',
        description: 'Môn thể thao dùng vợt đánh cầu qua lưới giữa hai bên sân.',
        imageUrl: 'https://images.unsplash.com/photo-1721760886982-3c643f05813d?fm=jpg&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&ixlib=rb-4.1.0&q=60&w=3000',
        category: 'Cá nhân/Đôi',
        popularity: 4,
        benefits: ['Tăng linh hoạt', 'Cải thiện phản xạ', 'Tốt cho mắt'],
        rules: 'Thi đấu theo set, mỗi set 21 điểm, thắng 2/3 set',
        equipment: 'Vợt, cầu, giày thể thao',
      ),
      Sport(
        id: '4',
        name: 'Bơi lội',
        description: 'Môn thể thao vận động dưới nước với nhiều kiểu bơi khác nhau.',
        imageUrl: 'https://plus.unsplash.com/premium_photo-1701030722699-6daeea040f89?fm=jpg&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c3dpbW1pbmd8ZW58MHx8MHx8fDA%3D&ixlib=rb-4.1.0&q=60&w=3000',
        category: 'Cá nhân',
        popularity: 5,
        benefits: ['Phát triển cơ bắp', 'Tốt cho hô hấp', 'Giảm stress'],
        rules: 'Thi đấu theo cự ly, người về đích đầu tiên thắng',
        equipment: 'Đồ bơi, kính bơi, mũ bơi',
      ),
      Sport(
        id: '5',
        name: 'Chạy bộ',
        description: 'Môn thể thao đơn giản, phù hợp với mọi lứa tuổi.',
        imageUrl: 'https://images.unsplash.com/photo-1552674605-db6ffd4facb5',
        category: 'Cá nhân',
        popularity: 5,
        benefits: ['Cải thiện tim mạch', 'Giảm cân', 'Tăng sức bền'],
        rules: 'Chạy từ điểm xuất phát đến đích',
        equipment: 'Giày chạy bộ, trang phục thể thao',
      ),
      Sport(
        id: '6',
        name: 'Tennis',
        description: 'Môn thể thao dùng vợt đánh bóng qua lưới giữa hai bên sân.',
        imageUrl: 'https://images.unsplash.com/photo-1602211844066-d3bb556e983b?auto=format&fit=crop&w=1200&q=80',
        category: 'Cá nhân/Đôi',
        popularity: 4,
        benefits: ['Tăng sức mạnh tay', 'Cải thiện tốc độ', 'Rèn thể lực'],
        rules: 'Thi đấu theo set, mỗi game cần 4 điểm và cách biệt 2 điểm',
        equipment: 'Vợt tennis, bóng tennis, giày tennis',
      ),
    ];
    setState(() {});
  }

  void toggleFavorite(Sport sport) {
    setState(() {
      if (favoriteSports.contains(sport)) {
        favoriteSports.remove(sport);
      } else {
        favoriteSports.add(sport);
      }
    });
  }

  bool isFavorite(Sport sport) {
    return favoriteSports.contains(sport);
  }

  List<Sport> get filteredSports {
    List<Sport> result = sports;

    if (searchText.isNotEmpty) {
      result = result.where((sport) =>
          sport.name.toLowerCase().contains(searchText.toLowerCase()) ||
          sport.description.toLowerCase().contains(searchText.toLowerCase())
      ).toList();
    }

    if (selectedCategory != 'Tất cả') {
      result = result.where((sport) => sport.category == selectedCategory).toList();
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thế Giới Thể Thao'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(favorites: favoriteSports),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm môn thể thao...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Bộ lọc danh mục
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ChoiceChip(
                    label: Text(categories[index]),
                    selected: selectedCategory == categories[index],
                    selectedColor: Colors.blue[100],
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // Số lượng kết quả
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${filteredSports.length} môn thể thao',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  '${favoriteSports.length} môn yêu thích',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),

          // Danh sách môn thể thao
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredSports.length,
              itemBuilder: (context, index) {
                final sport = filteredSports[index];
                return SportCard(
                  sport: sport,
                  isFavorite: isFavorite(sport),
                  onToggleFavorite: () => toggleFavorite(sport),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(sport: sport),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SportCard extends StatelessWidget {
  final Sport sport;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onTap;

  const SportCard({
    super.key,
    required this.sport,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                sport.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: const Icon(Icons.sports, size: 60, color: Colors.grey),
                  );
                },
              ),
            ),

            // Nội dung
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên và nút yêu thích
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          sport.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.pink : Colors.grey,
                        ),
                        onPressed: onToggleFavorite,
                      ),
                    ],
                  ),

                  // Thể loại
                  Chip(
                    label: Text(
                      sport.category,
                      style: const TextStyle(fontSize: 12),
                    ),
                    backgroundColor: Colors.blue[50],
                  ),

                  const SizedBox(height: 8),

                  // Mô tả ngắn
                  Text(
                    sport.description.length > 100
                        ? '${sport.description.substring(0, 100)}...'
                        : sport.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                  ),

                  const SizedBox(height: 8),

                  // Độ phổ biến
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          size: 16,
                          color: index < sport.popularity
                              ? Colors.amber
                              : Colors.grey[300],
                        );
                      }),
                      const SizedBox(width: 5),
                      Text(
                        '${sport.popularity}/5',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}