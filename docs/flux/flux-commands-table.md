---
layout: table-wrappers
title:  Flux Commands Table
parent: Flux
nav_order: 3
---

<link rel="stylesheet" href="../../assets/css/sortTable.css">
 <script src="../../assets/js/sortable-table.js"></script>
<script>
  function getValue(param) {
  var filter, table, tr, td, i, txtValue, column;

  input3 = document.getElementById("3");
  filter3 = input3.querySelector('.name').value.toUpperCase();

  input4 = document.getElementById("4");
  filter4 = input4.querySelector('.name').value.toUpperCase();

  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td3 = tr[i].getElementsByTagName("td")[3];
    td4 = tr[i].getElementsByTagName("td")[4];
    if (td3 && td4) {
      txtValue3 = td3.textContent || td3.innerText;
      txtValue4 = td4.textContent  || td4.innerText;
      if ((txtValue3.toUpperCase().indexOf(filter3) > -1 || filter3==="*") && (txtValue4.toUpperCase().indexOf(filter4) > -1 || filter4==="*" )) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
<body>

<div class="table-wrap">
 <table class="sortable" id="myTable">
  <caption>
    Flux commands
    <span class="sr-only"> (column headers with buttons are sortable).</span>
  </caption>
  <thead>
    <tr>
      <th aria-sort="ascending">
        <button>
          Commands
          <span aria-hidden="false"></span>
        </button>
      </th>
      <th class="no-sort">Description</th>
      <th class="no-sort">Options</th>
      <th id="3">
        <label for="filterColumn3">Signature  : In</label>
        <select id="3" onchange="getValue();" class="name">
          <option value="*">*</option>
          <option value="Document">Document</option>
          <option value="ListMap">ListMap</option>
          <option value="Map">Map</option>
          <option value="Object">Object</option>
          <option value="Reader">Reader</option>
          <option value="StreamReceiver">StreamReceiver</option>
          <option value="String">String</option>
          <option value="Triple">Triple</option>
          <option value="XmlReceiver">XmlReceiver</option>
        </select>
      </th>
      <th id="4">
        <label for="filterColumn4">Signature: Out</label>
        <select id="4" onchange="getValue();" class="name">
          <option value="*">*</option>
          <option value="Document">Document</option>
          <option value="Object">Object</option>
          <option value="Reader">Reader</option>
          <option value="StreamReceiver">StreamReceiver</option>
          <option value="String">String</option>
          <option value="Triple">Triple</option>
          <option value="Void">Void</option>
          <option value="XmlReceiver">XmlReceiver</option>
        </select>
      </th>
      <th class="no-sort">Example in Playground</th>
      <th aria-sort="ascending">
        <button>
          Java class
          <span aria-hidden="false"></span>
        </button>
      </th>
    </tr>
  </thead>

    <tbody>
      <tr>
        <td>add-oreaggregation</td>
        <td>adds ore:Aggregation to an Europeana Data Model stream. The aggregation id is set by emitting literal('aggregation_id', id)</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-linkeddata/src/main/java/org/metafacture/linkeddata/OreAggregationAdder.java">org.metafacture.linkeddata.OreAggregationAdder</a></td>
      </tr>
      <tr>
        <td>add-preamble-epilogue</td>
        <td>Adds a String preamle and/or epilogue to the stream</td>
        <td>preamble (String), epilogue (String)</td>
        <td>String</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=add-preamble-epilogue">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-formatting/src/main/java/org/metafacture/formatting/PreambleEpilogueAdder.java">org.metafacture.formatting.PreambleEpilogueAdder</a></td>
      </tr>
      <tr>
        <td>as-formeta-records</td>
        <td>Reads a stream of formeta data and splits between each top-level element</td>
        <td></td>
        <td>Reader</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=as-formeta-records">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-formeta/src/main/java/org/metafacture/formeta/FormetaRecordsReader.java">org.metafacture.formeta.FormetaRecordsReader</a></td>
      </tr>
      <tr>
        <td>as-lines</td>
        <td>Processes input from a reader line by line.</td>
        <td></td>
        <td>Reader</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=as-lines">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/LineReader.java">org.metafacture.io.LineReader</a></td>
      </tr>
      <tr>
        <td>as-records</td>
        <td>Reads data from a Reader and splits it into individual records</td>
        <td>skipemptyrecords (boolean), separator (String)</td>
        <td>Reader</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=as-records">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/RecordReader.java">org.metafacture.io.RecordReader</a></td>
      </tr>
      <tr>
        <td>batch-log</td>
        <td>Writes log info every BATCHSIZE records. </td>
        <td>batchsize (int)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-flux-examples/blob/master/sample4/bib-data.pica%3Fraw%3Dtrue%22%0A%7C+open-http%0A%7C+as-lines%0A%7C+decode-pica%0A//+This+cannot+be+shown+by+the+Playground.+Since+it+outputs+to+stoud%3F%0A%7C+batch-log%28batchsize%3D%2220%22%29%0A%7C+encode-json%0A%7C+print%0A%3B">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/StreamBatchLogger.java">org.metafacture.monitoring.StreamBatchLogger</a></td>
      </tr>
      <tr>
        <td>batch-reset</td>
        <td>Resets flow for every BATCHSIZE records.</td>
        <td>batchsize (int)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/StreamBatchResetter.java">org.metafacture.flowcontrol.StreamBatchResetter</a></td>
      </tr>
      <tr>
        <td>calculate-metrics</td>
        <td>Calculates values for various cooccurrence metrics. The expected inputs are triples containing as subject the var name and as object the count. Marginal counts must appear first, joint counts second. Marinal counts must be written as 1:A, Joint counts as 2:A&B</td>
        <td></td>
        <td>Triple</td>
<td>Triple</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-statistics/src/main/java/org/metafacture/statistics/CooccurrenceMetricCalculator.java">org.metafacture.statistics.CooccurrenceMetricCalculator</a></td>
      </tr>
      <tr>
        <td>catch-object-exception</td>
        <td>passes objects through and catches exceptions.</td>
        <td>logprefix (String), logstacktrace (boolean)</td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/ObjectExceptionCatcher.java">org.metafacture.flowcontrol.ObjectExceptionCatcher</a></td>
      </tr>
      <tr>
        <td>catch-stream-exception</td>
        <td>passes streams events through and catches exceptions.</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/StreamExceptionCatcher.java">org.metafacture.flowcontrol.StreamExceptionCatcher</a></td>
      </tr>
      <tr>
        <td>change-id</td>
        <td>By default changes the record ID to the value of the '_id' literal (if present). Use the contructor to choose another literal as ID source.</td>
        <td>keepidliteral (boolean), idliteral (String), keeprecordswithoutidliteral (boolean)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=change-id">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/RecordIdChanger.java">org.metafacture.mangling.RecordIdChanger</a></td>
      </tr>
      <tr>
        <td>collect-triples</td>
        <td>Collects named values to form records. The name becomes the id, the value is split by 'separator' into name and value</td>
        <td></td>
        <td>Triple</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=collect-triples">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleCollect.java">org.metafacture.triples.TripleCollect</a></td>
      </tr>
      <tr>
        <td>count-triples</td>
        <td>Counts triples</td>
        <td>countpredicate (String), countby [SUBJECT, PREDICATE, OBJECT, ALL]</td>
        <td>Triple</td>
<td>Triple</td>
        <td></td>
        <td>org.metafacture.triples.TripleCount</td>
      </tr>
      <tr>
        <td>decode-aseq</td>
        <td>Parses a raw Aseq record (UTF-8 encoding expected).</td>
        <td></td>
        <td>String</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-aseq">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/AseqDecoder.java">org.metafacture.biblio.AseqDecoder</a></td>
      </tr>
      <tr>
        <td>decode-csv</td>
        <td>Decodes lines of CSV files. First line may be interpreted as header.</td>
        <td>hasheader (boolean), separator (String)</td>
        <td>String</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-csv">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-csv/src/main/java/org/metafacture/csv/CsvDecoder.java">org.metafacture.csv.CsvDecoder</a></td>
      </tr>
      <tr>
        <td>decode-formeta</td>
        <td>Decodes a record in formeta format.</td>
        <td></td>
        <td>String</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-formeta">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-formeta/src/main/java/org/metafacture/formeta/FormetaDecoder.java">org.metafacture.formeta.FormetaDecoder</a></td>
      </tr>
      <tr>
        <td>decode-html</td>
        <td>Decode HTML to metadata events. The attrValsAsSubfields option can be used to override the default attribute values to be used as subfields (e.g. by default `link rel="canonical" href="http://example.org"` becomes `link.canonical`). It expects an HTTP-style query string specifying as key the attributes whose value should be used as a subfield, and as value the attribute whose value should be the subfield value, e.g. the default contains `link.rel=href`. To use the HTML element text as the value (instead of another attribute), omit the value of the query-string key-value pair, e.g. `title.lang`. To add to the defaults, instead of replacing them, start with an `&`, e.g. `&h3.class`</td>
        <td>attrvalsassubfields (String)</td>
        <td>Reader</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-html">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-html/src/main/java/org/metafacture/html/HtmlDecoder.java">org.metafacture.html.HtmlDecoder</a></td>
      </tr>
      <tr>
        <td>decode-json</td>
        <td>Decodes JSON to metadata events. The 'recordPath' option can be used to set a JsonPath to extract a path as JSON - or to split the data into multiple JSON documents.</td>
        <td>recordid (String), recordcount (int), booleanmarker (String), arraymarker (String), arrayname (String), recordpath (String), allowcomments (boolean), numbermarker (String)</td>
        <td>String</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-json">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-json/src/main/java/org/metafacture/json/JsonDecoder.java">org.metafacture.json.JsonDecoder</a></td>
      </tr>
      <tr>
        <td>decode-mab</td>
        <td>Parses a raw Mab2 stream (UTF-8 encoding expected).</td>
        <td></td>
        <td>String</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-mab">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/MabDecoder.java">org.metafacture.biblio.MabDecoder</a></td>
      </tr>
      <tr>
        <td>decode-marc21</td>
        <td>Decodes MARC 21 records (UTF-8 encoding expected).</td>
        <td>emitleaderaswhole (boolean), ignoremissingid (boolean)</td>
        <td>String</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-marc21">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/marc21/Marc21Decoder.java">org.metafacture.biblio.marc21.Marc21Decoder</a></td>
      </tr>
      <tr>
        <td>decode-pica</td>
        <td>Parses pica+ records. The parser only parses single records. A string containing multiple records must be split into individual records before passing it to PicaDecoder.</td>
        <td>trimfieldnames (boolean), normalizedserialization (boolean), ignoremissingidn (boolean), skipemptyfields (boolean), normalizeutf8 (boolean)</td>
        <td>String</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-pica">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/pica/PicaDecoder.java">org.metafacture.biblio.pica.PicaDecoder</a></td>
      </tr>
      <tr>
        <td>decode-string</td>
        <td>Splits a String into several Strings, either by extracting parts that match a regexp or by splitting by a regexp.</td>
        <td>mode [SPLIT, EXTRACT]</td>
        <td>String</td>
<td>String</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StringDecoder.java">org.metafacture.strings.StringDecoder</a></td>
      </tr>
      <tr>
        <td>decode-xml</td>
        <td>Reads an XML file and passes the XML events to a receiver. Set `totalEntitySizeLimit="0"` to allow unlimited XML entities.</td>
        <td>totalentitysizelimit (String)</td>
        <td>Reader</td>
<td>XmlReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-xml">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/XmlDecoder.java">org.metafacture.xml.XmlDecoder</a></td>
      </tr>
      <tr>
        <td>decode-yaml</td>
        <td>Decodes YAML to metadata events.</td>
        <td>recordid (String), recordcount (int), arraymarker (String), arrayname (String)</td>
        <td>String</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=decode-yaml">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-yaml/src/main/java/org/metafacture/yaml/YamlDecoder.java">org.metafacture.yaml.YamlDecoder</a></td>
      </tr>
      <tr>
        <td>decouple</td>
        <td>creates a new thread in which subsequent flow elements run.</td>
        <td>debug (boolean)</td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/ObjectPipeDecoupler.java">org.metafacture.flowcontrol.ObjectPipeDecoupler</a></td>
      </tr>
      <tr>
        <td>defer-stream</td>
        <td>Defers all stream events until an end-record event is received</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/StreamDeferrer.java">org.metafacture.flowcontrol.StreamDeferrer</a></td>
      </tr>
      <tr>
        <td>digest-file</td>
        <td>Uses the input string as a file name and computes a cryptographic hash the file</td>
        <td></td>
        <td>String</td>
<td>Triple</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-files/src/main/java/org/metafacture/files/FileDigestCalculator.java">org.metafacture.files.FileDigestCalculator</a></td>
      </tr>
      <tr>
        <td>discard-events</td>
        <td></td>
        <td>discardlifecycleevents (boolean), discardliteralevents (boolean), discardentityevents (boolean), discardrecordevents (boolean)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/StreamEventDiscarder.java">org.metafacture.mangling.StreamEventDiscarder</a></td>
      </tr>
      <tr>
        <td>draw-uniform-sample</td>
        <td>Draws a uniform sample of records from the input stream.</td>
        <td></td>
        <td>Object</td>
<td>Object</td>
        <td><a href="https://metafacture.org/playground/?example=draw-uniform-sample">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-statistics/src/main/java/org/metafacture/statistics/UniformSampler.java">org.metafacture.statistics.UniformSampler</a></td>
      </tr>
      <tr>
        <td>encode-csv</td>
        <td>Encodes each value in a record as a csv row.</td>
        <td>includeheader (boolean), noquotes (boolean), separator (String), includerecordid (boolean)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=encode-csv">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-csv/src/main/java/org/metafacture/csv/CsvEncoder.java">org.metafacture.csv.CsvEncoder</a></td>
      </tr>
      <tr>
        <td>encode-formeta</td>
        <td>Encodes streams in formeta format.</td>
        <td>style [CONCISE, VERBOSE, MULTILINE]</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=encode-formeta">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-formeta/src/main/java/org/metafacture/formeta/FormetaEncoder.java">org.metafacture.formeta.FormetaEncoder</a></td>
      </tr>
      <tr>
        <td>encode-json</td>
        <td>Serialises an object as JSON</td>
        <td>booleanmarker (String), arraymarker (String), prettyprinting (boolean), numbermarker (String)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=encode-json">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-json/src/main/java/org/metafacture/json/JsonEncoder.java">org.metafacture.json.JsonEncoder</a></td>
      </tr>
      <tr>
        <td>encode-literals</td>
        <td>Outputs the name and value of each literal which is received as a string. Name and value are separated by a separator string. The default separator string is a tab. If a literal name is empty, only the value will be output without a separator. The module ignores record and entity events. In particular, this means that literal names are not prefixed by the name of the entity which contains them.</td>
        <td>separator (String)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=encode-literals">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-formatting/src/main/java/org/metafacture/formatting/StreamLiteralFormatter.java">org.metafacture.formatting.StreamLiteralFormatter</a></td>
      </tr>
      <tr>
        <td>encode-marc21</td>
        <td>Encodes MARC21 records</td>
        <td>generateidfield (boolean)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=encode-marc21">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/marc21/Marc21Encoder.java">org.metafacture.biblio.marc21.Marc21Encoder</a></td>
      </tr>
      <tr>
        <td>encode-marcxml</td>
        <td>Encodes a stream into MARCXML. If you can't ensure valid MARC21 (e.g. the leader isn't correct or not set as one literal) then set the parameter `ensureCorrectMarc21Xml` to `true`.</td>
        <td>ensurecorrectmarc21xml (boolean), emitnamespace (boolean), xmlversion (String), formatted (boolean), xmlencoding (String)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=encode-marcxml">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/marc21/MarcXmlEncoder.java">org.metafacture.biblio.marc21.MarcXmlEncoder</a></td>
      </tr>
      <tr>
        <td>encode-pica</td>
        <td>Encodes a stream in pica+ format</td>
        <td>ignorerecordid (boolean)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/pica/PicaEncoder.java">org.metafacture.biblio.pica.PicaEncoder</a></td>
      </tr>
      <tr>
        <td>encode-xml</td>
        <td>Encodes a stream as XML. Defaults: `rootTag="records"`, `recordTag="record"`, no attributeMarker.</td>
        <td>recordtag (String), namespacefile (String), xmlheaderversion (String), writexmlheader (boolean), xmlheaderencoding (String), separateroots (boolean), roottag (String), valuetag (String), attributemarker (String), writeroottag (boolean), namespaces (String)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=encode-xml">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/SimpleXmlEncoder.java">org.metafacture.xml.SimpleXmlEncoder</a></td>
      </tr>
      <tr>
        <td>encode-yaml</td>
        <td>Serialises an object as YAML.</td>
        <td>arraymarker (String), [deprecated] prettyprinting (boolean)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=encode-yaml">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-yaml/src/main/java/org/metafacture/yaml/YamlEncoder.java">org.metafacture.yaml.YamlEncoder</a></td>
      </tr>
      <tr>
        <td>extract-element</td>
        <td>Extracts the specified element from an HTML document</td>
        <td></td>
        <td>Reader</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=extract-element">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-html/src/main/java/org/metafacture/html/ElementExtractor.java">org.metafacture.html.ElementExtractor</a></td>
      </tr>
      <tr>
        <td>filter</td>
        <td>Filters a stream based on a morph definition. A record is accepted if the morph returns at least one non empty value.</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metamorph/src/main/java/org/metafacture/metamorph/Filter.java">org.metafacture.metamorph.Filter</a></td>
      </tr>
      <tr>
        <td>filter-duplicate-objects</td>
        <td>Filters consecutive duplicated data objects.</td>
        <td></td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/DuplicateObjectFilter.java">org.metafacture.mangling.DuplicateObjectFilter</a></td>
      </tr>
      <tr>
        <td>filter-null-values</td>
        <td>Discards or replaces null values</td>
        <td>replacement (String)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=filter-null-values">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/NullFilter.java">org.metafacture.mangling.NullFilter</a></td>
      </tr>
      <tr>
        <td>filter-records-by-path</td>
        <td>Splits a stream into records based on entity path</td>
        <td>path (String), entityseparator (String), recordidformat (String)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=filter-records-by-path">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/RecordPathFilter.java">org.metafacture.mangling.RecordPathFilter</a></td>
      </tr>
      <tr>
        <td>filter-strings</td>
        <td>Only forwards records which match (or do not match) a regular expression.</td>
        <td>passmatches (boolean)</td>
        <td>String</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=filter-strings">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StringFilter.java">org.metafacture.strings.StringFilter</a></td>
      </tr>
      <tr>
        <td>filter-triples</td>
        <td>Filters triple. The  patterns for subject, predicate and object are disjunctive.</td>
        <td>predicatepattern (String), objectpattern (String), passmatches (boolean), subjectpattern (String)</td>
        <td>Triple</td>
<td>Triple</td>
        <td><a href="https://metafacture.org/playground/?example=filter-triples">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleFilter.java">org.metafacture.triples.TripleFilter</a></td>
      </tr>
      <tr>
        <td>find-fix-paths</td>
        <td>Finds all paths that have values that match the given pattern. Allows for regex. These paths can be used in a Fix to address fields.</td>
        <td></td>
        <td>StreamReceiver</td>
<td>String</td>
        <td></td>
        <td>org.metafacture.metafix.FindFixPaths</td>
      </tr>
      <tr>
        <td>fix</td>
        <td>Applies a fix transformation to the event stream, given as the path to a fix file or the fixes themselves.</td>
        <td>repeatedfieldstoentities (boolean), strictness [PROCESS, RECORD, EXPRESSION], entitymembername (String), strictnesshandlesprocessexceptions (boolean)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td>org.metafacture.metafix.Metafix</td>
      </tr>
      <tr>
        <td>flatten</td>
        <td>flattens out entities in a stream by introducing dots in literal names</td>
        <td>entitymarker (String)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=flatten">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/StreamFlattener.java">org.metafacture.mangling.StreamFlattener</a></td>
      </tr>
      <tr>
        <td>from-jdom-document</td>
        <td></td>
        <td></td>
        <td>Document</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-jdom/src/main/java/org/metafacture/jdom/JDomDocumentToStream.java">org.metafacture.jdom.JDomDocumentToStream</a></td>
      </tr>
      <tr>
        <td>handle-cg-xml</td>
        <td>Reads CG-XML files</td>
        <td></td>
        <td>XmlReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/CGXmlHandler.java">org.metafacture.xml.CGXmlHandler</a></td>
      </tr>
      <tr>
        <td>handle-comarcxml</td>
        <td>A comarc xml reader</td>
        <td></td>
        <td>XmlReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/ComarcXmlHandler.java">org.metafacture.biblio.ComarcXmlHandler</a></td>
      </tr>
      <tr>
        <td>handle-generic-xml</td>
        <td>A generic XML reader. Separates XML data in distinct records with the defined record tag name (default: `recordtagname="record"`) If no matching record tag is found, the output will be empty. The handler breaks down XML elements with simple string values and optional attributes into entities with a value subfield (name configurable) and additional subfields for each attribute. Record tag and value tag names can be configured. Attributes can get an attributeMarker.</td>
        <td>emitnamespace (boolean), recordtagname (String), attributemarker (String), valuetagname (String)</td>
        <td>XmlReceiver</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=handle-generic-xml">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/GenericXmlHandler.java">org.metafacture.xml.GenericXmlHandler</a></td>
      </tr>
      <tr>
        <td>handle-mabxml</td>
        <td>A MAB XML reader</td>
        <td></td>
        <td>XmlReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/AlephMabXmlHandler.java">org.metafacture.biblio.AlephMabXmlHandler</a></td>
      </tr>
      <tr>
        <td>handle-marcxml</td>
        <td>A MARC XML reader. To read marc data without namespace specification set option `namespace=""`</td>
        <td>namespace (String), attributemarker (String)</td>
        <td>XmlReceiver</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=handle-marcxml">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/marc21/MarcXmlHandler.java">org.metafacture.biblio.marc21.MarcXmlHandler</a></td>
      </tr>
      <tr>
        <td>handle-picaxml</td>
        <td>A pica xml reader</td>
        <td></td>
        <td>XmlReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/pica/PicaXmlHandler.java">org.metafacture.biblio.pica.PicaXmlHandler</a></td>
      </tr>
      <tr>
        <td>jscript</td>
        <td>executes the function process(obj) in a given jscript</td>
        <td>invoke (String)</td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-scripting/src/main/java/org/metafacture/scripting/JScriptObjectPipe.java">org.metafacture.scripting.JScriptObjectPipe</a></td>
      </tr>
      <tr>
        <td>json-to-elasticsearch-bulk</td>
        <td></td>
        <td>idkey (String), index (String), type (String)</td>
        <td>String</td>
<td>String</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-elasticsearch/src/main/java/org/metafacture/elasticsearch/JsonToElasticsearchBulk.java">org.metafacture.elasticsearch.JsonToElasticsearchBulk</a></td>
      </tr>
      <tr>
        <td>lines-to-records</td>
        <td>Collects strings and emits them as records when a line matches the pattern or the stream is closed.</td>
        <td>recordmarkerregexp (String)</td>
        <td>String</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=lines-to-records">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/LineRecorder.java">org.metafacture.strings.LineRecorder</a></td>
      </tr>
      <tr>
        <td>list-fix-paths</td>
        <td>Lists all paths found in the input records. These paths can be used in a Fix to address fields. Options: `count` (output occurence frequency of each path, sorted by highest frequency first; default: `true`), `template` (for formatting the internal triple structure; default: `${o}    |       ${s}` if count is true, else `${s}`)`index` (output individual repeated subfields and array elements with index numbers instead of '*'; default: `false`)</td>
        <td>template (String), count (boolean), index (boolean)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td></td>
        <td>org.metafacture.metafix.ListFixPaths</td>
      </tr>
      <tr>
        <td>list-fix-values</td>
        <td>Lists all values found for the given path. The paths can be found using fix-list-paths. Options: `count` (output occurence frequency of each value, sorted by highest frequency first; default: `true`)`template` (for formatting the internal triple structure; default: `${o}     |       ${s}` if count is true, else `${s}`)</td>
        <td>template (String), count (boolean)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=list-fix-values">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-fix/blob/master/metafix/src/main/java/org/metafacture/metafix/ListFixValues.java">org.metafacture.metafix.ListFixValues</a></td>
      </tr>
      <tr>
        <td>literal-to-object</td>
        <td>Emits literal values as objects.</td>
        <td>pattern (String)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=literal-to-object">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/LiteralToObject.java">org.metafacture.mangling.LiteralToObject</a></td>
      </tr>
      <tr>
        <td>log-object</td>
        <td>logs objects with the toString method</td>
        <td></td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/ObjectLogger.java">org.metafacture.monitoring.ObjectLogger</a></td>
      </tr>
      <tr>
        <td>log-stream</td>
        <td>logs events</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/StreamLogger.java">org.metafacture.monitoring.StreamLogger</a></td>
      </tr>
      <tr>
        <td>log-stream-time</td>
        <td>Benchmarks the execution time of the downstream modules.</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/StreamTimer.java">org.metafacture.monitoring.StreamTimer</a></td>
      </tr>
      <tr>
        <td>log-time</td>
        <td>Benchmarks the execution time of the downstream modules.</td>
        <td></td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/ObjectTimer.java">org.metafacture.monitoring.ObjectTimer</a></td>
      </tr>
      <tr>
        <td>map-to-stream</td>
        <td></td>
        <td></td>
        <td>Map</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-javaintegration/src/main/java/org/metafacture/javaintegration/MapToStream.java">org.metafacture.javaintegration.MapToStream</a></td>
      </tr>
      <tr>
        <td>match</td>
        <td>Matches the incoming strings against a regular expression and replaces the matching parts.</td>
        <td>pattern (String), replacement (String)</td>
        <td>String</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=match">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StringMatcher.java">org.metafacture.strings.StringMatcher</a></td>
      </tr>
      <tr>
        <td>merge-batch-stream</td>
        <td>Merges a sequence of batchSize records</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/StreamBatchMerger.java">org.metafacture.plumbing.StreamBatchMerger</a></td>
      </tr>
      <tr>
        <td>merge-same-ids</td>
        <td></td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=merge-same-ids">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/StreamMerger.java">org.metafacture.plumbing.StreamMerger</a></td>
      </tr>
      <tr>
        <td>morph</td>
        <td>Applies a metamorph transformation to the event stream. Metamorph definition is given in brackets.</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=morph">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metamorph/src/main/java/org/metafacture/metamorph/Metamorph.java">org.metafacture.metamorph.Metamorph</a></td>
      </tr>
      <tr>
        <td>normalize-unicode-stream</td>
        <td>Normalises composed and decomposed Unicode characters.</td>
        <td>normalizationform [NFD, NFC, NFKD, NFKC], normalizevalues (boolean), normalizeids (boolean), normalizekeys (boolean)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StreamUnicodeNormalizer.java">org.metafacture.strings.StreamUnicodeNormalizer</a></td>
      </tr>
      <tr>
        <td>normalize-unicode-string</td>
        <td>Normalizes diacritics in Unicode strings.</td>
        <td>normalizationform [NFD, NFC, NFKD, NFKC]</td>
        <td>String</td>
<td>String</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/UnicodeNormalizer.java">org.metafacture.strings.UnicodeNormalizer</a></td>
      </tr>
      <tr>
        <td>object-batch-log</td>
        <td>Writes log info for every BATCHSIZE records.</td>
        <td>batchsize (int)</td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-monitoring/src/main/java/org/metafacture/monitoring/ObjectBatchLogger.java">org.metafacture.monitoring.ObjectBatchLogger</a></td>
      </tr>
      <tr>
        <td>object-tee</td>
        <td>Sends an object to more than one receiver.</td>
        <td></td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/ObjectTee.java">org.metafacture.plumbing.ObjectTee</a></td>
      </tr>
      <tr>
        <td>object-to-literal</td>
        <td>Outputs a record containing the input object as literal</td>
        <td>recordid (String), literalname (String)</td>
        <td>Object</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/ObjectToLiteral.java">org.metafacture.mangling.ObjectToLiteral</a></td>
      </tr>
      <tr>
        <td>open-file</td>
        <td>Opens a file.</td>
        <td>decompressconcatenated (boolean), encoding (String), compression (String)</td>
        <td>String</td>
<td>Reader</td>
        <td><a href="https://metafacture.org/playground/?example=open-file">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/FileOpener.java">org.metafacture.io.FileOpener</a></td>
      </tr>
      <tr>
        <td>open-http</td>
        <td>Opens an HTTP resource. Supports setting HTTP header fields `Accept`, `Accept-Charset`, `Accept-Encoding`, `Content-Encoding` and `Content-Type`, as well as generic headers (separated by `\n`). Defaults: request `method` = `GET`, request `url` = `@-` (input data), request `body` = `@-` (input data) if request method supports body and input data not already used, `Accept` header (`accept`) = `*/*`, `Accept-Charset` header (`acceptcharset`) = `UTF-8`, `errorprefix` = `ERROR: `.</td>
        <td>method [DELETE, GET, HEAD, OPTIONS, POST, PUT, TRACE], contentencoding (String), header (String), [deprecated] encoding (String), body (String), acceptcharset (String), acceptencoding (String), url (String), contenttype (String), accept (String), errorprefix (String)</td>
        <td>String</td>
<td>Reader</td>
        <td><a href="https://metafacture.org/playground/?example=open-http">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/HttpOpener.java">org.metafacture.io.HttpOpener</a></td>
      </tr>
      <tr>
        <td>open-oaipmh</td>
        <td>Opens an OAI-PMH stream and passes a reader to the receiver. Mandatory arguments are: BASE_URL, DATE_FROM, DATE_UNTIL, METADATA_PREFIX, SET_SPEC .</td>
        <td>setspec (String), datefrom (String), encoding (String), dateuntil (String), metadataprefix (String)</td>
        <td>String</td>
<td>Reader</td>
        <td><a href="https://metafacture.org/playground/?example=open-oaipmh">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/OaiPmhOpener.java">org.metafacture.biblio.OaiPmhOpener</a></td>
      </tr>
      <tr>
        <td>open-resource</td>
        <td>Opens a resource.</td>
        <td>encoding (String)</td>
        <td>String</td>
<td>Reader</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/ResourceOpener.java">org.metafacture.io.ResourceOpener</a></td>
      </tr>
      <tr>
        <td>open-tar</td>
        <td>Opens a tar archive and passes every entry.</td>
        <td></td>
        <td>Reader</td>
<td>Reader</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/TarReader.java">org.metafacture.io.TarReader</a></td>
      </tr>
      <tr>
        <td>pass-through</td>
        <td>A simple pass-through module</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/IdentityStreamPipe.java">org.metafacture.plumbing.IdentityStreamPipe</a></td>
      </tr>
      <tr>
        <td>print</td>
        <td>Writes objects to stdout</td>
        <td>footer (String), header (String), encoding (String), compression (String), separator (String)</td>
        <td>Object</td>
<td>Void</td>
        <td><a href="https://metafacture.org/playground/?example=print">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/ObjectStdoutWriter.java">org.metafacture.io.ObjectStdoutWriter</a></td>
      </tr>
      <tr>
        <td>rdf-macros</td>
        <td>Expands some macros for RDF/XML</td>
        <td>autoaddedsubject (String)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-linkeddata/src/main/java/org/metafacture/linkeddata/RdfMacroPipe.java">org.metafacture.linkeddata.RdfMacroPipe</a></td>
      </tr>
      <tr>
        <td>read-beacon</td>
        <td>Reads BEACON format</td>
        <td>metadatafilter (String), buffersize (int), relation (String)</td>
        <td>Reader</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=read-beacon">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-linkeddata/src/main/java/org/metafacture/linkeddata/BeaconReader.java">org.metafacture.linkeddata.BeaconReader</a></td>
      </tr>
      <tr>
        <td>read-dir</td>
        <td>Reads a directory and emits all filenames found.</td>
        <td>filenamepattern (String), recursive (boolean)</td>
        <td>String</td>
<td>String</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-files/src/main/java/org/metafacture/files/DirReader.java">org.metafacture.files.DirReader</a></td>
      </tr>
      <tr>
        <td>read-string</td>
        <td>Creates a reader for the supplied string and sends it to the receiver</td>
        <td></td>
        <td>String</td>
<td>Reader</td>
        <td><a href="https://metafacture.org/playground/?example=read-string">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/StringReader.java">org.metafacture.strings.StringReader</a></td>
      </tr>
      <tr>
        <td>read-triples</td>
        <td>Reads triples</td>
        <td></td>
        <td>String</td>
<td>Triple</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleReader.java">org.metafacture.triples.TripleReader</a></td>
      </tr>
      <tr>
        <td>record-to-entity</td>
        <td></td>
        <td>entityname (String), idliteralname (String)</td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-mangling/src/main/java/org/metafacture/mangling/RecordToEntity.java">org.metafacture.mangling.RecordToEntity</a></td>
      </tr>
      <tr>
        <td>regex-decode</td>
        <td>Decodes a string based on a regular expression using named capture groups</td>
        <td>rawinputliteral (String)</td>
        <td>String</td>
<td>StreamReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=regex-decode">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/RegexDecoder.java">org.metafacture.strings.RegexDecoder</a></td>
      </tr>
      <tr>
        <td>remodel-pica-multiscript</td>
        <td>Groups multiscript fields in entities</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/pica/PicaMultiscriptRemodeler.java">org.metafacture.biblio.pica.PicaMultiscriptRemodeler</a></td>
      </tr>
      <tr>
        <td>reorder-triple</td>
        <td>Shifts subjectTo predicateTo and objectTo around</td>
        <td>subjectfrom [SUBJECT, PREDICATE, OBJECT], objectfrom [SUBJECT, PREDICATE, OBJECT], predicatefrom [SUBJECT, PREDICATE, OBJECT]</td>
        <td>Triple</td>
<td>Triple</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleReorder.java">org.metafacture.triples.TripleReorder</a></td>
      </tr>
      <tr>
        <td>reset-object-batch</td>
        <td>Resets the downstream modules every batch-size objects</td>
        <td>batchsize (int)</td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/ObjectBatchResetter.java">org.metafacture.flowcontrol.ObjectBatchResetter</a></td>
      </tr>
      <tr>
        <td>retrieve-triple-objects</td>
        <td>Uses the object value of the triple as a URL and emits a new triple in which the object value is replaced with the contents of the resource identified by the URL.</td>
        <td>defaultencoding (String)</td>
        <td>Triple</td>
<td>Triple</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleObjectRetriever.java">org.metafacture.triples.TripleObjectRetriever</a></td>
      </tr>
      <tr>
        <td>sort-triples</td>
        <td>Sorts triples. Several options can be combined, e.g. `by="object",numeric="true",order="decreasing"` will numerically sort the Object of the triples in decreasing order (given that all Objects are indeed of numeric type).</td>
        <td>by [SUBJECT, PREDICATE, OBJECT, ALL], numeric (boolean), order [INCREASING, DECREASING]</td>
        <td>Triple</td>
<td>Triple</td>
        <td><a href="https://metafacture.org/playground/?example=sort-triples">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleSort.java">org.metafacture.triples.TripleSort</a></td>
      </tr>
      <tr>
        <td>split-lines</td>
        <td>Splits a string at new lines and sends each line to the receiver.</td>
        <td></td>
        <td>String</td>
<td>String</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-strings/src/main/java/org/metafacture/strings/LineSplitter.java">org.metafacture.strings.LineSplitter</a></td>
      </tr>
      <tr>
        <td>split-xml-elements</td>
        <td>Splits elements (e.g. defining single records) residing in one XML document into multiple single XML documents.</td>
        <td>elementname (String), xmldeclaration (String), toplevelelement (String)</td>
        <td>XmlReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/XmlElementSplitter.java">org.metafacture.xml.XmlElementSplitter</a></td>
      </tr>
      <tr>
        <td>stream-count</td>
        <td>Counts the number of records and fields read.</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-statistics/src/main/java/org/metafacture/statistics/Counter.java">org.metafacture.statistics.Counter</a></td>
      </tr>
      <tr>
        <td>stream-tee</td>
        <td>Replicates an event stream to an arbitrary number of stream receivers.</td>
        <td></td>
        <td>StreamReceiver</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/StreamTee.java">org.metafacture.plumbing.StreamTee</a></td>
      </tr>
      <tr>
        <td>stream-to-triples</td>
        <td>Emits the literals which are received as triples such that the name and value become the predicate and the object of the triple. The record id containing the literal becomes the subject. If 'redirect' is true, the value of the subject is determined by using either the value of a literal named '_id', or for individual literals by prefixing their name with '{to:ID}'. Set 'recordPredicate' to encode a complete record in one triple. The value of 'recordPredicate' is used as the predicate of the triple. If 'recordPredicate' is set, no {to:ID}NAME-style redirects are possible.</td>
        <td>redirect (boolean), recordpredicate (String)</td>
        <td>StreamReceiver</td>
<td>Triple</td>
        <td><a href="https://metafacture.org/playground/?example=stream-to-triples">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/StreamToTriples.java">org.metafacture.triples.StreamToTriples</a></td>
      </tr>
      <tr>
        <td>stream-to-xml</td>
        <td>Encodes a stream as XML. Defaults: `rootTag="records"`, `recordTag="record"`, no attributeMarker.</td>
        <td>recordtag (String), namespacefile (String), xmlheaderversion (String), writexmlheader (boolean), xmlheaderencoding (String), separateroots (boolean), roottag (String), valuetag (String), attributemarker (String), writeroottag (boolean), namespaces (String)</td>
        <td>StreamReceiver</td>
<td>String</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/SimpleXmlEncoder.java">org.metafacture.xml.SimpleXmlEncoder</a></td>
      </tr>
      <tr>
        <td>string-list-map-to-stream</td>
        <td></td>
        <td></td>
        <td>ListMap</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-javaintegration/src/main/java/org/metafacture/javaintegration/StringListMapToStream.java">org.metafacture.javaintegration.StringListMapToStream</a></td>
      </tr>
      <tr>
        <td>template</td>
        <td>Builds a String from a template and an Object. Provide template in brackets. `${o}` marks the place where the object is to be inserted. If the object is an instance of Triple `${s}`, `${p}` and `${o}` are used instead.</td>
        <td></td>
        <td>Object</td>
<td>String</td>
        <td><a href="https://metafacture.org/playground/?example=template">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-formatting/src/main/java/org/metafacture/formatting/ObjectTemplate.java">org.metafacture.formatting.ObjectTemplate</a></td>
      </tr>
      <tr>
        <td>thread-object-tee</td>
        <td>Incoming objects are distributed to the added receivers, running in their own threads.</td>
        <td></td>
        <td>Object</td>
<td>Object</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/ObjectThreader.java">org.metafacture.flowcontrol.ObjectThreader</a></td>
      </tr>
      <tr>
        <td>to-jdom-document</td>
        <td>Converts a stream into a JDom document.</td>
        <td></td>
        <td>StreamReceiver</td>
<td>Document</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-jdom/src/main/java/org/metafacture/jdom/StreamToJDomDocument.java">org.metafacture.jdom.StreamToJDomDocument</a></td>
      </tr>
      <tr>
        <td>triples-to-stream</td>
        <td>Converts a triple into a record stream</td>
        <td></td>
        <td>Triple</td>
<td>StreamReceiver</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TriplesToStream.java">org.metafacture.triples.TriplesToStream</a></td>
      </tr>
      <tr>
        <td>validate-json</td>
        <td>Validate JSON against a given schema, send only valid input to the receiver. Pass the schema location to validate against. Write valid and/or invalid output to locations specified with `writeValid` and `writeInvalid`. Set the JSON key for the record ID value with `idKey` (for logging output, defaults to `id`).</td>
        <td>idkey (String), writeinvalid (String), writevalid (String)</td>
        <td>String</td>
<td>String</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/4bfe2d09df6423a55c20f6ff057b8e24c18ad9f0/metafacture-json/src/main/java/org/metafacture/json/JsonValidator.java">org.metafacture.json.JsonValidator</a></td>
      </tr>
      <tr>
        <td>wait-for-inputs</td>
        <td>Blocks close-stream events until a given number of close-stream events have been received.</td>
        <td></td>
        <td>Object</td>
<td>Object</td>
        <td><a href="https://metafacture.org/playground/?example=wait-for-inputs">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/CloseSuppressor.java">org.metafacture.flowcontrol.CloseSuppressor</a></td>
      </tr>
      <tr>
        <td>write</td>
        <td>Writes objects to stdout or a file
Arguments: [stdout, PATH]</td>
        <td>appendiffileexists (boolean), footer (String), header (String), encoding (String), compression [NONE, AUTO, BZIP2, GZIP, PACK200, XZ], separator (String)</td>
        <td>Object</td>
<td>Void</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/ObjectWriter.java">org.metafacture.io.ObjectWriter</a></td>
      </tr>
      <tr>
        <td>write-files</td>
        <td>Writes objects to one (or more) file(s)</td>
        <td>appendiffileexists (boolean), footer (String), header (String), encoding (String), compression [NONE, AUTO, BZIP2, GZIP, PACK200, XZ], separator (String)</td>
        <td>Object</td>
<td>Void</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-io/src/main/java/org/metafacture/io/ObjectFileWriter.java">org.metafacture.io.ObjectFileWriter</a></td>
      </tr>
      <tr>
        <td>write-triple-objects</td>
        <td>Writes the object value of the triple into a file. The filename is constructed from subject and predicate. Please note: This module does not check if the filename constructed from subject and predicate stays within `baseDir`. THIS MODULE SHOULD NOT BE USED IN ENVIRONMENTS IN WHICH THE VALUES OF SUBJECT AND PREDICATE A PROVIDED BY AN UNTRUSTED SOURCE!</td>
        <td>encoding (String)</td>
        <td>Triple</td>
<td>Void</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleObjectWriter.java">org.metafacture.triples.TripleObjectWriter</a></td>
      </tr>
      <tr>
        <td>write-triples</td>
        <td>Writes triples into a file.</td>
        <td></td>
        <td>Triple</td>
<td>Void</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-triples/src/main/java/org/metafacture/triples/TripleWriter.java">org.metafacture.triples.TripleWriter</a></td>
      </tr>
      <tr>
        <td>write-xml-files</td>
        <td>Writes the XML into the filesystem. The filename is constructed from the XPATH given as 'property'. Variables are:`target` (determining the output directory), `property` (the element in the XML entity. Constitutes the main part of the file's name.), `startIndex` ( a subfolder will be extracted out of the filename. This marks the index' beginning ), `stopIndex` ( a subfolder will be extracted out of the filename. This marks the index' end )</td>
        <td>endindex (int), startindex (int), property (String), filesuffix (String), encoding (String), compression (String), target (String)</td>
        <td>StreamReceiver</td>
<td>Void</td>
        <td></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-xml/src/main/java/org/metafacture/xml/XmlFilenameWriter.java">org.metafacture.xml.XmlFilenameWriter</a></td>
      </tr>
      <tr>
        <td>xml-tee</td>
        <td>Sends an object to more than one receiver.</td>
        <td></td>
        <td>XmlReceiver</td>
<td>XmlReceiver</td>
        <td><a href="https://metafacture.org/playground/?example=write">example in Playground</a></td>
        <td><a href="https://github.com/metafacture/metafacture-core/blob/master/metafacture-plumbing/src/main/java/org/metafacture/plumbing/XmlTee.java">org.metafacture.plumbing.XmlTee</a></td>
      </tr>
    </tbody>


 </table>
</div>

