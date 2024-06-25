import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_tutorial/mutation_page.dart';

const String readRepositories = """
query{
  allFilms {
    films {
      title
      id
      director
      releaseDate
    }
  }
}
""";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GraphQL in Flutter"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Query(
              options: QueryOptions(
                document: gql(readRepositories),
              ),
              builder: (QueryResult result,
                  {VoidCallback? refetch, FetchMore? fetchMore}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }

                if (result.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                List repositories = result.data!['allFilms']['films'];

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: repositories.length,
                  itemBuilder: (context, index) {
                    final repository = repositories[index];
                    return ListTile(
                      title: Text(repository['title']),
                      trailing: Text(repository['director']),
                      // onTap: () {
                      //                   //   Navigator.push(
                      //                   //     context,
                      //                   //     MaterialPageRoute(
                      //                   //       builder: (context) => RepositoryDetailPage(repositoryId: repository['id']),
                      //                   //     ),
                      //                   //   );
                      // },
                    );
                  },
                );
              }),
          SizedBox(height: 20),
          Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MutationPage(),));
                  },
                  child: Text("Mutation")))
        ],
      ),
    );
  }
}
