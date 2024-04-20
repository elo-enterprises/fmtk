<table>
  <tr>
    <td colspan=2><strong>
    fmtk:
      </strong>&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
  <tr>
    <td width=15%><img src=img/icon.png style="width:150px"></td>
    <td>
      Formal Methods Toolkit:
      <br/><br/>
      A growing collection of containers and notebooks for working with specification languages & model checkers
      <br/><br/>
      <a href="https://github.com/elo-enterprises/fmtk/actions/workflows/docker-build.yml"><img src="https://github.com/elo-enterprises/fmtk/actions/workflows/docker-build.yml/badge.svg"></a>
    </td>
  </tr>
</table>

---------------------------------------------------------------------------------

<div class="toc">
<ul>
<li><a href="#overview">Overview</a></li>
<li><a href="#quick-start">Quick Start</a><ul>
<li><a href="#buildtest">Build/Test</a></li>
<li><a href="#running-storm">Running Storm</a></li>
<li><a href="#stormpy-shell">StormPy Shell</a></li>
<li><a href="#storm-in-notebooks">Storm in Notebooks</a></li>
<li><a href="#see-also">See also</a></li>
</ul>
</li>
</ul>
</div>


---------------------------------------------------------------------------------


# Overview

Formal Methods Toolkit: A growing collection of containers and notebooks for working with specification languages & model checkers

Under construction.  Uses [Storm Model Checker](https://www.stormchecker.org/about.html) official images for a base, plus adding [momba](http://momba.dev) and [CoSApp](https://cosapp.readthedocs.io/en/latest/), etc.  See the [Dockerfile](Dockerfile) and [docker-compose.yml](docker-compose.yml) for more details.

-----------------------------------

# Quick Start

## Build/Test

Build the container and run the smoke tests.

```bash
$ make clean build test
```

You can interact with the container in several ways, for example:


```bash
# Drop into an interactive shell for this container (bash)
$ make shell

# or, equivalently
$ docker compose run shell

# to send a specific command to the container,
# args are still passed to bash so use something like:
$ docker compose run shell -x -c 'storm --version || true'
```

## Running Storm

The [docker-compose.yml](docker-compose.yml) will mount the working-directory for you automatically to give access to any model files.

You can interact with the `storm` CLI directly like this:

```bash
$ docker compose run storm --version
Storm 1.8.0
Date: Sun Apr 14 01:12:54 2024
Command line arguments: --version
Current working directory: /workspace
Compiled on Linux 5.15.49-linuxkit using gcc 12.2.0 with flags ' -O3 -DNDEBUG -fprefetch-loop-arrays -flto -flto-partition=none -fomit-frame-pointer'
Linked with GNU Linear Programming Kit v5.0.
Linked with Microsoft Z3 Optimizer v4.8 Build 12 Rev 0.
Linked with CArL.
```

## StormPy Shell

You can also drop into an IPython shell inside the container, and then  interact directly with `stormpy`.  See also the [stormpy tutorial here](https://moves-rwth.github.io/stormpy/getting_started.html).

```pycon
$ docker compose run stormpy
+ ipython -i -c 'import stormpy; print(stormpy.__version__)'
Python 3.11.2 (main, May 30 2023, 17:45:26) [GCC 12.2.0]
Type 'copyright', 'credits' or 'license' for more information
IPython 8.23.0 -- An enhanced Interactive Python. Type '?' for help.
1.8.0

In [1]: import stormpy.examples.files
In [2]: from stormpy.examples import files
In [3]: dir(files)
Out[3]:
['dft_galileo_hecs',
 'dft_json_and',
 'drn_ctmc_dft',
 'drn_pdtmc_die',
 'drn_pomdp_maze',
 'gspn_pnml_simple',
 'gspn_pnpro_simple',
 'jani_dtmc_die',
 'prism_dtmc_brp',
 'prism_dtmc_die',
 'prism_ma_simple',
 'prism_mdp_coin_2_2',
 'prism_mdp_firewire',
 'prism_mdp_maze',
 'prism_mdp_slipgrid',
 'prism_par_pomdp_maze',
 'prism_pdtmc_brp',
 'prism_pdtmc_die',
 'prism_pmdp_coin_two_dice',
 'prism_pomdp_maze',]
```

## Storm in Notebooks

This uses [jupyter](https://jupyter.org/) to work with storm & stormpy in a notebook.

```bash

# starts jupyter lab for this container
$ make serve

# or, equivalently
$ docker compose up lab

# or, with daemonization
$ make serve/bg

# this will open a browser for the lab notebooks:
$ make open

# stop the container
$ make stop
```

You can also run notebooks, inside the main container, but outside of jupyterlab's web interface:

```bash
$ notebook=./notebooks/jani-model.ipynb make run
```
-----------------------------------

## See also

* [Principles of Model Checking](https://books.google.com/books?id=5dvxCwAAQBAJ&)
* [JANI model spec](https://jani-spec.org/)
* [pycarl](https://github.com/moves-rwth/pycarl/tree/2.2.0) (part of storm)
* [storm/stormpy compatibility info](https://moves-rwth.github.io/stormpy/installation.html#compatibility-of-stormpy-and-storm)
* [stormpy @ dockerhub](https://hub.docker.com/r/movesrwth/stormpy/tags)
* [storm and prism/jani](https://www.stormchecker.org/documentation/usage/running-storm.html#running-storm-on-prism-jani-or-explicit-input)
* [prism's benchmark suite](https://github.com/prismmodelchecker/prism-benchmarks/tree/master/models/smgs/dice)
* <https://www.kahoque.com/papers/SysCon2016_Fault_CR.pdf>
* [modest model checker](https://www.modestchecker.net/)
* [example JANIs from the specs author](https://github.com/ahartmanns/jani-models/)
