# parameter-space-neural-models
Exploring the parameter spaces of neural models

## Destexhe *et al.* 1994
Reticular thalamus (RE) cells were connected with GABAergic synapses of the A or B subtypes.
Neurons were arrayed on a 2-dimensional lattice.

The model is conductance-based, with 6 intrinsic currents, synaptic input, and a calcium buffering mechanism.
This results in 9 state variables per cell, plus 1 state variable per synapse.
There are 16 parameters per cell.

The following experiments were performed:

* 2 RE cells, reciprocal GABA_A inhibition (2 cells, 2 synapses)
* 2 RE cells, reciprocal GABA_A inhibition and self-connection (2 cells, 4 synapses)
* 5 RE cells, nearest-neighbor reciprocal GABA_A inhibition (5 cells, 10 synapses)
* 5 RE cells, nearest-neighbor reciprocal GABA_A inhibition and self-connections (5 cells, 15 synapses)
* 5 RE cells, fully connected with GABA_A synapses (5 cells, 20 synapses)
* 4 RE cells, fully-connected with GABA_A synapses and self-connections (5 cells, 25 synapses)
* 100 RE cells, nearest-neighbor GABA_A synapses (100 cells, 400 synapses)
* 100 RE cells, dense proximal GABA_A synapses including autapses (100 cells, 2,500 synapses)
* 400 RE cells, dense proximal GABA_A synapses including autapses (400 cells, 10,000 synapses)
* 1,600 RE cells, dense proximal GABA_A synapses, including autapses (1,600 cells, 40,000 synapses)

All experiments were repeated with GABA_B synapses, though only a subset of experiments were shown.

## Poirazi, Brannon, & Mel 2003 (poiraziArithmeticSubthresholdSynaptic2003)

This paper investigated subthreshold synaptic summation in a model CA1 pyramidal cell.
The model is "n123" from the Duke/Southampton archive of neuronal morphology,
with an axon added.
It contains 183 compartments.
The number of synapses was varied from 2 to 28.

## Izhikevich 2003

The neurons here are a reduced Hodgkin-Huxley model with two state variables
and auxiliary after-spike resetting.
There are four parameters per cell.

Izhikevich simulates a sparse network of 10,000 cells with 1,000,000 synaptic connections.
Synapses are instantaneous, with no state variables, but each synapse has a synaptic weight parameter.

## Rumelhart *et al.* 1986

Paper on backpropagation algorithm for ANNs.

## Hasselmo, Schnell, & Barkai 1995

Linear model with 2 state variables with 9 parameters.
Since the model is a linear dynamical system,
it is solvable and does not need to be numerically integrated.

## Destexhe *et al.* 1996

Each cell is a single compartment.
Thalamocortical (TC) cells have 6 intrinsic currents.
Reticular thalamic (RE) cells have 4 intrinsic currents.
Each cell have 2 synaptic currents:
thalamocortical cells have thalamocortical GABA_A and and reticular GABA_B;
reticular thalamic cells have AMPAergic current from thalamocortical inputs,
and GABA_A from reticular inputs.

TC cells have 8 state variables each.
RE cells have 6 state variables each.
Each AMPA and GABA_A synapse contributes 1 state variable.
Each GABA_B synapse contributes 2: one for fractional receptor activation
and another for concentration of activated G protein.

TC cells have 16 parameters each.
RC cells have 12 parameters each.

In practice, many of these parameters are degenerate.
For example, the potassium reversal potential or the specific membrane capacitance
is unlikely to vary too much among your cells of the same type.
Therefore, the lower-bound estimate for the number of parameters is closer to one per current,
or 6 parameters for TC cells and 4 parameters for RE cells.

The following networks were tested:

* 1 TC cell
* 2 TC cells and 2 RE cells with 6 GABA_A synapses, 2 GABA_B synapses, and 4 AMPA synapses
* 2 TC cells and 2 RE cells with 2 GABA_B synapses and 4 AMPA synapses
* 50 TC cells and 50 RE cells with 1,100 GABA_A synapses, 550 GABA_B synapses, and 550 AMPA synapses

## Poirazi, Brannon, & Mel 2003 (poiraziPyramidalNeuronTwolayer2003)

CA1 pyramidal model (183 compartments) with 17 types of voltage-dependent ion channels.
> This is really quite cool. I need to look into this further.
