% number of metabotropic receptor types vs. number of synaptic connections

% load the data
neuro_cosci_review_data;

%% Plot histograms
%
% % intrinsic parameters
% figure
% histogram_of_param([neuro.nIntrinsicParams]);
% hold on;
% ax = gca;
% histogram_of_param([cosci.nIntrinsicParams]);
% xlabel('# of intrinsic parameters')
% legend({'Neuro', 'CoSci'}, 'Location', 'best')
%
% % synaptic parameters
% figure
% histogram_of_param([neuro.nSynapticParams]);
% hold on;
% ax = gca;
% histogram_of_param([cosci.nSynapticParams]);
% xlabel('# of synaptic parameters')
% legend({'Neuro', 'CoSci'}, 'Location', 'best')
%
% % compartments
% figure
% histogram_of_param([neuro.nCompartments]);
% xlabel('# of compartments')
%
% % neurons
% figure
% histogram_of_param([neuro.nNeurons]);
% hold on;
% ax = gca;
% histogram_of_param([cosci.nNeurons]);
% xlabel('# of neurons')
% legend({'Neuro', 'CoSci'}, 'Location', 'best')
%
% % layers
% figure
% histogram_of_param([neuro.nLayers]);
% hold on;
% ax = gca;
% histogram_of_param([cosci.nLayers]);
% xlabel('# of layers')
% legend({'Neuro', 'CoSci'}, 'Location', 'best')
%
%% Plot # of neurons vs. # of intrinsic parameters per neuron


%% NOTE: each plot should have dots and numbers
% one number for each dot, e.g. 1-10 are Destexhe et al. 1994

% offsets from the data points (used for annotations)
dx = 1;
dy = 1;

% generate the figure
figure; hold on

% plot the data points in a scatter plot
scatter([neuro.nNeurons], [neuro.nIntrinsicParams] ./ [neuro.nNeurons], 'ko')
scatter([cosci.nNeurons], [cosci.nLayers] ./ [cosci.nNeurons], 'kx')

xlabel('# of neurons')
ylabel({'# of intrinsic parameters', 'per neuron'})
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
legend({'Neuro', 'CoSci'}, 'Location', 'NorthEastOutside')
figlib.pretty('PlotBuffer', 0.2, 'AxisBox', 'on')
xlim([0 1e6])
ylim([0 1e6])
axis square

