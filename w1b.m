% Set up and plot the dataset
yy = [1.1 2.3 2.9]';
X = [0.8 1.9 3.1]';
clf(); hold all;
plot(X, yy, 'x', 'MarkerSize', 20, 'LineWidth', 2);

% phi-functions to create various matrices of new features
% from an original matrix of 1D inputs.
phi_linear = @(Xin) [ones(size(Xin,1),1) Xin];
phi_quadratic = @(Xorig) [ones(size(Xorig,1),1) Xorig Xorig.^2];
fw_rbf = @(xx, cc) exp(-(xx-cc).^2 / 2);
phi_rbf = @(Xin) [fw_rbf(Xin, 1) fw_rbf(Xin, 2) fw_rbf(Xin, 3)];

fit_and_plot(phi_linear, X, yy); % Helper routine (see below)
fit_and_plot(phi_quadratic, X, yy);
fit_and_plot(phi_rbf, X, yy);
legend({'data', 'linear fit', 'quadratic fit', 'rbf fit'});

