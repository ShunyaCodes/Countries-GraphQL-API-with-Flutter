import 'package:countries/model/Country.dart';
import 'package:countries/server/graphQL_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiClients {
  String countryQuery = '''
           query getCountry(\$input: ID!) {
                country(code: \$input) {
                    code 
                    name
                    phone
                    capital
                    currency
                    native
                    emoji
                    continent{
                      name
                    }
                    languages{
                      name
                    }
                }
            }
    ''';

  //query to get country

  Future<Country> getCountry(String code) async {
    Country country = Country();
    try {
      //initializing GraphQLConfig

      GraphQLConfig graphQLConfiguration = GraphQLConfig();
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client.query(
        QueryOptions(
            document: gql(countryQuery), variables: {"input": "$code"}),
      );

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0]?.message);
      } else if (result.data != null) {
        country = Country.fromJson(result.data["country"]);

        return country;
      }
    } catch (e) {
      print(e);
      return country;
    }
  }
}
