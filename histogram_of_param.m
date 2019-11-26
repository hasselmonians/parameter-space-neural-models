function p = histogram_of_param(varargin)

  if nargin == 1
    % h = figure;
    [n, edges] = histcounts(log10(varargin{1}));
    p = histogram(varargin{1}, 10.^edges, 'Normalization', 'probability');
    set(gca, 'XScale', 'log');
  else
    [~, edges] = histcounts(log10(varargin{2}));
    histogram(varargin{1}, varargin{2}, 10.^edges, 'Normalization', 'countdensity');
    set(varargin{1}, 'XScale', 'log');
  end

  figlib.pretty();

end
