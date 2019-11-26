% number of metabotropic receptor types vs. number of synaptic connections

% load the data
neuro_cosci_review_data;

%% Plot histograms

% intrinsic parameters
figure
histogram_of_param(neuro.nIntrinsicParams);
xlabel('# of intrinsic parameters')

% synaptic parameters
figure
histogram_of_param(neuro.nSynapticParams);
hold on;
ax = gca;
histogram_of_param(cosci.nParams);
xlabel('# of synaptic parameters')
legend({'Neuro', 'CoSci'}, 'Location', 'best')

% compartments
figure
histogram_of_param(neuro.nCompartments);
xlabel('# of compartments')

% neurons
figure
histogram_of_param(neuro.nNeurons);
hold on;
ax = gca;
histogram_of_param(cosci.nNeurons);
xlabel('# of neurons')
legend({'Neuro', 'CoSci'}, 'Location', 'best')

% layers
figure
histogram_of_param(neuro.nLayers);
hold on;
ax = gca;
histogram_of_param(cosci.nLayers);
xlabel('# of layers')
legend({'Neuro', 'CoSci'}, 'Location', 'best')

return

%% Plot pairwise scatter plots

paramNames = {'# of intrinsic parameters', '# of synaptic parameters', '# of compartments', '# of neurons'};
paramMatrix = [neuro.nIntrinsicParams; neuro.nSynapticParams; neuro.nCompartments; neuro.nNeurons];
combns = nchoosek(1:4, 2);

for ii = 1:length(combns)
  figure;
  scatter(paramMatrix(combns(ii, 1), :), paramMatrix(combns(ii, 2), :));
  xlabel(paramNames(combns(ii, 1)));
  ylabel(paramNames(combns(ii, 2)));
  set(gca, 'YScale', 'log');
  set(gca, 'XScale', 'log');
  axis square
end


%% Plot pairwise scatter plots with neuro and cosci models

paramNames = {'# of synaptic parameters', '# of neurons', '# of layers'};
paramMatrixNeuro = [neuro.nSynapticParams; neuro.nNeurons; neuro.nLayers];
paramMatrixCoSci = [cosci.nSynapticParams; cosci.nNeurons; cosci.nLayers];
combns = nchoosek(1:3, 2);

for ii = 1:length(combns)
  figure;
  scatter(paramMatrixNeuro(combns(ii, 1), :), paramMatrixNeuro(combns(ii, 2), :));
  scatter(paramMatrixCoSci(combns(ii, 1), :), paramMatrixCoSci(combns(ii, 2), :));
  xlabel(paramNames(combns(ii, 1)));
  ylabel(paramNames(combns(ii, 2)));
  set(gca, 'YScale', 'log');
  set(gca, 'XScale', 'log');
  axis square
end
