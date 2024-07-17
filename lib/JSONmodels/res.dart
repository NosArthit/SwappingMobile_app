import 'package:collection/collection.dart';
import 'package:my_application/JSONmodels/bmsstate.dart';

class Response {

  String? status;
  BmsState? bmsState;

  Response({
    this.status,
    this.bmsState,
  });

  @override
  String toString() {
    return 'Response(status: $status, data: $bmsState)';
  }

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json['status'] as String?,
        bmsState: json['data'] == null
            ? null
            : BmsState.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': bmsState?.toJson(),
      };

  Response copyWith({
    String? status,
    BmsState? data,
  }) {
    return Response(
      status: status ?? this.status,
      bmsState: data ?? this.bmsState,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Response) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^
      bmsState.hashCode;
}