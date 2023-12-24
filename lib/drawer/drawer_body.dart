import 'package:flutter/material.dart';

class MyDrawerBody extends StatefulWidget {
  const MyDrawerBody({super.key});

  @override
  State<MyDrawerBody> createState() => _MyDrawerBodyState();
}

class _MyDrawerBodyState extends State<MyDrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
       child: ListView(
          children: [
            category("So'ngi Yangiliklar"),
            category("Mahalliy"),
            category("Dunyo"),
            category("Texnologiyalar"),
            const Divider(),
            Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: category("Tanlanganlar xabarlar", Colors.green)
            ),
            const Divider(),
            SizedBox(height: 16.0),
            category("Madaniyat"),
            category("Avto"),
            category("Sport"),
            category("Foto"),
            category("Lifestyle"),
            category("Kolumnistlar"),
            category("Afisha"),

          ],
        ),
    );
  }

  Widget category(String title, [Color givenColor = Colors.black]) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        title,
        style: TextStyle(
            color: givenColor, fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
