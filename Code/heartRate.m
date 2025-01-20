function heartRate(app)

%heartDisease = readtable('Heart Disease Data.xlsx','Sheet','Kaggle_heartDiseaseData');
heartDisease = codeLoader;
[hRows, hCol] = size(heartDisease);

%% What's a person's max heart rate based on their age?
% Age groups
% 40-49
% 50-59
% 60-69
% etc

%list of ages and their max heart rates
age30 = [];
maxHR30 = [];

age40 = [];
maxHR40 = [];

age50 = [];
maxHR50 = [];

age60 = [];
maxHR60 = [];

age70 = [];
maxHR70 = [];

%checks for the patients age and then keeps said age and max heart rate
%value in a list
for ix = 1:hRows
    if heartDisease.age(ix) <= 49 && heartDisease.age(ix) >= 40
        age40 = [age40,(heartDisease.age(ix))];
        maxHR40 = [maxHR40,(heartDisease.max_hr(ix))];
    elseif heartDisease.age(ix) <= 59 && heartDisease.age(ix) >= 50
        age50 = [age50,(heartDisease.age(ix))];
        maxHR50 = [maxHR50,(heartDisease.max_hr(ix))];
    elseif heartDisease.age(ix) <= 69 && heartDisease.age(ix) >= 60
        age60 = [age60,(heartDisease.age(ix))];
        maxHR60 = [maxHR60,(heartDisease.max_hr(ix))];
    elseif heartDisease.age(ix) <= 79 && heartDisease.age(ix) >= 70
        age70 = [age70,(heartDisease.age(ix))];
        maxHR70 = [maxHR70,(heartDisease.max_hr(ix))];
    else
        age30 = [age30,(heartDisease.age(ix))];
        maxHR30 = [maxHR30,(heartDisease.max_hr(ix))];
    end
end

xlabel(app.UIAxes3,'Age')
ylabel(app.UIAxes3, 'Max Heart Rate')
title(app.UIAxes3, 'Max Heart Rate Corresponding to Age')

%each case will display the corresponding scatterplot with their age as the
%x axis and heart rate as the y axis. It will also create a line of best
%fit and display the R^2 value
switch app.DropDown.Value
    case '29-39'
        r = corrcoef(age30,maxHR30);
        p = polyfit(age30,maxHR30,1); 
        rsquared = r(1,2)^2;
        f = polyval(p,age30);
        plot(app.UIAxes3,age30,maxHR30,'r.',age30,f,'MarkerSize',15)
        legend(app.UIAxes3,'Data','Line of Best Fit')
        app.EditField.Value = rsquared;

    case '40-49'
        r = corrcoef(age40,maxHR40);
        p = polyfit(age40,maxHR40,1); 
        rsquared = r(1,2)^2;
        f = polyval(p,age40);
        plot(app.UIAxes3,age40,maxHR40,'g.',age40,f,'MarkerSize',15)
        legend(app.UIAxes3,'Data','Line of Best Fit')
        app.EditField.Value = rsquared;

    case '50-59'
        r = corrcoef(age50,maxHR50);
        p = polyfit(age50,maxHR50,1); 
        rsquared = r(1,2)^2;
        f = polyval(p,age50);
        plot(app.UIAxes3,age50,maxHR50,'c.',age50,f,'MarkerSize',15)
        legend(app.UIAxes3,'Data','Line of Best Fit')
        app.EditField.Value = rsquared;

    case '60-69'
        r = corrcoef(age60,maxHR60);
        p = polyfit(age60,maxHR60,1); 
        rsquared = r(1,2)^2;
        f = polyval(p,age60);
        plot(app.UIAxes3,age60,maxHR60,'b.',age60,f,'MarkerSize',15)
        legend(app.UIAxes3,'Data','Line of Best Fit')
        app.EditField.Value = rsquared;

    case '70-79'
        r = corrcoef(age70,maxHR70);
        p = polyfit(age70,maxHR70,1); 
        rsquared = r(1,2)^2;
        f = polyval(p,age70);
        plot(app.UIAxes3,age70,maxHR70,'m.',age70,f,'MarkerSize',15)
        legend(app.UIAxes3,'Data','Line of Best Fit')
        app.EditField.Value = rsquared;

end

