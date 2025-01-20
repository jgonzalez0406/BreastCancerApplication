function piChart(app)

%heartDisease = readtable('Heart Disease Data.xlsx','Sheet','Kaggle_heartDiseaseData');
heartDisease = codeLoader;
[hRows, hCol] = size(heartDisease);

%initializes variables
exeTypicalAngina = 0;
nonExeTypicalAngina = 0;

exeAtypicalAngina = 0;
nonExeAtypicalAngina = 0;

%% based on the type of angina, was it exercise induced?
% runs through each row
for ix = 1:hRows
    if heartDisease.chest_pain_type(ix) == 0 % checks if the chest pain is typical angina
        if heartDisease.exang(ix) == 0 % nonexercise induced
            nonExeTypicalAngina = nonExeTypicalAngina + 1;
        else
            exeTypicalAngina = exeTypicalAngina + 1; %exercise induced
        end
    else % checks if its atypical 
        if heartDisease.exang(ix) == 0 % nonexercise induced
            nonExeAtypicalAngina = nonExeAtypicalAngina + 1;
        else
            exeAtypicalAngina = exeAtypicalAngina + 1; % exercise induced
        end
    end
end

type = {'Exercised Induced', 'Non-Exercise Induced'};



switch app.ButtonGroup.SelectedObject.Text
    case 'Typical'
        TypCounts = [exeTypicalAngina,nonExeTypicalAngina]; % creates array of only typical anginas
        pie(app.UIAxes,TypCounts,type) % pie chart!!!

        title(app.UIAxes,'Exercise Induced Vs Non-Excercise Induced Typical Anginas')

        totalTyp = exeTypicalAngina+nonExeTypicalAngina;     
            
        app.ExerciseInducedNumber.Value = round((exeTypicalAngina/totalTyp)*100); %calculates percentage!!!
        app.NonExerciseInducedNumber.Value = round((nonExeTypicalAngina/totalTyp)*100);
    % same as above except for atypical anginas
    case 'Atypical'
        NonTypCounts = [exeAtypicalAngina,nonExeAtypicalAngina];
         pie(app.UIAxes,NonTypCounts,type)
         
        title(app.UIAxes,'Exercise Induced Vs Non-Excercise Induced Atypical Anginas')

        totalAtyp = exeAtypicalAngina+nonExeAtypicalAngina;     
            
        app.ExerciseInducedNumber.Value = round((exeAtypicalAngina/totalAtyp)*100);
        app.NonExerciseInducedNumber.Value = round((nonExeAtypicalAngina/totalAtyp)*100);
end

