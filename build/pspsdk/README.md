# PSP Software Development Kit ![CI][ci-badge]
Version 1.0+beta2 - https://github.com/pspdev/pspsdk


## Introduction

The PSP Software Development Kit (PSPSDK) is a collection of Open Source tools
and libraries written for Sony's Playstation Portable (PSP) gaming console.
It also includes documentation and other resources developers can use to write
software for the PSP.

PSPSDK is distributed under a BSD-compatible license, with the exception of the
files located in tools/PrxEncrypter. The files located in the tools/PrxEncrypter
directory are subject to the terms of the GNU General Public License version 3.
See the LICENSE files for more information.


## Features

### PSPSDK provides a full set of libraries for creating PSP software:

* Stub libraries and headers for interfacing with the PSP operating system,
  ranging from threading libraries, file io, display driver and wifi networking.
* Basic runtime support (crt0) for executables and libraries.
* A minimal port of the Standard C Library (libc) is included. PSPSDK's
  mini-libc provides portable memory allocation, string formatting, and several
  other Standard C Library functions.
* Support code for linking with the full Standard C Library provided with the
  PSPDEV toolchain.
* An implementation of the libGU graphics library. libGU provides an interface
  to the 2D and 3D hardware acceleration features found in the PSP's Graphic
  Engine.
* An implementation of the libGUM library. libGUM provides an interface for
  manipulating matrices for use in 3D software.
* A simple audio library which can be used to play back PCM audio streams.
* Support for building static executables and PRX files (relocatable modules).

### PSPSDK also includes several tools to assist in building PSP software:

* bin2c, bin2o, and bin2s for converting binary files into C source, object
  files, and assembler source files, respectively.
* mksfo for creating PARAM.SFO files.
* pack-pbp and unpack-pbp for adding files to and removing files from EBOOT.PBP.
* psp-config for locating PSPDEV tools and libraries.
* psp-prxgen for converting specially made ELFs to PRX files.
* psp-build-exports for creating export tables
* psp-fixup-imports for fixing up import tables post-linking to remove unused
  functions from the executable.

Documentation for the libraries are also provided, and can be found in the
doc/ directory of the PSPSDK source and binary distributions.

A library for Make (build.mak) is also included to provide an easy way to build
simple programs and libraries. See any PSPSDK sample program for details on how
build.mak is used.


## Installation

PSPSDK is distributed in both source and binary packages. If you only want to
use the PSPSDK tools and libraries to develop your software you'll want to grab
the binary distribution of PSPSDK specific to your development platform. If you
need fine-grained control over how PSPSDK is installed on your system, or if you
would like to modify PSPSDK then grab the source distribution. You can also
install PSPSDK from Git, see "Installation from Git" below for details.

### Requirements

To use PSPSDK you must have the following software installed:

* The PSPDEV Toolchain. PSPSDK requires the GNU toolchain (GCC and binutils)
  targetted to the PSP. You can find binary packages of these tools at
  https://github.com/pspdev/. You can find a script to build and install the
  toolchain at https://github.com/pspdev/psptoolchain.

In addition to the above requirements, if you plan on building PSPSDK from
source, you will need:

* Make. Note: GNU Make may not be required, but if you run into problems
  building from source you may want to install it. You can find GNU Make
  at http://www.gnu.org/software/make/.

If you plan on building PSPSDK directly from the Git repository you will need:

* A Git client. A popular client for Windows is TortoiseGit 
  (https://tortoisegit.org/).
* GNU autotools. You will need a recent version of autoconf
  (http://www.gnu.org/software/autoconf/) and automake
  (http://sourceware.org/automake/).

The following packages are not required to build PSPSDK, but are used to build
documentation and other optional resources:

* Doxygen. You can find Doxygen at http://doxygen.nl/.
  If you want to view the pretty source dependency graphs, then you will also
  need to install Graphviz (http://www.graphviz.org/).

### Installation from binary

Download the PSPSDK binary package specific to your development system.
For example, if you are using Windows, you will want to download the file
pspsdk-1.0-win32.zip.

Extract or unzip the package into the folder where the PSPDEV toolchain is
installed.  For example, on a Windows system you may have installed the PSPDEV
toolchain to C:\pspdev. You would then unzip PSPSDK into C:\pspdev.

Update your PATH environment variable to point to the PSPSDK tools directory.
In the above example, if you installed PSPSDK to C:\pspdev, you would add
C:\pspdev\bin to your PATH.

### Installation from source

PSPSDK uses the GNU autotools (autoconf and automake) for its build system. To
install PSPSDK from a source distribution, run the following commands after
unpacking it:

    ./configure
    make
    make doxygen-doc
    make install

If you haven't installed Doxygen or don't want to build the library
documentation, you can skip the third step.

### Installation from Git

PSPSDK can be found in the Git repository located at
https://github.com/pspdev/pspsdk. If you are using the command line version of
the git client, you can the following command to download PSPSDK:

    git clone https://github.com/pspdev/pspsdk.git

Once you've downloaded PSPSDK, run the following from the pspsdk directory to
create the configure script and support files (you must have autoconf and
automake installed):

    ./bootstrap

You can now run the commands listed in the "Installation from source" section.


## Notes

* This is a BETA release of PSPSDK. Some of the features and tools described
  here may not be fully implemented.

* By default PSPSDK will install into the directory where the PSPDEV toolchain
  is installed. If you decide to install PSPSDK somewhere else then you must
  define a PSPSDK environment variable that points to your alternate directory.
  The psp-config build utility will look for PSPSDK in the location specified in
  the PSPSDK environment variable first, or use its own location to determine
  where PSPSDK is installed.

* The Makefile templates provided by the sample code are designed for building a
  single executable or a library, but not both. If you plan on using these
  templates in your project to build both libraries and executables be aware
  that you will have to structure your project so that each library and
  executable are built in a seperate directory.


## Bugs

If you find a bug in PSPSDK, open an issue at GitHub. If possible, include any
code or documentation that can be used by the PSPSDK developers to recreate the
bug.


## Resources

### Official Source Documentation

This is generated automatically from the repository `master` branch:
https://pspdev.github.io/pspsdk/


### Internet Relay Chat (IRC)

The PSPSDK developers can sometimes be found hanging out in the #pspdev channel
on irc.freenode.net.
Nowadays also discord is used for communication: https://discord.gg/bePrj9W


## Thanks

The pspsdk developers wish to thank all the people who have contributed bug
fixes, ideas and support for the project. Also big thanks to nem for kicking off
PSP development with all his work, the original imports system is based on his
work in the hello world demo.


[ci-badge]: https://github.com/pspdev/pspsdk/workflows/CI/badge.svg
