#!/bin/bash
CRF_path="/Users/chen/CRF++/CRF++-0.58"
project_path="/Users/chen/github/CFR++"
training_data_path="${project_path}/Data/icwb2-data/training/pku_training.utf8"
formatted_data_path="${project_path}/Data/icwb2-data/training/formatted_pku.utf8"
template_path="${project_path}/template"
model_path="${project_path}/models/pku_model"
test_data_path="${project_path}/Data/icwb2-data/testing/as_test.utf8"
formatted_test_path="${project_path}/Data/icwb2-data/testing/as_test_formatted.utf8"
test_result="${project_path}/Data/icwb2-data/testing/as_test_result.utf8"
test_result_words="${project_path}/Data/icwb2-data/testing/as_test_result_words.utf8"
score_script="${project_path}/Data/icwb2-data/scripts/score"
test_gold_path="${project_path}/Data/icwb2-data/gold/as_test_gold.utf8"
test_gold_words="${project_path}/Data/icwb2-data/gold/as_training_words.utf8"

evaluates="${project_path}/evaluates/pku_as.score"

#echo "Start installing CRF++"
#cd ${CRF_path}
#./configure
#sudo make
#sudo make install

echo "Start data-formatting for training"
python ${project_path}/dataFormatting.py ${training_data_path} ${formatted_data_path}

echo "Start modelling"
crf_learn -f 3 -c 8.0 ${template_path} ${formatted_data_path} ${model_path}

echo "Start data-formatting for testing"
python ${project_path}/dataFormatting_test.py ${test_data_path} ${formatted_test_path}

echo "Start testing"
crf_test -m ${model_path} ${formatted_test_path} > ${test_result}

echo "Get the testing result"
python ${project_path}/output.py ${test_result} ${test_result_words}

echo "Start evaluating"
${project_path}/Data/icwb2-data/scripts/score ${test_gold_words} ${test_gold_path} ${test_result_words} > ${evaluates}







