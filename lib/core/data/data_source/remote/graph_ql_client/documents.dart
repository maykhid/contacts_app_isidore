class GQLDocuments {
  static const String login = r'''
    mutation Login($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        user {
          createdAt
          email
          id
          status
          tokens
          updatedAt
        }
        errors {
          fullMessage
          message
          property
        }
        status
      }
    }
''';

  static const String signUp = r'''
    mutation Mutation($userInput: UserRegisterInput!) {
      signup(userInput: $userInput) {
        errors {
          property
          message
          fullMessage
        }
        status
        user {
          createdAt
          email
          id
          status
          tokens
          updatedAt
        }
      }
    }
''';

  static const String allContacts = '''
        query Query {
          contacts {
            address
            createdAt
            email
            name
            id
            phone
            updatedAt
          }
        }
''';

  static const String addContact = r'''
    mutation Mutation($contactInput: ContactInput!) {
      contact(contactInput: $contactInput) {
        contact {
          address
          createdAt
          email
          id
          name
          phone
          updatedAt
        }
        errors {
          fullMessage
          message
          property
        }
        status
      }
    }
''';
}
