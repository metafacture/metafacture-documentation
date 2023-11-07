![logo](https://github.com/culturegraph/metafacture-core/wiki/img/metafacture_small.png)

# Metafacture Documentation

Metafacture is a toolkit for processing semi-structured data with a focus on library metadata. It provides a versatile set of tools for reading, writing and transforming data. Metafacture can be used as a stand-alone application via CLI or as a Java library in other applications. There is also a playground where you can test workflows.

[Have a look here for a quick intro into metafacture.](./MF-in-5-min.md)

This is the central place for the documentation about Metafacture.

Metafacture comprises three main parts: **Framework**, **Flux** and one of the **Transformation-Modules Fix and Morph**. It can be extended with modules.

> [!NOTE]
> With regard to the Transformation-Modules this documentation focusses on Fix instead of MORPH. If you want to find out more about MORPH. Have a look at [the old documentation](https://github.com/metafacture/metafacture-core/wiki/Metamorph-User-Guide) and the german cookbook by [Swissbib](https://swissbib.gitlab.io/metamorph-doku/).


Our goal with this repo is to collaboratively create comprehensive documentation on Metafacture in the [issue tracker](https://github.com/culturegraph/metafacture-documentation/issues?q=). Feel free to open issues not only for bugs or enhancements, but also questions about Metafacture usage, or to share your experiences. We hope that over time, in that way we can create useful tutorials, how-tos, and collect good practices for using Metafacture.

__________________

Deciding which parts are relevant to you depends on the way you are using Metafacture:

## Using Metafacture via playground or CLI

> [!NOTE]
> No Java-Code is necessary!!!

While working with the playground or the command line you only need [Flux](#flux) and the transformation module [Fix](#fix).
Have a look here for [Getting started](/Getting-Started.md).

## Framework for Java integration/development

If you plan to use Metafacture as a Java library or if you wish to add commands to Flux. You should get familar with the [Framework](#framework).

__________________

## FLUX

Flux is a scripting language to easily build and run processing pipelines. No Java programming is necessary - it's used as a command line. To use Flux you may download the binary distribution of Metafacture.

For more information on how to use Flux, see the [Flux User Guide](/Flux-User-Guide.md).

See [here a list for all available FLUX-Commands](/flux-commands.md).

__________________

## FIX

Metafix is a domain specific language for metadata transformation based on Catmandu FIX. The FIX object performing the transformation is used as part of a processing pipeline.

If you are using **Metafacture with CLI or Playground** and therefore the Flux scripting language to build and run pipelines, use the `fix` command in your FLUX-Pipeline. 

If you are using **Metafacture as a Java library**, just create a Metafix object and add it to your pipeline (see also the [Framework User Guide](#framework)).

The transformation itself is declared in a fix-object which can be a file. For more information on how to declare transformations see [Metafix User Guide](/Fix-User-Guide.md).

See [here a list for all available FIX functions and a cookbook for using fix](/Fix-function-and-Cookbook.md).

> [!NOTE]
> PS: There is also the transformation modul MORPH. Have a look at[ the old documentation](https://github.com/metafacture/metafacture-core/wiki/Metamorph-User-Guide) and the german cookbook by [Swissbib](https://swissbib.gitlab.io/metamorph-doku/).

__________________

## Framework

> [!NOTE]
>Relevant for developers

The framework includes the interfaces and abstract classes which form the foundation of the data processing pipelines. This part of Metafacture is only relevant for you if you plan to use Metafacture as a Java library or if you wish to add pipe elements to Flux.

For more information see the [Framework User Guide](/Framework-User-Guide.md).

