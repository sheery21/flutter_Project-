import 'package:flutter/material.dart';
import 'package:flutter_12_start/Model/category_model.dart';
import 'package:flutter_12_start/screens/Burgers/BrugersPage.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

class OderMenu extends StatefulWidget {
  final List<CategoryModel> categories;

  const OderMenu({super.key, required this.categories});

  @override
  State<OderMenu> createState() => _OderMenuState();
}

class _OderMenuState extends State<OderMenu> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Boardwalk burgers',
            style: UiHelper.boldBlueTextFeildStyle(),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFF9FAFB),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Center(
              child: UiHelper.CustomWhiteTextField(
                controller: searchController,
                text: "Search for foods...",
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                itemCount: widget.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 column
                  crossAxisSpacing: 12, // column gap
                  mainAxisSpacing: 12, // row gap
                  childAspectRatio: 0.8, // height/width ratio
                ),
                itemBuilder: (context, index) {
                  final category = widget.categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CatgorTile(categoryName: category.name!),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              category.image!,
                              height: 160,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          category.name!,
                          style: UiHelper.boldBlackTextFeildStyle(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
