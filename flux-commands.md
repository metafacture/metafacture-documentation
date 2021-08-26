Available flux commands
=======================

add-oreaggregation
------------------
- description:	adds ore:Aggregation to an Europeana Data Model stream. The aggregation id is set by emitting literal('aggregation_id', id)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.linkeddata.OreAggregationAdder

add-preamble-epilogue
---------------------
- description:	Adds a String preamle and/or epilogue to the stream
- options:	preamble (String), epilogue (String)
- signature:	String -> String
- java class:	org.metafacture.formatting.PreambleEpilogueAdder

as-formeta-records
------------------
- description:	Reads a stream of formeta data and splits between each top-level element
- signature:	Reader -> String
- java class:	org.metafacture.formeta.FormetaRecordsReader

as-lines
--------
- description:	Processes input from a reader line by line.
- signature:	Reader -> String
- java class:	org.metafacture.io.LineReader

as-records
----------
- description:	Reads data from a Reader and splits it into individual records
- options:	skipemptyrecords (boolean), separator (String)
- signature:	Reader -> String
- java class:	org.metafacture.io.RecordReader

batch-log
---------
- description:	Writes log info every BATCHSIZE records. 
- options:	batchsize (int)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.monitoring.StreamBatchLogger

batch-reset
-----------
- description:	Resets flow for every BATCHSIZE records.
- options:	batchsize (int)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.flowcontrol.StreamBatchResetter

calculate-metrics
-----------------
- description:	Calculates values for various cooccurrence metrics. The expected inputs are triples containing as subject the var name and as object the count. Marginal counts must appear first, joint counts second. Marinal counts must be written as 1:A, Joint counts as 2:A&B
- signature:	Triple -> Triple
- java class:	org.metafacture.statistics.CooccurrenceMetricCalculator

catch-object-exception
----------------------
- description:	passes objects through and catches exceptions.
- options:	logprefix (String), logstacktrace (boolean)
- signature:	Object -> Object
- java class:	org.metafacture.flowcontrol.ObjectExceptionCatcher

catch-stream-exception
----------------------
- description:	passes streams events through and catches exceptions.
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.flowcontrol.StreamExceptionCatcher

change-id
---------
- description:	By default changes the record id to the value of the '_id' literal (if present). Use the contructor to choose another literal as id source.
- options:	keepidliteral (boolean), idliteral (String), keeprecordswithoutidliteral (boolean)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.mangling.RecordIdChanger

collect-triples
---------------
- description:	Collects named values to form records. The name becomes the id, the value is split by 'separator' into name and value
- signature:	Triple -> StreamReceiver
- java class:	org.metafacture.triples.TripleCollect

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
- java class:	org.metafacture.biblio.AseqDecoder

decode-csv
----------
- description:	Decodes lines of CSV files. First line is interpreted as header.
- options:	hasheader (boolean), separator (String)
- signature:	String -> StreamReceiver
- java class:	org.metafacture.csv.CsvDecoder

decode-formeta
--------------
- description:	Decodes a record in formeta format.
- signature:	String -> StreamReceiver
- java class:	org.metafacture.formeta.FormetaDecoder

decode-html
-----------
- description:	Decode HTML to metadata events. The attrValsAsSubfields option can be used to override the default attribute values to be used as subfields (e.g. by default `link rel="canonical" href="http://example.org"` becomes `link.canonical`). It expects an HTTP-style query string specifying as key the attributes whose value should be used as a subfield, and as value the attribute whose value should be the subfield value, e.g. the default contains `link.rel=href`. To use the HTML element text as the value (instead of another attribute), omit the value of the query-string key-value pair, e.g. `title.lang`. To add to the defaults, instead of replacing them, start with an `&`, e.g. `&h3.class`
- options:	attrvalsassubfields (String)
- signature:	Reader -> StreamReceiver
- java class:	org.metafacture.html.HtmlDecoder

