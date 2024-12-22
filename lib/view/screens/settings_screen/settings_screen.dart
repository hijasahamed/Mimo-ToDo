import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 36, 47),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 36, 47),
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        title: MimoTextWidget(text: 'Settings',  color: Colors.white, size: screenSize.width/25, weight: FontWeight.w500),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width/15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: screenSize.width / 15,
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: const AssetImage('asset/image/user.png'),
                    ),
                    SizedBox(width: screenSize.width/25,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MimoTextWidget(text: 'Malak Idrissi',  color: Colors.white, size: screenSize.width/25, weight: FontWeight.w500),
                        MimoTextWidget(text: 'Rabat, Morocco',  color: Colors.white, size: screenSize.width/35, weight: FontWeight.w400),
                      ],
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 44, 55, 71),
                      child: Icon(Icons.edit,color: Colors.white,),
                    )
                  ],
                ),
                SizedBox(height: screenSize.height/30 ,),
                MimoTextWidget(text: "Hi! My name is Malak, I'm a community manager from Rabat, Morocco",  color: Colors.white, size: screenSize.width/28, weight: FontWeight.w500,maxline: true,),
                SizedBox(height: screenSize.height/15,),
                buildOptionRow(Icons.notifications, "Notifications"),
                buildOptionRow(Icons.settings, "General"),
                buildOptionRow(Icons.person, "Account"),
                buildOptionRow(Icons.info_outline, "About"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildOptionRow(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30.0,
          ),
          const SizedBox(width: 25),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

}