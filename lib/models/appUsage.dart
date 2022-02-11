class Usage {
  final int usageVal;
  final String usageDetails;
  final String colorVal;
  Usage(this.usageDetails,this.usageVal,this.colorVal);

  Usage.fromMap(Map<String, dynamic> map)
      : assert(map['usagedetails'] != null),
        assert(map['usageVal'] != null),
        assert(map['colorVal'] != null),
        usageDetails = map['usagedetails'],
        usageVal = map['usageVal'],
        colorVal=map['colorVal'];

  @override
  String toString() => "Record<$usageVal:$usageDetails>";
}