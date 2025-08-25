% record_weights.m

global Weights Weight_history epoch

epoch = epoch + 1;
Weight_history(epoch,:) = Weights;