decode-json
-----------
- description:	Decodes JSON to metadata events. The 'setRecordPath' option can be used to set a JsonPath to extract a path as JSON - or to split the data into multiple JSON documents.
- options:	recordid (String), recordcount (int), arraymarker (String), arrayname (String), recordpath (String), allowcomments (boolean)
- signature:	String -> StreamReceiver
- java class:	org.metafacture.json.JsonDecoder

decode-mab
----------
- description:	Parses a raw Mab2 stream (UTF-8 encoding expected).
- signature:	String -> StreamReceiver
- java class:	org.metafacture.biblio.MabDecoder

decode-marc21
-------------
- description:	Decodes MARC 21 records
- options:	emitleaderaswhole (boolean), ignoremissingid (boolean)
- signature:	String -> StreamReceiver
- java class:	org.metafacture.biblio.marc21.Marc21Decoder

decode-pica
-----------
- description:	Parses pica+ records. The parser only parses single records. A string containing multiple records must be split into individual records before passing it to PicaDecoder.
- options:	trimfieldnames (boolean), normalizedserialization (boolean), ignoremissingidn (boolean), skipemptyfields (boolean), normalizeutf8 (boolean)
- signature:	String -> StreamReceiver
- java class:	org.metafacture.biblio.pica.PicaDecoder

decode-string
-------------
- description:	Splits a String into several Strings, either by extracting parts that match a regexp or by splitting by a regexp.
- options:	mode [SPLIT, EXTRACT]
- signature:	String -> String
- java class:	org.metafacture.strings.StringDecoder

decode-xml
----------
- description:	Reads an XML file and passes the XML events to a receiver.
- signature:	Reader -> XmlReceiver
- java class:	org.metafacture.xml.XmlDecoder

decouple
--------
- description:	creates a new thread in which subsequent flow elements run.
- options:	debug (boolean)
- signature:	Object -> Object
- java class:	org.metafacture.flowcontrol.ObjectPipeDecoupler

defer-stream
------------
- description:	Defers all stream events until an end-record event is received
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.flowcontrol.StreamDeferrer

digest-file
-----------
- description:	Uses the input string as a file name and computes a cryptographic hash the file
- signature:	String -> Triple
- java class:	org.metafacture.files.FileDigestCalculator

discard-events
--------------
- options:	discardlifecycleevents (boolean), discardliteralevents (boolean), discardentityevents (boolean), discardrecordevents (boolean)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.mangling.StreamEventDiscarder

draw-uniform-sample
-------------------
- description:	Draws a uniform sample of records from the input stream.
- signature:	Object -> Object
- java class:	org.metafacture.statistics.UniformSampler

encode-formeta
--------------
- description:	Encodes streams in formeta format.
- options:	style [CONCISE, VERBOSE, MULTILINE]
- signature:	StreamReceiver -> String
- java class:	org.metafacture.formeta.FormetaEncoder

encode-json
-----------
- description:	Serialises an object as JSON
- options:	prettyprinting (boolean)
- signature:	StreamReceiver -> String
- java class:	org.metafacture.json.JsonEncoder

encode-literals
---------------
- description:	Outputs the name and value of each literal which is received as a string. Name and value are separated by a separator string. The default separator string is a tab. If a literal name is empty, only the value will be output without a separator. The module ignores record and entity events. In particular, this means that literal names are not prefixed by the name of the entity which contains them.
- options:	separator (String)
- signature:	StreamReceiver -> String
- java class:	org.metafacture.formatting.StreamLiteralFormatter

encode-marc21
-------------
- description:	Encodes MARC21 records
- options:	generateidfield (boolean)
- signature:	StreamReceiver -> String
- java class:	org.metafacture.biblio.marc21.Marc21Encoder

encode-marcxml
--------------
- description:	Encodes a stream into MARCXML.
- options:	xmlversion (String), formatted (boolean), xmlencoding (String)
- signature:	StreamReceiver -> String
- java class:	org.metafacture.biblio.marc21.MarcXmlEncoder

