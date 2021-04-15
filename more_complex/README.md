# A more Complex Example

This example is designed to show you how to lay out a directory that can be
used in Packer builds. Organizing related builds within directories makes it
easier to reuse code and use variables. Here we split our build into several
files:

1. `init.pkr.hcl` describes all of our required plugins, required Packer
   version, etc.
1. `variables.pkr.hcl` declares all of the variables we will use.
1. `dev.pkrvars.hcl` declares a set of possible values for the variables declared in "variables.pkr.hcl"
1. `prod.pkrvars.hcl` declares another set of possible values for the variables declared in "variables.pkr.hcl"
1. `sources.pkr.hcl` defines our sources
1. `build.pkr.hcl` defines a build

To run Packer using these templates:

change into this directory

```sh
cd learn-packer-getting-started/more_complex
packer init .
packer build .
```

When you call `packer build .` from inside a directory, Packer loads all the
sources, builds, and declared variables and runs all the defined builds in that
directory.

You can change the variables to not use their default values by pointing the
builder at a specific variables file, using the `-var-file` argument.

```
packer build -var-file=dev.pkrvars.hcl .
```

This is useful if you have different values you want to use in different
environments (for example, development vs. production environments).

```
packer build -var-file=prod.pkrvars.hcl .
```
