import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanner_app/data/e_code.dart';

class ECodeScreen extends StatefulWidget {
  const ECodeScreen({super.key});

  @override
  _ECodeScreenState createState() => _ECodeScreenState();
}

class _ECodeScreenState extends State<ECodeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<MapEntry<String, String>> _filteredECodeList = ECode.eCodeStatus.entries.toList();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterECodeList);
  }

  void _filterECodeList() {
    setState(() {
      _filteredECodeList = ECode.eCodeStatus.entries
          .where((entry) => entry.key.contains(_searchController.text) || entry.value.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.white),
        centerTitle: true,
        title:  Text("ECode Status", style: TextStyle(fontSize: 22.h, color: Colors.white),),
        backgroundColor: Colors.teal,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Icon(Icons.search, size: 28.h, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18.r),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search ECode',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredECodeList.length,
                itemBuilder: (context, index) {
                  var eCode = _filteredECodeList[index];
                  IconData icon = Icons.warning_amber_rounded;

                  if (eCode.value.contains("HALAL")) {
                    icon = Icons.check_circle_rounded;
                  } else if (eCode.value.contains("HARAM")) {
                    icon = Icons.block_rounded;
                  }

                  return Card(
                    margin: EdgeInsets.only(bottom: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      leading: Icon(icon, color: Colors.teal),
                      title: Text(
                        "${eCode.key}: ${eCode.value}",
                        style: TextStyle(
                          fontSize: 18.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
