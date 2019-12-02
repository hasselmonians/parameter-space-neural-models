

%% Hardcode the data from neuroscience papers
% contains a list of the paper names
% the number of intrinsic parameters
% the number of synaptic parameters
% the number of neuronal compartments
% and the number of neurons

paperName = {'destexheModelSpindleRhythmicity1994 #1', ...
            'destexheModelSpindleRhythmicity1994 #2', ...
            'destexheModelSpindleRhythmicity1994 #3', ...
            'destexheModelSpindleRhythmicity1994 #4', ...
            'destexheModelSpindleRhythmicity1994 #5', ...
            'destexheModelSpindleRhythmicity1994 #6', ...
            'destexheModelSpindleRhythmicity1994 #7', ...
            'destexheModelSpindleRhythmicity1994 #8', ...
            'destexheModelSpindleRhythmicity1994 #9', ...
            'destexheModelSpindleRhythmicity1994 #10', ...
            'poiraziArithmeticSubthresholdSynaptic2003', ...
            'izhikevichSimpleModelSpiking2003', ...
            'hasselmoDynamicsLearningRecall1995', ...
            'destexheIonicMechanismsUnderlying1996 #1', ...
            'destexheIonicMechanismsUnderlying1996 #2', ...
            'destexheIonicMechanismsUnderlying1996 #3', ...
            'destexheIonicMechanismsUnderlying1996 #4', ...
            'sadehAssessingRoleInhibition2017', ...
            'traubSinglecolumnThalamocorticalNetwork2005', ...
            'potjansCelltypeSpecificCortical2014', ...
            'nadimFrequencyRegulationSlow1998a', ...
            'lyttonDynamicInteractionsDetermine1997', ...
            'hillModelIntersegmentalCoordination2002a', ...
            'bartosFastSynapticInhibition2002', ...
            'wangGammaOscillationSynaptic1996', ...
            'markramReconstructionSimulationNeocortical2015'};

nIntrinsicParams  = [26, 26, 56, 56, 56, 56, 1006, 1006, 4006, 16006, 2756, 40000, ...
                  9, 16, 46, 46, 910, 18008, 3679051, 400000, 38, 20, 88, 1003, 503, 146835000];
nSynapticParams   = [3, 5, 11, 16, 21, 26, 401, 2501, 10001, 40001, 32, 1000000, ...
                  0, 0, 15, 9, 2203, 1280, 500000, 300000001, 7, 8, 33, 21600, 9900, 108000000];
nCompartments     = [2, 2, 5, 5, 5, 5, 100, 100, 400, 1600, 183, 10000, ...
                   2, 1, 2, 2, 100, 2000, 229940, 80000, 9, 2, 8, 200, 100, 8157500];
nNeurons          = [2, 2, 5, 5, 5, 5, 100, 100, 400, 1600, 1, 10000, ...
                  2, 1, 2, 2, 100, 2000, 3560, 80000, 3, 2, 8, 200, 100, 31375];
nLayers           = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
                   1, 1, 1, 1, 1, 1, 6, 1, 1, 1, 1, 1, 1, 6];
labels            = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 5, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

for ii = 1:length(paperName)
      neuro(ii).paperName = paperName(ii);
      neuro(ii).nIntrinsicParams = nIntrinsicParams(ii);
      neuro(ii).nSynapticParams = nSynapticParams(ii);
      neuro(ii).nCompartments = nCompartments(ii);
      neuro(ii).nNeurons = nNeurons(ii);
      neuro(ii).nLayers = nLayers(ii);
      neuro(ii).label = labels(ii);
end

%% Hardcode the data from computer science papers

paperName = {'krizhevskyImageNetClassificationDeep2017', ...
                  'simonyanVeryDeepConvolutional2015 A', ...
                  'simonyanVeryDeepConvolutional2015 B', ...
                  'simonyanVeryDeepConvolutional2015 C', ...
                  'simonyanVeryDeepConvolutional2015 D', ...
                  'simonyanVeryDeepConvolutional2015 E', ...
                  'heDeepResidualLearning2015 18', ...
                  'heDeepResidualLearning2015 34', ...
                  'heDeepResidualLearning2015 50', ...
                  'heDeepResidualLearning2015 101', ...
                  'heDeepResidualLearning2015 152'};

nSynapticParams   = [60e6, 133e6, 133e6, 134e6, 138e6, 144e6, 10e6, 20e6, 25.6e6, 44.5e6, 60.2e6];
nLayers           = [8, 11, 13, 16, 16, 19, 18, 34, 50, 101, 152];
nNeurons          = [594376, 11944, 12136, 13416, 14696, 15976, 4650, 7616, 22720, 48832, 72256];
nIntrinsicParams  = [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3];
labels            = [15, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17];


for ii = 1:length(paperName)
      cosci(ii).paperName = paperName(ii);
      cosci(ii).nSynapticParams = nSynapticParams(ii);
      cosci(ii).nIntrinsicParams = nIntrinsicParams(ii) .* nNeurons(ii);
      cosci(ii).nNeurons = nNeurons(ii);
      cosci(ii).nLayers = nLayers(ii);
      cosci(ii).label = labels(ii);
end
