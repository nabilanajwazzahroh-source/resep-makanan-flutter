import 'package:flutter/material.dart';

void main() {
  runApp(const ResepKitaApp());
}

// ==================== TEMA WARNA ====================

const Color sage = Color(0xFF6B8E73);
const Color sageDark = Color(0xFF3F6047);
const Color sageLight = Color(0xFFE1EBDD);
const Color cream = Color(0xFFF5F7F2);
const Color dark = Color(0xFF263A2B);
const Color orange = Color(0xFFE9A23B);

// ==================== MODEL RESEP ====================

class Recipe {
  final String name;
  final String category;
  final String description;
  final String time;
  final String emoji;
  final List<String> ingredients;
  final List<String> steps;

  const Recipe({
    required this.name,
    required this.category,
    required this.description,
    required this.time,
    required this.emoji,
    required this.ingredients,
    required this.steps,
  });
}

// ==================== DATA RESEP ====================

const List<Recipe> recipes = [
  Recipe(
    name: 'Nasi Goreng Spesial',
    category: 'Makanan Berat',
    description: 'Nasi goreng rumahan yang praktis untuk sarapan.',
    time: '20 menit',
    emoji: '🍳',
    ingredients: [
      '2 piring nasi putih',
      '1 butir telur',
      '2 siung bawang putih',
      '1 sdm kecap manis',
      'Garam secukupnya',
    ],
    steps: [
      'Tumis bawang putih hingga harum.',
      'Masukkan telur, lalu orak-arik hingga matang.',
      'Tambahkan nasi, kecap, dan garam.',
      'Aduk hingga rata dan sajikan hangat.',
    ],
  ),
  Recipe(
    name: 'Pancake Pisang',
    category: 'Camilan',
    description: 'Pancake lembut dengan rasa manis alami pisang.',
    time: '15 menit',
    emoji: '🥞',
    ingredients: [
      '1 buah pisang matang',
      '1 butir telur',
      '4 sdm tepung terigu',
      '3 sdm susu',
    ],
    steps: [
      'Haluskan pisang.',
      'Campur pisang, telur, tepung, dan susu.',
      'Tuang adonan ke wajan yang diolesi margarin.',
      'Balik dan masak hingga matang.',
    ],
  ),
  Recipe(
    name: 'Sup Sayur',
    category: 'Makanan Berat',
    description: 'Sup hangat dengan sayuran segar yang mudah dibuat.',
    time: '25 menit',
    emoji: '🥣',
    ingredients: [
      '1 buah wortel',
      '1 buah kentang',
      'Segenggam buncis',
      '700 ml air',
      'Garam dan lada',
    ],
    steps: [
      'Cuci dan potong semua sayuran.',
      'Didihkan air di dalam panci.',
      'Masukkan wortel dan kentang.',
      'Tambahkan buncis, garam, dan lada.',
      'Masak hingga sayuran empuk.',
    ],
  ),
  Recipe(
    name: 'Jus Mangga',
    category: 'Minuman',
    description: 'Minuman buah segar yang cocok untuk cuaca panas.',
    time: '5 menit',
    emoji: '🥭',
    ingredients: [
      '1 buah mangga matang',
      '150 ml air dingin',
      'Es batu secukupnya',
      'Madu sesuai selera',
    ],
    steps: [
      'Kupas dan potong mangga.',
      'Masukkan mangga dan air ke blender.',
      'Tambahkan madu jika suka.',
      'Blender hingga halus dan sajikan.',
    ],
  ),
  Recipe(
    name: 'Roti Telur Keju',
    category: 'Camilan',
    description: 'Menu sederhana untuk sarapan atau camilan.',
    time: '10 menit',
    emoji: '🥪',
    ingredients: [
      '2 lembar roti tawar',
      '1 butir telur',
      '1 lembar keju',
      'Margarin secukupnya',
    ],
    steps: [
      'Kocok telur hingga rata.',
      'Masak telur di wajan.',
      'Letakkan telur dan keju di antara roti.',
      'Panggang sebentar lalu sajikan.',
    ],
  ),
  Recipe(
    name: 'Salad Buah',
    category: 'Camilan',
    description: 'Campuran buah segar dengan saus yogurt sederhana.',
    time: '10 menit',
    emoji: '🍓',
    ingredients: [
      '1 buah apel',
      '1 buah pir',
      '5 buah stroberi',
      '4 sdm yogurt',
    ],
    steps: [
      'Cuci dan potong buah.',
      'Masukkan buah ke dalam mangkuk.',
      'Tambahkan yogurt.',
      'Aduk perlahan dan sajikan.',
    ],
  ),
  Recipe(
    name: 'Mie Goreng',
    category: 'Makanan Berat',
    description: 'Mie goreng sederhana dengan bumbu yang lezat.',
    time: '15 menit',
    emoji: '🍜',
    ingredients: [
      '1 bungkus mie telur',
      '1 butir telur',
      '1 siung bawang putih',
      'Sayuran secukupnya',
      'Kecap dan garam',
    ],
    steps: [
      'Rebus mie hingga matang, lalu tiriskan.',
      'Tumis bawang putih hingga harum.',
      'Masukkan telur dan sayuran.',
      'Tambahkan mie, kecap, dan garam.',
      'Aduk rata lalu sajikan.',
    ],
  ),
  Recipe(
    name: 'Es Cokelat',
    category: 'Minuman',
    description: 'Minuman cokelat dingin yang manis dan menyegarkan.',
    time: '5 menit',
    emoji: '🥤',
    ingredients: [
      '2 sdm bubuk cokelat',
      '200 ml susu',
      'Es batu secukupnya',
      'Gula sesuai selera',
    ],
    steps: [
      'Larutkan bubuk cokelat dengan sedikit air hangat.',
      'Tambahkan susu dan gula.',
      'Aduk hingga tercampur rata.',
      'Tambahkan es batu dan sajikan.',
    ],
  ),
];

