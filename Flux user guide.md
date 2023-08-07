This document provides a quick introduction to Metafacture Flux, a domain specific language to build data flows for metadata processing.
The Flux makes use of Metafacture as a stand-alone application - so you build workflows without the need of writing java code.



# Installing Flux and Running Flux

# There are different ways of installing and running Metafacture FLUX
## Stand-alone application (without Java Code)

Either use a prebuild distribution by unziping the Metafacture distribution archive. With regard of using FIX we advise to use the Runner provided by the Metafacture Fix repo. See  [releases page](https://github.com/metafacture/metafacture-fix/releases)

Then execute the script `flux.sh` or `flux.bat` in the unzipped `bin/` folder.

## More elaborate ways for developers:

### Build from local distribution
Check out the repo to build a certain branch and roll your own local distribution like this:
```bash
$ cd metafacture-core; ./gradlew installDist
```

Then go to `metafacture-core/metafacture-runner/build/install/metafacture-core` and execute the `flux.*` there.

### Working with the Java source code 

If you are working with the source code directly, execute the class `org.metafacture.runner.Flux`.

## Run a Flux-File

Just provide the flux file you wish to run as first argument.

```bash
$> flux.sh FILE.flux
```

## Provide Arguments
To provide arguments add variable assignments after the first argument as follows:
```bash
$> flux.sh FILE.flux var1=value1 var2=value2
```
This sets the variable `var1` to the value 'value1' and `var2` to the value 'value2'.

# Writing Flux files
The following snippet shows a simple flux file:
```c
//declare variables
default file = FLUX_DIR + "10.marc21";

//declare flow
file
| open-file
| as-lines
| decode-marc21
| fix(FLUX_DIR + "fix-marc21.fix")
| encode-json(prettyPrinting="true")
| write("stdout")
;
```
In the first section variables are declared, in the second, we define the flow.
Linebreaks are optional. Semicolons `;` mark the end of a variable assignment or flow definition. 

[List of available FLUX commands.](https://github.com/metafacture/metafacture-documentation/blob/master/flux-commands.md)

## Variables
Variables are always Strings and can be concatenated with the `+` operator. Escape sequences follow the Java String conventions: `\n`=line break, `\t`=tab, `\\`=\, `\u0024`=unicode character, etc.

The `default` keyword tells Flux to assign the respective value _only_ if the variable has 
not yet been set on the command line. Without `default`, previous assignments will be overwritten.

Paths are always relative to the directory within which the flux command is executed. To address files relative to the location of the executed flux file, use the predefined `FLUX_DIR` variable.

## Comments
Flux supports single line C/Java-style comments: `//comment`.

## Flow Definitions

A FLUX contains multiple command-moduls that are doing specific things. E.g.:

```C
"file/path.mrc"
| open-file -> This opens the file of the provided `file/path.mrc`-path.
| as-lines - This reads the file by lines.
| decode-marc21 -> This decodes the data as binary marc21 into an internal format.
| fix(FLUX_DIR + "fix-marc21.fix")  -> This executes the provided Fix-transformation.
| encode-json(prettyPrinting="true") -> This encodes the transformed data as JSON-Format.
| write("stdout") -> This writes the Json-Data to standard output.
;
``````

The syntax for defining flows takes its cues from bash pipes. Commands are concatenated with the pipe character `|`. 

Some commands take a constructor argument. It is provided within brackets: `command("arg")`.
Furthermore, some commands have named options. These are set as follows `command(optionname="arg1",annotheroption="arg2")` or with constructor argument: `command("arg",option="arg2")`.
To learn about the available options of a command, execute Flux without arguments: It will list all available commands, including options. or have a look at: [List of available FLUX commands.](https://github.com/metafacture/metafacture-documentation/blob/master/flux-commands.md) TODO: We need to add FIX to that list!!!


To some commands, the entire environment can be given as argument. This is done with the `*` character: `fix("tranformation.fix", *)`. In this case Metafix gains access to all variable assignments made in Flux.
(See also [[Metafix-User-Guide#parameters-to-metafix-definitions]]).

Note that unlike shell pipes, the data flowing between Flux commands is _typed_. This means that only commands with matching signatures can be combined. Commands expect a certain input and provide a certain output like: `StreamReceiver, `Object`, `Reader` and others.

To lookup the signatures, execute Flux without arguments or see: [[Metafix-User-Guide#parameters-to-metafix-definitions]]). It will list all available commands, including signatures.



## Getting Help and Inspiration (TODO: Ersetzen.)
1. Have a look at the [List of available FLUX commands.](https://github.com/metafacture/metafacture-documentation/blob/master/flux-commands.md) or if the flux executed without arguments, Flux will display a short help text along with a list of all registered commands. This is the list of FLUX commands mentioned already above.
2. There are several example flux files along with sample data in the folder `examples/`: https://github.com/metafacture/metafacture-core/tree/master/metafacture-runner/src/main/dist/examples

_________________________
# For developers: 

## Adding new Commands
Add your class and a descriptive flux shortcut to `flux-commands.properties`. This file acts as a lookup table for flux commands. Use the proper file, i.e. the one residing in the same module where your newly created class resides. If you have e.g. created a class in the module `metafacture-biblio`, you add the flux-command to https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/resources/flux-commands.properties.
Recompile. That's all to add a command.

However it's good practice to also add some annotations to the java class so that IDEs (and also humans) can pickup some hints what the new command can do, what type of input is allowed and what type of output is computed. Thus you know what commands can be chained together in a pipe.
There are 4 annotations, see this [example](https://github.com/metafacture/metafacture-core/blob/master/metafacture-biblio/src/main/java/org/metafacture/biblio/AlephMabXmlHandler.java):
```
@Description("A MAB XML reader")
@In(XmlReceiver.class)
@Out(StreamReceiver.class)
@FluxCommand("handle-mabxml")morph
```
If you add a command it would be nice if you also add a flux example to the module `metafacture-runner` so that users can easily see how it's used, see e.g. https://github.com/metafacture/metafacture-core/blob/master/metafacture-runner/src/main/dist/examples/read/regexp/regexp.flux.
