import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> gender = ["ชาย", "หญิง", "LGT+"];
  String _selectedItem = "ชาย";
  List<ListItem> prefix = [
    ListItem("boy", "เด็กชาย"),
    ListItem("girl", "เด็กหญิง"),
    ListItem("Mr.", "นาย"),
    ListItem("Miss.", "นางสาว"),
    ListItem("Mrs", "นาง"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItem = [];
  ListItem? _selectedPrefix;

  List<DropdownMenuItem<ListItem>> buildropdownmenuitem(List<ListItem> prefix) {
    List<DropdownMenuItem<ListItem>> item = [];
    for (ListItem pf in prefix) {
      item.add(DropdownMenuItem(value: pf, child: Text(pf.name)));
    }
    return item;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dropdownMenuItem = buildropdownmenuitem(prefix);
    _selectedPrefix = _dropdownMenuItem[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lib7_143'),
      ),
      body: Column(
        children: [
          Text("เลือกเพศ"),
          DropdownButton(
            value: _selectedItem,
            items: gender.map((item) {
              return DropdownMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
          ),
          Divider(),
          Text("คำนำหน้า"),
          DropdownButton(
              value: _selectedPrefix,
              items: _dropdownMenuItem,
              onChanged: (value) {
                setState(() {
                  _selectedPrefix = value;
                });
              })
        ],
      ),
    );
  }
}

class ListItem {
  String value;
  String name;
  ListItem(this.value, this.name);
}