encode-pica
-----------
- description:	Encodes a stream in pica+ format
- options:	ignorerecordid (boolean)
- signature:	StreamReceiver -> String
- java class:	org.metafacture.biblio.pica.PicaEncoder

encode-xml
----------
- description:	Encodes a stream as xml
- options:	recordtag (String), namespacefile (String), xmlheaderversion (String), writexmlheader (boolean), xmlheaderencoding (String), separateroots (boolean), roottag (String), writeroottag (boolean)
- signature:	StreamReceiver -> String
- java class:	org.metafacture.xml.SimpleXmlEncoder

extract-element
---------------
- description:	Extracts the specified element from an HTML document
- signature:	Reader -> String
- java class:	org.metafacture.html.ElementExtractor

filter
------
- description:	Filters a stream based on a morph definition. A record is accepted if the morph returns at least one non empty value.
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.metamorph.Filter

filter-duplicate-objects
------------------------
- description:	Filters consecutive duplicated data objects.
- signature:	Object -> Object
- java class:	org.metafacture.mangling.DuplicateObjectFilter

filter-null-values
------------------
- description:	Discards or replaces null values
- options:	replacement (String)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.mangling.NullFilter

filter-strings
--------------
- description:	Only forwards records which match (or do not match) a regular expression given in the constructor
- options:	passmatches (boolean)
- signature:	String -> String
- java class:	org.metafacture.strings.StringFilter

filter-triples
--------------
- description:	Filters triple. The  patterns for subject, predicate and object are disjunctive.
- options:	predicatepattern (String), objectpattern (String), passmatches (boolean), subjectpattern (String)
- signature:	Triple -> Triple
- java class:	org.metafacture.triples.TripleFilter

flatten
-------
- description:	flattens out entities in a stream by introducing dots in literal names
- options:	entitymarker (String)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.mangling.StreamFlattener

from-jdom-document
------------------
- signature:	Document -> StreamReceiver
- java class:	org.metafacture.jdom.JDomDocumentToStream

handle-cg-xml
-------------
- description:	Reads CG-XML files
- signature:	XmlReceiver -> StreamReceiver
- java class:	org.metafacture.xml.CGXmlHandler

handle-comarcxml
----------------
- description:	A comarc xml reader
- signature:	XmlReceiver -> StreamReceiver
- java class:	org.metafacture.biblio.ComarcXmlHandler

handle-generic-xml
------------------
- description:	A generic xml reader
- options:	emitnamespace (boolean), recordtagname (String)
- signature:	XmlReceiver -> StreamReceiver
- java class:	org.metafacture.xml.GenericXmlHandler

handle-mabxml
-------------
- description:	A MAB XML reader
- signature:	XmlReceiver -> StreamReceiver
- java class:	org.metafacture.biblio.AlephMabXmlHandler

handle-marcxml
--------------
- description:	A marc xml reader
- options:	namespace (String)
- signature:	XmlReceiver -> StreamReceiver
- java class:	org.metafacture.biblio.marc21.MarcXmlHandler

handle-picaxml
--------------
- description:	A pica xml reader
- signature:	XmlReceiver -> StreamReceiver
- java class:	org.metafacture.biblio.pica.PicaXmlHandler

jscript
-------
- description:	executes the function process(obj) in a given jscript
- options:	invoke (String)
- signature:	Object -> Object
- java class:	org.metafacture.scripting.JScriptObjectPipe

json-to-elasticsearch-bulk
--------------------------
- options:	idkey (String), index (String), type (String)
- signature:	String -> String
- java class:	org.metafacture.elasticsearch.JsonToElasticsearchBulk

lines-to-records
----------------
- description:	Collects strings and emits them as records when a line matches the pattern or the stream is closed.
- options:	recordmarkerregexp (String)
- signature:	String -> String
- java class:	org.metafacture.strings.LineRecorder

