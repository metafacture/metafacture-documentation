Metafacture - Introduction - A 5 minute introduction to Metafacture

## HELLO WORLD

```
$ cat helloWord.flux
"Hello World"
| print
;
```


Running this little Flux script on the [CLI Metafacture Runner](https://github.com/metafacture/metafacture-fix/releases) (with `$ ./bin/metafix-runner /path/to/your.flux` on Unix/Linux/Mac or `$ ./bin/metafix-runner.bat /path/to/your.flux` on Windows) or on the [MF Playground](https://metafacture.org/playground/?flux=%22Hello+World%22%0A%7C+print%0A%3B). It generates the string `"Hello World` on the standard output. We just asked Metafacture to print the incoming string.

The same works, when we start with a JSON-file which is a usual form of a metadata record.

```
$ cat file.json
{"hello":"world"}
```

```
$ cat helloWorld2.flux
"file.json"
| open-file
| as-lines
| print
;
```
Here we ask Metafacture to open the file `file.json`, read each line separatly as a string and generate the string on standard output.

To handle metadata records and ETL (Extract - Transform - Load) we have to build UNIX-like pipelines. For each step in a pipeline we use FLUX commands/moduls. Each FLUX command aids a specific modular step in an ETL process that usually can be subsumed under one of the following steps:
→ read → decode → transform → encode → write → 


## FORMAT to FORMAT

Metafacture can be used to convert an input format to an output format by building a small pipeline with a FLux script:

```
$ cat file.json
---
hello: world
```

```
$ cat yaml2json.flux
"file.yaml"
| open-file
| as-records
| decode-yaml
| encode-json
| print
;
```

We added two modules for decoding and encoding the data: `decode-json` and `encode-yaml` 
Metafacture provides decoders and encoders for many formats. We also used the `as-records` module instead of `as-lines` to 
read multi-line metadata statements and not each line separatly.

## OPTIONS

Each Metafacture Module can have options that change its behavior. The options can be read in the documentation or by running the runner without arguments.

As an example, we can use a JSON decoder option prettyPrinting to provide a pretty printed version of the JSON:

```
$ cat file.json
---
hello: world
```

```
$ cat yaml2json.flux
"file.yaml"
| open-file
| as-records
| decode-yaml
| encode-json(prettyPrinting="true")
| print
;
```

FIX LANGUAGE

Many data conversions need a mapping from one field to another field plus optional conversions of the data inside these fields. Metafacture provides the transformation module `fix` that uses the Catmandu-inspired Fix language to assist in these mappings. A full list Fix functon is available at https://github.com/metafacture/metafacture-documentation/blob/master/Fix-function-and-Cookbook.md#functions.

Fixes can be provided inline as text argument of the fix module in the Flux script, or as a pointer to a Fix Script. A Fix Scripts groups one or more fixes in a file.

```
$ cat example.fix
add_field('address.street','Walker Street')
add_field('address.number','15')
copy_field('colors.2','best_color')
```

```
$ cat data.yaml
---
colors:
- Red
- Green
- Blue
...
```

```
$ cat yaml2yaml.flux
"data.yaml"
| open-file
| as-records
| decode-yaml
| fix("example.fix")
| encode-yaml
| print
;
```


$ catmandu convert YAML --fix example.fix to YAML < data.yaml

```
---
address:
    number: '15'
    street: Walker Street
best_color: Green
colors:
    - Red
    - Green
    - Blue
...
```

In the example we created the Fix Script `example.fix` that contains a combination of mappings and data conversion on (nested) data. We run a YAML to YAML conversion using the example.fix Fix Script. (Note: Differently to Catmandu array/list index are 1-based.)


SPECIALIZATIONS

Catmandu was mainly created for data conversions of specialized metadata languages in the field of libraries, archives and museums. One of the specialized modules is `decode-marc` and `encode-marc`. 

With them you can read, write and convert MARC files.

For instance, to extract all the titles from an ISO MARC file one could write:

```
$ cat titles.fix
set_array("title")
copy_field("245??.?","title.$append")
join_field("title")
copy_field("001","id")
retain("title", "id")
```
 
 ```
 $ cat marc2csv.flux
"data.mrc"
| open-file
| as-records
| decode-marc
| fix("title.fix")
| encode-csv
| print
;
```

In the example above marc data is converted to a csv file.
The 245 field with its subfields of each MARC record is mapped to the title field.
The retain Fix function keeps only the title field in the output. (In contrast to Catmandu there are no special marc or pica fixes since the iternal handling of records and elements is more generic. Also the internal serialization of MARC is not as complex as in Catmandu.)


No get started.

(Note: This mini introduction of Metafacture is inspired by the mini introduction of Catmandu here: https://metacpan.org/dist/Catmandu/view/lib/Catmandu/Introduction.pod)