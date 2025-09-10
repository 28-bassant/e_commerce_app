class RegisterRequestDto{
  String? email;
  String? name;
  String? password;
  String? rePassword;
  String? phone;

  RegisterRequestDto({
    required this.email,
    required this.name,
    required this.password,
    required this.rePassword,
    required this.phone,
});
}