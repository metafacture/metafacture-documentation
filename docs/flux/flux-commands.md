---
layout: default
title: Flux Commands
parent: Flux
nav_order: 2
---

Available flux commands (with release 7.0.0)
=======================

add-oreaggregation
------------------
- description:	adds ore:Aggregation to an Europeana Data Model stream. The aggregation id is set by emitting literal('aggregation_id', id)
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.linkeddata.OreAggregationAdder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-linkeddata/src/main/java/org/metafacture/linkeddata/OreAggregationAdder.java)

add-preamble-epilogue
---------------------
- description:	Adds a String preamle and/or epilogue to the stream
- options:	preamble (String), epilogue (String)
- signature:	String -> String
- [example in Playground](https://metafacture.org/playground/?example=add-preamble-epilogue)
- java class:	[org.metafacture.formatting.PreambleEpilogueAdder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-formatting/src/main/java/org/metafacture/formatting/PreambleEpilogueAdder.java)

as-formeta-records
------------------
- description:	Reads a stream of formeta data and splits between each top-level element
- signature:	Reader -> String
- [example in Playground](https://metafacture.org/playground/?example=as-formeta-records)
- java class:	[org.metafacture.formeta.FormetaRecordsReader](https://github.com/metafacture/metafacture-core/blob/master/metafacture-formeta/src/main/java/org/metafacture/formeta/FormetaRecordsReader.java)

as-lines
--------
- description:	Processes input from a reader line by line.
- signature:	Reader -> String
- [example in Playground](https://metafacture.org/playground/?example=as-lines)
- java class:	[org.metafacture.io.LineReader](https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/LineReader.java)

as-records
----------
- description:	Reads data from a Reader and splits it into individual records
- options:	skipemptyrecords (boolean), separator (String)
- signature:	Reader -> String
- [example in Playground](https://metafacture.org/playground/?example=as-records)
- java class:	[org.metafacture.io.RecordReader](https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/RecordReader.java)

batch-log
---------
- description:	Writes log info every BATCHSIZE records. 
- options:	batchsize (int)
- signature:	StreamReceiver -> StreamReceiver
- [example in Playground](https://github.com/metafacture/metafacture-core/blob/master/metafacture-flux-examples/blob/master/sample4/bib-data.pica%3Fraw%3Dtrue%22%0A%7C+open-http%0A%7C+as-lines%0A%7C+decode-pica%0A//+This+cannot+be+shown+by+the+Playground.+Since+it+outputs+to+stoud%3F%0A%7C+batch-log%28batchsize%3D%2220%22%29%0A%7C+encode-json%0A%7C+print%0A%3B)
- java class:	[org.metafacture.monitoring.StreamBatchLogger](https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/StreamBatchLogger.java)

batch-reset
-----------
- description:	Resets flow for every BATCHSIZE records.
- options:	batchsize (int)
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.flowcontrol.StreamBatchResetter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/StreamBatchResetter.java)

calculate-metrics
-----------------
- description:	Calculates values for various cooccurrence metrics. The expected inputs are triples containing as subject the var name and as object the count. Marginal counts must appear first, joint counts second. Marinal counts must be written as 1:A, Joint counts as 2:A&B
- signature:	Triple -> Triple
- java class:	[org.metafacture.statistics.CooccurrenceMetricCalculator](https://github.com/metafacture/metafacture-core/blob/master/metafacture-statistics/src/main/java/org/metafacture/statistics/CooccurrenceMetricCalculator.java)

catch-object-exception
----------------------
- description:	passes objects through and catches exceptions.
- options:	logprefix (String), logstacktrace (boolean)
- signature:	Object -> Object
- java class:	[org.metafacture.flowcontrol.ObjectExceptionCatcher](https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/ObjectExceptionCatcher.java)

catch-stream-exception
----------------------
- description:	passes streams events through and catches exceptions.
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.flowcontrol.StreamExceptionCatcher](https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/StreamExceptionCatcher.java)

change-id
---------
- description:	By default changes the record ID to the value of the '_id' literal (if present). Use the contructor to choose another literal as ID source.
- options:	keepidliteral (boolean), idliteral (String), keeprecordswithoutidliteral (boolean)
- signature:	StreamReceiver -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=change-id)
- java class:	[org.metafacture.mangling.RecordIdChanger](https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/RecordIdChanger.java)

collect-triples
---------------
- description:	Collects named values to form records. The name becomes the id, the value is split by 'separator' into name and value
- signature:	Triple -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=collect-triples)
- java class:	[org.metafacture.triples.TripleCollect](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleCollect.java)

count-triples
-------------
- description:	Counts triples
- options:	countpredicate (String), countby [SUBJECT, PREDICATE, OBJECT, ALL]
- signature:	Triple -> Triple
- java class:	org.metafacture.triples.TripleCount

decode-aseq
-----------
- description:	Parses a raw Aseq record (UTF-8 encoding expected).
- signature:	String -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-aseq)
- java class:	[org.metafacture.biblio.AseqDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/AseqDecoder.java)

decode-csv
----------
- description:	Decodes lines of CSV files. First line may be interpreted as header.
- options:	hasheader (boolean), separator (String)
- signature:	String -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-csv)
- java class:	[org.metafacture.csv.CsvDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-csv/src/main/java/org/metafacture/csv/CsvDecoder.java)

decode-formeta
--------------
- description:	Decodes a record in formeta format.
- signature:	String -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-formeta)
- java class:	[org.metafacture.formeta.FormetaDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-formeta/src/main/java/org/metafacture/formeta/FormetaDecoder.java)

