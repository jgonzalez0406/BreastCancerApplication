% Project Code
function [heartDisease] = codeLoader()
%loads in code
heartDisease = readtable('Heart Disease Data.xlsx','Sheet','Kaggle_heartDiseaseData');
