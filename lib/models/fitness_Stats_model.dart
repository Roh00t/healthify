class FitnesssStats {
  final int fitnesssStatsVal;
  final String fitnesssStatsYear;
  final String colorVal;
  FitnesssStats(this.fitnesssStatsVal,this.fitnesssStatsYear,this.colorVal);

  FitnesssStats.fromMap(Map<String, dynamic> map)
      : assert(map['fitnesssStatsVal'] != null),
        assert(map['fitnesssStatsYear'] != null),
        assert(map['colorVal'] != null),
        fitnesssStatsVal = map['fitnesssStatsVal'],
        fitnesssStatsYear=map['fitnesssStatsYear'],
        colorVal = map['colorVal'];

  @override
  String toString() => "Record<$fitnesssStatsVal:$fitnesssStatsYear:$colorVal>";
}