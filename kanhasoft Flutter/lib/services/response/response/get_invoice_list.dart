class GetInvoiceListResponse {
  final List<Data>? data;
  final Paging? paging;
  final Status? status;
  const GetInvoiceListResponse({this.data, this.paging, this.status});
  GetInvoiceListResponse copyWith(
      {List<Data>? data, Paging? paging, Status? status}) {
    return GetInvoiceListResponse(
        data: data ?? this.data,
        paging: paging ?? this.paging,
        status: status ?? this.status);
  }

  Map<String, Object?> toJson() {
    return {
      'data': data?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'paging': paging?.toJson(),
      'status': status?.toJson()
    };
  }

  static GetInvoiceListResponse fromJson(Map<String, Object?> json) {
    return GetInvoiceListResponse(
        data: json['data'] == null
            ? null
            : (json['data'] as List)
                .map<Data>(
                    (data) => Data.fromJson(data as Map<String, Object?>))
                .toList(),
        paging: json['paging'] == null
            ? null
            : Paging.fromJson(json['paging'] as Map<String, Object?>),
        status: json['status'] == null
            ? null
            : Status.fromJson(json['status'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''GetInvoiceListResponse(
                data:${data.toString()},
paging:${paging.toString()},
status:${status.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is GetInvoiceListResponse &&
        other.runtimeType == runtimeType &&
        other.data == data &&
        other.paging == paging &&
        other.status == status;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, data, paging, status);
  }
}

class Status {
  final String? code;
  final String? message;
  const Status({this.code, this.message});

  Map<String, Object?> toJson() {
    return {'code': code, 'message': message};
  }

  static Status fromJson(Map<String, Object?> json) {
    return Status(
        code: json['code'] == null ? null : json['code'] as String,
        message: json['message'] == null ? null : json['message'] as String);
  }

  @override
  String toString() {
    return '''Status(
                code:$code,
message:$message
    ) ''';
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, code, message);
  }
}

class Paging {
  final int? totalRecords;
  final int? pageSize;
  final int? pageNumber;
  const Paging({this.totalRecords, this.pageSize, this.pageNumber});
  Paging copyWith({int? totalRecords, int? pageSize, int? pageNumber}) {
    return Paging(
        totalRecords: totalRecords ?? this.totalRecords,
        pageSize: pageSize ?? this.pageSize,
        pageNumber: pageNumber ?? this.pageNumber);
  }

  Map<String, Object?> toJson() {
    return {
      'totalRecords': totalRecords,
      'pageSize': pageSize,
      'pageNumber': pageNumber
    };
  }

  static Paging fromJson(Map<String, Object?> json) {
    return Paging(
        totalRecords:
            json['totalRecords'] == null ? null : json['totalRecords'] as int,
        pageSize: json['pageSize'] == null ? null : json['pageSize'] as int,
        pageNumber:
            json['pageNumber'] == null ? null : json['pageNumber'] as int);
  }

  @override
  String toString() {
    return '''Paging(
                totalRecords:$totalRecords,
pageSize:$pageSize,
pageNumber:$pageNumber
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Paging &&
        other.runtimeType == runtimeType &&
        other.totalRecords == totalRecords &&
        other.pageSize == pageSize &&
        other.pageNumber == pageNumber;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, totalRecords, pageSize, pageNumber);
  }
}

class Data {
  final String? invoiceId;
  final String? invoiceNumber;
  final String? type;
  final String? currency;
  final String? invoiceDate;
  final String? createdAt;
  final String? dueDate;
  final List<Status>? status;
  final List<dynamic>? subStatus;
  final int? numberOfDocuments;
  final dynamic totalTax;
  final dynamic totalAmount;
  final dynamic balanceAmount;
  final String? description;
  final dynamic totalPaid;
  final dynamic invoiceSubTotal;
  final List<CustomFields>? customFields;
  final dynamic totalDiscount;
  final List<dynamic>? extensions;
  final String? version;
  final Customer? customer;
  final Merchant? merchant;
  final bool? purchaseOrderMatched;
  final bool? isRegulated;
  final bool? isInsured;
  const Data(
      {this.invoiceId,
      this.invoiceNumber,
      this.type,
      this.currency,
      this.invoiceDate,
      this.createdAt,
      this.dueDate,
      this.status,
      this.subStatus,
      this.numberOfDocuments,
      this.totalTax,
      this.totalAmount,
      this.balanceAmount,
      this.description,
      this.totalPaid,
      this.invoiceSubTotal,
      this.customFields,
      this.totalDiscount,
      this.extensions,
      this.version,
      this.customer,
      this.merchant,
      this.purchaseOrderMatched,
      this.isRegulated,
      this.isInsured});
  Data copyWith(
      {String? invoiceId,
      String? invoiceNumber,
      String? type,
      String? currency,
      String? invoiceDate,
      String? createdAt,
      String? dueDate,
      List<Status>? status,
      List<dynamic>? subStatus,
      int? numberOfDocuments,
      dynamic totalTax,
      dynamic totalAmount,
      dynamic balanceAmount,
      String? description,
      dynamic totalPaid,
      dynamic invoiceSubTotal,
      List<CustomFields>? customFields,
      dynamic totalDiscount,
      List<dynamic>? extensions,
      String? version,
      Customer? customer,
      Merchant? merchant,
      bool? purchaseOrderMatched,
      bool? isRegulated,
      bool? isInsured}) {
    return Data(
        invoiceId: invoiceId ?? this.invoiceId,
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        type: type ?? this.type,
        currency: currency ?? this.currency,
        invoiceDate: invoiceDate ?? this.invoiceDate,
        createdAt: createdAt ?? this.createdAt,
        dueDate: dueDate ?? this.dueDate,
        status: status ?? this.status,
        subStatus: subStatus ?? this.subStatus,
        numberOfDocuments: numberOfDocuments ?? this.numberOfDocuments,
        totalTax: totalTax ?? this.totalTax,
        totalAmount: totalAmount ?? this.totalAmount,
        balanceAmount: balanceAmount ?? this.balanceAmount,
        description: description ?? this.description,
        totalPaid: totalPaid ?? this.totalPaid,
        invoiceSubTotal: invoiceSubTotal ?? this.invoiceSubTotal,
        customFields: customFields ?? this.customFields,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        extensions: extensions ?? this.extensions,
        version: version ?? this.version,
        customer: customer ?? this.customer,
        merchant: merchant ?? this.merchant,
        purchaseOrderMatched: purchaseOrderMatched ?? this.purchaseOrderMatched,
        isRegulated: isRegulated ?? this.isRegulated,
        isInsured: isInsured ?? this.isInsured);
  }

  Map<String, Object?> toJson() {
    return {
      'invoiceId': invoiceId,
      'invoiceNumber': invoiceNumber,
      'type': type,
      'currency': currency,
      'invoiceDate': invoiceDate,
      'createdAt': createdAt,
      'dueDate': dueDate,
      'status':
          status?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'subStatus': subStatus,
      'numberOfDocuments': numberOfDocuments,
      'totalTax': totalTax,
      'totalAmount': totalAmount,
      'balanceAmount': balanceAmount,
      'description': description,
      'totalPaid': totalPaid,
      'invoiceSubTotal': invoiceSubTotal,
      'customFields': customFields
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'totalDiscount': totalDiscount,
      'extensions': extensions,
      'version': version,
      'customer': customer?.toJson(),
      'merchant': merchant?.toJson(),
      'purchaseOrderMatched': purchaseOrderMatched,
      'isRegulated': isRegulated,
      'isInsured': isInsured
    };
  }

  static Data fromJson(Map<String, Object?> json) {
    return Data(
        invoiceId:
            json['invoiceId'] == null ? null : json['invoiceId'] as String,
        invoiceNumber: json['invoiceNumber'] == null
            ? null
            : json['invoiceNumber'] as String,
        type: json['type'] == null ? null : json['type'] as String,
        currency: json['currency'] == null ? null : json['currency'] as String,
        invoiceDate:
            json['invoiceDate'] == null ? null : json['invoiceDate'] as String,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String,
        dueDate: json['dueDate'] == null ? null : json['dueDate'] as String,
        status: json['status'] == null
            ? null
            : (json['status'] as List)
                .map<Status>(
                    (data) => Status.fromJson(data as Map<String, Object?>))
                .toList(),
        subStatus: json['subStatus'] == null
            ? null
            : json['subStatus'] as List<dynamic>,
        numberOfDocuments: json['numberOfDocuments'] == null
            ? null
            : json['numberOfDocuments'] as int,
        totalTax: json['totalTax'] == null ? 0.0 : json['totalTax'] as dynamic,
        totalAmount:
            json['totalAmount'] == null ? null : json['totalAmount'] as dynamic,
        balanceAmount:
            json['balanceAmount'] == null ? null : json['balanceAmount'] as dynamic,
        description:
            json['description'] == null ? null : json['description'] as String,
        totalPaid: json['totalPaid'] == null ? null : json['totalPaid'] as dynamic,
        invoiceSubTotal: json['invoiceSubTotal'] == null
            ? null
            : json['invoiceSubTotal'] as dynamic,
        customFields: json['customFields'] == null
            ? null
            : (json['customFields'] as List)
                .map<CustomFields>((data) =>
                    CustomFields.fromJson(data as Map<String, Object?>))
                .toList(),
        totalDiscount:
            json['totalDiscount'] == null ? null : json['totalDiscount'] as dynamic,
        extensions: json['extensions'] == null
            ? null
            : json['extensions'] as List<dynamic>,
        version: json['version'] == null ? null : json['version'] as String,
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer'] as Map<String, Object?>),
        merchant: json['merchant'] == null
            ? null
            : Merchant.fromJson(json['merchant'] as Map<String, Object?>),
        purchaseOrderMatched: json['purchaseOrderMatched'] == null
            ? null
            : json['purchaseOrderMatched'] as bool,
        isRegulated:
            json['isRegulated'] == null ? null : json['isRegulated'] as bool,
        isInsured:
            json['isInsured'] == null ? null : json['isInsured'] as bool);
  }

  @override
  String toString() {
    return '''Data(
                invoiceId:$invoiceId,
invoiceNumber:$invoiceNumber,
type:$type,
currency:$currency,
invoiceDate:$invoiceDate,
createdAt:$createdAt,
dueDate:$dueDate,
status:${status.toString()},
subStatus:$subStatus,
numberOfDocuments:$numberOfDocuments,
totalTax:$totalTax,
totalAmount:$totalAmount,
balanceAmount:$balanceAmount,
description:$description,
totalPaid:$totalPaid,
invoiceSubTotal:$invoiceSubTotal,
customFields:${customFields.toString()},
totalDiscount:$totalDiscount,
extensions:$extensions,
version:$version,
customer:${customer.toString()},
merchant:${merchant.toString()},
purchaseOrderMatched:$purchaseOrderMatched,
isRegulated:$isRegulated,
isInsured:$isInsured
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Data &&
        other.runtimeType == runtimeType &&
        other.invoiceId == invoiceId &&
        other.invoiceNumber == invoiceNumber &&
        other.type == type &&
        other.currency == currency &&
        other.invoiceDate == invoiceDate &&
        other.createdAt == createdAt &&
        other.dueDate == dueDate &&
        other.status == status &&
        other.subStatus == subStatus &&
        other.numberOfDocuments == numberOfDocuments &&
        other.totalTax == totalTax &&
        other.totalAmount == totalAmount &&
        other.balanceAmount == balanceAmount &&
        other.description == description &&
        other.totalPaid == totalPaid &&
        other.invoiceSubTotal == invoiceSubTotal &&
        other.customFields == customFields &&
        other.totalDiscount == totalDiscount &&
        other.extensions == extensions &&
        other.version == version &&
        other.customer == customer &&
        other.merchant == merchant &&
        other.purchaseOrderMatched == purchaseOrderMatched &&
        other.isRegulated == isRegulated &&
        other.isInsured == isInsured;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        invoiceId,
        invoiceNumber,
        type,
        currency,
        invoiceDate,
        createdAt,
        dueDate,
        status,
        subStatus,
        numberOfDocuments,
        totalTax,
        totalAmount,
        balanceAmount,
        description,
        totalPaid,
        invoiceSubTotal,
        customFields,
        totalDiscount,
        extensions);
  }
}

class Merchant {
  final String? id;
  const Merchant({this.id});
  Merchant copyWith({String? id}) {
    return Merchant(id: id ?? this.id);
  }

  Map<String, Object?> toJson() {
    return {'id': id};
  }

  static Merchant fromJson(Map<String, Object?> json) {
    return Merchant(id: json['id'] == null ? null : json['id'] as String);
  }

  @override
  String toString() {
    return '''Merchant(
                id:$id
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Merchant &&
        other.runtimeType == runtimeType &&
        other.id == id;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id);
  }
}

class Customer {
  final String? id;
  final List<dynamic>? addresses;
  const Customer({this.id, this.addresses});
  Customer copyWith({String? id, List<dynamic>? addresses}) {
    return Customer(id: id ?? this.id, addresses: addresses ?? this.addresses);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'addresses': addresses};
  }

  static Customer fromJson(Map<String, Object?> json) {
    return Customer(
        id: json['id'] == null ? null : json['id'] as String,
        addresses: json['addresses'] == null
            ? null
            : json['addresses'] as List<dynamic>);
  }

  @override
  String toString() {
    return '''Customer(
                id:$id,
addresses:$addresses
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Customer &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.addresses == addresses;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, addresses);
  }
}

class CustomFields {
  final String? key;
  final String? value;
  const CustomFields({this.key, this.value});
  CustomFields copyWith({String? key, String? value}) {
    return CustomFields(key: key ?? this.key, value: value ?? this.value);
  }

  Map<String, Object?> toJson() {
    return {'key': key, 'value': value};
  }

  static CustomFields fromJson(Map<String, Object?> json) {
    return CustomFields(
        key: json['key'] == null ? null : json['key'] as String,
        value: json['value'] == null ? null : json['value'] as String);
  }

  @override
  String toString() {
    return '''CustomFields(
                key:$key,
value:$value
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CustomFields &&
        other.runtimeType == runtimeType &&
        other.key == key &&
        other.value == value;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, key, value);
  }
}
