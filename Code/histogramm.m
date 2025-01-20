function histogramm(app)

%heartDisease = readtable('Heart Disease Data.xlsx','Sheet','Kaggle_heartDiseaseData');
heartDisease = codeLoader;
[hRows, hCol] = size(heartDisease);

%initializes variables
typicalAngina = 0;
atypicalAngina = 0;
nonAnginalPain = 0;
aysmptomatic = 0;

FtypicalAngina = 0;
FatypicalAngina = 0;
FnonAnginalPain = 0;
Faysmptomatic = 0;

% each type of angina
types = [0,1,2,3];

%% What's the frequency of each type of chest pain based on sex

% runs for female amounts
for ix = 1:hRows
        if heartDisease.sex(ix) == 0 %female
            if heartDisease.chest_pain_type(ix) == 0 %type 0
                FtypicalAngina = FtypicalAngina + 1;
            elseif heartDisease.chest_pain_type(ix) == 1 %type 1
                FatypicalAngina = FatypicalAngina + 1;
            elseif heartDisease.chest_pain_type(ix) == 2 %type 2
                FnonAnginalPain = FnonAnginalPain + 1;
            else
                Faysmptomatic = Faysmptomatic + 1; %type 3
            end
        end
end

% runs for male amounts
for ix = 1:hRows
        if heartDisease.sex(ix) == 1 %male
            if heartDisease.chest_pain_type(ix) == 0 %type 0
                typicalAngina = typicalAngina + 1;
            elseif heartDisease.chest_pain_type(ix) == 1 %type 1
                atypicalAngina = atypicalAngina + 1;
            elseif heartDisease.chest_pain_type(ix) == 2 %type 2
                nonAnginalPain = nonAnginalPain + 1;
            else %type 3
                aysmptomatic = aysmptomatic + 1;
            end
        end
end


switch app.ButtonGroup2.SelectedObject.Text
    case 'Male' 
        freq = [typicalAngina,atypicalAngina,nonAnginalPain,aysmptomatic]; %creates freq list
        bar(app.UIAxes2,types,freq) %bar graph
        xlabel(app.UIAxes2,'Types of chest pain')
        ylabel(app.UIAxes2,'Frequency')
        title(app.UIAxes2,"Frequency of each type of chest pain for men")
    case 'Female'
        freq = [FtypicalAngina,FatypicalAngina,FnonAnginalPain,Faysmptomatic];
        bar(app.UIAxes2,types,freq)
        xlabel(app.UIAxes2,'Types of chest pain')
        ylabel(app.UIAxes2,'Frequency')
        title(app.UIAxes2,"Frequency of each type of chest pain for women")
end
