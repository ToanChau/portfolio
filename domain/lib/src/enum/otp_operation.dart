enum OtpOperation {
  confirmAccount('confirmAccount'),
  deleteAccount('deleteAccount');

  const OtpOperation(this.value);

  final String value;
}