% annotate with labels for each point
text([neuro.nNeurons] + dx, [neuro.nIntrinsicParams] ./ [neuro.nNeurons] + dy, ...
  cellstr(num2str([1:length(neuro)]')), 'FontSize', 10, 'Color', 'k');
text([cosci.nNeurons] + dx, [cosci.nIntrinsicParams] ./ [cosci.nNeurons] + dy, ...
  cellstr(num2str([1:length(cosci)]')), 'FontSize', 10, 'Color', 'k');

%% Plot # of layers vs. # of intrinsic parameters

% generate the figure
figure; hold on
% plot the data points in a scatter plot
scatter([neuro.nLayers], [neuro.nIntrinsicParams] ./ [neuro.nNeurons], 'ko')
scatter([cosci.nLayers], [cosci.nIntrinsicParams] ./ [cosci.nNeurons], 'kx')

xlabel('# of layers')
ylabel({'# of intrinsic parameters', 'per neuron'})
set(gca, 'YScale', 'log')
legend({'Neuro', 'CoSci'}, 'Location', 'NorthEastOutside')
figlib.pretty('PlotBuffer', 0.2)
xlim([-11.8889 158.1111])
ylim([1.0644 3.5480e+05])
yticks([10 100 1000 10000 100000])
axis square

% annotate with labels for each point
text([neuro.nLayers] + dx, [neuro.nIntrinsicParams] ./ [neuro.nNeurons] + dy, ...
  cellstr(num2str([1:length(neuro)]')), 'FontSize', 10, 'Color', 'k');
text([cosci.nLayers] + dx, [cosci.nIntrinsicParams] ./ [cosci.nNeurons] + dy, ...
  cellstr(num2str([1:length(cosci)]')), 'FontSize', 10, 'Color', 'k');

%% Plot # of synaptic parameters vs. # of intrinsic parameters per neuron

% generate the figure
figure; hold on;
% plot the data points in a scatter plot
scatter([neuro.nSynapticParams], [neuro.nIntrinsicParams] ./ [neuro.nNeurons], 'ko');
scatter([cosci.nSynapticParams], [cosci.nIntrinsicParams ]./ [cosci.nNeurons], 'kx');

xlabel('# of synaptic parameters')
ylabel('# of intrinsic parameters per neuron')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
legend({'Neuro', 'CoSci'}, 'Location', 'NorthEastOutside')
figlib.pretty('PlotBuffer', 0.2)
axis square

% annotate with labels for each point
text([neuro.nSynapticParams] + dx, [neuro.nIntrinsicParams] ./ [neuro.nNeurons] + dy, ...
  cellstr(num2str([1:length(neuro)]')), 'FontSize', 10, 'Color', 'k');
text([cosci.nSynapticParams] + dx, [cosci.nIntrinsicParams] ./ [cosci.nNeurons] + dy, ...
  cellstr(num2str([1:length(cosci)]')), 'FontSize', 10, 'Color', 'k');

return

%% TEST

figure; hold on;
p(1) = scatter([neuro.nSynapticParams], [neuro.nIntrinsicParams] ./ [neuro.nNeurons]);
p(2) = scatter([cosci.nSynapticParams], [cosci.nIntrinsicParams ]./ [cosci.nNeurons]);
p(1).Marker = 'none';
p(2).Marker = 'none';
figlib.pretty('PlotBuffer', 0.2)
text([neuro.nSynapticParams], [neuro.nIntrinsicParams] ./ [neuro.nNeurons], ...
  cellstr(num2str([1:length(neuro)]')), 'FontSize', 10, 'Color', 'k');
text([cosci.nSynapticParams], [cosci.nIntrinsicParams ]./ [cosci.nNeurons], ...
  cellstr(num2str([1:length(cosci)]')), 'FontSize', 10, 'Color', 'r');
xlabel('# of synaptic parameters')
ylabel('# of intrinsic parameters per neuron')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
legend({'Neuro', 'CoSci'}, 'Location', 'NorthEastOutside')
axis square

%% TEST

% generate a figure
figure; hold on;
cmap = colormaps.linspecer(cosci(end).label); % last number in the labels

% determine which neuro models are citation duplicates
isDuplicate = false(1, length(neuro));
isDuplicate(2:end) = diff([neuro.label]) == 0;

% plot the points
for ii = 1:length(neuro)
  p = scatter(neuro(ii).nSynapticParams, neuro(ii).nIntrinsicParams / neuro(ii).nNeurons, ...
    'MarkerEdgeColor', cmap(neuro(ii).label, :), 'Marker', 'o');
  % if a point has the same citation as the previous, turn handle visibility off
  if isDuplicate(ii)
    set(p, 'HandleVisibility', 'off');
  end
end

% determine which computer science models are citation duplicates
isDuplicate = false(1, length(cosci));
isDuplicate(2:end) = diff([cosci.label]) == 0;

% plot the points
for ii = 1:length(cosci)
  scatter(cosci(ii).nSynapticParams, cosci(ii).nIntrinsicParams / cosci(ii).nNeurons, ...
    'MarkerEdgeColor', cmap(cosci(ii).label, :), 'Marker', 'x');
  % if a point has the same citation as the previous, turn handle visibility off
  if isDuplicate(ii)
    set(p, 'HandleVisibility', 'off');
  end
end

xlabel('# of synaptic parameters')
ylabel('# of intrinsic parameters per neuron')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

% generate the legend
legend_names = {'Destexhe et al. 1994', ...
                'Poirazi et al. 2003', ...
                'Izhikevich 2003', ...
                'Hasselmo et al. 1995', ...
                'Destexhe et al. 1996', ...
                'Sadeh et al. 2017', ...
                'Traub et al. 2005', ...
                'Potjans and Diesmann 2005', ...
                'Nadim et al. 1998', ...
                'Lytton et al. 1997', ...
                'Hill et al. 2002', ...
                'Bartos et al. 2002', ...
                'Wang et al. 1996', ...
                'Markram et al. 2015', ...
                'Krizhevsky et al. 2017', ...
                'Simonyan et al. 2015', ...
                'He et al. 2015'};
legend(legend_names, 'Location', 'NorthEastOutside')

figlib.pretty('PlotBuffer', 0.2)


%% Plot pairwise scatter plots

% paramNames = {'# of intrinsic parameters', '# of synaptic parameters', '# of compartments', '# of neurons'};
% paramMatrix = [neuro.nIntrinsicParams; neuro.nSynapticParams; neuro.nCompartments; neuro.nNeurons];
% combns = nchoosek(1:4, 2);
%
% for ii = 1:length(combns)
%   figure;
%   scatter(paramMatrix(combns(ii, 1), :), paramMatrix(combns(ii, 2), :));
%   xlabel(paramNames(combns(ii, 1)));
%   ylabel(paramNames(combns(ii, 2)));
%   set(gca, 'YScale', 'log');
%   set(gca, 'XScale', 'log');
%   figlib.pretty('PlotBuffer', 0.1);
%   axis square
% end


%% Plot pairwise scatter plots with neuro and cosci models

return

% paramNames = {'# of synaptic parameters', '# of neurons', '# of layers'};
% paramMatrixNeuro = [neuro.nIntrinsicParams; neuro.nSynapticParams; neuro.nNeurons; neuro.nLayers];
% paramMatrixCoSci = [cosci.nIntrinsicParams; cosci.nSynapticParams; cosci.nNeurons; cosci.nLayers];
% combns = nchoosek(1:3, 2);
%
% for ii = 1:length(combns)
%   figure; hold on;
%   scatter(paramMatrixNeuro(combns(ii, 1), :), paramMatrixNeuro(combns(ii, 2), :));
%   scatter(paramMatrixCoSci(combns(ii, 1), :), paramMatrixCoSci(combns(ii, 2), :));
%   xlabel(paramNames(combns(ii, 1)));
%   ylabel(paramNames(combns(ii, 2)));
%   set(gca, 'YScale', 'log');
%   set(gca, 'XScale', 'log');
%   legend({'Neuro', 'CoSci'}, 'Location', 'best')
%   axis square
%   figlib.pretty('PlotBuffer', 0.1)
% end
