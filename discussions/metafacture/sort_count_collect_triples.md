
## Problem
* for some cases we are using the sort-triples and collect-triples commands to process large amounts of data. E.g. to analyze bibliographic data or for transformations of work entities
* https://github.com/linked-swissbib/mfWorkflows/blob/master/src/main/resources/transformation/work/work.flux#L16
* https://github.com/linked-swissbib/mfWorkflows/blob/master/src/main/resources/statistics/item.flux#L11
* https://github.com/linked-swissbib/mfWorkflows/blob/master/src/main/resources/transformation/jsonld/transformation.flux#L48

We get in trouble because of insufficient memory and had to split the data in smaller sets for processing.

### Question
I have seen there is a mechanism triggered by a flag called 'memorylow' 
https://github.com/culturegraph/metafacture-core/blob/master/src/main/java/org/culturegraph/mf/stream/pipe/sort/AbstractTripleSort.java#L99
which makes it possible to swap triples to the file system as temporary store
* is this mechanism used by any other? Are there any experiences with it?
* As far as I have seen is the memorylow flag only accessible via Java (not Flux) because there is no setter-method. Did I miss something?


Thanks for any hints!