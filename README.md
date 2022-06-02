# metafacture-documentation

The central place for documentation about Metafacture.

Our goal with this repo is to collaboratively create comprehensive documentation on Metafacture in the [issue tracker](https://github.com/culturegraph/metafacture-documentation/issues?q=). Feel free to open issues not only for bugs or enhancements, but also questions about Metafacture usage, or to share your experiences. We hope that over time, in that way we can create useful tutorials, how-tos, and collect good practices for using Metafacture.

Here are some links to existing documentation:

- [metafacture-core README](https://github.com/culturegraph/metafacture-core/blob/master/README.md)
- [metafacture-core Wiki](https://github.com/culturegraph/metafacture-core/wiki)
- [metafacture-core flux-commands](https://github.com/metafacture/metafacture-documentation/blob/master/flux-commands.md)
- [metafacture-core fix functions and cookbook](https://github.com/metafacture/metafacture-fix#functions-and-cookbook)
- [metafacture-examples](https://github.com/culturegraph/metafacture-examples)
- [metafacture-java-examples](https://github.com/hbz/metafacture-java-examples)
- [metafacture-flux-examples](https://github.com/hbz/metafacture-flux-examples)
- [Introduction to Metafacture (workshop slides)](http://slides.lobid.org/metafacture-2020)
- [Metamorph Book (work in progress, very early version)](http://b3e.net/metamorph-book/latest/)
- [Metamorph-Dokumentation (entstanden im Projekt linked-swissbib)](https://swissbib.gitlab.io/metamorph-doku)

## how to change flux-commands.md

The entries in flux-commands.md describe the usage of commands used by flux.
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

## how to publish flux-commands.md

If you have updated some of these annotations, say "description", and these changes are
merged into the master branch, generate a new flux-commands.md like this:

Go to metafacture-core, checkout master and build a distribution and start flux.sh:
```bash
$ ./gradlew installDist
$ cd ./metafacture-runner/build/install/metafacture-core/
$ flux.sh > flux-commands.md
```

Open the generated flux-commands.md and remove some boilerplate at the beginning of the
file manually. Save it, copy it here, commit and push.

The [publishing process will be automated with an github action](https://github.com/metafacture/metafacture-core/issues/368).
