import 'package:flutter/material.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 36, 47),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: MimoTextWidget(text: 'Categories', color: Colors.white, size: screenSize.width/25, weight: FontWeight.w500),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[900],
        padding: EdgeInsets.symmetric(horizontal:  0.05),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/quote_avatar.png'), // Replace with your image
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '“The memories is a shield and life helper.”',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tamim Al-Barghouti',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCategoryCard(Icons.add, "Add", "0 tasks"),
                  _buildCategoryCard(Icons.home, "Home", "10 tasks"),
                  _buildCategoryCard(Icons.sports, "Sport", "5 tasks"),
                  _buildCategoryCard(Icons.school, "Homework", "13 tasks"),
                  _buildCategoryCard(Icons.computer, "E-learning", "4 tasks"),
                  _buildCategoryCard(Icons.shopping_cart, "Shopping", "9 tasks"),
                  _buildCategoryCard(Icons.fastfood, "Food", "1 task"),
                  _buildCategoryCard(Icons.design_services, "Design", "3 tasks"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: Colors.white),
            Spacer(),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
