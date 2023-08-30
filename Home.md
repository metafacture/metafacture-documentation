![logo](https://github.com/culturegraph/metafacture-core/wiki/img/metafacture_small.png)

# Metafacture Documentation

Metafacture is a toolkit for processing semi-structured data with a focus on library metadata. It provides a versatile set of tools for reading, writing and transforming data. Metafacture can be used as a stand-alone application via CLI or as a Java library in other applications. There is also a playground where you can test workflows.

The name Metafacture is a portmanteau of the words metadata and manufacture.

Metafacture comprises three main parts: Framework, Flux and the Transformation-Module Fix. It can be extended with modules.

__________________

## Using Metafacture via playground or CLI

> [!NOTE]
> No JAVA-Code is necessary!!!

While working with the playground or the command line you only need [Flux](#flux) and the transformation module [Fix](#fix).
Have a look here for [Getting started](/Getting-Started.md).

## Framework for JAVA-Integration/Development

If you plan to use Metafacture as a Java library or if you wish to add commands to Flux. You should get familar with the [Framework](/Home.md#framework).

__________________

## FLUX

Flux is a scripting language to easily build and run processing pipelines. No Java programming is necessary - it's used as a command line. To use Flux you may download the binary distribution of Metafacture.

For more information on how to use Flux, see the [Flux User Guide](/Flux-User-Guide.md).

See [here for all available FLUX-Commands](/flux-commands.md).

## FIX

Metafix is a domain specific language for metadata transformation based on Catmandu FIX. The FIX object performing the transformation is used as part of a processing pipeline.

If you are using **Metafacture with CLI or Playground** and therefore the Flux scripting language to build and run pipelines, use the `fix` command in your FLUX-Pipeline. 

If you are using **Metafacture as a Java library**, just create a Metafix object and add it to your pipeline (see also the [Framework User Guide](#framework)).

The transformation itself is declared in a fix-object which can be a file. For more information on how to declare transformations see [Metafix User Guide](/Fix-User-Guide.md).

> [!NOTE]
> PS: There is also the transformation modul MORPH. Have a look at[ the old documentation](https://github.com/metafacture/metafacture-core/wiki/Metamorph-User-Guide) and the german cookbook by [Swissbib](https://swissbib.gitlab.io/metamorph-doku/).

## Framework

> [!NOTE]
>Relevant for developers

The framework includes the interfaces and abstract classes which form the foundation of the data processing pipelines. This part of Metafacture is only relevant for you if you plan to use Metafacture as a Java library or if you wish to add pipe elements to Flux.

For more information see the [Framework User Guide](/Framework-User-Guide.md).

