% This function returns the predicted label based on 1NN algorithm
function testlabel = OneNN(traindata,trainlabel,testdata)
m_train = size(traindata,1);
m_test = size(testdata,1);
for i=1:m_test
    min_distance = (traindata(1,:)-testdata(i,:))*...
            (traindata(1,:)-testdata(i,:))';
    nearest = 1;
    for j = 2:m_train
        temp = (traindata(j,:)-testdata(i,:))*...
            (traindata(j,:)-testdata(i,:))';
        if temp <min_distance
            nearest = j;
            min_distance = temp;
        end
    end
    testlabel(i) = trainlabel(nearest);
end
end