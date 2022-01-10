import 'package:flutter/material.dart';
import 'package:flutter_prototype/Component/button.dart';
import 'package:flutter_prototype/Ui/reportsummary.dart';
import 'package:image_picker/image_picker.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String dropDownValue = 'Porthole';
  TextEditingController textController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final breakdownCategories = [
    'Porthole',
    'Traffic Light',
    'Drainage',
    'Signboard',
    'Other'
  ];
  String? breakdownCategory;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  // Pick an image
  void _imgFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void _imgFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 4,
          title: Text('Report Details'),
        ),
        backgroundColor: Color(0xFFF5F5F5),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              buildDescription(),
              buildCategory(),
              buildUploadImage(),
              const SizedBox(height: 24),
              LoginSignupButton(
                  title: 'Submit',
                  ontapp: () {
                    navigateToReportSummary();
                  })
            ],
          ),
        ));
  }

  Widget buildDescription() => TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.notes),
            hintText: 'A porthole found at...',
            labelText: 'Description',
            border: OutlineInputBorder()),
      );

  Widget buildCategory() => Container(
        margin: EdgeInsets.only(top: 24, bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.blue, width: 2)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            hint: Text(
              'Select a breakdown caterogry',
              style: TextStyle(fontSize: 18),
            ),
            value: breakdownCategory,
            items: breakdownCategories.map(buildMenuItem).toList(),
            onChanged: (value) => {setState(() => breakdownCategory = value)},
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem(String breakdownCategory) =>
      DropdownMenuItem(
        value: breakdownCategory,
        child: Text(
          breakdownCategory,
          style: TextStyle(fontSize: 20),
        ),
      );

  Widget buildUploadImage() => Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.blue, width: 2)),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Upload Image',
                  style: TextStyle(fontSize: 20),
                )),
            Image.asset(
              'assets/images/pothole.jpg',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: 64,
                    onPressed: () {
                      _imgFromCamera();
                    },
                    icon: Icon(Icons.camera_alt)),
                const SizedBox(
                  width: 32,
                ),
                IconButton(
                    iconSize: 64,
                    onPressed: () {
                      _imgFromGallery();
                    },
                    icon: Icon(Icons.image))
              ],
            ),
          ],
        ),
      );

  void navigateToReportSummary() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReportSummary()),
      );
}