literal-to-object
-----------------
- description:	Emits literal values as objects.
- options:	pattern (String)
- signature:	StreamReceiver -> String
- java class:	org.metafacture.mangling.LiteralToObject

log-object
----------
- description:	logs objects with the toString method
- signature:	Object -> Object
- java class:	org.metafacture.monitoring.ObjectLogger

log-stream
----------
- description:	logs events
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.monitoring.StreamLogger

log-stream-time
---------------
- description:	Benchmarks the execution time of the downstream modules.
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.monitoring.StreamTimer

log-time
--------
- description:	Benchmarks the execution time of the downstream modules.
- signature:	Object -> Object
- java class:	org.metafacture.monitoring.ObjectTimer

map-to-stream
-------------
- signature:	Map -> StreamReceiver
- java class:	org.metafacture.javaintegration.MapToStream

match
-----
- description:	Matches the incoming strings against a regular expression and replaces the matching parts.
- options:	pattern (String), replacement (String)
- signature:	String -> String
- java class:	org.metafacture.strings.StringMatcher

merge-batch-stream
------------------
- description:	Merges a sequence of batchSize records
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.plumbing.StreamBatchMerger

merge-same-ids
--------------
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.plumbing.StreamMerger

morph
-----
- description:	applies a metamorph transformation to the event stream. Metamorph definition is given in brackets.
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.metamorph.Metamorph

normalize-unicode-stream
------------------------
- description:	Normalises composed and decomposed Unicode characters.
- options:	normalizationform [NFD, NFC, NFKD, NFKC], normalizevalues (boolean), normalizeids (boolean), normalizekeys (boolean)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.strings.StreamUnicodeNormalizer

normalize-unicode-string
------------------------
- description:	Normalizes diacritics in Unicode strings.
- options:	normalizationform [NFD, NFC, NFKD, NFKC]
- signature:	String -> String
- java class:	org.metafacture.strings.UnicodeNormalizer

object-batch-log
----------------
- description:	Writes log info for every BATCHSIZE records.
- options:	batchsize (int)
- signature:	Object -> Object
- java class:	org.metafacture.monitoring.ObjectBatchLogger

object-tee
----------
- description:	Sends an object to more than one receiver.
- signature:	Object -> Object
- java class:	org.metafacture.plumbing.ObjectTee

object-to-literal
-----------------
- description:	Outputs a record containing the input object as literal
- options:	recordid (String), literalname (String)
- signature:	<unknown> -> StreamReceiver
- java class:	org.metafacture.mangling.ObjectToLiteral

open-file
---------
- description:	Opens a file.
- options:	decompressconcatenated (boolean), encoding (String), compression [NONE, AUTO, BZIP2, GZIP, PACK200, XZ]
- signature:	String -> Reader
- java class:	org.metafacture.io.FileOpener

open-http
---------
- description:	Opens a http resource. Supports the setting of Accept and Accept-Charset as http header fields.
- options:	encoding (String), accept (String)
- signature:	String -> Reader
- java class:	org.metafacture.io.HttpOpener

open-oaipmh
-----------
- description:	Opens an OAI-PMH stream and passes a reader to the receiver. Mandatory arguments are: BASE_URL, DATE_FROM, DATE_UNTIL, METADATA_PREFIX, SET_SPEC .
- options:	setspec (String), datefrom (String), encoding (String), dateuntil (String), metadataprefix (String)
- signature:	String -> Reader
- java class:	org.metafacture.biblio.OaiPmhOpener

open-resource
-------------
- description:	Opens a resource.
- options:	encoding (String)
- signature:	String -> Reader
- java class:	org.metafacture.io.ResourceOpener

open-tar
--------
- description:	Opens a tar archive and passes every entry.
- signature:	Reader -> Reader
- java class:	org.metafacture.io.TarReader

pass-through
------------
- description:	A simple pass-through module
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.plumbing.IdentityStreamPipe

