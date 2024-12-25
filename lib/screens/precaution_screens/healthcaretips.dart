import 'package:flutter/material.dart';
import 'package:meternity_hub/screens/precaution_screens/options.dart';

class PregnancyCareApp extends StatelessWidget {
  const PregnancyCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pregnancy Care Tips,',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6B5DE6),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PregnancyCareTipsScreen(),
    );
  }
}

class PregnancyCareTipsScreen extends StatelessWidget {
  const PregnancyCareTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40), // Top spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF6B5DE6),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HealthcareHome()));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10), // Spacing before title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 58.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  'Pregnancy',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B5DE6),
                  ),
                ),
                Text(
                  'Healthcare Tips',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B5DE6),
                  ),
                ),
                Text(
                  '-------------------------------------',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Essential care guidance for every stage',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30), // Spacing after title
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                PregnancyStageCard(
                  title: 'Before Pregnancy',
                  icon: Icons.favorite_border,
                  content: """
      Medical Preparation:
      • Prenatal Vitamins: Start a prenatal vitamin that includes:
        - Folic Acid (400–800 mcg daily): Prevents neural tube defects.
        - Iron (27 mg daily): Supports blood production and prevents anemia.
        - Calcium (1,000 mg daily): Essential for bone health.
        - Vitamin D (600 IU daily): Enhances calcium absorption and supports immune health.
      • Check for immunity against rubella and chickenpox; consider vaccination if not immune.
      
      Lifestyle Adjustments:
      • Quit harmful habits:
        - Alcohol: Completely avoid to prevent fetal alcohol syndrome.
        - Smoking: Increases risks of miscarriage and preterm birth.
      • Dietary adjustments:
        - Include leafy greens, whole grains, lean protein, and low-fat dairy.
        - Limit processed foods and high-mercury fish like swordfish or mackerel.
      
      Genetic Counseling:
      • If applicable, undergo carrier screening for conditions like cystic fibrosis or sickle cell anemia.
      
      Exercise and Weight Management:
      • Maintain a healthy weight to reduce complications like gestational diabetes or preeclampsia.
      • Engage in moderate aerobic exercises (e.g., walking or swimming).
      """,
                ),
                SizedBox(height: 16),
                PregnancyStageCard(
                  title: 'Start of Pregnancy',
                  icon: Icons.baby_changing_station,
                  content: """
      Routine Care:
      • Schedule your first prenatal appointment.
      • Begin tracking weight and blood pressure.
      
      Supplements:
      • Folic Acid: Increase intake to at least 600 mcg daily.
      • Vitamin B6 (1.9 mg daily): Helps manage nausea.
      • Omega-3 Fatty Acids (DHA/EPA, 200–300 mg daily): Supports fetal brain and eye development.
      
      Dietary Considerations:
      • Focus on foods high in:
        - Protein: Lean meat, eggs, and legumes.
        - Iron-rich foods: Spinach, fortified cereals, and red meat, paired with Vitamin C-rich foods.
        - Calcium sources: Milk, yogurt, and fortified plant-based milk.
      • Avoid:
        - Raw or undercooked foods: Sushi, unpasteurized cheese.
        - Excess caffeine: Limit to 200 mg/day (approximately one 12-ounce coffee).
      
      Activity:
      • Continue light to moderate exercise (e.g., prenatal yoga or brisk walking).
      • Avoid high-risk activities like contact sports or hot yoga.
      """,
                ),
                SizedBox(height: 16),
                PregnancyStageCard(
                  title: 'During Pregnancy',
                  icon: Icons.pregnant_woman,
                  content: """
      Supplements:
      • Iron: Increase intake if blood tests indicate anemia; aim for 27–30 mg daily.
      • Calcium and Vitamin D: Maintain current levels.
      • Choline (450 mg daily): Essential for brain and spinal cord development.
      • Magnesium (350–400 mg daily): Helps prevent leg cramps and supports muscle function.
      • Iodine (220 mcg daily): Supports thyroid health.
      
      Dietary Adjustments:
      • Increase caloric intake by:
        - 300 calories/day in the second trimester.
        - 450 calories/day in the third trimester.
      • Stay hydrated (aim for 10–12 cups of fluids daily).
      • Incorporate:
        - Whole grains: For sustained energy.
        - Fruits and vegetables: For fiber and antioxidants.
        - Low-fat dairy: For calcium and protein.
      
      Monitoring and Care:
      • Watch for signs of gestational diabetes; follow a prescribed diet if diagnosed.
      • Monitor fetal movements daily in the third trimester.
      
      Symptom Management:
      • Heartburn: Avoid spicy or acidic foods and eat smaller meals.
      • Swelling: Elevate feet and wear compression socks if needed.
      • Constipation: Increase fiber intake and stay hydrated.
      
      Emotional Health:
      • Practice mindfulness, join support groups, and communicate concerns with your doctor or midwife.
      """,
                ),
                SizedBox(height: 16),
                PregnancyStageCard(
                  title: 'Nearing Delivery',
                  icon: Icons.hourglass_bottom,
                  content: """
      Additional Supplements:
      • Evening Primrose Oil or Raspberry Leaf Tea: May be recommended to prepare for labor, but only under medical supervision.
      • Probiotics: To support gut health and potentially reduce the risk of allergies in the baby.
      
      Dietary Focus:
      • Eat energy-rich but nutritious meals (e.g., nuts, avocados, and whole grains).
      • Maintain protein intake to support the baby's growth.
      
      Preparations:
      • Complete hospital bag packing with essentials for mom and baby.
      • Finalize birth plans and register at the hospital or birthing center.
      • Prepare your home for postpartum recovery (e.g., creating a nursing or resting area).
      
      Monitoring Symptoms:
      • Look out for signs of labor, such as regular contractions, water breaking, or "lightening" when the baby drops.
      • Contact your healthcare provider for any emergency symptoms like vaginal bleeding or reduced fetal movements.
      """,
                ),
                SizedBox(height: 16),
                PregnancyStageCard(
                  title: 'After Pregnancy',
                  icon: Icons.new_releases,
                  content: """
      Supplements:
      • Continue prenatal vitamins if breastfeeding to meet your nutrient needs.
      • Consider additional iron and vitamin C if recovering from significant blood loss.
      
      Diet and Hydration:
      • Focus on foods high in:
        - Protein: To aid tissue repair.
        - Calcium and Vitamin D: Essential for breastfeeding moms.
        - Hydrating fluids: To support milk production.
      
      Physical Recovery:
      • Manage perineal pain with warm sitz baths and over-the-counter pain relievers as prescribed.
      • Gradually resume light exercise like walking to regain strength.
      
      Mental Health:
      • Watch for postpartum depression signs: overwhelming sadness, difficulty bonding with the baby, or persistent anxiety.
      • Seek counseling or support if needed.
      
      Breastfeeding Support:
      • Consult lactation experts for breastfeeding techniques.
      • Maintain adequate caloric intake (approximately 500 extra calories/day if breastfeeding).
      """,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PregnancyStageCard extends StatefulWidget {
  final String title;
  final String content;
  final IconData icon;

  const PregnancyStageCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
  });

  @override
  State<PregnancyStageCard> createState() => _PregnancyStageCardState();
}

