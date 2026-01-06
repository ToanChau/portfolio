// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(method) => "Sign in with ${method}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "activities": MessageLookupByLibrary.simpleMessage("Activities"),
    "apple": MessageLookupByLibrary.simpleMessage("Apple"),
    "continue_key": MessageLookupByLibrary.simpleMessage("continue"),
    "continue_with": m0,
    "failure_bad_request": MessageLookupByLibrary.simpleMessage(
      "Bad request. Please check your input.",
    ),
    "failure_connection": MessageLookupByLibrary.simpleMessage(
      "Failed to connect to the server.",
    ),
    "failure_connection_timeout": MessageLookupByLibrary.simpleMessage(
      "Connection timed out.",
    ),
    "failure_forbidden": MessageLookupByLibrary.simpleMessage(
      "You do not have permission to access this resource.",
    ),
    "failure_http_unknown": MessageLookupByLibrary.simpleMessage(
      "An unknown HTTP error occurred.",
    ),
    "failure_internal_server": MessageLookupByLibrary.simpleMessage(
      "Internal server error. Please try again later.",
    ),
    "failure_method_not_allowed": MessageLookupByLibrary.simpleMessage(
      "This method is not allowed.",
    ),
    "failure_network_unknown": MessageLookupByLibrary.simpleMessage(
      "An unknown network error occurred.",
    ),
    "failure_not_acceptable": MessageLookupByLibrary.simpleMessage(
      "The request is not acceptable.",
    ),
    "failure_not_found": MessageLookupByLibrary.simpleMessage(
      "Requested resource was not found.",
    ),
    "failure_not_login": MessageLookupByLibrary.simpleMessage(
      "You are not logged in. Please log in to continue.",
    ),
    "failure_parser": MessageLookupByLibrary.simpleMessage(
      "Failed to parse the response.",
    ),
    "failure_receive_timeout": MessageLookupByLibrary.simpleMessage(
      "Request timed out while receiving data.",
    ),
    "failure_send_timeout": MessageLookupByLibrary.simpleMessage(
      "Request timed out while sending data.",
    ),
    "failure_server_unknown": MessageLookupByLibrary.simpleMessage(
      "An unknown server error occurred.",
    ),
    "failure_unauthorized": MessageLookupByLibrary.simpleMessage(
      "Unauthorized access. Please log in.",
    ),
    "google": MessageLookupByLibrary.simpleMessage("Google"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "let_go": MessageLookupByLibrary.simpleMessage("Let\'s Gooooo"),
    "login_again": MessageLookupByLibrary.simpleMessage("Please log in again"),
    "notification": MessageLookupByLibrary.simpleMessage("Notification"),
    "phone_number": MessageLookupByLibrary.simpleMessage("phone number"),
    "promo": MessageLookupByLibrary.simpleMessage("Promos"),
    "qr_code": MessageLookupByLibrary.simpleMessage("Qr code"),
    "session_expired": MessageLookupByLibrary.simpleMessage("Session expired"),
    "sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
    "todo_desciption": MessageLookupByLibrary.simpleMessage(
      "Briefly describe the task so you can crush it!",
    ),
    "todo_empty": MessageLookupByLibrary.simpleMessage(
      "List is clear. Let’s make some chaos!",
    ),
    "todo_title": MessageLookupByLibrary.simpleMessage(
      "What’s your next challenge?",
    ),
    "use_phone_to_sign_in": MessageLookupByLibrary.simpleMessage(
      "Use phone number",
    ),
  };
}
