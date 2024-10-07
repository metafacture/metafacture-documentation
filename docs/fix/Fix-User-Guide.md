---
layout: default
title: Fix User Guide
parent: Fix
nav_order: 1
---

# Fix User Guide

This document provides an introduction to the Metafacture Fix language (short: Metafix or Fix). The Fix language for Metafacture is introduced as an alternative to configuring data transformations with Metamorph. Inspired by Catmandu Fix, Metafix processes metadata not as a continuous data stream but as discrete records.

## Part of a metafacture worflow
Metafacture Fix is a transformation module that can be used in a [Flux Workflow](../flux/Flux-User-Guide.html), for this you have to use this in your pipeline:

Flux-Example:
```perl
   infile
   | open-file
   | as-lines
   | decode-marc21
   | fix(FLUX_DIR + "fixFile.fix")
   | encode-json
   | print
   ;
```

- when using the FLUX: 
   - address the `fix`-module
   - you can add variables
   - The Fix transformation can be part of the FLUX `|fix("retain('245??')")` - usually useful for short fixes
   - or it can be separated in an external file, that is called in the FLUX-Process as in the code snippet above
- when using it in a Java process, just add the library to your process

## Record-based and metadata manipulating approach
While Metafature processes the data as a stream, the `fix` module does not. It buffers the incoming stream to distinct records.
Thus you can manipulate all metadata elements of a record at once and don't need to think about the order of the incoming stream - which was a really big hassle in the stream-based MORPH.
The incoming record then can be manipulated, fields can be changed, removed or added. This also differs from the approach in the other Transformation Module MORPH where you construct a new record and a new data stream. With FIX you change stuff in the record and "only" change the data stream in Metafacture.


