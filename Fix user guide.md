This document provides an introduction to the Metafacture Fix language (short: Metafix or Fix). Fix is a declarative flow oriented language in which transformations of arbitrary metadata/semi-structured data can be defined using the FIX language. The  Fix language for Metafacture is introduced as an alternative to configuring data transformations with Metamorph. Inspired by Catmandu Fix, Metafix processes metadata not as a continuous data stream but as discrete records. The basic idea is to rebuild constructs from the (Catmandu) Fix language like functions, selectors and binds in Java and combine with additional functionalities from the Metamorph toolbox.

## Part of a metafacture worflow
Metafacture Fix is a transformation module that can be used in a workflow, for this you have to use this in your pipeline:
- when using the FLUX: 
- - address the `fix`-module
- - 
```PERL
   infile
   | open-file
   | as-lines
   | decode-marc21
   | fix(FLUX_DIR + "fixFile.fix")
   | encode-json
   | print
   ;
   ```
- - you can add variables
- - there are some optiones available
- - The fix-Transformation can be part of the FLUX `|fix("retain(`245??`)")` - usually useful for short fixes
- - or it can be separated in a external file, that is called in the FLUX-Process as in the code-snipped above
- when using it in a JAVA-Process, just add the library to your process

## Record-based and metadata manipulating approach
While Metafature processes the data as a stream, the fix module does not it buffers the incoming stream to distinct records.
So that you can manipulate all metadata-elements of a record at once and without focussing about the order of the incoming stream - which was a really big hassle in the stream-based MORPH.
The incoming record then can be manipulated, fields can be changed, removed or added. This also differs from the approach in MORPH where you construct a new record and a new data stream, whereas you change stuff in the record in FIX and "only" change the data stream in Metafacture.


