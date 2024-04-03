---
layout: default
title: Fix
nav_order: 6
has_children: true
---

Metafix is a domain specific language for metadata transformation based on Catmandu FIX. The FIX object performing the transformation is used as part of a processing pipeline.

If you are using **Metafacture with CLI or Playground** and therefore the Flux scripting language to build and run pipelines, use the `fix` command in your FLUX-Pipeline. 

If you are using **Metafacture as a Java library**, just create a Metafix object and add it to your pipeline (see also the [Framework User Guide](#framework)).

The transformation itself is declared in a fix-object which can be a file. For more information on how to declare transformations see [Metafix User Guide](/Fix-User-Guide.md).

See [here a list for all available FIX functions and a cookbook for using fix](//docs/fix/Fix-functions-and-Cookbook.html).

{: .note }
> PS: There is also the transformation modul MORPH. Have a look at[ the old documentation](https://github.com/metafacture/metafacture-core/wiki/Metamorph-User-Guide) and the german cookbook by [Swissbib](https://swissbib.gitlab.io/metamorph-doku/).