import 'package:flutter/material.dart';
import 'package:qrscanner2/QrCodeGenerator.dart';
import 'package:qrscanner2/QrCodeScanner.dart';

class BarcodeScannerScreen extends StatefulWidget {
  BarcodeScannerScreen({Key? key, String? title}) : super(key: key);

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[QrCodeScanner(), QrCodeGenerator()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF313131),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan Qr Code',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Create Qr Code',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFF5fa693),
        iconSize: 30,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}