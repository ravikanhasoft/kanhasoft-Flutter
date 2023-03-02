import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_demo/bloc/base_state.dart';
import 'package:flutter_demo/ui/create_invoice/bloc/create_invoice_bloc.dart';
import 'package:flutter_demo/ui/create_invoice/bloc/create_invoice_event.dart';
import 'package:flutter_demo/ui/create_invoice/bloc/create_invoice_state.dart';

import 'package:flutter_demo/utils/preference.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/widget/my_text.dart';
import 'package:flutter_demo/widget/my_text_input.dart';

class CreateInvoiceView extends StatefulWidget {
  const CreateInvoiceView({super.key});

  @override
  CreateInvoiceState createState() => CreateInvoiceState();
}

class CreateInvoiceState extends State<CreateInvoiceView> {
  late CreateInvoiceBlock createInvoiceBlock;
  late DateTime dateTime;

  late TextEditingController refranceController;
  late TextEditingController dateController;
  late TextEditingController deescriptiopnController;
  late TextEditingController amountController;
  String defaultValueAmount = "GBP";

  @override
  void initState() {
    createInvoiceBlock = CreateInvoiceBlock();
    dateController = TextEditingController();
    refranceController = TextEditingController();
    deescriptiopnController = TextEditingController();
    amountController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateInvoiceBlock>(
      create: (context) => createInvoiceBlock,
      child: BlocListener<CreateInvoiceBlock, BaseState>(
        listener: (context, state) {
          if (state is ErrorState) {
            showSnackBar("${state.errorMessage}");
            // ignore: void_checks
          }
          if (state is CreateInvoceResponse) {
            showSnackBar(state.responseMessage, color: Colors.green);
            dateController.text = "";
            refranceController.text = "";
            deescriptiopnController.text = "";
            amountController.text = "";
          }
        },
        child: mainUi(),
      ),
    );
  }

  mainUi() {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[300],
        title: MyText(
          "Create Invoice",
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
      body: SingleChildScrollView(
        child: createInvoiceUI(),
      ),
    );
  }

  createInvoiceUI() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            "Invoice Refrance",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          MyTextInput(
            hintText: "Enter Invoice Refrance",
            controller: refranceController,
            labelText: "",
          ),
          const SizedBox(
            height: 10,
          ),
          MyText(
            fontSize: 14,
            "Invoice Date",
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          GestureDetector(
            onTap: () {
              showDateDailog(
                context,
                callback: (selectedDate) {
                  setState(() {
                    dateTime = selectedDate;
                    dateController.text =
                        DateFormat("yyyy-MM-dd").format(dateTime);
                  });
                },
              );
            },
            child: MyTextInput(
              isTextEditable: false,
              controller: dateController,
              labelText: "",
              hintText: "Enter Invoice Date",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MyText(
            fontSize: 14,
            "Description",
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          MyTextInput(
              minLines: 5,
              controller: deescriptiopnController,
              labelText: "",
              hintText: "Enter Description"),
          const SizedBox(
            height: 10,
          ),
          MyText(
            fontSize: 14,
            "Amount",
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: myDropdoun(
                      hint: 'Please SELECT CURRENCY',
                      list: ["GBP", "EUR", "USD"],
                      onChnage: (values) {
                        setState(() {
                          defaultValueAmount = values;
                        });
                      },
                      selectedValue: defaultValueAmount)),
              Flexible(
                flex: 1,
                child: MyTextInput(
                  textInputType: TextInputType.number,
                  controller: amountController,
                  labelText: "",
                  hintText: "Enter Amount",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<CreateInvoiceBlock, BaseState>(
            builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    checkValidation();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(12),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: state is LoadingState
                      ? loadingState()
                      : MyText(
                          "Submit",
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ));
            },
          )
        ],
      ),
    );
  }

  checkValidation() {
    if (createInvoiceBlock.checkFeild(refranceController.text)) {
      return showSnackBar("Please enter a refrance");
    } else if (createInvoiceBlock.checkFeild(dateController.text)) {
      return showSnackBar("Please enter a date");
    } else if (createInvoiceBlock.checkFeild(deescriptiopnController.text)) {
      return showSnackBar("Please enter a description");
    } else if (createInvoiceBlock.checkFeild(amountController.text)) {
      return showSnackBar("Please enter a amount");
    }
    callCreateInvoiceApi();
  }

  callCreateInvoiceApi() async {
    FocusScope.of(context).requestFocus(FocusNode());

    Map<String, dynamic> header = {
      "Content-Type": "application/json",
      "Authorization": await MyPreference.get(
          MyPreference.BEARER_TOKEN, SharePrefType.String),
      "Operation-Mode": "SYNC",
      "org-token":
          await MyPreference.get(MyPreference.ORG_TOKEN, SharePrefType.String)
    };
    Map<String, dynamic> body = {
      "listOfInvoices": [
        {
          "bankAccount": {
            "bankId": "",
            "sortCode": "09-01-01",
            "accountNumber": "12345678",
            "accountName": "John Terry"
          },
          "customer": {
            "firstName": "Nguyen",
            "lastName": "Dung 2",
            "contact": {
              "email": "nguyendung2@101digital.io",
              "mobileNumber": "+6597594971"
            },
            "addresses": [
              {
                "premise": "CT11",
                "countryCode": "VN",
                "postcode": "1000",
                "county": "hoangmai",
                "city": "hanoi"
              }
            ]
          },
          "documents": [
            {
              "documentId": "96ea7d60-89ed-4c3b-811c-d2c61f5feab2",
              "documentName": "Bill",
              "documentUrl": "http://url.com/#123"
            }
          ],
          "invoiceReference": refranceController.text,
          "invoiceNumber":
              "INV${refranceController.text}${DateTime.now().microsecond}",
          "currency": defaultValueAmount,
          "invoiceDate": dateController.text,
          "dueDate": "2021-06-04",
          "description": deescriptiopnController.text,
          "customFields": [
            {"key": "invoiceCustomField", "value": "value"}
          ],
          "extensions": [
            {
              "addDeduct": "ADD",
              "value": 10,
              "type": "PERCENTAGE",
              "name": "tax"
            },
            {
              "addDeduct": "DEDUCT",
              "type": "FIXED_VALUE",
              "value": 10.00,
              "name": "discount"
            }
          ],
          "items": [
            {
              "itemReference": "itemRef",
              "description": "Honda RC150",
              "quantity": 1,
              "rate": amountController.text,
              "itemName": "Honda Motor",
              "itemUOM": "KG",
              "customFields": [
                {"key": "taxiationAndDiscounts_Name", "value": "VAT"}
              ],
              "extensions": [
                {
                  "addDeduct": "ADD",
                  "value": 10,
                  "type": "FIXED_VALUE",
                  "name": "tax"
                },
                {
                  "addDeduct": "DEDUCT",
                  "value": 10,
                  "type": "PERCENTAGE",
                  "name": "tax"
                }
              ]
            }
          ]
        }
      ]
    };
    createInvoiceBlock.add(CreateInvoice(body: body, header: header));
  }
}
