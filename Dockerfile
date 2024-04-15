FROM movesrwth/stormpy:1.8.0

# NB: this is required for some more recent storm-image tags
# FROM movesrwth/storm:1.8.0
# RUN apt-get update
# RUN apt-get install -y python3-pip
# RUN mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old
# RUN git clone https://github.com/moves-rwth/pycarl.git --branch 2.0.0
# RUN cd pycarl && pip install .
# NB: branch tag here must match storm image tag
# https://moves-rwth.github.io/stormpy/installation.html#compatibility-of-stormpy-and-storm

RUN cd / && git clone https://github.com/moves-rwth/stormpy.git --branch 1.8.0
RUN pip install ipython
RUN pip install pytest
RUN pip install jupyterlab
RUN apt-get update
RUN apt-get install -y graphviz
RUN pip install graphviz

RUN cd / && git clone https://github.com/ahartmanns/jani-models.git
# https://github.com/jpmorganchase/jupyter-fs
RUN pip install jupyter-fs

RUN cd / && git clone https://github.com/prismmodelchecker/prism-benchmarks.git
RUN pip install jupyter_app_launcher
RUN pip install matplotlib

RUN cd / && git clone https://github.com/moves-rwth/stormpyter.git
