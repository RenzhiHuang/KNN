d=57;
%get the train data and train label
train_data = train(:,1:d);
train_label = train(:,d+1);
test_data = test(:,1:d);
test_label = test(:,d+1);
k=[1,5,9,49,99];

for i = 1:5
    %% Training error and test error
    %test_label_predicted = OneNN(train_data,train_label,test_data);
    train_label_predicted = KNN(train_data,train_label,train_data,k(i));
    test_label_predicted = KNN(train_data,train_label,test_data,k(i));
    test_error(i) = KNNerror(test_label,test_label_predicted);
    train_error(i) = KNNerror(train_label,train_label_predicted);
    %% Cross Validation
    sum_test_error = 0;
    for fold = 1:5
        cvtrain_data = cv_sub_train{fold}(:,1:d);
        cvtrain_label = cv_sub_train{fold}(:,d+1);
        cvtest_data = cv_sub_test{fold}(:,1:d);
        cvtest_label = cv_sub_test{fold}(:,d+1);
        cv_label_predicted = KNN(cvtrain_data,cvtrain_label,cvtest_data,k(i));
        sum_test_error = sum_test_error+...
            KNNerror(cvtest_label,cv_label_predicted);
    end
    cv_error(i)=sum_test_error/5;
end
