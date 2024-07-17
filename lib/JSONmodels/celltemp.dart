/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = CellTemp.fromJson(map);
*/ 
class CellTemp {
    int? cellAverageTemp;
    int? cellDifferenceTemp;
    int? cellMaxTemp;
    int? cellMinTemp;
    String? maxTempCellNumber;
    String? maxTempGroupNumber;
    String? minTempCellNumber;
    String? minTempGroupNumber;

    //CellTemp({this.cellAverageTemp, this.cellDifferenceTemp, this.cellMaxTemp, this.cellMinTemp, this.maxTempCellNumber, this.maxTempGroupNumber, this.minTempCellNumber, this.minTempGroupNumber}); 

    CellTemp(
      {required this.cellMaxTemp,
      required this.maxTempCellNumber,
      required this.maxTempGroupNumber,
      required this.cellMinTemp,
      required this.minTempCellNumber,
      required this.minTempGroupNumber,
      required this.cellAverageTemp,
      required this.cellDifferenceTemp}
    );

    CellTemp.fromJson(Map<String, dynamic> json) {
        cellAverageTemp = json['cellAverageTemp'];
        cellDifferenceTemp = json['cellDifferenceTemp'];
        cellMaxTemp = json['cellMaxTemp'];
        cellMinTemp = json['cellMinTemp'];
        maxTempCellNumber = json['maxTempCellNumber'];
        maxTempGroupNumber = json['maxTempGroupNumber'];
        minTempCellNumber = json['minTempCellNumber'];
        minTempGroupNumber = json['minTempGroupNumber'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['cellAverageTemp'] = cellAverageTemp;
        data['cellDifferenceTemp'] = cellDifferenceTemp;
        data['cellMaxTemp'] = cellMaxTemp;
        data['cellMinTemp'] = cellMinTemp;
        data['maxTempCellNumber'] = maxTempCellNumber;
        data['maxTempGroupNumber'] = maxTempGroupNumber;
        data['minTempCellNumber'] = minTempCellNumber;
        data['minTempGroupNumber'] = minTempGroupNumber;
        return data;
    }
}