// ==================== DATA FAVORIT ====================

final ValueNotifier<Set<String>> favoriteRecipes =
ValueNotifier<Set<String>>({});

void toggleFavorite(Recipe recipe) {
  final updated = Set<String>.from(favoriteRecipes.value);

  if (updated.contains(recipe.name)) {
    updated.remove(recipe.name);
  } else {
    updated.add(recipe.name);
  }

  favoriteRecipes.value = updated;
}

// ==================== APLIKASI UTAMA ====================

class ResepKitaApp extends StatelessWidget {
  const ResepKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResepKita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: sage,
          primary: sage,
          surface: cream,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: cream,
          foregroundColor: dark,
          elevation: 0,
          centerTitle: false,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: sageLight,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: sageDark,
                );
              }

              return const TextStyle(fontSize: 12);
            },
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}

// ==================== NAVIGASI UTAMA ====================

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeTab(),
    ExploreTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.explore),
            label: 'Jelajahi',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// ==================== BERANDA ====================

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: sageLight,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.restaurant_menu,
                  color: sageDark,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, Sobat Masak! 👋',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'ResepKita',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                        color: dark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Banner utama
          Container(
            padding: const EdgeInsets.all(23),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [sageDark, sage],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MASAK JADI SERU ✨',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Temukan resep\nfavoritmu!',
                  style: TextStyle(
                    fontSize: 30,
                    height: 1.2,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Inspirasi masakan praktis untuk setiap hari.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '🥗 🍲 🍰',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 26),

          const SectionTitle(
            title: 'Pilih Kategori',
            subtitle: 'Cari inspirasi sesuai seleramu',
          ),

          const SizedBox(height: 14),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CategoryButton(
                title: 'Makanan Berat',
                emoji: '🍛',
                color: const Color(0xFFE1EBDD),
                onTap: () => openCategory(context, 'Makanan Berat'),
              ),
              CategoryButton(
                title: 'Camilan',
                emoji: '🥐',
                color: const Color(0xFFFFE8D6),
                onTap: () => openCategory(context, 'Camilan'),
              ),
              CategoryButton(
                title: 'Minuman',
                emoji: '🥤',
                color: const Color(0xFFDCEBF7),
                onTap: () => openCategory(context, 'Minuman'),
              ),
            ],
          ),

          const SizedBox(height: 27),

          SectionTitle(
            title: 'Resep Pilihan',
            subtitle: '${recipes.length} inspirasi masakan',
            actionText: 'Lihat semua',
            onAction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const RecipeListPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 14),

          ...recipes.take(4).map(
                (recipe) => RecipeCard(recipe: recipe),
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              'Dibuat dengan ❤️ untuk Sobat Masak',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== JUDUL BAGIAN ====================

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? actionText;
  final VoidCallback? onAction;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: dark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        if (actionText != null)
          TextButton(
            onPressed: onAction,
            child: Text(
              actionText!,
              style: const TextStyle(
                color: sageDark,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}

// ==================== TOMBOL KATEGORI ====================

class CategoryButton extends StatelessWidget {
  final String title;
  final String emoji;
  final Color color;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    required this.emoji,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: dark,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void openCategory(BuildContext context, String category) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => RecipeListPage(category: category),
    ),
  );
}

// ==================== KARTU RESEP ====================

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
        side: const BorderSide(
          color: Color(0xFFE8EDE5),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 65,
          height: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: sageLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            recipe.emoji,
            style: const TextStyle(fontSize: 32),
          ),
        ),
        title: Text(
          recipe.name,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            color: dark,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(recipe.category),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 15,
                    color: sage,
                  ),
                  const SizedBox(width: 4),
                  Text(recipe.time),
                ],
              ),
            ],
          ),
        ),
        trailing: ValueListenableBuilder<Set<String>>(
          valueListenable: favoriteRecipes,
          builder: (context, favorites, _) {
            final isFavorite = favorites.contains(recipe.name);

            return IconButton(
              tooltip: isFavorite
                  ? 'Hapus dari favorit'
                  : 'Tambah ke favorit',
              onPressed: () => toggleFavorite(recipe),
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.redAccent : sage,
              ),
            );
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RecipeDetailPage(recipe: recipe),
            ),
          );
        },
      ),
    );
  }
}

