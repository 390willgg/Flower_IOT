import 'dart:convert';

import 'package:flower_project/exceptions/error/exception.dart';
import 'package:flower_project/features/profile/data/datasources/remote_datasources.dart';
import 'package:flower_project/features/profile/data/models/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<ProfileRemoteDataSource>(), MockSpec<http.Client>()])
void main() async {
  final logger = Logger();

  // Create mock object.
  var remoteDataSource = MockProfileRemoteDataSource();
  MockClient mockClient = MockClient();
  var remoteDataSourceImplementation =
      ProfileRemoteDataSourceImplementation(client: mockClient);

  const userId = 1;
  const page = 1;

  Uri urlGetAllUser = Uri.parse("https://reqres.in/api/users?page=$page");
  Uri urlGetUser = Uri.parse("https://reqres.in/api/users/$userId");

  Map<String, dynamic> fakeDataJson = {
    "id": 1,
    "email": "user_@reqres.in",
    "first_name": "Janet",
    "last_name": "Weaver",
    "avatar": "http://image.com/$userId",
  };

  ProfileModel fakeProfileModel = ProfileModel.fromJson(fakeDataJson);

  group(
    "Profile Remote Data Source",
    () {
      group(
        "getUser()",
        () {
          test(
            'SUCCESS TEST',
            () async {
              when(remoteDataSource.getUser(userId)).thenAnswer(
                (_) async => fakeProfileModel,
              );

              try {
                var response = await remoteDataSource.getUser(userId);
                logger.d(response.toJson());
                expect(response, fakeProfileModel);
              } catch (e) {
                logger.e(e);
                fail("IMPOSABLE ERROR");
              }
            },
          );

          test(
            'FAIL',
            () async {
              when(remoteDataSource.getUser(userId)).thenThrow(Exception());

              try {
                var response = await remoteDataSource.getUser(userId);
                logger.d(response.toJson());
                fail("IMPOSABLE ERROR");
              } catch (e) {
                logger.e(e);
                expect(e, isException);
              }
            },
          );
        },
      );

      group(
        "getAllUser()",
        () {
          test(
            'SUCCESS test',
            () async {
              when(remoteDataSource.getAllUser(page)).thenAnswer(
                (_) async => [fakeProfileModel],
              );

              try {
                var response = await remoteDataSource.getAllUser(page);
                expect(response, [fakeProfileModel]);
              } catch (e) {
                fail("IMPOSABLE ERROR");
              }
            },
          );

          test(
            'FAIL',
            () async {
              when(remoteDataSource.getAllUser(page)).thenThrow(Exception());
              try {
                await remoteDataSource.getAllUser(page);
                fail("IMPOSABLE ERROR");
              } catch (e) {
                expect(e, isException);
              }
            },
          );
        },
      );
    },
  );

  group(
    "Profile Remote Data Source Implementation",
    () {
      group(
        "getUser()",
        () {
          test(
            "Success(200)",
            () async {
              when(mockClient.get(urlGetUser))
                  .thenAnswer((_) async => http.Response(
                      jsonEncode({
                        "data": fakeDataJson,
                      }),
                      200));

              try {
                var response =
                    await remoteDataSourceImplementation.getUser(userId);
                // Log detailed response information
                logger.d('Response Type: ${response.runtimeType}');
                logger.d('Response Full Object: ${response.toJson()}');
                logger.d('ID: ${response.id}');
                logger.d('Email: ${response.email}');
                logger.d('First Name: ${response.firstName}');
                logger.d('Last Name: ${response.lastName}');
                logger.d('Full Name: ${response.fullName}');
                logger.d('Avatar: ${response.avatar}');
                logger.d('Profile Image URL: ${response.profileImageUrl}');

                expect(response, fakeProfileModel);
              } catch (e) {
                logger.e(e);
                fail("IMPOSABLE ERROR");
              }
            },
          );

          test(
            "FAIL ERROR (404)",
            () async {
              when(mockClient.get(urlGetUser))
                  .thenAnswer((_) async => http.Response(jsonEncode({}), 404));

              try {
                await remoteDataSourceImplementation.getUser(userId);
                fail("IMPOSABLE ERROR");
              } on EmptyException catch (e) {
                expect(e, isException);
              } catch (e) {
                fail("IMPOSABLE ERROR");
              }
            },
          );

          test(
            "FAIL ERROR (500)",
            () async {
              when(mockClient.get(urlGetUser))
                  .thenAnswer((_) async => http.Response(jsonEncode({}), 500));

              try {
                await remoteDataSourceImplementation.getUser(userId);
                fail("IMPOSABLE ERROR");
              } on EmptyException {
                fail("IMPOSABLE ERROR");
              } catch (e) {
                expect(e, isException);
              }
            },
          );
        },
      );

      group(
        "getAllUser()",
        () {
          test(
            "SUCCESS (200)",
            () async {
              when(mockClient.get(urlGetAllUser)).thenAnswer(
                (_) async => http.Response(
                  jsonEncode({
                    "data": [fakeDataJson],
                  }),
                  200,
                ),
              );

              try {
                var response =
                    await remoteDataSourceImplementation.getAllUser(page);
                logger.d(response.map((e) => e.toJson()).toList());
                expect(response, [fakeProfileModel]);
              } on EmptyException {
                fail("IMPOSABLE ERROR");
              } on StatusCodeException {
                fail("IMPOSABLE ERROR");
              } catch (e) {
                fail("IMPOSABLE ERROR");
              }
            },
          );

          test(
            "FAIL TEST(EMPTY)",
            () async {
              when(mockClient.get(urlGetAllUser)).thenAnswer(
                  (_) async => http.Response(jsonEncode({"data": []}), 200));

              try {
                await remoteDataSourceImplementation.getAllUser(page);
                fail("IMPOSABLE ERROR");
              } on EmptyException catch (e) {
                expect(e, isException);
              } on StatusCodeException {
                fail("IMPOSABLE ERROR");
              } catch (e) {
                fail("IMPOSABLE ERROR");
              }
            },
          );

          test(
            "FAIL TEST(404)",
            () async {
              when(mockClient.get(urlGetAllUser))
                  .thenAnswer((_) async => http.Response(jsonEncode({}), 404));
              try {
                await remoteDataSourceImplementation.getAllUser(page);
                fail("IMPOSABLE ERROR");
              } on EmptyException {
                fail("IMPOSABLE ERROR");
              } on StatusCodeException catch (e) {
                expect(e, isException);
              } catch (e) {
                fail("IMPOSABLE ERROR");
              }
            },
          );

          test(
            "FAIL TEST(500)",
            () async {
              when(mockClient.get(urlGetUser))
                  .thenAnswer((_) async => http.Response(jsonEncode({}), 500));
              try {
                await remoteDataSourceImplementation.getUser(userId);
                fail("IMPOSABLE ERROR");
              } on EmptyException {
                fail("IMPOSABLE ERROR");
              } on StatusCodeException {
                fail("IMPOSABLE ERROR");
              } catch (e) {
                expect(e, isException);
              }
            },
          );
        },
      );
    },
  );
}
