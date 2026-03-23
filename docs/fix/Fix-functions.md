---
layout: default
title: Fix Functions
parent: Fix
nav_order: 2
---

This page is a replication of the passage [Functions](https://github.com/metafacture/metafacture-core?tab=readme-ov-file#functions) of the Fix Readme.md. Status: [Core Release 8.0.1](https://github.com/metafacture/metafacture-core/releases/tag/metafacture-core-8.0.1)

### Functions

#### Script-level functions

##### `include`

Includes a Fix file and executes it as if its statements were written in place of the function call.

Parameters:

- `path` (required): Path to Fix file (if the path starts with a `.`, it is resolved relative to the including file's directory; otherwise, it is resolved relative to the current working directory).

Options:

- All options are made available as "dynamic" local variables in the included Fix file.

```perl
include("<path>"[, <dynamicLocalVariables>...])
```

[Example for Metafacture Runner](https://github.com/metafacture/metafacture-core/blob/master/metafacture-runner/src/main/dist/examples/transform/miscFix/include/base.fix)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/script/Include.java)

##### `log`

Sends a message to the logs.

Parameters:

- `logMessage` (required): Message to log.

Options:

- `level`: Log level to log at (one of `DEBUG`, `INFO`, `WARN` or `ERROR`). (Default: `INFO`)

```perl
log("<logMessage>"[, level: "<logLevel>"])
```

[Example for Metafacture Runner](https://github.com/metafacture/metafacture-core/blob/master/metafacture-runner/src/main/dist/examples/transform/miscFix/log/base.fix)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/script/Log.java)

##### `nothing`

Does nothing. It is used for benchmarking in Catmandu.

```perl
nothing()
```

[Example in Playground](https://metafacture.org/playground/?example=nothing)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/script/Nothing.java)

##### `put_filemap`

Defines an external map for [lookup](#lookup) from a file or a URL. Maps with more than 2 columns are supported but are reduced to a defined key and a value column.

```perl
put_filemap("<sourceFile>", "<mapName>", sep_char: "\t")
```

The separator (`sep_char`) will vary depending on the source file, e.g.:

| Type | Separator  |
|------|------------|
| CSV  | `,` or `;` |
| TSV  | `\t`       |

Options:

- `allow_empty_values`: Sets whether to allow empty values in the filemap or to ignore these entries. (Default: `false`)
- `compression`: Sets the compression of the file.
- `decompress_concatenated`: Flags whether to use decompress concatenated file compression.
- `encoding`: Sets the encoding used to open the resource.
- `expected_columns`: Sets number of expected columns; lines with different number of columns are ignored. Set to `-1` to disable the check and allow arbitrary number of columns. (Default: `2`)
- `key_column`: Defines the column to be used for keys. Uses zero index. (Default: `0`)
- `value_column`: Defines the column to be used for values. Uses zero index. (Default: `1`)

[Example in Playground](https://metafacture.org/playground/?example=put_filemap)

[Example for Metafacture Runner](https://github.com/metafacture/metafacture-core/blob/master/metafacture-runner/src/main/dist/examples/transform/miscFix/putFilemapLocally/base.fix)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/script/PutFileMap.java)

##### `put_map`

Defines an internal map for [lookup](#lookup) from key/value pairs.

```perl
put_map("<mapName>",
  "dog": "mammal",
  "parrot": "bird",
  "shark": "fish"
)
```

[Example in Playground](https://metafacture.org/playground/?example=put_map)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/script/PutMap.java)

##### `put_rdfmap`

Defines an external RDF map for lookup from a file or an HTTP(S) resource.
As the RDF map is reducing RDF triples to a key/value map it is mandatory to set the target.
The targeted RDF property can optionally be bound by an RDF language tag.

```perl
put_rdfmap("<rdfResource>", "<rdfMapName>", target: "<rdfProperty>")
put_rdfmap("<rdfResource>", "<rdfMapName>", target: "<rdfProperty>", select_language: "<rdfLanguageTag>")
```

[Example in Playground](https://metafacture.org/playground/?example=put_rdfmap)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/script/PutRdfMap.java)

##### `put_var`

Defines a single global variable that can be referenced with `$[<variableName>]`.

```perl
put_var("<variableName>", "<variableValue>")
```

[Example in Playground](https://metafacture.org/playground/?example=put_var)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/script/PutVar.java)

##### `put_vars`

Defines multiple global variables that can be referenced with `$[<variableName>]`.

```perl
put_vars(
  "<variableName_1>": "<variableValue_1>",
  "<variableName_2>": "<variableValue_2>"
)
```

[Example in Playground](https://metafacture.org/playground/?example=put_vars)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/script/PutVars.java)

##### `to_var`

Defines a single global variable that can be referenced with `$[<variableName>]` and assigns the value of the `<sourceField>`.

```perl
to_var("<sourceField>", "<variableName>")
```

Options:

- `default`: Default value if source field does not exist. The option needs to be written in quotation marks because it is a reserved word in Java. (Default: Empty string)

[Example in Playground](https://metafacture.org/playground/?example=to_var)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/script/ToVar.java)

#### Record-level functions

##### `add_array`

Creates a new array (with optional values).

```perl
add_array("<targetFieldName>")
add_array("<targetFieldName>", "<value_1>"[, ...])
```

[Example in Playground](https://metafacture.org/playground/?example=add_array)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/AddArray.java)

##### `add_field`

Creates a field with a defined value.

```perl
add_field("<targetFieldName>", "<fieldValue>")
```

[Example in Playground](https://metafacture.org/playground/?example=add_field)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/AddField.java)

##### `add_hash`

Creates a new hash (with optional values).

```perl
add_hash("<targetFieldName>")
add_hash("<targetFieldName>", "subfieldName": "<subfieldValue>"[, ...])
```

[Example in Playground](https://metafacture.org/playground/?example=add_hash)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/AddHash.java)

##### `array`

Converts a hash/object into an array.

```perl
array("<sourceField>")
```

E.g.:

```perl
array("foo")
# {"name":"value"} => ["name", "value"]
```

[Example in Playground](https://metafacture.org/playground/?example=array)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Array.java)

##### `call_macro`

Calls a named macro, i.e. a list of statements that have been previously defined with the [`do put_macro`](#do-put_macro) bind.

Parameters:

- `name` (required): Unique name of the macro.

Options:

- All options are made available as "dynamic" local variables in the macro.

```perl
do put_macro("<macroName>"[, <staticLocalVariables>...])
  ...
end
call_macro("<macroName>"[, <dynamicLocalVariables>...])
```

[Example in Playground](https://metafacture.org/playground/?example=call_macro)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/CallMacro.java)

##### `copy_field`

Copies a field from an existing field.

```perl
copy_field("<sourceField>", "<targetField>")
```

[Example in Playground](https://metafacture.org/playground/?example=copy_field)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/CopyField.java)

##### `format`

Replaces the value with a formatted (`sprintf`-like) version as in [java.util.Formatter](https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html).

```perl
format("<sourceField>", "<formatString>")
```

[Example in Playground](https://metafacture.org/playground/?example=format)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Format.java)

##### `hash`

Converts an array into a hash/object.

```perl
hash("<sourceField>")
```

E.g.:
```perl
hash("foo")
# ["name", "value"] => {"name":"value"}
```

[Example in Playground](https://metafacture.org/playground/?example=hash)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Hash.java)

##### `move_field`

Moves a field from an existing field. Can be used to rename a field.

```perl
move_field("<sourceField>", "<targetField>")
```

[Example in Playground](https://metafacture.org/playground/?example=move_field)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/MoveField.java)

##### `parse_text`

Parses a text into an array or hash of values using regular expressions and grouping.

```perl
parse_text("<sourceField>", "<parsePattern>")
```

E.g.:

```perl
# date1: "2015-03-07"
parse_text("date1", "(\\d\\d\\d\\d)-(\\d\\d)-(\\d\\d)")
# "date1": "2015",
# "date1": "03".
# "date1": "07"
# This repeated field is internally an array, if you rename the field by adding a `[]` suffix the json/yaml encoder would also interpret this repeated element as array.

# "date2": "2015-03-07"
parse_text("date2", "(?<year>\\d\\d\\d\\d)-(?<month>\\d\\d)-(?<day>\\d\\d)")
# "date2":
#   "year": "2015"
#   "month": "03"
#   "day": "07"

# date: "abcd"
parse_text(date, '(\d\d\d\d)-(\d\d)-(\d\d)')
# date: "abcd"
```

[Example in Playground](https://metafacture.org/playground/?example=parse_text)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/ParseText.java)

##### `paste`

Joins multiple field values into a new field. Can be combined with additional literal strings.

The default `join_char` is a single space. Literal strings have to start with `~`.

```perl
paste("<targetField>", "<sourceField_1>"[, ...][, "join_char": ", "])
```

E.g.:

```perl
# a: eeny
# b: meeny
# c: miny
# d: moe
paste("my.string", "~Hi", "a", "~how are you?")
# "my.string": "Hi eeny how are you?"
```

[Example in Playground](https://metafacture.org/playground/?example=paste)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Paste.java)

##### `print_record`

Prints the current record as JSON either to standard output or to a file.

Parameters:

- `prefix` (optional): Prefix to print before the record; may include [format directives](https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html#syntax) for counter and record ID (in that order). (Default: Empty string)

Options:

- `append`: Whether to open files in append mode if they exist. (Default: `false`)
- `compression` (file output only): Compression mode. (Default: `auto`)
- `destination`: Destination to write the record to; may include [format directives](https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html#syntax) for counter and record ID (in that order). (Default: `stdout`)
- `encoding` (file output only): Encoding used by the underlying writer. (Default: `UTF-8`)
- `footer`: Footer which is written at the end of the output. (Default: `\n`)
- `header`: Header which is written at the beginning of the output. (Default: Empty string)
- `id`: Field name which contains the record ID; if found, will be available for inclusion in `prefix` and `destination`. (Default: `_id`)
- `internal`: Whether to print the record's internal representation instead of JSON. (Default: `false`)
- `pretty`: Whether to use pretty printing. (Default: `false`)
- `separator`: Separator which is written after the record. (Default: `\n`)

```perl
print_record(["<prefix>"][, <options>...])
```

E.g.:

```perl
print_record("%d) Before transformation: ")
print_record(destination: "record-%2$s.json", id: "001", pretty: "true")
print_record(destination: "record-%03d.json.gz", header: "After transformation: ")
```

[Example for Metafacture Runner](https://github.com/metafacture/metafacture-core/blob/master/metafacture-runner/src/main/dist/examples/transform/miscFix/printRecord/base.fix)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/PrintRecord.java)

##### `random`

Creates (or replaces) a field with a random number (less than the specified maximum).

```perl
random("<targetField>", "<maximum>")
```

[Example in Playground](https://metafacture.org/playground/?example=random)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Random.java)

##### `remove_field`

Removes a field.

```perl
remove_field("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=remove_field)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/RemoveField.java)

##### `rename`

Replaces a regular expression pattern in subfield names of a field. Does not change the name of the source field itself.

```perl
rename("<sourceField>", "<regexp>", "<replacement>")
```

[Example in Playground](https://metafacture.org/playground/?example=rename)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Rename.java)

##### `retain`

Deletes all fields except the ones listed (incl. subfields).

```perl
retain("<sourceField_1>"[, ...])
```

[Example in Playground](https://metafacture.org/playground/?example=retain)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Retain.java)

##### `set_array`

Creates a new array (with optional values), provided that the intermediate structures (i.e. parent fields) exist. To create any missing intermediate structures, use [`add_array`](#add_array) instead.

```perl
set_array("<targetFieldName>")
set_array("<targetFieldName>", "<value_1>"[, ...])
```

[Example in Playground](https://metafacture.org/playground/?example=set_array)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/SetArray.java)

##### `set_field`

Creates a field with a defined value, provided that the intermediate structures (i.e. parent fields) exist. To create any missing intermediate structures, use [`add_field`](#add_field) instead.

```perl
set_field("<targetFieldName>", "<fieldValue>")
```

[Example in Playground](https://metafacture.org/playground/?example=set_field)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/SetField.java)

##### `set_hash`

Creates a new hash (with optional values), provided that the intermediate structures (i.e. parent fields) exist. To create any missing intermediate structures, use [`add_hash`](#add_hash) instead.

```perl
set_hash("<targetFieldName>")
set_hash("<targetFieldName>", "subfieldName": "<subfieldValue>"[, ...])
```

[Example in Playground](https://metafacture.org/playground/?example=set_hash)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/SetHash.java)

##### `timestamp`

Creates (or replaces) a field with the current timestamp.

Options:

- `format`: Date and time pattern as in [java.text.SimpleDateFormat](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html). (Default: `timestamp`)
- `timezone`: Time zone as in [java.util.TimeZone](https://docs.oracle.com/javase/8/docs/api/java/util/TimeZone.html). (Default: `UTC`)
- `language`: Language tag as in [java.util.Locale](https://docs.oracle.com/javase/8/docs/api/java/util/Locale.html). (Default: The locale of the host system)

```perl
timestamp("<targetField>"[, format: "<formatPattern>"][, timezone: "<timezoneCode>"][, language: "<languageCode>"])
```

[Example in Playground](https://metafacture.org/playground/?example=timestamp)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Timestamp.java)

##### `vacuum`

Deletes empty fields, arrays and objects.

```perl
vacuum()
```

[Example in Playground](https://metafacture.org/playground/?example=vacuum)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Vacuum.java)

#### Field-level functions

##### `append`

Adds a string at the end of a field value.

```perl
append("<sourceField>", "<appendString>")
```

[Example in Playground](https://metafacture.org/playground/?example=append)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Append.java)

##### `capitalize`

Upcases the first character in a field value.

```perl
capitalize("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=capitalize)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Capitalize.java)

##### `count`

Counts the number of elements in an array or a hash and replaces the field value with this number.

```perl
count("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=count)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Count.java)

##### `downcase`

Downcases all characters in a field value.

```perl
downcase("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=downcase)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Downcase.java)

##### `filter`

Only keeps field values that match the regular expression pattern. Works only with array of strings/repeated fields.

```perl
filter("<sourceField>", "<regexp>")
```

[Example in Playground](https://metafacture.org/playground/?example=filter)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Filter.java)

##### `flatten`

Flattens a nested array field.

```perl
flatten("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=flatten)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Flatten.java)

##### `from_json`

Replaces the string with its JSON deserialization.

Options:

- `error_string`: Error message as a placeholder if the JSON couldn't be parsed. (Default: `null`)

```perl
from_json("<sourceField>"[, error_string: "<errorValue>"])
```

[Example in Playground](https://metafacture.org/playground/?example=from_json)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/FromJson.java)

##### `html_to_text`

Turns HTML text to plain text.

```perl
html_to_text("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=html_to_text)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/HtmlToText.java)

##### `index`

Returns the index position of a substring in a field and replaces the field value with this number.

```perl
index("<sourceField>", "<substring>")
```

[Example in Playground](https://metafacture.org/playground/?example=index)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Index.java)

##### `isbn`

Extracts an ISBN and replaces the field value with the normalized ISBN; optionally converts and/or validates the ISBN.

Options:

- `to`: ISBN format to convert to (either `ISBN10` or `ISBN13`). (Default: Only normalize ISBN)
- `verify_check_digit`: Whether the check digit should be verified. (Default: `false`)
- `error_string`: Error message as a placeholder if the ISBN couldn't be validated. (Default: `null`)

```perl
isbn("<sourceField>"[, to: "<isbnFormat>"][, verify_check_digit: "<boolean>"][, error_string: "<errorValue>"])
```

[Example in Playground](https://metafacture.org/playground/?example=isbn)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Isbn.java)

##### `join_field`

Joins an array of strings into a single string.

```perl
join_field("<sourceField>", "<separator>")
```

[Example in Playground](https://metafacture.org/playground/?example=join_field)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/JoinField.java)

##### `lookup`

Looks up matching values in a map and replaces the field value with this match. [External files](#put_filemap), [internal maps](#put_map) as well as [RDF resources](#put_rdfmap) can be used.

Parameters:

- `path` (required): Field path to look up.
- `map` (optional): Name or path of the map in which to look up values.

Options:

- `default`: Default value to use for unknown values. The option needs to be written in quotation marks because it is a reserved word in Java. (Default: Old value)
- `delete`: Whether to delete unknown values. (Default: `false`)
- `print_unknown`: Whether to print unknown values. (Default: `false`)

Additional options when printing unknown values:

- `append`: Whether to open files in append mode if they exist. (Default: `true`)
- `compression` (file output only): Compression mode. (Default: `auto`)
- `destination`: Destination to write unknown values to; may include [format directives](https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html#syntax) for counter and record ID (in that order). (Default: `stdout`)
- `encoding` (file output only): Encoding used by the underlying writer. (Default: `UTF-8`)
- `footer`: Footer which is written at the end of the output. (Default: `\n`)
- `header`: Header which is written at the beginning of the output. (Default: Empty string)
- `id`: Field name which contains the record ID; if found, will be available for inclusion in `prefix` and `destination`. (Default: `_id`)
- `prefix`: Prefix to print before the unknown value; may include [format directives](https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html#syntax) for counter and record ID (in that order). (Default: Empty string)
- `separator`: Separator which is written after the unknown value. (Default: `\n`)

```perl
lookup("<sourceField>"[, <mapName>][, <options>...])
```

E.g.:

```perl
# local (unnamed) map
lookup("path.to.field", key_1: "value_1", ...)

# internal (named) map
put_map("internal-map", key_1: "value_1", ...)
lookup("path.to.field", "internal-map")

# external file map (implicit)
lookup("path.to.field", "path/to/file", sep_char: ";")

# external file map (explicit)
put_filemap("path/to/file", "file-map", sep_char: ";")
lookup("path.to.field", "file-map")

# RDF map (explicit)
put_rdfmap("path/to/file", "rdf-map", target: "<rdfProperty>")
lookup("path.to.field", "rdf-map")

# with default value
lookup("path.to.field", "map-name", "default": "NA")

# with printing unknown values to a file
lookup("path.to.field", "map-name", print_unknown: "true", destination: "unknown.txt")
```

[Example in Playground](https://metafacture.org/playground/?example=lookup)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Lookup.java)

##### `normalize_utf8`

Performs normalization of diacritics in UTF-8 encoded strings.

```perl
normalize_utf8("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=normalize_utf8)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/NormalizeUTF8.java)

##### `prepend`

Adds a string at the beginning of a field value.

```perl
prepend("<sourceField>", "<prependString>")
```

[Example in Playground](https://metafacture.org/playground/?example=prepend)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Prepend.java)

##### `replace_all`

Replaces a regular expression pattern in field values with a replacement string. Regexp capturing is possible; refer to capturing groups by number (`$<number>`) or name (`${<name>}`).

```perl
replace_all("<sourceField>", "<regexp>", "<replacement>")
```

[Example in Playground](https://metafacture.org/playground/?example=replace_all)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/ReplaceAll.java)

##### `reverse`

Reverses the character order of a string or the element order of an array.

```perl
reverse("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=reverse)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Reverse.java)

##### `sort_field`

Sorts strings in an array. Alphabetically and A-Z by default. Optional numerical and reverse sorting.

```perl
sort_field("<sourceField>")
sort_field("<sourceField>", reverse: "true")
sort_field("<sourceField>", numeric: "true")
```

[Example in Playground](https://metafacture.org/playground/?example=sort_field)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/SortField.java)

##### `split_field`

Splits a string into an array and replaces the field value with this array.

```perl
split_field("<sourceField>", "<separator>")
```

[Example in Playground](https://metafacture.org/playground/?example=split_field)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/SplitField.java)

##### `substring`

Replaces a string with its substring as defined by the start position (offset) and length.

```perl
substring("<sourceField>", "<startPosition>", "<length>")
```

[Example in Playground](https://metafacture.org/playground/?example=substring)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Substring.java)

##### `sum`

Sums numbers in an array and replaces the field value with this number.

```perl
sum("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=sum)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Sum.java)

##### `to_base64`

Replaces the value with its Base64 encoding.

Options:

-`url_safe`: Perform URL-safe encoding (uses Base64URL format). (Default: `false`)

```perl
to_base64("<sourceField>"[, url_safe: "<boolean>"])
```

[Example in Playground](https://metafacture.org/playground/?example=to_base64)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/ToBase64.java)

##### `to_json`

Replaces the value with its JSON serialization.

Options:

- `error_string`: Error message as a placeholder if the JSON couldn't be generated. (Default: `null`)
- `pretty`: Whether to use pretty printing. (Default: `false`)

```perl
to_json("<sourceField>"[, pretty: "<boolean>"][, error_string: "<errorValue>"])
```

[Example in Playground](https://metafacture.org/playground/?example=to_json)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/ToJson.java)

##### `trim`

Deletes whitespace at the beginning and the end of a field value.

```perl
trim("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=trim)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Trim.java)

##### `uniq`

Deletes duplicate values in an array.

```perl
uniq("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=uniq)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Uniq.java)

##### `upcase`

Upcases all characters in a field value.

```perl
upcase("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=upcase)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/Upcase.java)

##### `uri_encode`

Encodes a field value as URI. Aka percent-encoding.

Options:

- `plus_for_space`: Sets whether "space" (` `) will be substituted by a "plus" (`+`) or be percent escaped (`%20`). (Default: `true`)
- `safe_chars`: Sets characters that won't be escaped. Safe characters are the ranges 0..9, a..z and A..Z. These are always safe and should not be specified. (Default: `.-*_`)

```perl
uri_encode("<sourceField>"[, <options>...])
```

E.g.:

```perl
uri_encode("path.to.field", plus_for_space:"false", safe_chars:"")
```

[Example in Playground](https://metafacture.org/playground/?example=uri_encode)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/field/UriEncode.java)

### Selectors

#### `reject`

Ignores records that match a condition.

```perl
if <condition>
  reject()
end
```

[Example in Playground](https://metafacture.org/playground/?example=reject)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/method/record/Reject.java)

### Binds

#### `do list`

Iterates over each element of an array. In contrast to Catmandu, it can also iterate over a single object or string.

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/bind/List.java)

```perl
do list(path: "<sourceField>")
  ...
end
```

[Example in Playground](https://metafacture.org/playground/?example=do_list)

Only the current element is accessible in this case (as the root element).

When specifying a variable name for the current element, the record remains accessible as the root element and the current element is accessible through the variable name:

```perl
do list(path: "<sourceField>", "var": "<variableName>")
  ...
end
```

[Example in Playground](https://metafacture.org/playground/?example=do_list_with_var)

#### `do list_as`

Iterates over each _named_ element of an array (like [`do list`](#do-list) with a variable name). If multiple arrays are given, iterates over the _corresponding_ elements from each array (i.e., all elements with the same array index, skipping elements whose arrays have already been exhausted).

[Example in Playground](https://metafacture.org/playground/?example=do+list_as)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/bind/ListAs.java)

```perl
do list_as(element_1: "<sourceField_1>"[, ...])
  ...
end
```

E.g.:

```perl
# "ccm:university":["https://ror.org/0304hq317"]
# "ccm:university_DISPLAYNAME":["Gottfried Wilhelm Leibniz Universität Hannover"]
set_array("sourceOrga[]")
do list_as(orgId: "ccm:university[]", orgName: "ccm:university_DISPLAYNAME[]")
  copy_field(orgId, "sourceOrga[].$append.id")
  copy_field(orgName, "sourceOrga[].$last.name")
end
# {"sourceOrga":[{"id":"https://ror.org/0304hq317","name":"Gottfried Wilhelm Leibniz Universität Hannover"}]}
```

#### `do once`

Executes the statements only once (when the bind is first encountered), not repeatedly for each record.

```perl
do once()
  ...
end
```

[Example in Playground](https://metafacture.org/playground/?example=do_once)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/bind/Once.java)

In order to execute multiple blocks only once, tag them with unique identifiers:

```perl
do once("maps setup")
  ...
end
do once("vars setup")
  ...
end
```

#### `do put_macro`

Defines a named macro, i.e. a list of statements that can be executed later with the [`call_macro`](#call_macro) function.

Variables can be referenced with `$[<variableName>]`, in the following order of precedence:

1. "dynamic" local variables, passed as options to the `call_macro` function;
2. "static" local variables, passed as options to the `do put_macro` bind;
3. global variables, defined via [`put_var`](#put_var)/[`put_vars`](#put_vars).

Parameters:

- `name` (required): Unique name of the macro.

Options:

- All options are made available as "static" local variables in the macro.

```perl
do put_macro("<macroName>"[, <staticLocalVariables>...])
  ...
end
call_macro("<macroName>"[, <dynamicLocalVariables>...])
```

[Example in Playground](https://metafacture.org/playground/?example=do_put_macro)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/bind/PutMacro.java)

### Conditionals

Conditionals start with `if` in case of affirming the condition or `unless` rejecting the condition.

Conditionals require a final `end`.

Additional conditionals can be set with `elsif` and `else`.

```perl
if <condition(params, ...)>
  ...
end
```

[Example in Playground](https://metafacture.org/playground/?example=if-conditional)

```perl
unless <condition(params, ...)>
  ...
end
```

[Example in Playground](https://metafacture.org/playground/?example=unless-conditional)

```perl
if <condition(params, ...)>
  ...
elsif
  ...
else
  ...
end
```

[Example in Playground](https://metafacture.org/playground/?example=if-elsif-else-conditionals)

#### `contain`

##### `all_contain`

Executes the functions if/unless the field contains the value. If it is an array or a hash all field values must contain the string.

[Example in Playground](https://metafacture.org/playground/?example=all_contain)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/AllContain.java)

##### `any_contain`

Executes the functions if/unless the field contains the value. If it is an array or a hash one or more field values must contain the string.

[Example in Playground](https://metafacture.org/playground/?example=any_contain)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/AnyContain.java)

##### `none_contain`

Executes the functions if/unless the field does not contain the value. If it is an array or a hash none of the field values may contain the string.

[Example in Playground](https://metafacture.org/playground/?example=none_contain)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/NoneContain.java)

##### `str_contain`

Executes the functions if/unless the first string contains the second string.

[Example in Playground](https://metafacture.org/playground/?example=str_contain)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/StrContain.java)

#### `equal`

##### `all_equal`

Executes the functions if/unless the field value equals the string. If it is an array or a hash all field values must equal the string.

[Example in Playground](https://metafacture.org/playground/?example=all_equal)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/AllEqual.java)

##### `any_equal`

Executes the functions if/unless the field value equals the string. If it is an array or a hash one or more field values must equal the string.

[Example in Playground](https://metafacture.org/playground/?example=any_equal)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/AnyEqual.java)

##### `none_equal`

Executes the functions if/unless the field value does not equal the string. If it is an array or a hash none of the field values may equal the string.

[Example in Playground](https://metafacture.org/playground/?example=none_equal)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/NoneEqual.java)

##### `str_equal`

Executes the functions if/unless the first string equals the second string.

[Example in Playground](https://metafacture.org/playground/?example=str_equal)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/StrEqual.java)

#### `exists`

Executes the functions if/unless the field exists.

```perl
if exists("<sourceField>")
```

[Example in Playground](https://metafacture.org/playground/?example=exists)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/Exists.java)

#### `greater_than`

Executes the functions if/unless the field value is greater than the given value.

[Example in Playground](https://metafacture.org/playground/?example=greater_than)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/GreaterThan.java)

#### `in`

Executes the functions if/unless the field value [is contained in](https://perldoc.perl.org/perlop#Smartmatch-Operator) the value of the other field.

_Also aliased as [`is_contained_in`](#is_contained_in)._

[Example in Playground](https://metafacture.org/playground/?example=in)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/In.java)

#### `is_contained_in`

_Alias for [`in`](#in)._

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/IsContainedIn.java)

#### `is_array`

Executes the functions if/unless the field value is an array.

[Example in Playground](https://metafacture.org/playground/?example=is_array)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/IsArray.java)

#### `is_empty`

Executes the functions if/unless the field value is empty.

[Example in Playground](https://metafacture.org/playground/?example=is_empty)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/IsEmpty.java)

#### `is_false`

Executes the functions if/unless the field value equals `false` or `0`.

[Example in Playground](https://metafacture.org/playground/?example=is_false)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/IsFalse.java)

#### `is_hash`

_Alias for [`is_object`](#is_object)._

[Example in Playground](https://metafacture.org/playground/?example=is_hash)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/IsHash.java)

#### `is_number`

Executes the functions if/unless the field value is a number.

[Example in Playground](https://metafacture.org/playground/?example=is_number)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/IsNumber.java)

#### `is_object`

Executes the functions if/unless the field value is a hash (object).

_Also aliased as [`is_hash`](#is_hash)._

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/IsObject.java)

#### `is_string`

Executes the functions if/unless the field value is a string (and not a number).

[Example in Playground](https://metafacture.org/playground/?example=is_string)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/IsString.java)

#### `is_true`

Executes the functions if/unless the field value equals `true` or `1`.

[Example in Playground](https://metafacture.org/playground/?example=is_true)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/IsTrue.java)

#### `less_than`

Executes the functions if/unless the field value is less than the given value.

[Example in Playground](https://metafacture.org/playground/?example=less_than)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/LessThan.java)

#### `match`

##### `all_match`

Executes the functions if/unless the field value matches the regular expression pattern. If it is an array or a hash all field values must match the regular expression pattern.

[Example in Playground](https://metafacture.org/playground/?example=all_match)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/AllMatch.java)

##### `any_match`

Executes the functions if/unless the field value matches the regular expression pattern. If it is an array or a hash one or more field values must match the regular expression pattern.

[Example in Playground](https://metafacture.org/playground/?example=any_match)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/AnyMatch.java)

##### `none_match`

Executes the functions if/unless the field value does not match the regular expression pattern. If it is an array or a hash none of the field values may match the regular expression pattern.

[Example in Playground](https://metafacture.org/playground/?example=none_match)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/NoneMatch.java)

##### `str_match`

Executes the functions if/unless the string matches the regular expression pattern.

[Example in Playground](https://metafacture.org/playground/?example=str_match)

[Java Code](https://github.com/metafacture/metafacture-core/blob/master/metafix/src/main/java/org/metafacture/metafix/conditional/StrMatch.java)
