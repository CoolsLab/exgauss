% Script for running a simple ex-Gaussian analysis
% =========================================================================
% 
% Dependencies:
% - MATLAB's Statistics and Optimization Toolboxes
% - John D'Errico's fminsearchbnd file: http://bit.ly/Ky3xll
%
% Explanation of variables:
% y             - Nx1 vector of observed response times
% X             - 1x3 best-fitting parameter values (mu,sigma,tau)
% fVal          - negative log-likelihood (-fVal is log-likelihood)
% exitFlag      - logical scalar, indicates exit condition of the 
%                 optimization algorithm; if true, the algorithm reached
%                 the pre-specified criteria
% solverOutput  - structure with the information about the optimization:
%                 * number of iterations,
%                 * number of function evaluations
%                 * algorithm

% Fit the ex-Gaussian model to the RT data through log-likelihood
% maximization using a constrained Simplex algorithm
[X,fVal,exitFlag,solverOutput] = exgauss_fit(y);

% Plot a histogram of the observations with on top the normalized
% ex-Gaussian distribution
figure;hold on
exgauss_plot(y,X);