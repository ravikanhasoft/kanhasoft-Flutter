import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_demo/bloc/base_state.dart';
import 'package:flutter_demo/services/response/response/get_invoice_list.dart';
import 'package:flutter_demo/ui/list/bloc/list_block.dart';
import 'package:flutter_demo/ui/list/bloc/list_event.dart';
import 'package:flutter_demo/ui/list/bloc/list_state.dart';

import 'package:flutter_demo/utils/navigator.dart';
import 'package:flutter_demo/utils/preference.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/widget/my_text.dart';
import 'package:flutter_demo/widget/my_text_input.dart';

class ListDataView extends StatefulWidget {
  const ListDataView({super.key});

  @override
  ListDataState createState() => ListDataState();
}

class ListDataState extends State<ListDataView> {
  late ListBloc _listBloc;
  late GetInvoiceListResponse? response = null;
  final _scrollController = ScrollController();
  late TextEditingController? searchController = null;
  bool isEditingText = true;
  bool isLoading = false;
  int currentPage = 1;
  int? totalRecord = -1;

  @override
  void initState() {
    _listBloc = ListBloc();
    searchController = TextEditingController();
    callApiInvoiceList(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          elevation: 0,
          title: MyText("Invoice List", fontWeight: FontWeight.w700),
          backgroundColor: Colors.grey[300],
        ),
        body: BlocProvider<ListBloc>(
          create: (context) => _listBloc,
          child: BlocListener<ListBloc, BaseState>(
            listener: (context, state) {
              if (state is LoadingState) {
                // ignore: void_checks
                return loadingState();
              }
              if (state is ErrorState) {
                showSnackBar("${state.errorMessage}");
              }
              if (state is GetInvoiceResponse) {
                isLoading = false;
                if (response != null) {
                  if (response?.paging != null) {
                    totalRecord = response?.paging?.totalRecords;
                  }
                  GetInvoiceListResponse ponse = state.response;
                  if (ponse.data != null && ponse.data!.isNotEmpty) {
                    if (currentPage == 1) {
                      response = state.response;
                    } else {
                      response?.data?.addAll(ponse.data!);
                    }
                  }
                } else {
                  response = state.response;
                  if (response?.paging != null) {
                    totalRecord = response?.paging?.totalRecords;
                  }
                }

                setState(() {});
              }
            },
            child: mainUi(),
          ),
        ));
  }

  mainUi() {
    if (response != null) {
      return Scaffold(
          backgroundColor: Colors.grey[300],
          floatingActionButton: SpeedDial(
            icon: Icons.filter_2_sharp,
            overlayOpacity: 0.5,
            backgroundColor: Colors.grey,
            children: [
              SpeedDialChild(
                  onTap: () =>
                      MyNavigator.pushNamed(Routes.strCreateInvoiceRoute)
                          ?.whenComplete(() => {
                                setState(() => {response = null}),
                                callApiInvoiceList(true)
                              }),
                  label: "Add Invoice",
                  backgroundColor: Colors.grey,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              SpeedDialChild(
                  onTap: () =>
                      MyNavigator.pushNamed(Routes.strFilterScreenRoute)
                          ?.whenComplete(() => {
                                setState(() => {response = null}),
                                callApiInvoiceList(true)
                              }),
                  label: "Filter",
                  backgroundColor: Colors.grey,
                  child: const Icon(
                    Icons.filter_alt,
                    color: Colors.white,
                  ))
            ],
          ),
          body: searchListWidget());
    } else {
      return Center(child: loadingState());
    }
  }

  searchListWidget() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: MyTextInput(
            hintText: "Search",
            prefixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            unPrefixIcon: IconButton(
              onPressed: () {
                if (searchController?.text != '') {
                  setState(() {
                    searchController?.text = '';
                    callApiInvoiceList(true);
                  });
                }
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            controller: searchController,
            onChange: (chnageText) {
              if (isEditingText) {
                isEditingText = false;
                Timer(const Duration(seconds: 2), () {
                  isEditingText = true;
                  response = null;
                  callApiInvoiceList(true);
                });
              }
            },
            maxLines: 1,
            labelText: null,
          ),
        ),
        setUpListUI()
      ],
    );
  }

  callApiInvoiceList(isPageStartOne) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        if (isPageStartOne) {
          currentPage = 1;
        }

        Map<String, dynamic> header = {
          "Content-Type": "application/json",
          "Authorization": await MyPreference.get(
              MyPreference.BEARER_TOKEN, SharePrefType.String),
          "org-token": await MyPreference.get(
              MyPreference.ORG_TOKEN, SharePrefType.String)
        };
        var orderingFilter = await MyPreference.get(
            MyPreference.ORDER_FILTER, SharePrefType.String);
        var fromDateFilter = await MyPreference.get(
            MyPreference.FROM_DATE_FILTER, SharePrefType.String);
        var todateFilter = await MyPreference.get(
            MyPreference.TO_DATE_FILTER, SharePrefType.String);

        var statusFilter = await MyPreference.get(
            MyPreference.STATUS_FILTER, SharePrefType.String);

        Map<String, dynamic> body = {
          "pageNum": currentPage,
          "pageSize": 10,
          "dateType": "INVOICE_DATE",
          "sortBy": "CREATED_DATE",
          "ordering": "DESCENDING",
          if (orderingFilter != null && !(_listBloc.checkFeild(orderingFilter)))
            "ordering": orderingFilter,
          if (searchController != null &&
              !(_listBloc.checkFeild(searchController?.text)))
            "keyword": searchController?.text,
          if (fromDateFilter != null && !(_listBloc.checkFeild(fromDateFilter)))
            "fromDate": fromDateFilter,
          if (todateFilter != null && !(_listBloc.checkFeild(todateFilter)))
            "toDate": todateFilter,
          if (statusFilter != null && !(_listBloc.checkFeild(statusFilter)))
            "status": statusFilter,
        };
        _listBloc.add(GetInvoiceList(header: header, body: body));
      },
    );
  }

  Widget setUpListUI() {
    if (response != null) {
      List<Data>? dataList = response?.data;
      if (dataList != null && dataList.isNotEmpty) {
        return Expanded(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return setUpSingleRow(dataList[index]);
                  },
                  itemCount: response?.data?.length,
                  controller: _scrollController
                    ..addListener(() {
                      if (_scrollController.position.pixels ==
                          _scrollController.position.maxScrollExtent) {
                        if (totalRecord != -1 &&
                            dataList.length < totalRecord! &&
                            !isLoading) {
                          callApiInvoiceList(false);
                          setState(() {
                            currentPage++;
                            isLoading = true;
                          });
                        }
                      }
                    }),
                ),
              ),
              Center(
                child: isLoading ? loadingState() : Container(),
              ),
            ],
          ),
        );
      } else {
        return Center(
          child: MyText("List not founded"),
        );
      }
    } else {
      return Center(
        child: MyText("List Screen"),
      );
    }
  }

  setUpSingleRow(Data object) {
    return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText("${object.invoiceNumber}", fontWeight: FontWeight.w700),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText("Invoice Date : ", fontWeight: FontWeight.w700),
                MyText("${object.invoiceDate}"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText("Amount : ", fontWeight: FontWeight.w700),
                MyText("${object.currency}  ${object.balanceAmount}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
