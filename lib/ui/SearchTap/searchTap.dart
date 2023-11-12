import 'package:flutter/material.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/SearchResponse/SearchResponse.dart';
import 'package:movies/ui/SearchTap/resultListWidget.dart';

class searchTap extends StatefulWidget {
  @override
  State<searchTap> createState() => _searchTapState();
}

class _searchTapState extends State<searchTap> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var response = SearchResponse();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 12, right: 12),
          child: SizedBox(
            height: 45,
            child: TextFormField(
                onTap: () {

                },
                controller: controller,
                onChanged: (value) async {
                  response = await apiManager.get(value);
                  setState(() {
                    response;
                  });
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: const Color(0xff514F4F),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )),
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        controller.text.isNotEmpty
            ? Expanded(child: resultListWidget(controller.text))
            :
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/movies.png')),
              Center(
                child: Text('No movies found',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.67))),
              ),

            ],
          ),
        ),
      ]),
    );
  }
}