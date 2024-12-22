import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/categories_screen_controller.dart';
import 'package:mimo_flutter_app/view/screens/settings_screen/settings_screen.dart';
import 'package:mimo_flutter_app/view/widgets/categories_screen_widget/add_categories_widget.dart';
import 'package:mimo_flutter_app/view/widgets/categories_screen_widget/categories_container_widget.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    CategoriesScreenController categoriesScreenController = Get.put(CategoriesScreenController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 36, 47),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 28, 36, 47),
        leading: Padding(
          padding: EdgeInsets.all(screenSize.width/60),
          child: GestureDetector(
            onTap: () => Get.to(() => SettingsScreen(screenSize: screenSize,)),
            child: const CircleAvatar(backgroundColor: Colors.blueGrey,backgroundImage: AssetImage('asset/image/user.png'))),
        ),
        centerTitle: true,
        title: MimoTextWidget(text: 'Categories', color: Colors.white, size: screenSize.width/25, weight: FontWeight.w500),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            onPressed: () {
              
            },
          ),
        ],       
      ),
      body: Padding(
        padding: EdgeInsets.only(top: screenSize.height/26,right: screenSize.width/20,left: screenSize.width/20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: screenSize.width/13,bottom: screenSize.width/13,right: screenSize.width/26,left: screenSize.width/26),
              margin: EdgeInsets.only(bottom: screenSize.height/25),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 38, 53, 73),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage('asset/image/user.png')
                  ),
                  SizedBox(width: screenSize.width/24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '“The memories is a shield and life helper.”',
                          style: TextStyle(
                            fontSize: screenSize.width/29,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: screenSize.width/40),
                        MimoTextWidget(text: 'Tamim Al-Barghouti', color: Colors.grey, size: screenSize.width/40, weight: FontWeight.w400)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('categories').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: Colors.white,));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 1,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return buildAddCategoryContainer(context: context,categoriesScreenController: categoriesScreenController,screenSize: screenSize);
                    },
                  );
                }

                final categoryDocs = snapshot.data!.docs;

                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: categoryDocs.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return buildAddCategoryContainer(context: context,categoriesScreenController: categoriesScreenController,screenSize: screenSize);
                    }

                    final categoryData = categoryDocs[index - 1];
                    final tasks = categoryData['task'] as List<dynamic>?; 
                    final taskCount = tasks?.length ?? 0; 
                    return buildCategoryContainer(
                      imoji: categoryData['imoji'] ?? 'No Imoji',
                      task: '$taskCount',
                      title: categoryData['title'] ?? 'No Title',
                      screenSize: screenSize,
                      categoriesScreenController: categoriesScreenController,
                      docId: categoryData.id
                    );
                  },
                );
              },
            ),
          ),
          ],
        ),
      ),
    );
  }
}