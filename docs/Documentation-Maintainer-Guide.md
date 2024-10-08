---
layout: default
title: Maintainer Guide
nav_order: 8
---

# Maintainer Guide

## how to change [docs/flux/flux-commands.md](https://github.com/metafacture/metafacture-documentation/blob/master/docs/flux/flux-commands.md)

The entries in [docs/flux/flux-commands.md](https://github.com/metafacture/metafacture-documentation/blob/master/docs/flux/flux-commands.md) describe the usage of commands used by flux.
flux-commands.md is fully automatically generated. To make this happen one has to
fill in the proper annotations in the correponding java classes. E.g.

```
reset-object-batch
------------------
- description:  Resets the downstream modules every batch-size objects
- options:      batchsize (int)
- signature:    Object -> Object
- java class:   org.metafacture.flowcontrol.ObjectBatchResetter
```

is generated by reading following annotations in [ObjectBatchResetter.java](https://github.com/metafacture/metafacture-core/blob/511b4af8b993c85a33d6a18322258a195684d133/metafacture-flowcontrol/src/main/java/org/metafacture/flowcontrol/ObjectBatchResetter.java):

```
@Description("Resets the downstream modules every batch-size objects")
@FluxCommand("reset-object-batch")
@In(Object.class)
@Out(Object.class)
```
The description of "options" is produced from all "public setter-methods", in this case:
```
 public void setBatchSize(final int batchSize) { ...
```
The option's name is produced by cutting away the "set" from the methods name, leaving
"BatchSize" which is then lowercased. The parameter of this option is generated from the
parameter type of the method - here an "int"eger.

## how to publish [docs/flux/flux-commands.md](https://github.com/metafacture/metafacture-documentation/blob/28-use-jekyll-theme/docs/flux/flux-commands.md)

If you have updated some of these annotations, say "description", and these changes are
merged into the master branch, generate a new flux-commands.md like explained in https://github.com/metafacture/metafacture-fix/wiki/Maintainer-Guidelines#update-flux-commands.

The [publishing process will be automated with an github action](https://github.com/metafacture/metafacture-core/issues/368).
