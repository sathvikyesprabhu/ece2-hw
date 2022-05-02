N = 1000
num_trials = 5;
trials = zeros(num_trials,4);

for i=1:num_trials
B = randn(N,N);
A = B + B'; 
[gammak, qk, k] = power_method(A);

trials(i,1)=k; % No. of iterations
trials(i,2)=gammak; % Predicted max eigen value
trials(i,3)=max(abs(eig(A))); % Actual max abs eigen value
eig_sort = sort(abs(eig(A)),'descend'); % Compare
trials(i,4) = eig_sort(1)/eig_sort(2);
end

trials
correlation = corr(trials(:,1),trials(:,end)) % MOderate to strong negative correlation