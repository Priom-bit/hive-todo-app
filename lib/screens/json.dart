import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

import '../model/client_model.dart';

class JsonParser extends StatefulWidget {
  const JsonParser({Key? key}) : super(key: key);

  @override
  State<JsonParser> createState() => _JsonParserState();
}

class _JsonParserState extends State<JsonParser> {
  List<ClientList> clients = [];
  bool isLoading = false;

  @override
  void initState() {
    getClientList();
    super.initState();
  }

  void getClientList() async {
    isLoading = true;
    Response response = await get(Uri.parse(
        'https://a311.yeapps.com/acme_api_702f//api_client/client_list?cid=ACME&user_id=21429&user_pass=1234'));
    isLoading = false;
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var e in decodedResponse["clientList"]) {
        clients.add(ClientList.fromJson(e));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Client Name List',style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ListView.separated(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blueGrey,
                child: ListTile(
                  onTap: () {
                    showBottomSheet(context: context, builder: (_) {
                      return SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(height: 24,),
                            Text(
                              clients[index].clientName!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Text("ID : ${clients[index].clientId!}"),
                            const SizedBox(height: 16,),
                            Text("Market Name : ${clients[index].marketName!}"),
                            const SizedBox(height: 16,),
                            Text("Area Name : ${clients[index].areaName!}"),
                            const SizedBox(height: 16,),
                            Text("Address : ${clients[index].address!}"),
                            const SizedBox(height: 16,),
                            Text("Thana : ${clients[index].thana!}"),
                            const SizedBox(height: 16,),
                            Text("Outstanding : ${clients[index].outstanding!}"),
                            const SizedBox(height: 36,),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                      );
                    });
                  },
                  title: Text(clients[index].clientName!),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
            ),
        );
    }
}