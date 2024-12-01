import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bảng Cửu Chương'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MultiplicationTableScreen(),
        ),
      ),
    );
  }
}

class MultiplicationTableScreen extends StatefulWidget {
  @override
  _MultiplicationTableScreenState createState() =>
      _MultiplicationTableScreenState();
}

class _MultiplicationTableScreenState extends State<MultiplicationTableScreen> {
  int? selectedNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nhập một số từ 1 đến 9 để xem bảng cửu chương:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nhập số...',
                ),
                onChanged: (value) {
                  int? number = int.tryParse(value);
                  if (number != null && number >= 1 && number <= 9) {
                    setState(() {
                      selectedNumber = number;
                    });
                  } else {
                    setState(() {
                      selectedNumber = null;
                    });
                  }
                },
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('Hiển Thị'),
            ),
          ],
        ),
        SizedBox(height: 20),
        if (selectedNumber != null)
          Expanded(
            child: SingleChildScrollView(
              child: Table(
                border: TableBorder.all(color: Colors.black, width: 1),
                children: _buildTableRows(selectedNumber!),
              ),
            ),
          )
        else
          Text(
            'Vui lòng nhập số hợp lệ từ 1 đến 9.',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
      ],
    );
  }

  List<TableRow> _buildTableRows(int number) {
    List<TableRow> rows = [];

    // Hàng tiêu đề
    rows.add(
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Phép Tính',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Kết Quả',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    // Thêm các hàng của bảng cửu chương
    for (int i = 1; i <= 9; i++) {
      rows.add(
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$number × $i',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${number * i}',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    return rows;
  }
}
