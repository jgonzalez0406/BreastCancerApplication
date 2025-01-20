function correlation(app)

heartDisease = codeLoader;
[hRows, hCol] = size(heartDisease);

%% What's the correlation?

% x-coords
cholestoral = zeros(1,hRows);
chestPain = zeros(1,hRows);

% y-coords
bpmRest = zeros(1,hRows);
bldSgrFast = zeros(1,hRows);


x = cholestoral;
y = bpmRest;

% loops and creates an array for each value that the user may want to see
for ix = 1:hRows
    cholestoral(ix) = heartDisease.cholestoral(ix);
    bldSgrFast(ix) = heartDisease.fasting_blood_sugar(ix);
    
    bpmRest(ix) = heartDisease.resting_bp(ix);
    chestPain(ix) = heartDisease.chest_pain_type(ix);
end

% button for the y axis
% will set y as the list they want to see and change the y axis label
switch app.ButtonY.SelectedObject.Text
    case 'BPM While Resting'
        y = bpmRest;
        ylabel(app.UIAxes4,'BPM While Resting')
        
    case 'Blood Sugar While Fasting'
        y = bldSgrFast;
        ylabel(app.UIAxes4,'Blood Sugar While Fasting')
        
end

% button for the x axis
% will set x as the list they want to see and change the x axis label
% this button has the code to actually run the scatterplot
switch app.ButtonX.SelectedObject.Text
    case 'Cholestoral'
        x = cholestoral;
        plot(app.UIAxes4,x,y,'g.','MarkerSize',15)
        xlabel(app.UIAxes4,'Cholestoral')
        
    case 'Chest Pain'
        x = chestPain;
        plot(app.UIAxes4,x,y,'r.','MarkerSize',15)
        xlabel(app.UIAxes4,'Type of Chest Pain')
        
end

title(app.UIAxes4,'Correlations!')
