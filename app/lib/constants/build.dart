import 'dart:convert';

const commitBuildDate = '<commit-build-date>';
const commitHash = '<commit-hash>';
// 'PGNvbW1pdC1tZXNzYWdlLWJhc2U2ND4=' is base64 encoded '<commit-message-base64>'
const commitMessageBase64 = 'PGNvbW1pdC1tZXNzYWdlLWJhc2U2ND4=';
final commitMessage = String.fromCharCodes(base64Decode(commitMessageBase64));
const buildNumber = '<build-number>';