## Basic concepts
The four main concepts of FIX (introduced by catmandu) are [functions](https://librecat.org/Catmandu/#functions), [selector](https://librecat.org/Catmandu/#selectors), [conditionals](https://librecat.org/Catmandu/#conditionals) and [binds](https://librecat.org/Catmandu/#binds). The following code snippet shows examples of eachs of these concepts:


```PERL

# Simple fix function

add_field("hello", "world")
remove_field("my.deep.nested.junk")
copy_field("stats", "output.$append")

# Conditionals

if exists("error")
  set_field("is_valid", "no")
  log("error")
elsif exists("warning")
  set_field("is_valid", "yes")
  log("warning")
else
  set_field("is_valid", "yes")
end

# Binds - Loops

do list(path: "foo", "var": "$i")
  add_field("$i.bar", "baz")
end

# Selector
if exists("error")
   reject()
end

```

**Functions** are used to add, change, remove or otherwise manipulate elements.

**Conditionals** are used to control the processing of function so that they are not process with every workflow but only under certain conditions.

**Selectors** can be used as hghlevel filter to filter the records you want.

**Binds** are wrappers for one or more fixes. They give extra control functionality for fixes such as loops.
All binds have the syntax:
```PERL
do Bind(params,…)
   fix(..)
   fix(..)
end
``````

For a list of all function, selectors, binds and conditionals have a look at:
https://github.com/metafacture/metafacture-core/wiki#functions-and-cookbook

## Addressing Pieces of Data - of: FIX-Path and the record structure in FIX

Internally FIX knows arrays, objects/hashes and simple elements. How a format is translated is depending on the `decode-...` command in the MF Workflow. Only one thing is specific to the fix, as in Catmandu a repeated field is translated into a list depending on the real input data of the single record and elements with the suffix `[]` are interpreted as arrays.

Since function manipulate, add or remove elements in a record, it is essential to understand the way on can adress source or target elements.

[e.g.:
```PERL
copy_field("<sourceField>", "<targetField>")
```
]
To adress the source or target element here, you need to provide the path to the element.
Metafacture Fix is using a path-syntax that is JSON Path like but not identical. It also uses the dot notation but there are some differences with the path structure of arrays and repeated fields. Especially when working with JSON, YAML or records repeated fields.

```
a : simpleField
b : c : objectField1
   d : objectField2
   e : objectField3
f : repeatedField1
f : repeatedField2
f : repeatedField3
g : - listElement1
   - listElement2
   - listElement3
h : - i : listObjectElement1.1
      j : listObjectElement1.2
    - i : listObjectElement2.1
      j : listObjectElement2.2
k : l : m : o : deepNestedField
```

The path for a simple string-element is adressed by stating the element name: `a`
For the fields with deeper structure you add a dot ‘.’. The path for elements in nested objects is stated by: `b.c` or `k.l.m.o`

In an data set an element sometimes an element can have multiple instances. Different data models solve this possibility differently. XML-Records can have all elements multiple times, element repition is possible and in many schemas (partly) allowed. Repeatable elements also exist in JSON and YAML but are unusual.

To point to a specific element you state the index number. To adress the value `repeatedField2` the path would be `f.2`` since the repeated field is handled as list.
Similar you adress the `listElement3` of the array/list by `g[].3`. The brackets are an array indicator created by the flux command decode-yaml. It helps to interpret an element as array also if the list has only on value.

Working with nested structures and combination of arrays and objects the path is a combination of element names, dots and index numbers.

`listObjectElement2.2` has the path: `h[].2.j`

You do not only need the path name for your source element but also if you want to create a new element. But remember that fix as in catmandu is using repeated fields and arrays as lists so if you want to create a repeated field you have to create an array without suffic [].

e.g.:
```PERL
copy_field("a", "z.y.x")
```

This would copy the value of z in a nested object:

```
z : 
   y: 
      x : simpleField
```


To adress paths you can use wildcards. For instance the star-wildcard: `person*` would match all simple literals with element names starting with 'person': 'person\_name', 'person\_age', etc.
Apart from the star-wildcard, the questionmark-wildcard ('?') is supported. It matches exactly one arbitrary character.

Not yet supported is alteration.

Besides path wildcards there are array/list wildcards that are used to refrence specific elements or all elements in an array. `g[].*` adresses all strings in the array `g[]`. `g[].$append` would refrence a new element in the array at the end of the array. `g[].$last` refrences the last element in an array.

## Cleaning up the transformation

Since FIX is not constructing a new record stream but is manipulating the existing record you usually clean up after you transform the data. There are functions to kick out all unnecessary elements an kick out all empty elements.

e.g.: if you transform MARC21 to JSON but you want to keep only certain elements that you created. you state them in a retain function:

```
retain("all",
   element",
   "that",
   "I",
   "want")
```
This function only keeps all the elements that I wanted. At the moment this only works with highlevel elements.

`vacuum()` deletes all emtpy elements.

## Defining Macros

Macros can be defined with the `put_macro`-Bind and use the same parameter
mechanism later. 
Macros are called with the `call_macro` function. Attributes
of the function are used as parameters:

```PERL
do put_macro("concat-up")
   set_array("$[target_field]")
   copy_field("$[source_field]","$[target_field].$append")
   case("$[target_field].*")
   join_field("$[target_field]",", ")
end


   
call_macro("concat-up", source_field:"data1", target_field:"Data1")
call_macro("concat-up", source_field:"data2", target_field:"Data2")
``````

In this case `target_field` and `source_field` serve as a parameter (the name is arbitrary). In the macro definition itsel, the parameters are addressed by `$[target_field]` and `$[source_field]`. 

Parameters are scoped, which means that the ones provided with the `call_macro` function shadow global ones. Macros cannot be nested.


## Splitting Fixes for Reuse

In a complex project setting there may be several Fixes in use,
and it is likely that they share common parts. Imagine for instance a
transformations from Marc 21 record holding data on books to RDF, and Marc 21
records hodling data on authors to RDF. Both make use of a table assinging
country names to ISO country codes. Such a table should only exist once. 

Another scenario would be to reduce the size of a single fix file and create several fix files used for different purposes.

To accomodate for such reuse, Fix offers an include mechanism:

``````
# Setup adds maps, macros and vars once
do once("setup")
  include ("./fix/maps.fix")
  include ("./fix/macros.fix")
  put_var("member", "-")
end
```

For perfomance reason it is useful to integrate macros and maps that are used often in an do once bind.