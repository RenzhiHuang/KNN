% This function returns the classification error for KNN
function error = KNNerror(label,label_predicted)
error_predictions = find(label ~= label_predicted');
error = size(error_predictions,1)/size(label,1);
end