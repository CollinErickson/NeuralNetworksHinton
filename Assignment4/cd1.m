function ret = cd1(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
    %error('not yet implemented');
    visible_data = sample_bernoulli(visible_data);
    
    %Take a training sample v, compute the probabilities of the hidden units and sample a hidden activation vector h from this probability distribution.
    hidden_probs = visible_state_to_hidden_probabilities(rbm_w, visible_data);
    hidden_sample = sample_bernoulli(hidden_probs);
    %Compute the outer product of v and h and call this the positive gradient.
    %%positive_gradient = hidden_sample * visible_data';
    positive_gradient = configuration_goodness_gradient(hidden_sample, visible_data);
    %%%positive_gradient = configuration_goodness_gradient(hidden_probs, visible_data);
    %From h, sample a reconstruction v' of the visible units, then resample the hidden activations h' from this. (Gibbs sampling step)
    recon_visible_probs = hidden_state_to_visible_probabilities(rbm_w, hidden_sample);
    recon_visible_sample = sample_bernoulli(recon_visible_probs);
    recon_hidden_probs = visible_state_to_hidden_probabilities(rbm_w, recon_visible_sample);
    recon_hidden_sample = sample_bernoulli(recon_hidden_probs);
    
    %Compute the outer product of v' and h' and call this the negative gradient.
    %%negative_gradient = recon_hidden_sample * recon_visible_sample';
    %%%negative_gradient = configuration_goodness_gradient(recon_hidden_sample, recon_visible_sample);
    negative_gradient = configuration_goodness_gradient(recon_hidden_probs, recon_visible_sample);
    %Let the update to the weight matrix {\displaystyle W} W be the positive gradient minus the negative gradient, times some learning rate: {\displaystyle \Delta W=\epsilon (vh^{\mathsf {T}}-v'h'^{\mathsf {T}})} {\displaystyle \Delta W=\epsilon (vh^{\mathsf {T}}-v'h'^{\mathsf {T}})}.
    update_W = positive_gradient - negative_gradient;
    %Update the biases a and b analogously: {\displaystyle \Delta a=\epsilon (v-v')} {\displaystyle \Delta a=\epsilon (v-v')}, {\displaystyle \Delta b=\epsilon (h-h')} {\displaystyle \Delta b=\epsilon (h-h')}.
    ret = update_W;
end