decode-html
-----------
- description:	Decode HTML to metadata events. The attrValsAsSubfields option can be used to override the default attribute values to be used as subfields (e.g. by default `link rel="canonical" href="http://example.org"` becomes `link.canonical`). It expects an HTTP-style query string specifying as key the attributes whose value should be used as a subfield, and as value the attribute whose value should be the subfield value, e.g. the default contains `link.rel=href`. To use the HTML element text as the value (instead of another attribute), omit the value of the query-string key-value pair, e.g. `title.lang`. To add to the defaults, instead of replacing them, start with an `&`, e.g. `&h3.class`
- options:	attrvalsassubfields (String)
- signature:	Reader -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-html)
- java class:	[org.metafacture.html.HtmlDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-html/src/main/java/org/metafacture/html/HtmlDecoder.java)

decode-json
-----------
- description:	Decodes JSON to metadata events. The 'recordPath' option can be used to set a JsonPath to extract a path as JSON - or to split the data into multiple JSON documents.
- options:	recordid (String), booleanmarker (String), recordcount (int), arraymarker (String), arrayname (String), recordpath (String), numbermarker (String), allowcomments (boolean)
- signature:	String -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-json)
- java class:	[org.metafacture.json.JsonDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-json/src/main/java/org/metafacture/json/JsonDecoder.java)

decode-mab
----------
- description:	Parses a raw Mab2 stream (UTF-8 encoding expected).
- signature:	String -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-mab)
- java class:	[org.metafacture.biblio.MabDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/MabDecoder.java)

decode-marc21
-------------
- description:	Decodes MARC 21 records (UTF-8 encoding expected).
- options:	emitleaderaswhole (boolean), ignoremissingid (boolean)
- signature:	String -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-marc21)
- java class:	[org.metafacture.biblio.marc21.Marc21Decoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/marc21/Marc21Decoder.java)

decode-pica
-----------
- description:	Parses pica+ records. The parser only parses single records. A string containing multiple records must be split into individual records before passing it to PicaDecoder.
- options:	trimfieldnames (boolean), normalizedserialization (boolean), ignoremissingidn (boolean), skipemptyfields (boolean), normalizeutf8 (boolean)
- signature:	String -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-pica)
- java class:	[org.metafacture.biblio.pica.PicaDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/pica/PicaDecoder.java)

decode-string
-------------
- description:	Splits a String into several Strings, either by extracting parts that match a regexp or by splitting by a regexp.
- options:	mode [SPLIT, EXTRACT]
- signature:	String -> String
- [example in Playground](https://metafacture.org/playground/?example=decode-string)
- java class:	[org.metafacture.strings.StringDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StringDecoder.java)

decode-xml
----------
- description:	Reads an XML file and passes the XML events to a receiver. Set `totalEntitySizeLimit="0"` to allow unlimited XML entities.
- options:	totalentitysizelimit (String)
- signature:	Reader -> XmlReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-xml)
- java class:	[org.metafacture.xml.XmlDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/XmlDecoder.java)

decode-yaml
-----------
- description:	Decodes YAML to metadata events.
- options:	recordid (String), recordcount (int), arraymarker (String), arrayname (String)
- signature:	String -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=decode-yaml)
- java class:	[org.metafacture.yaml.YamlDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-yaml/src/main/java/org/metafacture/yaml/YamlDecoder.java)

decouple
--------
- description:	creates a new thread in which subsequent flow elements run.
- options:	debug (boolean)
- signature:	Object -> Object
- java class:	[org.metafacture.flowcontrol.ObjectPipeDecoupler](https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/ObjectPipeDecoupler.java)

defer-stream
------------
- description:	Defers all stream events until an end-record event is received
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.flowcontrol.StreamDeferrer](https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/StreamDeferrer.java)

digest-file
-----------
- description:	Uses the input string as a file name and computes a cryptographic hash the file
- signature:	String -> Triple
- java class:	[org.metafacture.files.FileDigestCalculator](https://github.com/metafacture/metafacture-core/blob/master/metafacture-files/src/main/java/org/metafacture/files/FileDigestCalculator.java)

discard-events
--------------
- options:	discardlifecycleevents (boolean), discardliteralevents (boolean), discardentityevents (boolean), discardrecordevents (boolean)
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.mangling.StreamEventDiscarder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/StreamEventDiscarder.java)

