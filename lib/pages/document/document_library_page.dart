import 'package:flutter/material.dart';
import 'package:frontend/common/routes/names.dart';
import 'package:frontend/common/values/fonts.dart';
import 'package:frontend/main.dart';


class DocumentLibraryPage extends StatefulWidget {
  const DocumentLibraryPage({super.key});

  @override
  State<DocumentLibraryPage> createState() => _DocumentLibraryPageState();
}

class _DocumentLibraryPageState extends State<DocumentLibraryPage>{
  int selectedItem = -1;
  bool isTapped = false;
  List<GetFile> items = [];
  List<GetFile> favouriteItems = [];


  @override
  void initState(){
    items = [
      GetFile("File_1", "Ivan", ".pdf","bytes", 2456, true),
      GetFile("File_2", "Oleg", ".doc", "bytes", 3283483, false),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Мои документы"),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              navigatorKey.currentState?.pushNamed(AppRoutes.service);
            },
            icon: const Icon(Icons.arrow_back)
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: TextButton(
                  onPressed: null,
                  child: Text("Все")
                )
              ),
              Tab(
                child: TextButton(
                  onPressed: null,
                  child: Text("Избранное")
                )
              ),
            ]
          )
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24
                  ),
                  child: buildListView(items)
                )
              ],
            ),
            const Text("hfuehofihe")
          ]
        )
      )
    );
  }

  Widget buildListView(List<GetFile> items){
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index)
      => Padding(
        padding: const EdgeInsets.all(4),
        child: ListTile(
          trailing: IconButton(
            onPressed: (){
              setState(() {
                items[index].isFavourite = !items[index].isFavourite;
              });
            },
            icon: Icon(Icons.favorite,
                color: items[index].isFavourite ? Colors.red : Colors.white)
          ),
          visualDensity: const VisualDensity(vertical: 4),
          leading: const Icon(Icons.file_open_rounded),
          onTap: () {
            setState(() {
              navigatorKey.currentState?.pushNamed(
                  AppRoutes.documentViewer,
                );
              }
            );
          },
          title: Text(
            "Name: ${items[index].name}${items[index].extension}\n"
                "Author: ${items[index].author
            }",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.primary,
            )
          ),
          selected: index == -1,
          selectedTileColor: Colors.black12,
        ),
      )
    );
  }
}

class GetFile{
  final String uid;
  final double size;
  final String author;
  String name;
  final String extension;
  String? description;
  bool isFavourite;

   GetFile(
    this.name,
    this.author,
    this.extension,
    this.uid,
    this.size,
    this.isFavourite,
    {
      this.description
    }
  );
}

