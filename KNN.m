% This function returns the predicted label based on KNN algorithm
function testlabel = KNN(traindata,trainlabel,testdata,k)
m_train = size(traindata,1);
m_test = size(testdata,1);
for i=1:m_test
    for j = 1:m_train
        distance(j) = (sum((traindata(j,:)-testdata(i,:)).^2))^0.5;
    end
    [a,index] = sort(distance);
    k_nearest = index(1:k);
    k_nearest_label = trainlabel(k_nearest);
    if histc(k_nearest_label,1)>=histc(k_nearest_label,-1)
        testlabel(i) = 1;
    else
        testlabel(i) = -1;
    end
end
end