draw-uniform-sample
-------------------
- description:	Draws a uniform sample of records from the input stream.
- signature:	Object -> Object
- [example in Playground](https://metafacture.org/playground/?example=draw-uniform-sample)
- java class:	[org.metafacture.statistics.UniformSampler](https://github.com/metafacture/metafacture-core/blob/master/metafacture-statistics/src/main/java/org/metafacture/statistics/UniformSampler.java)

encode-csv
----------
- description:	Encodes each value in a record as a csv row.
- options:	includeheader (boolean), noquotes (boolean), separator (String), includerecordid (boolean)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=encode-csv)
- java class:	[org.metafacture.csv.CsvEncoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-csv/src/main/java/org/metafacture/csv/CsvEncoder.java)

encode-formeta
--------------
- description:	Encodes streams in formeta format.
- options:	style [CONCISE, VERBOSE, MULTILINE]
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=encode-formeta)
- java class:	[org.metafacture.formeta.FormetaEncoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-formeta/src/main/java/org/metafacture/formeta/FormetaEncoder.java)

encode-json
-----------
- description:	Serialises an object as JSON
- options:	booleanmarker (String), arraymarker (String), prettyprinting (boolean), numbermarker (String)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=encode-json)
- java class:	[org.metafacture.json.JsonEncoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-json/src/main/java/org/metafacture/json/JsonEncoder.java)

encode-literals
---------------
- description:	Outputs the name and value of each literal which is received as a string. Name and value are separated by a separator string. The default separator string is a tab. If a literal name is empty, only the value will be output without a separator. The module ignores record and entity events. In particular, this means that literal names are not prefixed by the name of the entity which contains them.
- options:	separator (String)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=encode-literals)
- java class:	[org.metafacture.formatting.StreamLiteralFormatter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-formatting/src/main/java/org/metafacture/formatting/StreamLiteralFormatter.java)

encode-marc21
-------------
- description:	Encodes MARC21 records
- options:	generateidfield (boolean), validateleader (boolean)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=encode-marc21)
- java class:	[org.metafacture.biblio.marc21.Marc21Encoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/marc21/Marc21Encoder.java)

encode-marcxml
--------------
- description:	Encodes a stream into MARCXML. If you can't ensure valid MARC21 (e.g. the leader isn't correct or not set as one literal) then set the parameter `ensureCorrectMarc21Xml` to `true`.
- options:	ensurecorrectmarc21xml (boolean), emitnamespace (boolean), xmlversion (String), formatted (boolean), xmlencoding (String)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=encode-marcxml)
- java class:	[org.metafacture.biblio.marc21.MarcXmlEncoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/marc21/MarcXmlEncoder.java)

encode-pica
-----------
- description:	Encodes a stream in pica+ format
- options:	ignorerecordid (boolean)
- signature:	StreamReceiver -> String
- java class:	[org.metafacture.biblio.pica.PicaEncoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/pica/PicaEncoder.java)

encode-xml
----------
- description:	Encodes a stream as XML. Defaults: `rootTag="records"`, `recordTag="record"`, no attributeMarker.
- options:	recordtag (String), namespacefile (String), xmlheaderversion (String), writexmlheader (boolean), xmlheaderencoding (String), separateroots (boolean), roottag (String), valuetag (String), attributemarker (String), writeroottag (boolean), namespaces (String)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=encode-xml)
- java class:	[org.metafacture.xml.SimpleXmlEncoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/SimpleXmlEncoder.java)

encode-yaml
-----------
- description:	Serialises an object as YAML.
- options:	arraymarker (String), [deprecated] prettyprinting (boolean)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=encode-yaml)
- java class:	[org.metafacture.yaml.YamlEncoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-yaml/src/main/java/org/metafacture/yaml/YamlEncoder.java)

extract-element
---------------
- description:	Extracts the specified element from an HTML document
- signature:	Reader -> String
- [example in Playground](https://metafacture.org/playground/?example=extract-element)
- java class:	[org.metafacture.html.ElementExtractor](https://github.com/metafacture/metafacture-core/blob/master/metafacture-html/src/main/java/org/metafacture/html/ElementExtractor.java)

filter
------
- description:	Filters a stream based on a morph definition. A record is accepted if the morph returns at least one non empty value.
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.metamorph.Filter](https://github.com/metafacture/metafacture-core/blob/master/metamorph/src/main/java/org/metafacture/metamorph/Filter.java)

filter-duplicate-objects
------------------------
- description:	Filters consecutive duplicated data objects.
- signature:	Object -> Object
- java class:	[org.metafacture.mangling.DuplicateObjectFilter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/DuplicateObjectFilter.java)

filter-null-values
------------------
- description:	Discards or replaces null values
- options:	replacement (String)
- signature:	StreamReceiver -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=filter-null-values)
- java class:	[org.metafacture.mangling.NullFilter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/NullFilter.java)

filter-records-by-path
----------------------
- description:	Splits a stream into records based on entity path
- options:	path (String), entityseparator (String), recordidformat (String)
- signature:	StreamReceiver -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=filter-records-by-path)
- java class:	[org.metafacture.mangling.RecordPathFilter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/RecordPathFilter.java)