// ==================== JELAJAHI RESEP ====================

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipeListPage(
      embedded: true,
    );
  }
}

class RecipeListPage extends StatefulWidget {
  final String category;
  final bool embedded;

  const RecipeListPage({
    super.key,
    this.category = 'Semua',
    this.embedded = false,
  });

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final TextEditingController controller = TextEditingController();

  late String selected;
  final List<String> categories = [
    'Semua',
    'Makanan Berat',
    'Camilan',
    'Minuman',
  ];

  @override
  void initState() {
    super.initState();
    selected = widget.category;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = recipes.where((recipe) {
      final matchesName = recipe.name
          .toLowerCase()
          .contains(controller.text.trim().toLowerCase());

      final matchesCategory =
          selected == 'Semua' || recipe.category == selected;

      return matchesName && matchesCategory;
    }).toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jelajahi Resep 🔎',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: dark,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Temukan masakan sesuai seleramu.',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: controller,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Cari nama masakan...',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: sage,
                    ),
                    suffixIcon: controller.text.isNotEmpty
                        ? IconButton(
                      onPressed: () {
                        controller.clear();
                        setState(() {});
                      },
                      icon: const Icon(Icons.close),
                    )
                        : null,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 46,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: selected == category,
                    selectedColor: sageLight,
                    onSelected: (_) {
                      setState(() {
                        selected = category;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              '${results.length} resep ditemukan',
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: results.isEmpty
                ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 65,
                    color: sage,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Resep tidak ditemukan.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Coba kata kunci yang lain.'),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: results.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  recipe: results[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== DETAIL RESEP ====================

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Resep',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          ValueListenableBuilder<Set<String>>(
            valueListenable: favoriteRecipes,
            builder: (context, favorites, _) {
              final isFavorite = favorites.contains(recipe.name);

              return IconButton(
                tooltip: isFavorite
                    ? 'Hapus dari favorit'
                    : 'Tambah ke favorit',
                onPressed: () => toggleFavorite(recipe),
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.redAccent : sage,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: sageLight,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              recipe.emoji,
              style: const TextStyle(fontSize: 100),
            ),
          ),

          const SizedBox(height: 22),

          Text(
            recipe.category.toUpperCase(),
            style: const TextStyle(
              color: sageDark,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            recipe.name,
            style: const TextStyle(
              fontSize: 29,
              height: 1.2,
              fontWeight: FontWeight.w900,
              color: dark,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            recipe.description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                  color: sage,
                ),
                const SizedBox(width: 9),
                Text(
                  recipe.time,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.restaurant,
                  color: sage,
                ),
                const SizedBox(width: 7),
                const Text('Mudah'),
              ],
            ),
          ),

          const SizedBox(height: 26),

          const Text(
            'Bahan-bahan',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: dark,
            ),
          ),

          const SizedBox(height: 14),

          ...recipe.ingredients.map(
                (ingredient) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: sage,
                    size: 21,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      ingredient,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Cara Membuat',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: dark,
            ),
          ),

