import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> initializeClient() {
  final HttpLink httpLink = HttpLink(
    'https://swapi-graphql.netlify.app/.netlify/functions/index',
  );


  return ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: httpLink,
    ),
  );
}

ValueNotifier<GraphQLClient> mutationClient() {
  final HttpLink mutationLink = HttpLink(
    'https://graphqlzero.almansi.me/api',
  );


  return ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: mutationLink,
    ),
  );
}