filter-strings
--------------
- description:	Only forwards records which match (or do not match) a regular expression.
- options:	passmatches (boolean)
- signature:	String -> String
- [example in Playground](https://metafacture.org/playground/?example=filter-strings)
- java class:	[org.metafacture.strings.StringFilter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StringFilter.java)

filter-triples
--------------
- description:	Filters triple. The  patterns for subject, predicate and object are disjunctive.
- options:	predicatepattern (String), objectpattern (String), passmatches (boolean), subjectpattern (String)
- signature:	Triple -> Triple
- [example in Playground](https://metafacture.org/playground/?example=filter-triples)
- java class:	[org.metafacture.triples.TripleFilter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleFilter.java)

find-fix-paths
--------------
- description:	Finds all paths that have values that match the given pattern. Allows for regex. These paths can be used in a Fix to address fields.
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=find-fix-paths)
- java class:	[org.metafacture.metafix.FindFixPaths](https://github.com/metafacture/metafacture-fix/blob/master/metafix/src/main/java/org/metafacture/metafix/FindFixPaths.java )

fix
---
- description:	Applies a fix transformation to the event stream, given as the path to a fix file or the fixes themselves.
- options:	repeatedfieldstoentities (boolean), strictness [PROCESS, RECORD, EXPRESSION], entitymembername (String), strictnesshandlesprocessexceptions (boolean)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.metafix.Metafix

flatten
-------
- description:	flattens out entities in a stream by introducing dots in literal names
- options:	entitymarker (String)
- signature:	StreamReceiver -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=flatten_in_flux)
- java class:	[org.metafacture.mangling.StreamFlattener](https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/StreamFlattener.java)

from-jdom-document
------------------
- signature:	Document -> StreamReceiver
- java class:	[org.metafacture.jdom.JDomDocumentToStream](https://github.com/metafacture/metafacture-core/blob/master/metafacture-jdom/src/main/java/org/metafacture/jdom/JDomDocumentToStream.java)

handle-cg-xml
-------------
- description:	Reads CG-XML files
- signature:	XmlReceiver -> StreamReceiver
- java class:	[org.metafacture.xml.CGXmlHandler](https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/CGXmlHandler.java)

handle-comarcxml
----------------
- description:	A comarc xml reader
- signature:	XmlReceiver -> StreamReceiver
- java class:	[org.metafacture.biblio.ComarcXmlHandler](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/ComarcXmlHandler.java)

handle-generic-xml
------------------
- description:	A generic XML reader. Separates XML data in distinct records with the defined record tag name (default: `recordtagname="record"`) If no matching record tag is found, the output will be empty. The handler breaks down XML elements with simple string values and optional attributes into entities with a value subfield (name configurable) and additional subfields for each attribute. Record tag and value tag names can be configured. Attributes can get an attributeMarker.
- options:	emitnamespace (boolean), recordtagname (String), attributemarker (String), valuetagname (String)
- signature:	XmlReceiver -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=handle-generic-xml)
- java class:	[org.metafacture.xml.GenericXmlHandler](https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/GenericXmlHandler.java)

handle-mabxml
-------------
- description:	A MAB XML reader
- signature:	XmlReceiver -> StreamReceiver
- java class:	[org.metafacture.biblio.AlephMabXmlHandler](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/AlephMabXmlHandler.java)

handle-marcxml
--------------
- description:	A MARC XML reader. To read marc data without namespace specification set option `namespace=""`. To ignore namespace specification set option `ignorenamespace="true".
- options:	namespace (String), ignorenamespace (boolean), attributemarker (String)
- signature:	XmlReceiver -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=handle-marcxml)
- java class:	[org.metafacture.biblio.marc21.MarcXmlHandler](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/marc21/MarcXmlHandler.java)

handle-picaxml
--------------
- description:	A pica xml reader
- signature:	XmlReceiver -> StreamReceiver
- java class:	[org.metafacture.biblio.pica.PicaXmlHandler](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/pica/PicaXmlHandler.java)

jscript
-------
- description:	executes the function process(obj) in a given jscript
- options:	invoke (String)
- signature:	Object -> Object
- java class:	[org.metafacture.scripting.JScriptObjectPipe](https://github.com/metafacture/metafacture-core/blob/master/metafacture-scripting/src/main/java/org/metafacture/scripting/JScriptObjectPipe.java)

json-to-elasticsearch-bulk
--------------------------
- options:	idkey (String), index (String), type (String)
- signature:	String -> String
- java class:	[org.metafacture.elasticsearch.JsonToElasticsearchBulk](https://github.com/metafacture/metafacture-core/blob/master/metafacture-elasticsearch/src/main/java/org/metafacture/elasticsearch/JsonToElasticsearchBulk.java)

lines-to-records
----------------
- description:	Collects strings and emits them as records when a line matches the pattern or the stream is closed.
- options:	recordmarkerregexp (String)
- signature:	String -> String
- [example in Playground](https://metafacture.org/playground/?example=lines-to-records)
- java class:	[org.metafacture.strings.LineRecorder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/LineRecorder.java)

list-fix-paths
--------------
- description:	Lists all paths found in the input records. These paths can be used in a Fix to address fields. Options: `count` (output occurence frequency of each path, sorted by highest frequency first; default: `true`), `template` (for formatting the internal triple structure; default: `${o}	|	${s}` if count is true, else `${s}`)`index` (output individual repeated subfields and array elements with index numbers instead of '*'; default: `false`)
- options:	template (String), count (boolean), index (boolean)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=list-fix-paths)
- java class:	[org.metafacture.metafix.ListFixPaths](https://github.com/metafacture/metafacture-fix/blob/master/metafix/src/main/java/org/metafacture/metafix/ListFixPaths.java )

list-fix-values
---------------
- description:	Lists all values found for the given path. The paths can be found using fix-list-paths. Options: `count` (output occurence frequency of each value, sorted by highest frequency first; default: `true`)`template` (for formatting the internal triple structure; default: `${o}	|	${s}` if count is true, else `${s}`)
- options:	template (String), count (boolean)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=list-fix-values)
- java class:	[org.metafacture.metafix.ListFixValues](https://github.com/metafacture/metafacture-fix/blob/master/metafix/src/main/java/org/metafacture/metafix/ListFixValues.java)

literal-to-object
-----------------
- description:	Emits literal values as objects.
- options:	pattern (String)
- signature:	StreamReceiver -> String
- [example in Playground](https://metafacture.org/playground/?example=literal-to-object)
- java class:	[org.metafacture.mangling.LiteralToObject](https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/LiteralToObject.java)

log-object
----------
- description:	logs objects with the toString method
- signature:	Object -> Object
- java class:	[org.metafacture.monitoring.ObjectLogger](https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/ObjectLogger.java)

log-stream
----------
- description:	logs events
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.monitoring.StreamLogger](https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/StreamLogger.java)

log-stream-time
---------------
- description:	Benchmarks the execution time of the downstream modules.
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.monitoring.StreamTimer](https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/StreamTimer.java)

log-time
--------
- description:	Benchmarks the execution time of the downstream modules.
- signature:	Object -> Object
- java class:	[org.metafacture.monitoring.ObjectTimer](https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/ObjectTimer.java)

map-to-stream
-------------
- signature:	Map -> StreamReceiver
- java class:	[org.metafacture.javaintegration.MapToStream](https://github.com/metafacture/metafacture-core/blob/master/metafacture-javaintegration/src/main/java/org/metafacture/javaintegration/MapToStream.java)

match
-----
- description:	Matches the incoming strings against a regular expression and replaces the matching parts.
- options:	pattern (String), replacement (String)
- signature:	String -> String
- [example in Playground](https://metafacture.org/playground/?example=match)
- java class:	[org.metafacture.strings.StringMatcher](https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StringMatcher.java)

merge-batch-stream
------------------
- description:	Merges a sequence of batchSize records
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.plumbing.StreamBatchMerger](https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/StreamBatchMerger.java)

merge-same-ids
--------------
- signature:	StreamReceiver -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=merge-same-ids)
- java class:	[org.metafacture.plumbing.StreamMerger](https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/StreamMerger.java)

morph
-----
- description:	Applies a metamorph transformation to the event stream. Metamorph definition is given in brackets.
- signature:	StreamReceiver -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=morph)
- java class:	[org.metafacture.metamorph.Metamorph](https://github.com/metafacture/metafacture-core/blob/master/metamorph/src/main/java/org/metafacture/metamorph/Metamorph.java)

normalize-unicode-stream
------------------------
- description:	Normalises composed and decomposed Unicode characters.
- options:	normalizationform [NFD, NFC, NFKD, NFKC], normalizevalues (boolean), normalizeids (boolean), normalizekeys (boolean)
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.strings.StreamUnicodeNormalizer](https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StreamUnicodeNormalizer.java)

normalize-unicode-string
------------------------
- description:	Normalizes diacritics in Unicode strings.
- options:	normalizationform [NFD, NFC, NFKD, NFKC]
- signature:	String -> String
- java class:	[org.metafacture.strings.UnicodeNormalizer](https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/UnicodeNormalizer.java)

object-batch-log
----------------
- description:	Writes log info for every BATCHSIZE records.
- options:	batchsize (int)
- signature:	Object -> Object
- java class:	[org.metafacture.monitoring.ObjectBatchLogger](https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/ObjectBatchLogger.java)

object-tee
----------
- description:	Sends an object to more than one receiver.
- signature:	Object -> Object
- java class:	[org.metafacture.plumbing.ObjectTee](https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/ObjectTee.java)

object-to-literal
-----------------
- description:	Outputs a record containing the input object as literal
- options:	recordid (String), literalname (String)
- signature:	Object -> StreamReceiver
- java class:	[org.metafacture.mangling.ObjectToLiteral](https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/ObjectToLiteral.java)

open-file
---------
- description:	Opens a file.
- options:	decompressconcatenated (boolean), encoding (String), compression [NONE, AUTO, BZIP2, GZIP, PACK200, XZ]
- signature:	String -> Reader
- [example in Playground](https://metafacture.org/playground/?example=open-file)
- java class:	[org.metafacture.io.FileOpener](https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/FileOpener.java)

open-http
---------
- description:	Opens an HTTP resource. Supports setting HTTP header fields `Accept`, `Accept-Charset`, `Accept-Encoding`, `Content-Encoding` and `Content-Type`, as well as generic headers (separated by `\n`). Defaults: request `method` = `GET`, request `url` = `@-` (input data), request `body` = `@-` (input data) if request method supports body and input data not already used, `Accept` header (`accept`) = `*/*`, `Accept-Charset` header (`acceptcharset`) = `UTF-8`, `errorprefix` = `ERROR: `.
- options:	method [DELETE, GET, HEAD, OPTIONS, POST, PUT, TRACE], contentencoding (String), header (String), [deprecated] encoding (String), body (String), acceptcharset (String), acceptencoding (String), url (String), accept (String), errorprefix (String), contenttype (String)
- signature:	String -> Reader
- [example in Playground](https://metafacture.org/playground/?example=open-http)
- java class:	[org.metafacture.io.HttpOpener](https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/HttpOpener.java)

open-oaipmh
-----------
- description:	Opens an OAI-PMH stream and passes a reader to the receiver. Mandatory arguments are: BASE_URL, DATE_FROM, DATE_UNTIL, METADATA_PREFIX, SET_SPEC .
- options:	setspec (String), datefrom (String), encoding (String), dateuntil (String), metadataprefix (String)
- signature:	String -> Reader
- [example in Playground](https://metafacture.org/playground/?example=open-oaipmh)
- java class:	[org.metafacture.biblio.OaiPmhOpener](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/OaiPmhOpener.java)

open-resource
-------------
- description:	Opens a resource.
- options:	encoding (String)
- signature:	String -> Reader
- java class:	[org.metafacture.io.ResourceOpener](https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/ResourceOpener.java)

open-tar
--------
- description:	Opens a tar archive and passes every entry.
- signature:	Reader -> Reader
- java class:	[org.metafacture.io.TarReader](https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/TarReader.java)

pass-through
------------
- description:	A simple pass-through module
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.plumbing.IdentityStreamPipe](https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/IdentityStreamPipe.java)

print
-----
- description:	Writes objects to stdout
- options:	footer (String), header (String), encoding (String), compression [NONE, AUTO, BZIP2, GZIP, PACK200, XZ], separator (String)
- signature:	Object -> Void
- [example in Playground](https://metafacture.org/playground/?example=print)
- java class:	[org.metafacture.io.ObjectStdoutWriter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/ObjectStdoutWriter.java)

rdf-macros
----------
- description:	Expands some macros for RDF/XML. When using Fix, configure `referenceMarker` to any char but the default `*`
- options:	autoaddedsubject (String), referencemarker (String), languagemarker (String)
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.linkeddata.RdfMacroPipe](https://github.com/metafacture/metafacture-core/blob/master/metafacture-linkeddata/src/main/java/org/metafacture/linkeddata/RdfMacroPipe.java)

read-beacon
-----------
- description:	Reads BEACON format
- options:	metadatafilter (String), buffersize (int), relation (String)
- signature:	Reader -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=read-beacon)
- java class:	[org.metafacture.linkeddata.BeaconReader](https://github.com/metafacture/metafacture-core/blob/master/metafacture-linkeddata/src/main/java/org/metafacture/linkeddata/BeaconReader.java)

read-dir
--------
- description:	Reads a directory and emits all filenames found.
- options:	filenamepattern (String), recursive (boolean)
- signature:	String -> String
- java class:	[org.metafacture.files.DirReader](https://github.com/metafacture/metafacture-core/blob/master/metafacture-files/src/main/java/org/metafacture/files/DirReader.java)

read-string
-----------
- description:	Creates a reader for the supplied string and sends it to the receiver
- signature:	String -> Reader
- [example in Playground](https://metafacture.org/playground/?example=read-string)
- java class:	[org.metafacture.strings.StringReader](https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StringReader.java)

read-triples
------------
- description:	Reads triples
- signature:	String -> Triple
- java class:	[org.metafacture.triples.TripleReader](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleReader.java)

record-to-entity
----------------
- options:	entityname (String), idliteralname (String)
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.mangling.RecordToEntity](https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/RecordToEntity.java)

regex-decode
------------
- description:	Decodes a string based on a regular expression using named capture groups
- options:	rawinputliteral (String)
- signature:	String -> StreamReceiver
- [example in Playground](https://metafacture.org/playground/?example=regex-decode)
- java class:	[org.metafacture.strings.RegexDecoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/RegexDecoder.java)

remodel-pica-multiscript
------------------------
- description:	Groups multiscript fields in entities
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.biblio.pica.PicaMultiscriptRemodeler](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/pica/PicaMultiscriptRemodeler.java)

reorder-triple
--------------
- description:	Shifts subjectTo predicateTo and objectTo around
- options:	subjectfrom [SUBJECT, PREDICATE, OBJECT], objectfrom [SUBJECT, PREDICATE, OBJECT], predicatefrom [SUBJECT, PREDICATE, OBJECT]
- signature:	Triple -> Triple
- java class:	[org.metafacture.triples.TripleReorder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleReorder.java)

reset-object-batch
------------------
- description:	Resets the downstream modules every batch-size objects
- options:	batchsize (int)
- signature:	Object -> Object
- java class:	[org.metafacture.flowcontrol.ObjectBatchResetter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/ObjectBatchResetter.java)

retrieve-triple-objects
-----------------------
- description:	Uses the object value of the triple as a URL and emits a new triple in which the object value is replaced with the contents of the resource identified by the URL.
- options:	defaultencoding (String)
- signature:	Triple -> Triple
- java class:	[org.metafacture.triples.TripleObjectRetriever](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleObjectRetriever.java)

sleep
-----
- description:	Lets the process sleep for a specific amount of time between objects.
- options:	sleeptime (int), timeunit (String)
- signature:	Object -> Object
- java class:	org.metafacture.flowcontrol.ObjectSleeper

sort-triples
------------
- description:	Sorts triples. Several options can be combined, e.g. `by="object",numeric="true",order="decreasing"` will numerically sort the Object of the triples in decreasing order (given that all Objects are indeed of numeric type).
- options:	by [SUBJECT, PREDICATE, OBJECT, ALL], numeric (boolean), order [INCREASING, DECREASING]
- signature:	Triple -> Triple
- [example in Playground](https://metafacture.org/playground/?example=sort-triples)
- java class:	[org.metafacture.triples.TripleSort](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleSort.java)

split-lines
-----------
- description:	Splits a string at new lines and sends each line to the receiver.
- signature:	String -> String
- java class:	[org.metafacture.strings.LineSplitter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/LineSplitter.java)

split-xml-elements
------------------
- description:	Splits elements (e.g. defining single records) residing in one XML document into multiple single XML documents.
- options:	elementname (String), xmldeclaration (String), toplevelelement (String)
- signature:	XmlReceiver -> StreamReceiver
- java class:	[org.metafacture.xml.XmlElementSplitter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/XmlElementSplitter.java)

stream-count
------------
- description:	Counts the number of records and fields read.
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.statistics.Counter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-statistics/src/main/java/org/metafacture/statistics/Counter.java)

stream-tee
----------
- description:	Replicates an event stream to an arbitrary number of stream receivers.
- signature:	StreamReceiver -> StreamReceiver
- java class:	[org.metafacture.plumbing.StreamTee](https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/StreamTee.java)

stream-to-triples
-----------------
- description:	Emits the literals which are received as triples such that the name and value become the predicate and the object of the triple. The record id containing the literal becomes the subject. If 'redirect' is true, the value of the subject is determined by using either the value of a literal named '_id', or for individual literals by prefixing their name with '{to:ID}'. Set 'recordPredicate' to encode a complete record in one triple. The value of 'recordPredicate' is used as the predicate of the triple. If 'recordPredicate' is set, no {to:ID}NAME-style redirects are possible.
- options:	redirect (boolean), recordpredicate (String)
- signature:	StreamReceiver -> Triple
- [example in Playground](https://metafacture.org/playground/?example=stream-to-triples)
- java class:	[org.metafacture.triples.StreamToTriples](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/StreamToTriples.java)

stream-to-xml
-------------
- description:	Encodes a stream as XML. Defaults: `rootTag="records"`, `recordTag="record"`, no attributeMarker.
- options:	recordtag (String), namespacefile (String), xmlheaderversion (String), writexmlheader (boolean), xmlheaderencoding (String), separateroots (boolean), roottag (String), valuetag (String), attributemarker (String), writeroottag (boolean), namespaces (String)
- signature:	StreamReceiver -> String
- java class:	[org.metafacture.xml.SimpleXmlEncoder](https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/SimpleXmlEncoder.java)

string-list-map-to-stream
-------------------------
- signature:	ListMap -> StreamReceiver
- java class:	[org.metafacture.javaintegration.StringListMapToStream](https://github.com/metafacture/metafacture-core/blob/master/metafacture-javaintegration/src/main/java/org/metafacture/javaintegration/StringListMapToStream.java)

template
--------
- description:	Builds a String from a template and an Object. Provide template in brackets. `${o}` marks the place where the object is to be inserted. If the object is an instance of Triple `${s}`, `${p}` and `${o}` are used instead.
- signature:	Object -> String
- [example in Playground](https://metafacture.org/playground/?example=template)
- java class:	[org.metafacture.formatting.ObjectTemplate](https://github.com/metafacture/metafacture-core/blob/master/metafacture-formatting/src/main/java/org/metafacture/formatting/ObjectTemplate.java)

thread-object-tee
-----------------
- description:	Incoming objects are distributed to the added receivers, running in their own threads.
- signature:	Object -> Object
- java class:	[org.metafacture.flowcontrol.ObjectThreader](https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/ObjectThreader.java)

to-jdom-document
----------------
- description:	Converts a stream into a JDom document.
- signature:	StreamReceiver -> Document
- java class:	[org.metafacture.jdom.StreamToJDomDocument](https://github.com/metafacture/metafacture-core/blob/master/metafacture-jdom/src/main/java/org/metafacture/jdom/StreamToJDomDocument.java)

triples-to-stream
-----------------
- description:	Converts a triple into a record stream
- signature:	Triple -> StreamReceiver
- java class:	[org.metafacture.triples.TriplesToStream](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TriplesToStream.java)

validate-json
-------------
- description:	Validate JSON against a given schema, send only valid input to the receiver. Pass the schema location to validate against. Write valid and/or invalid output to locations specified with `writeValid` and `writeInvalid`. Set the JSON key for the record ID value with `idKey` (for logging output, defaults to `id`).
- options:	idkey (String), writeinvalid (String), writevalid (String)
- signature:	String -> String
- java class:	[org.metafacture.json.JsonValidator](https://github.com/metafacture/metafacture-core/blob/4bfe2d09df6423a55c20f6ff057b8e24c18ad9f0/metafacture-json/src/main/java/org/metafacture/json/JsonValidator.java)

wait-for-inputs
---------------
- description:	Blocks close-stream events until a given number of close-stream events have been received.
- signature:	Object -> Object
- [example in Playground](https://metafacture.org/playground/?example=wait-for-inputs)
- java class:	[org.metafacture.flowcontrol.CloseSuppressor](https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/CloseSuppressor.java)

write
-----
- description:	Writes objects to stdout or a file
- arguments:	[stdout, PATH]
- options:	appendiffileexists (boolean), footer (String), header (String), encoding (String), compression (String), separator (String)
- signature:	Object -> Void
- java class:	[org.metafacture.io.ObjectWriter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/ObjectWriter.java)

write-files
-----------
- description:	Writes objects to one (or more) file(s)
- options:	appendiffileexists (boolean), footer (String), header (String), encoding (String), compression [NONE, AUTO, BZIP2, GZIP, PACK200, XZ], separator (String)
- signature:	Object -> Void
- java class:	[org.metafacture.io.ObjectFileWriter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/ObjectFileWriter.java)

write-triple-objects
--------------------
- description:	Writes the object value of the triple into a file. The filename is constructed from subject and predicate. Please note: This module does not check if the filename constructed from subject and predicate stays within `baseDir`. THIS MODULE SHOULD NOT BE USED IN ENVIRONMENTS IN WHICH THE VALUES OF SUBJECT AND PREDICATE A PROVIDED BY AN UNTRUSTED SOURCE!
- options:	encoding (String)
- signature:	Triple -> Void
- java class:	[org.metafacture.triples.TripleObjectWriter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleObjectWriter.java)

write-triples
-------------
- description:	Writes triples into a file.
- signature:	Triple -> Void
- java class:	[org.metafacture.triples.TripleWriter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleWriter.java)

write-xml-files
---------------
- description:	Writes the XML into the filesystem. The filename is constructed from the XPATH given as 'property'. Variables are:`target` (determining the output directory), `property` (the element in the XML entity. Constitutes the main part of the file's name.), `startIndex` ( a subfolder will be extracted out of the filename. This marks the index' beginning ), `stopIndex` ( a subfolder will be extracted out of the filename. This marks the index' end )
- options:	endindex (int), startindex (int), property (String), filesuffix (String), encoding (String), compression (String), target (String)
- signature:	StreamReceiver -> Void
- java class:	[org.metafacture.xml.XmlFilenameWriter](https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/XmlFilenameWriter.java)

xml-tee
-------
- description:	Sends an object to more than one receiver.
- signature:	XmlReceiver -> XmlReceiver
- [example in Playground](https://metafacture.org/playground/?example=write)
- java class:	[org.metafacture.plumbing.XmlTee](https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/XmlTee.java)

