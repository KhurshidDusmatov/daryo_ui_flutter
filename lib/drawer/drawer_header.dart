import 'package:flutter/material.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({super.key});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Daryo",
                  style: TextStyle(fontSize: 23.0, color: Colors.white)),
              SizedBox(width: 15.0),
              selectLang(),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Toshkent",
                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
              Row(
                children: [
                  Icon(
                    Icons.cloud_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "+12.0",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          ),
          const Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCurrencyRate(Icons.monetization_on_outlined, "12.100"),
              getCurrencyRate(Icons.euro_outlined, "13.100"),
              getCurrencyRate(Icons.currency_ruble, "11.100"),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(color: Colors.blue),
    );
  }

  Widget getCurrencyRate(IconData icon, String rate) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        Text(
          rate,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  List<bool> _selectLang = [false, true];

  Widget selectLang() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30.0)
        ),
        height: 30,
        child: ToggleButtons(
          borderColor: Colors.transparent,
          selectedBorderColor: Colors.transparent,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0)),
                color: _selectLang[0] ? Colors.white : Colors.blue,
              ),
              width: 96,
              height: 30,
              child: Text("Lotincha", style: TextStyle(color: _selectLang[0] ? Colors.blue : Colors.white)),
              alignment: Alignment.center,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
                color: _selectLang[1] ? Colors.white : Colors.blue,
              ),
              width: 96,
              height: 30,
                child: Text("Криллча", style: TextStyle(color: _selectLang[1] ? Colors.blue : Colors.white)),
                alignment: Alignment.center
            ),
          ],
          isSelected: _selectLang,
          onPressed: (index) {
            setState(() {
              if (index == 0) {
                _selectLang[0] = true;
                _selectLang[1] = false;
              } else {
                _selectLang[1] = true;
                _selectLang[0] = false;
              }
            });
          },
        ),
      ),
    );
  }
}