          const SizedBox(height: 15),

          ...List.generate(
            recipe.steps.length,
                (index) => Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: sage,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        recipe.steps[index],
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: sage,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Selamat memasak! 🍳'),
                ),
              );
            },
            icon: const Icon(Icons.restaurant),
            label: const Text(
              'Siap Memasak!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ==================== HALAMAN FAVORIT ====================

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder<Set<String>>(
        valueListenable: favoriteRecipes,
        builder: (context, favorites, _) {
          final favoriteList = recipes
              .where((recipe) => favorites.contains(recipe.name))
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(18, 22, 18, 6),
                child: Text(
                  'Resep Favorit ❤️',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: dark,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 18),
                child: Text(
                  'Kumpulan resep yang kamu sukai.',
                  style: TextStyle(color: Colors.black54),
                ),
              ),

              Expanded(
                child: favoriteList.isEmpty
                    ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 85,
                          color: sage,
                        ),
                        SizedBox(height: 18),
                        Text(
                          'Belum Ada Resep Favorit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: dark,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tekan ikon hati pada resep untuk '
                              'menambahkannya ke daftar favorit.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.5,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: favoriteList.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                      recipe: favoriteList[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ==================== HALAMAN PROFIL ====================

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 15),

          const Text(
            'Profil',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w900,
              color: dark,
            ),
          ),

          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [sageDark, sage],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.restaurant_menu,
                    size: 48,
                    color: sageDark,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'ResepKita',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Inspirasi masakan setiap hari',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Tentang Aplikasi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: dark,
            ),
          ),

          const SizedBox(height: 12),

          const ProfileInfoCard(
            icon: Icons.menu_book,
            title: 'Koleksi Resep',
            subtitle: 'Berbagai resep makanan dan minuman.',
          ),

          ValueListenableBuilder<Set<String>>(
            valueListenable: favoriteRecipes,
            builder: (context, favorites, _) {
              return ProfileInfoCard(
                icon: Icons.favorite,
                title: 'Resep Favorit',
                subtitle: '${favorites.length} resep tersimpan.',
              );
            },
          ),

          const ProfileInfoCard(
            icon: Icons.search,
            title: 'Jelajahi Resep',
            subtitle: 'Cari resep berdasarkan nama dan kategori.',
          ),

          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: sageLight,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.eco,
                  color: sageDark,
                  size: 35,
                ),
                SizedBox(height: 10),
                Text(
                  'Masak dengan senang, '
                      'nikmati setiap hidangan.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: sageDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'ResepKita • Versi 1.0.0',
                  style: TextStyle(
                    fontSize: 12,
                    color: sageDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== KARTU INFORMASI PROFIL ====================

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: sageLight,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: sageDark,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: dark,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(subtitle),
        ),
      ),
    );
  }
}