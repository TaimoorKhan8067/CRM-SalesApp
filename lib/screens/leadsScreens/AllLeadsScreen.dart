import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sales_app/configs/constant.dart';
import 'package:sales_app/screens/leadsScreens/clientDetails.dart';
import 'package:sales_app/screens/leadsScreens/historyDialog.dart';
import 'package:sales_app/screens/leadsScreens/propertyDetails.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/leadsListItem.dart';

class Leads extends StatefulWidget {
  final int indexRequired;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Leads(this.indexRequired);
  @override
  // ignore: no_logic_in_create_state
  _LeadsState createState() => _LeadsState(indexRequired);
}

class _LeadsState extends State<Leads> {
  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  final int indexRequired;
  _LeadsState(this.indexRequired);
  String dropdownValue = "New Leads";
  DateTime _selectedDate = DateTime.now();
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    final items = List<ListItem>.generate(
      1000,
      (i) => MessageItem('Client Name $i', 'Project Name $i'),
    );
    return ListView.builder(
      // Let the ListView know how many items it needs to build.
      itemCount: items.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 2,
          child: ExpansionTile(
            // tilePadding: EdgeInsets.all(20),
            backgroundColor: const Color.fromRGBO(153, 153, 153, 0.15),
            initiallyExpanded: false,
            expandedCrossAxisAlignment: CrossAxisAlignment.center,
            leading: Container(
                width: screenWidth * 0.1,
                height: screenHeight * .05,
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: (indexRequired) == 2
                      ? Colors.green
                      : (indexRequired) == 3
                          ? Colors.amber
                          : (indexRequired) == 4
                              ? Colors.pink
                              : (indexRequired) == 5
                                  ? Colors.lime
                                  : (indexRequired) == 6
                                      ? Colors.teal
                                      : index % 4 == 0
                                          ? Colors.green
                                          : index % 4 == 1
                                              ? Colors.amber
                                              : index % 4 == 2
                                                  ? Colors.pink
                                                  : Colors.lime,
                )),
            title: item.buildTitle(context),

            subtitle: item.buildSubtitle(context),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Divider(
                      // height: 20,
                      // indent: 20,
                      // endIndent: 0,
                      color: Colors.black54),

                  // const Text(
                  //     "anything here....anything here....anything here....anything here....anything here....anything here....anything here...."
                  //     'anything here....anything here....anything here....'),
                  const Text(
                    " Details for Lead : ",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                        color: appHeadingColor),
                  ),
                  PropertyDataTable(),
                  const Divider(),
                  const Text(
                    " Client Details : ",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                        color: appHeadingColor),
                  ),
                  ClientDataTable(),
                  const Divider(),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Column(children: [
                      const Text(
                        'Lead Follow Up',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            color: appHeadingColor),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Current Status :",
                            style: TextStyle(
                                // fontSize: 30.0,
                                fontWeight: FontWeight.w500,
                                color: appTextColor),
                          ),
                          const Padding(padding: EdgeInsets.only(right: 10)),
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              "New Leads",
                              "Deal Done",
                              "Keen Intrested",
                              "Visit Done",
                              "Contact in Future"
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Next FollowUp :",
                            style: TextStyle(
                                // fontSize: 30.0,
                                fontWeight: FontWeight.w500,
                                color: appTextColor),
                          ),
                          const Padding(padding: EdgeInsets.only(right: 10)),
                          Row(children: [
                            Text(
                              "${_selectedDate.toLocal()}".split(' ')[0],
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dashed,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.date_range,
                                // color: Colors.white,
                              ),
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    theme: const DatePickerTheme(
                                      itemHeight: 50,
                                    ),
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    // maxTime: DateTime(2019, 6, 7),
                                    onChanged: (date) {
                                  //  print('change $date');
                                }, onConfirm: (date) {
                                  //  print('confirm $date');
                                  setState(() {
                                    _selectedDate = date;
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                            )
                          ]),
                        ],
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 190,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.question_answer_rounded,
                            color: appPrimaryColor,
                          ),
                          labelText: 'Remarks :',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500, color: appTextColor),
                          helperText: 'Write your Comments Here after call.',
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: appPrimaryColor),
                          onPressed: () {},
                          child: const Text("Create FollowUp")),
                    ]),
                  ),
                ],
              ),
            ],
            childrenPadding: const EdgeInsets.all(10),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const HistoryDialog(
                            status: "Deal Done",
                            remarks:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            createdBy: "Hassan",
                            createdOn: "22/02/2022",
                            nextFollow: "End",
                          ),
                        );
//
                      },
                      icon: const Icon(Icons.history)),
                  IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('screenWidth: $screenWidth')));
                        // _launchPhoneURL("03105195204");
                        _callNumber("+923105195204");
//
                      },
                      icon: const Icon(Icons.call)),
                ],
              ),
            ),
            onExpansionChanged: (value) {
              setState(() {
                _isExpanded = value;
              });
            },
          ),
        );
      },
    );
  }
}