print
-----
- description:	Writes objects to stdout
- options:	footer (String), header (String), encoding (String), compression (String), separator (String)
- signature:	Object -> 
- java class:	org.metafacture.io.ObjectStdoutWriter

rdf-macros
----------
- description:	Expands some macros for RDF/XML
- options:	autoaddedsubject (String)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.linkeddata.RdfMacroPipe

read-beacon
-----------
- description:	Reads BEACON format
- options:	metadatafilter (String), buffersize (int), relation (String)
- signature:	Reader -> StreamReceiver
- java class:	org.metafacture.linkeddata.BeaconReader

read-dir
--------
- description:	Reads a directory and emits all filenames found.
- options:	filenamepattern (String), recursive (boolean)
- signature:	String -> String
- java class:	org.metafacture.files.DirReader

read-string
-----------
- description:	Creates a reader for the supplied string and sends it to the receiver
- signature:	String -> Reader
- java class:	org.metafacture.strings.StringReader

read-triples
------------
- signature:	<unknown> -> 
- java class:	org.metafacture.triples.TripleReader

record-to-entity
----------------
- options:	idliteralname (String), entityname (String)
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.mangling.RecordToEntity

regex-decode
------------
- description:	Decodes a string based on a regular expression using named capture groups
- options:	rawinputliteral (String)
- signature:	String -> StreamReceiver
- java class:	org.metafacture.strings.RegexDecoder

remodel-pica-multiscript
------------------------
- description:	Groups multiscript fields in entities
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.biblio.pica.PicaMultiscriptRemodeler

reorder-triple
--------------
- description:	Shifts subjectTo predicateTo and object around
- options:	subjectfrom [SUBJECT, PREDICATE, OBJECT], objectfrom [SUBJECT, PREDICATE, OBJECT], predicatefrom [SUBJECT, PREDICATE, OBJECT]
- signature:	Triple -> Triple
- java class:	org.metafacture.triples.TripleReorder

reset-object-batch
------------------
- description:	Resets the downstream modules every batch-size objects
- options:	batchsize (int)
- signature:	Object -> Object
- java class:	org.metafacture.flowcontrol.ObjectBatchResetter

retrieve-triple-objects
-----------------------
- description:	Uses the object value of the triple as a URL and emits a new triple in which the object value is replaced with the contents of the resource identified by the URL.
- options:	defaultencoding (String)
- signature:	Triple -> Triple
- java class:	org.metafacture.triples.TripleObjectRetriever

sort-triples
------------
- description:	Sorts triples
- options:	by [SUBJECT, PREDICATE, OBJECT, ALL], order [INCREASING, DECREASING]
- signature:	Triple -> Triple
- java class:	org.metafacture.triples.TripleSort

split-lines
-----------
- description:	Splits a string at new lines and sends each line to the receiver.
- signature:	String -> String
- java class:	org.metafacture.strings.LineSplitter

split-xml-elements
------------------
- description:	Splits elements (e.g. defining single records) residing in one XML document into multiple single XML documents.
- options:	elementname (String), xmldeclaration (String), toplevelelement (String)
- signature:	XmlReceiver -> StreamReceiver
- java class:	org.metafacture.xml.XmlElementSplitter

stream-count
------------
- description:	Counts the number of records and fields read.
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.statistics.Counter

stream-tee
----------
- description:	Replicates an event stream to an arbitrary number of stream receivers.
- signature:	StreamReceiver -> StreamReceiver
- java class:	org.metafacture.plumbing.StreamTee

stream-to-triples
-----------------
- description:	Emits the literals which are received as triples such that the name and value become the predicate and the object of the triple. The record id containing the literal becomes the subject. If 'redirect' is true, the value of the subject is determined by using either the value of a literal named '_id', or for individual literals by prefixing their name with '{to:ID}'. Set 'recordPredicate' to encode a complete record in one triple. The value of 'recordPredicate' is used as the predicate of the triple. If 'recordPredicate' is set, no {to:ID}NAME-style redirects are possible.
- options:	redirect (boolean), recordpredicate (String)
- signature:	StreamReceiver -> Triple
- java class:	org.metafacture.triples.StreamToTriples

