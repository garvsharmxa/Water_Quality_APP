import 'package:flutter/material.dart';

class WaterQualityMonitoring extends StatefulWidget {
  @override
  _WaterQualityMonitoringState createState() => _WaterQualityMonitoringState();
}

class _WaterQualityMonitoringState extends State<WaterQualityMonitoring> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2023),
      firstDate: DateTime(2010),
      lastDate: DateTime(2023),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Water Quality Monitoring',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select date',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  child: const Text("Select Date"),
                  onPressed: _showDatePicker,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Region Of Interest',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                child: const Text('Draw ROI in Rectangle'),
                onPressed: () {
                  drawRectangle();
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Draw ROI in Polygon'),
                onPressed: () {
                  drawPolygon();
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Calculation to be performed',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
           SizedBox(height: 15,),
           Center(
             child:  SelectItem(
                 items: ['Chlorophyll', 'Turbidity', 'TSS', 'Sentinel 2 RGB']),),
            SizedBox(height: 15,),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  // code to be executed when the button is clicked
                },
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                child: const Text('Clear Map'),
                onPressed: () {
                  // code to be executed when the button is clicked
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void drawRectangle() {
    // code to draw rectangle
  }

  void drawPolygon() {
    // code to draw polygon
  }
}

class SelectItem extends StatefulWidget {
  final List<String> items;

  SelectItem({required this.items});

  @override
  _SelectItemState createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.items.first; // Initialize with the first item
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedItem,
      items: widget.items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedItem = value!;
        });
      },
    );
  }
}
