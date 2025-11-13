---
layout: default
title: Getting Started
nav_order: 2
---

# Getting started!

## Playground

The easiest way to get started with Metafacture is the Playground. Take a look at the [first example](https://metafacture.org/playground/?example=encode-xml) and run it by pressing the !["Process"](https://metafacture.org/img/process.png) button. Check out the other examples (first button, !["Load Examples"](https://metafacture.org/img/load-exmples.png)) for different input sources, transformations, and output formats.

For commands available in the Flux, see [the Flux commands documentation](flux/flux-commands.html).

For functions of the Fix, see [the Fix functions](fix/Fix-functions.html).

For next steps get familar with [FLUX](flux/Flux-User-Guide.html) and [FIX](fix/Fix-User-Guide.html). And try out some Metafacture workflows.

## Command line

To use Metafacture as a command-line tool, download the latest Metafacture release from our [releases page](https://github.com/metafacture/metafacture-core/releases). Extract the downloaded archive and change into the newly created directory (e.g. `cd metafacture-runner-0.6.1`). Run a Flux workflow with:

`$ ./bin/metafix-runner /path/to/your.flux` on Unix/Linux/Mac or
`$ ./bin/metafix-runner.bat /path/to/your.flux` on Windows.

To get started, you can export a workflow from the Playground (last button, !["Export Workflow"](https://metafacture.org/img/export.png)).

To set up IDE support for editing your Flux and Fix files, see [the IDE extensions page](https://metafacture.org/ide-extensions.html).

For next steps get familar with [FLUX](flux/Flux-User-Guide.html) and [FIX](fix/Fix-User-Guide.html). And try out some Metafacture workflows.

## Using Metafacture as a Java library

If you want to use Metafacture in your own Java projects all you need is to add some dependencies to your project. As of Metafacture 5, the single metafacture-core package has been replaced with a number of domain-specific packages. You can find the list of packages on [Maven Central](https://search.maven.org/search?q=g:org.metafacture).

Alternatively, you can simply guess the package names from the top-level folders in the source code repository -- they are the same. 

For instance, if you want to use the `metafacture-io` library in your project, simply add the following dependency to your `pom.xml`:

```xml
<dependency>
    <groupId>org.metafacture</groupId>
    <artifactId>metafacture-io</artifactId>
    <version>$VERSION</version>
</dependency>
```

or if Gradle is your build tool of choice use:

```groovy
dependencies {
    implementation 'org.metafacture:metafacture-io:$VERSION'
}
```

To use Fix you would declare `metafix` instead of `metafacture-io` as in the example above. Note that `metafix` is not published to maven central but only to [github releases](https://github.com/metafacture/metafacture-fix/releases).

Occasionally, we publish snapshot builds on [Sonatype OSS Repository](https://oss.sonatype.org/index.html#nexus-search;gav~org.metafacture~~~~~kw,versionexpand). The version number is derived from the branch name. Snapshot builds from the master branch always have the version `master-SNAPSHOT`. We also provide sometimes pre releases as github packages.


If you plan to use Metafacture as a Java library or if you wish to add commands to Flux you should get familar with the [Framework](java-integration/Framework-User-Guide.html).
