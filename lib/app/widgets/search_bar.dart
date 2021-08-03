import 'package:flutter/material.dart';
import 'package:recipea_app/app/ui/search/view/search_page.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                focusColor: Theme.of(context).highlightColor,
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: IconButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SearchPage(
                            query: _controller.text, count: 10,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.search_outlined, color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.zero,
                  ),
                  hintText: 'Search...'),
            ),
          ),
          const SizedBox(width: 10.0),
          Container(
            padding: const EdgeInsets.all(16.5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Icon(Icons.tune, color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
