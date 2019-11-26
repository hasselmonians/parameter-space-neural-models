% number of metabotropic receptor types vs. number of synaptic connections

% load the data
neuro_cosci_review_data;

%% Plot histograms

% intrinsic parameters
histogram_of_param(neuro.nIntrinsicParams);
xlabel('# of intrinsic parameters')

% synaptic parameters
histogram_of_param(neuro.nSynapticParams);
xlabel('# of synaptic parameters')

% compartments
histogram_of_param(neuro.nCompartments);
xlabel('# of compartments')

% neurons
histogram_of_param(neuro.nNeurons);
xlabel('# of neurons')

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
