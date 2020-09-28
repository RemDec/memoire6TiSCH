# memoire6TiSCH

Master thesis written in 2019-2020 at University of Mons about the 6TiSCH stack deployed in Wireless Sensors Networks, with a focus on the joining phase and its security.
The work is splitted in two parts :

* A state of the art of what is 6TiSCH as defined by the standards (RFC) and the concerned literature. A full review is done layer by layer, before going in the joining phase details. It is intended to be readable without any knowledge in WSNs and their specific network stacks.  

* An implementation of a new strategy for the joining phase, called NPEB method. The method is implemented modifying the official 6TiSCH simulator to highlight high performance improvements (mainly concerning joining time and energy consumption), as empirically analyzed in this work. The adapted simulator running NPEB and computing related KPIs is available [here](https://github.com/RemDec/6tisch-simulator-NPEB).