stream-to-xml
-------------
- description:	Encodes a stream as xml
- options:	recordtag (String), namespacefile (String), xmlheaderversion (String), writexmlheader (boolean), xmlheaderencoding (String), separateroots (boolean), roottag (String), writeroottag (boolean)
- signature:	StreamReceiver -> String
- java class:	org.metafacture.xml.SimpleXmlEncoder

string-list-map-to-stream
-------------------------
- signature:	ListMap -> StreamReceiver
- java class:	org.metafacture.javaintegration.StringListMapToStream

template
--------
- description:	Builds a String from a template and an Object. Provide template in brackets. ${o} marks the place where the object is to be inserted. If the object in an instance of Triple ${s}, ${p} and ${o} are used instead
- signature:	Object -> String
- java class:	org.metafacture.formatting.ObjectTemplate

thread-object-tee
-----------------
- description:	Incoming objects are distributed to the added receivers, running in their own threads.
- signature:	Object -> Object
- java class:	org.metafacture.flowcontrol.ObjectThreader

to-jdom-document
----------------
- description:	Converts a stream into a JDom document.
- signature:	StreamReceiver -> Document
- java class:	org.metafacture.jdom.StreamToJDomDocument

triples-to-stream
-----------------
- description:	Converts a triple into a record stream
- signature:	Triple -> StreamReceiver
- java class:	org.metafacture.triples.TriplesToStream

wait-for-inputs
---------------
- description:	
- signature:	Object -> Object
- java class:	org.metafacture.flowcontrol.CloseSuppressor

write
-----
- description:	Writes objects to stdout or a file
- arguments:	[stdout, PATH]
- options:	footer (String), header (String), encoding (String), compression [NONE, AUTO, BZIP2, GZIP, PACK200, XZ], separator (String)
- signature:	Object -> Void
- java class:	org.metafacture.io.ObjectWriter

write-files
-----------
- options:	footer (String), header (String), encoding (String), compression [NONE, AUTO, BZIP2, GZIP, PACK200, XZ], separator (String)
- signature:	Object -> 
- java class:	org.metafacture.io.ObjectFileWriter

write-triple-objects
--------------------
- description:	Writes the object value of the triple into a file. The filename is constructed from subject and predicate. Please note: This module does not check if the filename constructed from subject and predicate stays within `baseDir`. THIS MODULE SHOULD NOT BE USED IN ENVIRONMENTS IN WHICH THE VALUES OF SUBJECT AND PREDICATE A PROVIDED BY AN UNTRUSTED SOURCE!
- options:	encoding (String)
- signature:	Triple -> Void
- java class:	org.metafacture.triples.TripleObjectWriter

write-triples
-------------
- description:	Writes triples into a file.
- signature:	Triple -> Void
- java class:	org.metafacture.triples.TripleWriter

write-xml-files
---------------
- description:	Writes the xml into the filesystem. The filename is constructed from the xpath given as 'property'.
 Variables are
- 'target' (determining the output directory)
- 'property' (the element in the XML entity. Constitutes the main part of the file's name.)
- 'startIndex' ( a subfolder will be extracted out of the filename. This marks the index' beginning )
- 'stopIndex' ( a subfolder will be extracted out of the filename. This marks the index' end )

- options:	endindex (int), startindex (int), property (String), filesuffix (String), encoding (String), compression (String), target (String)
- signature:	StreamReceiver -> Void
- java class:	org.metafacture.xml.XmlFilenameWriter

xml-tee
-------
- description:	Sends an object to more than one receiver.
- signature:	XmlReceiver -> XmlReceiver
- java class:	org.metafacture.plumbing.XmlTee