## Basic concepts
The four main concepts of FIX (introduced by catmandu) are [functions](https://librecat.org/Catmandu/#functions), [selector](https://librecat.org/Catmandu/#selectors), [conditionals](https://librecat.org/Catmandu/#conditionals) and [binds](https://librecat.org/Catmandu/#binds). The following code snippet shows examples of eachs of these concepts:


```perl

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

**Conditionals** are used to control the processing of fix functions. The included fix functions are not process with every workflow but only under certain conditions.

**Selectors** can be used to filter the records you want.

**Binds** are wrappers for one or more fixes. They give extra control functionality for fixes such as loops.
All binds have the same syntax:

```perl
do Bind(params,…)
   fix(..)
   fix(..)
end
```

Find here a [list of all functions, selectors, binds and conditionals](Fix-functions.html).


## Addressing Pieces of Data: FIX-Path and the record structure in FIX

Internally FIX knows arrays, objects/hashes and simple elements. How a format is translated depends on the `decode-...` command in the MF Workflow. Only one thing is specific to the fix, as in Catmandu: a repeated field is translated into a list depending on the real input data of the single record. Elements with the suffix `[]` are interpreted as arrays.

Since functions manipulate, add or remove elements in a record, it is essential to understand the way you can address source or target elements.

e.g.:
```perl
copy_field("<sourceField>", "<targetField>")
```

To address the source or target element here, you need to provide the path to the element.
Metafacture Fix uses a path syntax that is JSON-Path-like but not identical. It also uses the dot notation but there are some differences with the path structure of arrays and repeated fields. Especially when working with JSON, YAML, or records with repeated fields.

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

The path for a simple string element is addressed by stating the element name: `a`
For the fields with deeper structure you add a dot `.`. The path for elements in nested objects is stated by: `b.c` or `k.l.m.o`

Sometimes an element can have multiple instances. Different data models solve this possibility differently. In XML records element repetition is possible and (partly) allowed in many schemas. Repeatable elements also exist in JSON and YAML but are unusual.

To point to a specific element you state the index number. To adress the value `repeatedField2` the path would be `f.2` since the repeated field is handled as a list.
Similarly you address the `listElement3` of the array/list by `g[].3`. The brackets are an array indicator created by the flux command `decode-yaml`(or by `decode-json`). It helps to interpret an repeatable element as an array even if the list has only one value.

When working with nested structures and combinations of arrays and objects the path is a combination of element names, dots and index numbers.

`listObjectElement2.2` has the path: `h[].2.j`

You do not only need the path name for your source element but also if you want to create a new element. But remember that fix, as in catmandu, is using repeated fields and arrays as lists so if you want to create a repeated field you have to create an array without suffix [].

e.g.: `copy_field("a", "z.y.x")`

This would copy the value of z in a nested object:

```YAML
z : 
   y: 
      x : simpleField
```


To address paths you can use wildcards. For instance the star-wildcard: `person*` would match all simple literals with element names starting with `'person'`: `'person\_name'`, `'person\_age'`, etc.
Apart from the `*` wildcard, the `?` wildcard is supported. It matches exactly one arbitrary character.

Not fully supported yet is alteration of pathes.

Besides path wildcards there are array/list wildcards that are used to reference specific elements or all elements in an array. `g[].*` addresses all strings in the array `g[]`. `g[].$append` would reference a new element in the array at the end of the array. `g[].$last` references the last element in an array.

## Cleaning up the transformation

Since FIX is not constructing a new record stream but is manipulating the existing record you usually clean up after you transform the data. There are functions to remove all unnecessary elements and to remove all empty elements.

e.g.: if you transform MARC21 to JSON but you want to keep only certain elements that you created, you state them in a `retain` function:

```perl
retain("all",
   elements",
   "that",
   "I",
   "want")
```
This function only keeps all the elements that I wanted. At the moment this only works with top-level elements.

`vacuum()` deletes all empty elements.

## Defining Macros

Macros can be defined with the `put_macro`-Bind and use the same parameter
mechanism later. 
Macros are called with the `call_macro` function. Attributes
of the function are used as parameters:

```perl
do put_macro("concat-up")
   set_array("$[target_field]")
   copy_field("$[source_field]","$[target_field].$append")
   upcase("$[target_field].*")
   join_field("$[target_field]",", ")
end


   
call_macro("concat-up", source_field:"data1", target_field:"Data1")
call_macro("concat-up", source_field:"data2", target_field:"Data2")
``````

In this case `target_field` and `source_field` serve as a parameter (the name is arbitrary). In the macro definition itself, the parameters are addressed by `$[target_field]` and `$[source_field]`. 

Parameters are scoped, which means that the ones provided with the `call_macro` function shadow global ones. Macros cannot be nested.

## Parameters to Fix definitions / Using variables

Fix definitions may contain parameters. They follow the pattern `$[NAME]`:

```perl
add_field("rights","$[rights]")
```

`$[rights]` in this case is a compile-time variable which is evaluated on
creation of the respective Fix object.

The `<vars>` section in the Metamorph definition can be used to set defaults:

```xml
<vars>
   <var name="rights" value="CC0" />
</vars>
```

For Java implementations: Compile-time variables are passed to Fix as a constructor parameter.

```java
final Map<String, String> vars = new HashMap<String, String>();
vars.put("rights", "CC-0");

final Metafix metafix = new metafix("fixdef.fix", vars);
```

## Splitting Fixes for Reuse

In a complex project setting there may be several Fixes in use,
and it is likely that they share common parts. Imagine for instance a
transformations from Marc 21 records holding data on books to RDF, and Marc 21
records holding data on authors to RDF. Both make use of a table assigning
country names to ISO country codes. Such a table should only exist once. 

Another scenario would be to reduce the size of a single fix file and create several fix files used for different purposes.

To accomodate for such reuse, Fix offers an include mechanism:

```perl
# Setup adds maps, macros and vars once
do once("setup")
  include ("./fix/maps.fix")
  include ("./fix/macros.fix")
  put_var("member", "-")
end
```

For performance reasons it is useful to integrate macros and maps that are used often in a `do once` bind.

## Cookbook

This page is a replication of the passages [Best practices and guidelines for working with Metafacture Fix](https://github.com/metafacture/metafacture-fix?tab=readme-ov-file#best-practices-and-guidelines-for-working-with-metafacture-fix) and [Glossary](https://github.com/metafacture/metafacture-fix?tab=readme-ov-file#glossary) of the Fix Readme.md. Status: [Fix Release 1.1.2](https://github.com/metafacture/metafacture-fix/releases/tag/1.1.2)

### Best practices and guidelines for working with Metafacture Fix

- We recommend to use double quotation marks for arguments and values in functions, binds and conditionals.
- If using a `list` bind with a variable, the `var` option requires quotation marks (`do list(path: "<sourceField>", "var": "<variableName>")`).
- Fix turns repeated fields into arrays internally but only marked arrays (with `[]` at the end of the field name) are also emitted as "arrays" (entities with indexed literals), all other arrays are emitted as repeated fields.
- Every Fix file should end with a final newline.

### Glossary

#### Array wildcards

Array wildcards resemble [Catmandu's concept of wildcards](http://librecat.org/Catmandu/#wildcards).

When working with arrays and repeated fields you can use wildcards instead of an index number to select elements of an array.

| Wildcard | Meaning |
|----------|:--------|
| `*` | Selects _all_ elements of an array. |
| `$first` | Selects only the _first_ element of an array. |
| `$last` | Selects only the _last_ element of an array. |
| `$prepend` | Selects the position _before_ the first element of an array. Can only be used when adding new elements to an array. |
| `$append` | Selects the position _after_ the last element of an array. Can only be used when adding new elements to an array. |

#### Path wildcards

Path wildcards resemble [Metamorph's concept of wildcards](https://github.com/metafacture/metafacture-core/wiki/Metamorph-User-Guide#addressing-pieces-of-data). They are not supported in Catmandu (it has [specialized Fix functions](https://librecat.org/Catmandu/#marc-mab-pica-paths) instead).

You can use path wildcards to select fields matching a pattern. They only match path _segments_ (field names), though, not _whole_ paths of nested fields. These wildcards cannot be used to add new elements.

| Wildcard | Meaning |
|----------|:--------|
| `*` | Placeholder for zero or more characters. |
| `?` | Placeholder for exactly one character. |
| `\|` | Alternation of multiple patterns. |
| `[...]` | Enumeration of characters. |
