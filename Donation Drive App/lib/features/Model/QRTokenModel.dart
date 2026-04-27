class QrTokenmodel {
  final String serialNumber;
  final String campaign;
  final String status;
  final String QR_Code;
  final DateTime generatedData;

  QrTokenmodel({
    required this.serialNumber,
    required this.campaign,
    required this.status,
    required this.QR_Code,
    required this.generatedData,
  });
}
