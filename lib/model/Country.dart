class Country {
  String capital;
  String code;
  String currency;
  String native;
  String emoji;
  String name;
  String phone;
  String continent;
  List<String> languages;

  Country(
      {this.capital,
      this.code,
      this.currency,
      this.native,
      this.emoji,
      this.name,
      this.phone,
      this.continent,
      this.languages});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        capital: json['capital'],
        code: json['code'],
        currency: json['currency'],
        native: json['native'],
        emoji: json['emoji'],
        name: json['name'],
        phone: json['phone'],
        continent: json['continent']['name'],
        languages: (json['languages'] as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map<String>((l) => l['name'])
            .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['capital'] = this.capital;
    data['code'] = this.code;
    data['currency'] = this.currency;
    data['native'] = this.native;
    data['emoji'] = this.emoji;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['continent'] = this.continent;
    data['languages'] = this.languages;
    return data;
  }
}
