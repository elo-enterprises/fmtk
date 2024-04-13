FROM movesrwth/stormpy
# :1.6.0
# RUN apt-get update
# RUN apt-get install -y python3-pip
#
# # NB: this is required for some more recent storm-image tags
# # RUN mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED.old
#
# RUN git clone https://github.com/moves-rwth/pycarl.git --branch 2.0.0
# RUN cd pycarl && pip install .
#
# NB: branch tag here must match storm image tag
# https://moves-rwth.github.io/stormpy/installation.html#compatibility-of-stormpy-and-storm
RUN cd / && git clone https://github.com/moves-rwth/stormpy.git --branch 1.7.0
# RUN cd stormpy && pip install .

# RUN storm --version
