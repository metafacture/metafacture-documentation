#!/bin/bash

# Generates a dot graphviz file from flux-commands.md.
# See https://github.com/metafacture/metafacture-core/issues/498.
# It's a draft for there are some steps missing to generate the nice colored svg.
#
# Called like: $ bash makeGraph.sh > flux-commands.dot

INPUT_FN="flux-commands.md"

unset IFS

# preprocessing
echo "digraph G {
  {
    node [margin=0 fontcolor=black fontsize=32 width=0.5 shape=oval style=filled]
    String [fillcolor=yellow fixedsize=false label="String"]
    Reader [fillcolor=yellow fixedsize=false label="Reader"]
    Object [fillcolor=yellow fixedsize=false label="Object"]
    Map [fillcolor=yellow fixedsize=false label="Map"]
    Triple [fillcolor=yellow fixedsize=false label="Triple"]
    Void [fillcolor=yellow fixedsize=false label="Void"]
    ListMap [fillcolor=yellow fixedsize=false label="ListMap"]
    Document [fillcolor=yellow fixedsize=false label="Document"]
    StreamReceiver [fillcolor=yellow fixedsize=false label="StreamReceiver"]
    XmlReceiver [fillcolor=yellow fixedsize=false label="XmlReceiver"]
  }
  rankdir=LR
  concentrate=true
"

sed '/./{:a;N;s/\n\(.\)/ \1/;ta}' $INPUT_FN |grep "signature:" > $INPUT_FN.tmp

while read -r LINE; do
  label=$(echo "$LINE" | sed 's#\(.*\) ---.*#\1#g')
  nodes=$(echo "$LINE" | sed 's#.*signature:\(.* -> .*\) - .*#\1#g'|sed  's#\(.* -> .*\) - .*#\1#g')
  printf "$nodes [label=\"$label\"];\n";
done < $INPUT_FN.tmp
echo "}"

exit

dot -Tsvg flux-commands.dot > flux-commands.svg
