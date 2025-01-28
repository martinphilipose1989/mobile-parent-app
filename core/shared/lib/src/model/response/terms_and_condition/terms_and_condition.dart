class TermsAndConditionsFile {
  final int? status;

  final TermsAndConditions? data;

  final String? message;

  TermsAndConditionsFile({this.status, this.data, this.message});
}

class TermsAndConditions {
  final String? url;

  TermsAndConditions({this.url});
}
