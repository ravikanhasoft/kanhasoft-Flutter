import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_demo/ui/filter/bloc/filter_bloc.dart';
import 'package:flutter_demo/utils/preference.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/widget/my_text.dart';
import 'package:flutter_demo/widget/my_text_input.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  FilterViewState createState() => FilterViewState();
}

class FilterViewState extends State<FilterView> {
  late FilterBloc filterBloc;
  late DateTime? fromDate = null;
  late TextEditingController fromDateController;
  late DateTime? toDate = null;
  late TextEditingController toDateController;
  late String? orderDropdowunValue = null;
  late String? statusDropdowunValue = null;
  late bool isTextFeildFill = false;

  @override
  void initState() {
    filterBloc = FilterBloc();
    fromDateController = TextEditingController();
    toDateController = TextEditingController();
    super.initState();
    setUpPrefranceValueInUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: mainUi(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[300],
        title: MyText(
          "Filter",
          textAlign: TextAlign.center,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
    );
  }

  mainUi() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            "From Date",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          GestureDetector(
            onTap: () {
              showDateDailog(
                context,
                callback: (selectedDate) {
                  setState(() {
                    fromDate = selectedDate;
                    fromDateController.text =
                        DateFormat("yyyy-MM-dd").format(selectedDate);
                    checkVisiblityCancelButton();
                  });
                },
              );
            },
            child: MyTextInput(
              isTextEditable: false,
              hintText: "Enter From Date",
              controller: fromDateController,
              labelText: "",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MyText(
            fontSize: 14,
            "To Date",
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          GestureDetector(
            onTap: () {
              // ignore: unnecessary_null_comparison
              if (fromDate == null) {
                showSnackBar("Please select from date");
              } else {
                showDateDailog(
                  firstDate: fromDate,
                  context,
                  callback: (selectedDate) {
                    setState(() {
                      toDate = selectedDate;
                      toDateController.text =
                          DateFormat("yyyy-MM-dd").format(selectedDate);
                      checkVisiblityCancelButton();
                    });
                  },
                );
              }
            },
            child: MyTextInput(
              isTextEditable: false,
              controller: toDateController,
              labelText: "",
              hintText: "Enter To Date",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MyText(
            fontSize: 14,
            "Ordering",
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          myDropdoun(
              hint: 'Please select order',
              list: ["ASCENDING", "DESCENDING"],
              onChnage: (values) {
                setState(() {
                  orderDropdowunValue = values;
                  checkVisiblityCancelButton();
                });
              },
              selectedValue: orderDropdowunValue),
          const SizedBox(
            height: 10,
          ),
          MyText(
            fontSize: 14,
            "Status",
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          myDropdoun(
              hint: 'Please select status',
              list: ["Paid", "Overdue"],
              onChnage: (values) {
                setState(() {
                  statusDropdowunValue = values;
                  checkVisiblityCancelButton();
                });
              },
              selectedValue: statusDropdowunValue),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                applyFilterLogic();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(12),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              child: MyText(
                "Apply Filter",
                color: Colors.white,
                fontWeight: FontWeight.w700,
              )),
          Visibility(
            visible: isTextFeildFill,
            child: ElevatedButton(
              onPressed: () {
                clearFilter();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(12),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              child: MyText(
                "Clear Filter",
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  checkVisiblityCancelButton() {
    isTextFeildFill = !filterBloc.checkFeild(fromDateController.text) ||
        !filterBloc.checkFeild(toDateController.text) ||
        !filterBloc.checkFeild(orderDropdowunValue) ||
        !filterBloc.checkFeild(statusDropdowunValue);
  }

  clearFilter() async {
    setState(() {
      fromDateController.text = "";
      toDateController.text = "";
      statusDropdowunValue = null;

      savePrefValue();
    });
  }

  applyFilterLogic() {
    savePrefValue();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  savePrefValue() async {
    bool isFromDateFilter = filterBloc.checkFeild(fromDateController.text);
    await MyPreference.add(MyPreference.FROM_DATE_FILTER,
        isFromDateFilter ? "" : fromDateController.text, SharePrefType.String);

    bool isToDateFilter = filterBloc.checkFeild(toDateController.text);
    await MyPreference.add(MyPreference.TO_DATE_FILTER,
        isToDateFilter ? "" : toDateController.text, SharePrefType.String);

    await MyPreference.add(
        MyPreference.ORDER_FILTER, orderDropdowunValue, SharePrefType.String);
    bool isStatusDrop = filterBloc.checkFeild(statusDropdowunValue);
    await MyPreference.add(MyPreference.STATUS_FILTER,
        isStatusDrop ? "" : statusDropdowunValue, SharePrefType.String);
    setState(() {
      orderDropdowunValue = "DESCENDING";
    });
  }

  void setUpPrefranceValueInUI() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var fromPrefValue = await MyPreference.get(
          MyPreference.FROM_DATE_FILTER, SharePrefType.String);
      if (fromPrefValue != null) {
        fromDateController.text = fromPrefValue;
      }
      var toPrefValue = await MyPreference.get(
          MyPreference.TO_DATE_FILTER, SharePrefType.String);
      if (toPrefValue != null) {
        toDateController.text = toPrefValue;
      }

      var orderPrefValue = await MyPreference.get(
          MyPreference.ORDER_FILTER, SharePrefType.String);
      if (orderPrefValue != null && orderPrefValue != '') {
        orderDropdowunValue = orderPrefValue;
      }

      var statusPrefValue = await MyPreference.get(
          MyPreference.STATUS_FILTER, SharePrefType.String);
      if (statusPrefValue != null && statusPrefValue != '') {
        statusDropdowunValue = statusPrefValue;
      }
      setState(() {
        checkVisiblityCancelButton();
      });
    });
  }
}
