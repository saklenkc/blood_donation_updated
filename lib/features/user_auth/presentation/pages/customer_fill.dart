import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/service/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({super.key});

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController diagnosis = TextEditingController();
  TextEditingController blood_group = TextEditingController();
  TextEditingController indication_transfusion = TextEditingController();
  TextEditingController hb = TextEditingController();
  TextEditingController reaction = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Your Detail",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Name",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: sex,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Sex",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Age",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Address",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: diagnosis,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Diagnosis",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: blood_group,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Blood Group",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: indication_transfusion,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Indication For Transfusion",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: hb,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "HB",
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: reaction,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Previous transfusion / reaction",
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      String Id = randomAlphaNumeric(10);
                      Map<String, dynamic> employeeInfoMap = {
                        "Name": nameController.text,
                        "Sex": sex.text,
                        "Age": ageController.text,
                        "ID": Id,
                        "Location": locationController.text,
                        "Dianogis": diagnosis.text,
                        "Blood_Group": blood_group.text,
                        "Indication_Transfusion": indication_transfusion.text,
                        "HB": hb.text,
                        "Previous_Reaction": reaction.text,
                      };
                      await DatabaseMethods()
                          .addEmployeeDetails(employeeInfoMap, Id)
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "Patient Detail Added Successfully...",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
