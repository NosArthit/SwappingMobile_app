class BmsState {
  String? sysVoltage;
  String? sysCurrent;
  String? sysSoc;
  String? sysStatus;
  String? chargeLink;
  String? chargeIndicator;
  String? errLevel;
  String? selfCheck;
  String? powerOffRequest;
  String? insulationFade;
  String? canCounter;

  BmsState({
    required this.sysVoltage,
    required this.sysCurrent,
    required this.sysSoc,
    required this.sysStatus,
    required this.chargeLink,
    required this.chargeIndicator,
    required this.errLevel,
    required this.selfCheck,
    required this.powerOffRequest,
    required this.insulationFade,
    required this.canCounter,
  });
}