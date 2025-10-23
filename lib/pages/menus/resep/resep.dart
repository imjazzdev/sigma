import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sigma/components/other/jadwal.dart';
import 'package:sigma/pages/menus/resep/resep_detail.dart';
import '../../../model/user_menu.dart';

class ResepPage extends StatefulWidget {
  const ResepPage({super.key});

  @override
  State<ResepPage> createState() => _ResepPageState();
}

class _ResepPageState extends State<ResepPage> {
  final supabase = Supabase.instance.client;
  List<UserMenu> userMenus = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchUserMenus();
  }

  Future<void> fetchUserMenus() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    final response = await supabase
        .from('user_menus')
        .select(
          'day_of_week, meal_type, recipes(name, image_url, karbohidrat, gula, lemak_total, protein, serat_pangan)',
        )
        .eq('user_id', userId);

    final data =
        (response as List)
            .map((e) => UserMenu.fromJson(e as Map<String, dynamic>))
            .toList();

    setState(() {
      userMenus = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final hariList = [
      'senin',
      'selasa',
      'rabu',
      'kamis',
      'jumat',
      'sabtu',
      'minggu',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Resep')),
      body: ListView.builder(
        itemCount: hariList.length,
        itemBuilder: (context, index) {
          final hari = hariList[index];

          UserMenu emptyMenu(String meal) => UserMenu(
            dayOfWeek: hari,
            mealType: meal,
            name: '-',
            imageUrl: '',
            karbohidrat: 0,
            gula: 0,
            lemakTotal: 0,
            protein: 0,
            seratPangan: 0,
          );

          final menuPagi = userMenus.firstWhere(
            (e) => e.dayOfWeek == hari && e.mealType == 'pagi',
            orElse: () => emptyMenu('pagi'),
          );

          final menuSiang = userMenus.firstWhere(
            (e) => e.dayOfWeek == hari && e.mealType == 'siang',
            orElse: () => emptyMenu('siang'),
          );

          final menuMalam = userMenus.firstWhere(
            (e) => e.dayOfWeek == hari && e.mealType == 'malam',
            orElse: () => emptyMenu('malam'),
          );

          return JadwalCard(
            hari: hari.substring(0, 3).toUpperCase(),
            onTapPagi: () => _openDetail(context, hari, 'Pagi', menuPagi),
            onTapSiang: () => _openDetail(context, hari, 'Siang', menuSiang),
            onTapMalam: () => _openDetail(context, hari, 'Malam', menuMalam),
            onLongPressPagi: () => _showRecipePicker(context, hari, 'pagi'),
            onLongPressSiang: () => _showRecipePicker(context, hari, 'siang'),
            onLongPressMalam: () => _showRecipePicker(context, hari, 'malam'),
          );
        },
      ),
    );
  }

  // Future<void> _showRecipePicker(
  //   BuildContext context,
  //   String hari,
  //   String mealType,
  // ) async {
  //   final recipes = await supabase
  //       .from('recipes')
  //       .select('id, name, image_url');

  //   showModalBottomSheet(
  //     context: context,

  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (context) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Expanded(
  //             flex: 1,
  //             child: Center(
  //               child: Text(
  //                 '$hari - $mealType',
  //                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 16),
  //             child: Divider(),
  //           ),
  //           Expanded(
  //             flex: 7,
  //             child: ListView.builder(
  //               itemCount: recipes.length,
  //               itemBuilder: (context, index) {
  //                 final recipe = recipes[index];
  //                 return ListTile(
  //                   leading:
  //                       recipe['image_url'] != null &&
  //                               recipe['image_url'].isNotEmpty
  //                           ? Image.network(
  //                             recipe['image_url'],
  //                             width: 50,
  //                             height: 50,
  //                             fit: BoxFit.cover,
  //                           )
  //                           : const Icon(Icons.fastfood),
  //                   title: Text(recipe['name']),
  //                   onTap: () async {
  //                     final userId = supabase.auth.currentUser?.id;
  //                     if (userId == null) return;

  //                     await supabase
  //                         .from('user_menus')
  //                         .update({'recipe_id': recipe['id']})
  //                         .eq('user_id', userId)
  //                         .eq('day_of_week', hari)
  //                         .eq('meal_type', mealType);

  //                     Navigator.pop(context);
  //                     fetchUserMenus(); // refresh tampilan
  //                   },
  //                 );
  //               },
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  Future<void> _showRecipePicker(
    BuildContext context,
    String hari,
    String mealType,
  ) async {
    final recipes = await supabase
        .from('recipes')
        .select('id, name, image_url');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Pilih Menu ${mealType.toUpperCase()} Hari ${hari.toUpperCase()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      final imageUrl = recipe['image_url'] ?? '';
                      final name = recipe['name'] ?? '-';

                      return GestureDetector(
                        onTap: () async {
                          final userId = supabase.auth.currentUser?.id;
                          if (userId == null) return;

                          await supabase
                              .from('user_menus')
                              .update({'recipe_id': recipe['id']})
                              .eq('user_id', userId)
                              .eq('day_of_week', hari)
                              .eq('meal_type', mealType);

                          Navigator.pop(context);
                          fetchUserMenus();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child:
                                      imageUrl.isNotEmpty
                                          ? Image.network(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                          )
                                          : Image.asset(
                                            'assets/images/placeholder.png',
                                            fit: BoxFit.cover,
                                          ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  name,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _openDetail(
    BuildContext context,
    String hari,
    String waktu,
    UserMenu menu,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => DetailMakananPage(
              menu: menu,
              waktu: waktu,
              hari: hari,
              judulHalaman:
                  waktu == 'Pagi'
                      ? 'Sarapan'
                      : waktu == 'Siang'
                      ? 'Makan Siang'
                      : 'Makan Malam',
              iconPath:
                  waktu == 'Pagi'
                      ? "assets/icon/morning.png"
                      : waktu == 'Siang'
                      ? "assets/icon/day-mode.png"
                      : "assets/icon/night.png",
              gambarMakananPath:
                  menu.imageUrl.isEmpty
                      ? "assets/images/placeholder.png"
                      : menu.imageUrl,
              namaMakanan: menu.name,
            ),
      ),
    );
  }
}
