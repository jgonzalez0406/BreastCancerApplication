function cholestoral(app)

heartDisease = codeLoader;
[hRows, hCol] = size(heartDisease);

%% What's a person's cholestoral based on their age?
% Three age groups
% 40-49
% 50-59
% 60-69

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

switch app.DropDown.Value
    case '29-39'
        plot(app.UIAxes3,age30,maxHR30,'r.','MarkerSize',15)
    case '40-49'
        plot(app.UIAxes3,age40,maxHR40,'g.','MarkerSize',15)
    case '50-59'
        plot(app.UIAxes3,age50,maxHR50,'c.','MarkerSize',15)
    case '60-69'
        plot(app.UIAxes3,age60,maxHR60,'b.','MarkerSize',15)
    case '70-79'
        plot(app.UIAxes3,age70,maxHR70,'m.','MarkerSize',15)
end
