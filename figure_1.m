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

% return

%% Plot # of neurons vs. # of intrinsic parameters per neuron

figure; hold on
scatter(neuro.nNeurons, neuro.nIntrinsicParams ./ neuro.nNeurons)
scatter(cosci.nNeurons, cosci.nLayers ./ cosci.nNeurons)
xlabel('# of neurons')
ylabel('# of intrinsic parameters per neuron')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
legend({'Neuro', 'CoSci'}, 'Location', 'NorthEastOutside')
figlib.pretty('PlotBuffer', 0.2, 'AxisBox', 'on')
xlim([0 1e6])
ylim([0 1e6])
axis square

% return
%% Plot # of layers vs. # of intrinsic parameters

figure; hold on
scatter(neuro.nLayers, neuro.nIntrinsicParams ./ neuro.nNeurons)
scatter(cosci.nLayers, cosci.nLayers ./ cosci.nNeurons)
xlabel('# of layers')
ylabel('# of intrinsic parameters per neuron')
% set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
legend({'Neuro', 'CoSci'}, 'Location', 'NorthEastOutside')
figlib.pretty('PlotBuffer', 0.2)
% xlim([0 1e6])
ylim([0 1e6])
axis square

return

%% Plot pairwise scatter plots

paramNames = {'# of intrinsic parameters', '# of synaptic parameters', '# of compartments', '# of neurons'};
paramMatrix = [neuro.nIntrinsicParams; neuro.nSynapticParams; neuro.nCompartments; neuro.nNeurons];
combns = nchoosek(1:4, 2);
figure; hold on
scatter(neuro.nNeurons, neuro.nIntrinsicParams ./ neuro.nNeurons)
scatter(cosci.nNeurons, cosci.nParams ./ cosci.nNeurons)
xlabel('# of neurons')
ylabel('# of parameters per neuron')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
figlib.pretty('PlotBuffer', 0.1);
axis square
for ii = 1:length(combns)
  figure;
  scatter(paramMatrix(combns(ii, 1), :), paramMatrix(combns(ii, 2), :));
  xlabel(paramNames(combns(ii, 1)));
  ylabel(paramNames(combns(ii, 2)));
  set(gca, 'YScale', 'log');
  set(gca, 'XScale', 'log');
  figlib.pretty('PlotBuffer', 0.1);
  axis square
end


%% Plot pairwise scatter plots with neuro and cosci models

paramNames = {'# of synaptic parameters', '# of neurons', '# of layers'};
paramMatrixNeuro = [neuro.nSynapticParams; neuro.nNeurons; neuro.nLayers];
paramMatrixCoSci = [cosci.nParams; cosci.nNeurons; cosci.nLayers];
combns = nchoosek(1:3, 2);

for ii = 1:length(combns)
  figure; hold on;
  scatter(paramMatrixNeuro(combns(ii, 1), :), paramMatrixNeuro(combns(ii, 2), :));
  scatter(paramMatrixCoSci(combns(ii, 1), :), paramMatrixCoSci(combns(ii, 2), :));
  xlabel(paramNames(combns(ii, 1)));
  ylabel(paramNames(combns(ii, 2)));
  set(gca, 'YScale', 'log');
  set(gca, 'XScale', 'log');
  legend({'Neuro', 'CoSci'}, 'Location', 'best')
  axis square
  figlib.pretty('PlotBuffer', 0.1)
end
