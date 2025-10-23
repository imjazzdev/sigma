class UserMenu {
  final String dayOfWeek;
  final String mealType;
  final String name;
  final String imageUrl;
  final double? karbohidrat;
  final double? gula;
  final double? lemakTotal;
  final double? protein;
  final double? seratPangan;

  UserMenu({
    required this.dayOfWeek,
    required this.mealType,
    required this.name,
    required this.imageUrl,
    this.karbohidrat,
    this.gula,
    this.lemakTotal,
    this.protein,
    this.seratPangan,
  });

  UserMenu.fromJson(Map<String, dynamic> json)
    : dayOfWeek = json['day_of_week'],
      mealType = json['meal_type'],
      name = json['recipes']['name'],
      imageUrl = json['recipes']['image_url'] ?? '',
      karbohidrat = (json['recipes']['karbohidrat'] as num?)?.toDouble(),
      gula = (json['recipes']['gula'] as num?)?.toDouble(),
      lemakTotal = (json['recipes']['lemak_total'] as num?)?.toDouble(),
      protein = (json['recipes']['protein'] as num?)?.toDouble(),
      seratPangan = (json['recipes']['serat_pangan'] as num?)?.toDouble();
}
