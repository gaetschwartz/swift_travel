// Tedious to type "Map<String,dynamic>" twice
Map<String, dynamic> transformJson(Map<String, dynamic> json) => <String, dynamic>{};

// Much better :)
typedef JSON = Map<String, dynamic>;
JSON transformJsonBetter(JSON json) => <String, dynamic>{};

// Note: You can then import the created type alias 
// anywhere in your project !
