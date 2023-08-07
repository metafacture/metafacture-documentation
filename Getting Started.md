# Getting started!

## Playground

The easiest way to get started with Metafacture is the Playground. Take a look at the [first example](https://metafacture.org/playground/?flux=PG_DATA%0A%7Cas-lines%0A%7Cdecode-formeta%0A%7Cfix%0A%7Cencode-xml%28rootTag%3D%22collection%22%29%0A%7Cprint%0A%3B&fix=move_field%28_id%2C+id%29%0Amove_field%28a%2C+title%29%0Apaste%28author%2C+b.v%2C+b.n%2C+%27~aus%27%2C+c%29%0Aretain%28id%2C+title%2C+author%29&data=1%7Ba%3A+Faust%2C+b+%7Bn%3A+Goethe%2C+v%3A+JW%7D%2C+c%3A+Weimar%7D%0A2%7Ba%3A+R%C3%A4uber%2C+b+%7Bn%3A+Schiller%2C+v%3A+F%7D%2C+c%3A+Weimar%7D&active-editor=fix) and run it by pressing the !["Process"](img/process.png) button. Check out the other examples (first button, !["Load Examples"](img/load-exmples.png)) for different input sources, transformations, and output formats.

For commands available in the Flux, see [the Flux commands documentation](https://github.com/metafacture/metafacture-documentation/blob/master/flux-commands.md).

For functions and usage of the Fix, see [the Fix functions and cookbook](https://github.com/metafacture/metafacture-fix#functions-and-cookbook).

For next steps get familar with FLUX and FIX. And try out some metafacture workflows.

## Command line

To use Metafacture as a command-line tool, download the latest metafix-runner from our [releases page](https://github.com/metafacture/metafacture-fix/releases). Extract the downloaded archive and change into the newly created directory (e.g. `cd metafacture-runner-0.4.0`). Run a Flux workflow with:

`$ ./bin/metafix-runner /path/to/your.flux` on Unix/Linux/Mac or
`$ ./bin/metafix-runner.bat /path/to/your.flux` on Windows.

To get started, you can export a workflow from the Playground (last button, !["Export Workflow"](img/export.png)).

To set up IDE support for editing your Flux and Fix files, see [the IDE extensions page](/ide-extensions/index.html).

For next steps get familar with FLUX and FIX. And try out some metafacture workflows.

## Using Metafacture as a Java library

If you want to use Metafacture in your own Java projects all you need is to add some dependencies to your project. As of Metafacture 5, the single metafacture-core package has been replaced with a number of domain-specific packages. You can find the list of packages on [Maven Central](https://search.maven.org/search?q=g:org.metafacture).

Alternatively, you can simply guess the package names from the top-level folders in the source code repository -- they are the same. For instance, if you want to use Metamorph in your project, simply add the following dependency to your `pom.xml`:

```xml
<dependency>
    <groupId>org.metafacture</groupId>
    <artifactId>metamorph</artifactId>
    <version>$VERSION</version>
</dependency>
```

or if Gradle is your build tool of choice use:

```groovy
dependencies {
    implementation 'org.metafacture:metamorph:$VERSION'
}
```

Occasionally, we publish snapshot builds on [Sonatype OSS Repository](https://oss.sonatype.org/index.html#nexus-search;gav~org.metafacture~~~~). The version number is derived from the branch name. Snapshot builds from the master branch always have the version `master-SNAPSHOT`. We also provide sometimes pre releases as github packages.


If you plan to use Metafacture as a Java library or if you wish to add commands to Flux. You should get familar with the [Framework](https://github.com/TobiasNx/metafacture_documentation_new/blob/main/Framework%20User%20Guid.md).