class _PregnancyStageCardState extends State<PregnancyStageCard> {
  bool _isExpanded = false;

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '•  ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B5DE6),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '-  ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFormattedContent() {
    final List<Widget> widgets = [];
    final sections = widget.content.trim().split('\n\n');

    for (String section in sections) {
      if (section.trim().isEmpty) continue;

      final lines = section.trim().split('\n');
      if (lines.isEmpty) continue;

      // Add section title
      if (!lines[0].startsWith('•') && !lines[0].startsWith('-')) {
        widgets.add(_buildSectionTitle(lines[0].replaceAll(':', '')));
      }

      // Add points
      for (int i = 1; i < lines.length; i++) {
        final line = lines[i].trim();
        if (line.isEmpty) continue;

        if (line.startsWith('•')) {
          widgets.add(_buildBulletPoint(line.substring(1).trim()));
        } else if (line.startsWith('-')) {
          widgets.add(_buildSubPoint(line.substring(1).trim()));
        } else if (!line.endsWith(':')) {
          widgets.add(_buildBulletPoint(line));
        }
      }

      widgets.add(const SizedBox(height: 16));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    widget.icon,
                    color: const Color(0xFF6B5DE6),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B5DE6),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B5DE6).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: const Color(0xFF6B5DE6),
                    ),
                  ),
                ],
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildFormattedContent(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
