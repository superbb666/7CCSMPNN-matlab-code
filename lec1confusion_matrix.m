function lec1confusion_matrix(tp, fp, fn, tn)

fprintf('-----lec1 confusion matrix-----\n');

error_rate = (fp+fn)/(tp+tn+fp+fn);
accuracy = (tp+tn)/(tp+tn+fp+fn);
recall = tp/(tp+fn);
precision = tp/(tp+fp);
f1_score = 2*tp/(2*tp+fp+fn);
fprintf('error_rate = %f\n', error_rate)
fprintf('accuracy = %f\n', accuracy)
fprintf('recall = %f\n', recall)
fprintf('precision = %f\n', precision)
fprintf('f1_score = %f\n', f1_score)

end