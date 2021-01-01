% used to plot zoom-in subplot
function varargout = func_magnifyOnFigure( varargin )
% NAME: magnifyOnFigure
% 
% AUTHOR: David Fernandez Prim (david.fernandez.prim@gmail.com)
% https://www.mathworks.com/matlabcentral/fileexchange/26007-on-figure-magnifier?s_tid=srchtitle
% REVISER: Hildo Guillardi Júnior
% https://github.com/hildogjr/magnifyOnFigure/
%
% PURPOSE: Shows a functional zoom tool, suitable for publishing of zoomed
% images and 2D plots
% 
% INPUT ARGUMENTS:  figureHandle [double 1x1]: graphic handle of the target figure
%                   axesHandle [double 1x1]: graphic handle of the target axes.
%
% OUTPUT ARGUMENTS: none
%                   
% SINTAX:
%           1)  magnifyOnFigure;
%               $ Adds magnifier on the last (current) axes of the current
%               figure, with default behavior.
%           2)  magnifyOnFigure( figureHandle );
%               $ Adds magnifier on the first axes of the figure with handle
%               'figureHandle', with default behavior. 
%           3)  magnifyOnFigure( figureHandle, 'property1', value1,... );
%               $ Adds magnifier on the first axes of the figure with handle
%               'figureHandle', with modified behavior. 
%           4)  magnifyOnFigure( axesHandle );
%               $ Adds magnifier on the axes with handle 'axesHandle', with
%               default behavior. 
%           5)  magnifyOnFigure( axesHandle, 'property1', value1,... );
%               $ Adds magnifier on the axes with handle 'axesHandle', with
%               modified behavior. 
%           6)  Consecutive calls to this function (in any of the syntaxes
%               exposed above) produce multiple selectable magnifiers on the target axes.
%
% USAGE EXAMPLES: see script 'magnifyOnFigure_examples.m'
%                 
% PROPERTIES: 
%        'magnifierShape':  'Shape of the magnifier ('rectangle' or 'ellipse' allowed, 'rectangle' as default)
%        'secondaryAxesFaceColor':  ColorSpec
%        'edgeWidth'                Color of the box surrounding the secondary 
%                                   axes, magnifier and link. Default 1
%        'edgeColor':               Color of the box surrounding the secondary 
%                                   axes, magnifier and link. Default 'black'
%        'displayLinkStyle':        Style of the link. 'none', 'straight' or
%                                   'edges', with 'straight' as default.
%        'mode':                    'manual' or 'interactive' (allowing
%                                   adjustments through mouse/keyboard). Default
%                                   'interactive'.                                
%        'units'                    Units in which the position vectors are
%                                   given. Only 'pixels' currently supported
%        'initialPositionSecondaryAxes':    Initial position vector ([left bottom width height])
%                                           of secondary axes, in pixels 
%        'initialPositionMagnifier':        Initial position vector ([left bottom width height])
%                                           of magnifier, in pixels 
%        'secondaryAxesXLim':       Initial XLim value of the secondary axes
%        'secondaryAxesYLim':       Initial YLim value of the secondary axes
%        'frozenZoomAspectRatio':   Specially useful for images, forces the use of the same zoom 
%                                   factor on both X and Y axes, in order to keep the aspect ratio 
%                                   ('on' or 'off' allowed, 'off' by default 
% 
% HOT KEYS (active if 'mode' set to 'interactive')
%
% -In a figure with multiple tool instances
%       'Tab':                  Switch the focus from one magnifier instance 
%                               to the next one on the current figure.
%       'Mouse pointer on secondary axes or magnifier of a tool+double left click'    
%                                                       Regain focus
%
% -On the focused magnifier instance
%       'up arrow':             Moves magnifier 1 pixel upwards
%       'down arrow':           Moves magnifier 1 pixel downwards
%       'left arrow':           Moves magnifier 1 pixel to the left
%       'right arrow':          Moves magnifier 1 pixel to the right
%       'Shift+up arrow':       Expands magnifier 10% on the Y-axis
%       'Shift+down arrow':     Compress magnifier 10% on the Y-axis
%       'Shift+left arrow':     Compress magnifier 10% on the X-axis
%       'Shift+right arrow':    Expands magnifier 10% on the X-axis
%       'Control+up arrow':     Moves secondary axes 1 pixel upwards
%       'Control+down arrow':   Moves secondary axes 1 pixel downwards
%       'Control+left arrow':   Moves secondary axes 1 pixel to the left
%       'Control+right arrow':  Moves secondary axes 1 pixel to the right
%       'Alt+up arrow':         Expands secondary axes 10% on the Y-axis
%       'Alt+down arrow':       Compress secondary axes 10% on the Y-axis
%       'Alt+left arrow':       Compress secondary axes 10% on the X-axis
%       'Alt+right arrow':      Expands secondary axes 10% on the X-axis
%       'PageUp':               Increase zooming factor on X-axis
%       'PageDown':             Decrease zooming factor on X-axis
%       'Shift+PageUp':         Increase zooming factor on Y-axis
%       'Shift+PageDown':       Decrease zooming factor on Y-axis
%       'Shift+Q':            Resets the zooming factors to 1
%       'Control+A':            Displays position of secondary axes and
%                               magnifier in the command window
%       'Control+D':            Deletes the focused tool
%       'Control+I':            Shows/hides the tool identifier (red
%                               background color when the tool has the focus, 
%                               black otherwise)
%       'Mouse pointer on magnifier+left click'         Drag magnifier to any
%                                                       direction
%       'Mouse pointer on secondary axes+left click'    Drag secondary axes in any
%                                                       direction
%
% TODO:
%   - Use another axes copy as magnifier instead of rectangle (no ticks).
%   - Adapt to work on 3D plots.
%   - Add tip tool with interface description?.
%
% KNOWN ISSUES:
%   - Secondary axes are not updated when the zoomming or panning tools of the figure are used.
%   - Degraded performance for big data sets or big window sizes.
%   - The size and position of the magnifier are modified for 'PaperPositionMode' equal to
%   'auto', when the figure is printed to file through 'print'.
%   - Doesn't work with dual plot (such `plotyy` function).
%   - Resizing the plot doesn't keep the magnif point.
%
% CHANGE HISTORY:
% 
%   Version     |       Date    |   Author          |   Description
%---------------|---------------|-------------------|---------------------------------------
%   1.0         |   28/11/2009  |   D. Fernandez    |   First version   
%   1.1         |   29/11/2009  |   D. Fernandez    |   Added link from magnifier to secondary axes   
%   1.2         |   30/11/2009  |   D. Fernandez    |   Keyboard support added   
%   1.3         |   01/12/2009  |   D. Fernandez    |   Properties added
%   1.4         |   02/12/2009  |   D. Fernandez    |   Manual mode supported
%   1.5         |   03/12/2009  |   D. Fernandez    |   New link style added ('edges')
%   1.6         |   03/12/2009  |   D. Fernandez    |   Bug solved in display of link style 'edges'
%   1.7         |   04/12/2009  |   D. Fernandez    |   Target axes selection added
%   1.8         |   07/12/2009  |   D. Fernandez    |   Solved bug when any of the axes are reversed.
%   1.9         |   08/12/2009  |   D. Fernandez    |   Adapted to work under all axes modes (tight, square, image, ...)
%   1.10        |   08/12/2009  |   D. Fernandez    |   Added frozenZoomAspectRatio zoom mode, useful for images
%   1.11        |   08/12/2009  |   D. Fernandez    |   Solved bug when axes contain other than 'line' or 'image' objects
%   1.12        |   05/01/2010  |   D. Fernandez    |   Added support to multiple instances
%   1.13        |   05/01/2010  |   D. Fernandez    |   Added 'delete' functionality
%   1.14        |   05/01/2010  |   D. Fernandez    |   Solved bug when initial positions for secondary axes and/or magnifier are specified
%   1.15        |   07/01/2010  |   D. Fernandez    |   Solved bug when resizing window
%   1.16        |   07/01/2010  |   D. Fernandez    |   Improved documentation
%   1.17        |   28/03/2010  |   D. Fernandez    |   Added tool identifications feature
%   1.18        |   19/10/2017  | H. Guillardi Jr.  |   Accept subplot (use last select axis), using `gca`. Works in olders Matlab versions.

clear global appDataStruct
global appDataStruct

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CHECK INPUT ARGUMENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin == 0 
    %Initialize 'appDataStructuct' with default values
    appDataStruct = initializeToolStruct();
    %Set figure handle
    appDataStruct.figureHandle = gcf;
    % Get number of axes in the same figure
%    childHandle = get(appDataStruct.figureHandle, 'Children');
    childHandle = gca; %get(appDataStruct.figureHandle, 'Children')% Get the last active axis.
    iAxes = find(strcmpi(get(childHandle, 'Type'), 'axes'));
    % If no target axes specified, select the first found as mainAxes
    appDataStruct.mainAxesHandle = childHandle( iAxes(end) );
elseif nargin > 0

    if isstruct(varargin{1})
        %Initialize 'appDataStructuct' with existent structure
        appDataStruct = initializeToolStruct( varargin{1} );               
        
    elseif ishandle(varargin{1}) && strcmpi(get(varargin{1}, 'Type'), 'figure')
        %Initialize 'appDataStructuct' with default values
        appDataStruct = initializeToolStruct();
        %Set figure handle
        appDataStruct.figureHandle = varargin{1};
        % Get number of axes in the same figure
%        childHandle = get(appDataStruct.figureHandle, 'Children');
        childHandle = gca;
        iAxes = find(strcmpi(get(childHandle, 'Type'), 'axes'));
        % If no target axes specified, select the first found as mainAxes
        appDataStruct.mainAxesHandle = childHandle( iAxes(end) );
                
    elseif ishandle(varargin{1}) && strcmpi(get(varargin{1}, 'Type'), 'axes')
        %Initialize 'appDataStructuct' with default values
        appDataStruct = initializeToolStruct();
        appDataStruct.mainAxesHandle = varargin{1};  
        % Get figure handle
        parentHandle = get(varargin{1}, 'Parent');
        iHandle = find(strcmpi(get(parentHandle, 'Type'), 'figure'));
        % Figure is the parent of the axes
        appDataStruct.figureHandle = parentHandle( iHandle(1) );  
        
    else
        if ishandle(varargin{1})
            warning('Wrong figure/axes handle specified. The magnifier will be applied on the current figure.');
        elseif isobject(varargin{1})
            error('Wrong object specified.');
        else        
            error('Wrong input class specified.');
        end                
        
    end

    if mod(nargin-1, 2) == 0
                       
        %Check input properties
        for i = 2:2:nargin 
            if  ~strcmpi( varargin{i}, 'frozenZoomAspectRatio' ) &&...
                ~strcmpi( varargin{i}, 'magnifierShape' ) &&...
                ~strcmpi( varargin{i}, 'secondaryaxesxlim' ) &&...
                ~strcmpi( varargin{i}, 'secondaryaxesylim' ) &&...    
                ~strcmpi( varargin{i}, 'secondaryaxesfacecolor' ) &&...
                ~strcmpi( varargin{i}, 'edgewidth' ) &&...
                ~strcmpi( varargin{i}, 'edgecolor' ) &&...
                ~strcmpi( varargin{i}, 'displayLinkStyle' ) &&...
                ~strcmpi( varargin{i}, 'mode' ) &&...
                ~strcmpi( varargin{i}, 'units' ) &&...
                ~strcmpi( varargin{i}, 'initialpositionsecondaryaxes' ) &&...
                ~strcmpi( varargin{i}, 'initialpositionmagnifier' )
                error('Illegal property specified. Please check.');
            end
            if strcmpi( varargin{i}, 'frozenZoomAspectRatio' )
                if ischar(varargin{i+1}) &&...
                   ( strcmpi(varargin{i+1}, 'on') || strcmpi(varargin{i+1}, 'off') )
                    appDataStruct.globalZoomMode = lower(varargin{i+1});
                else
                    warning(sprintf('Specified zoom mode not supported. Default values will be applied [%s].', appDataStruct.globalZoomMode));
                end
            end
            if strcmpi( varargin{i}, 'mode' )
                if ischar(varargin{i+1}) &&...
                   ( strcmpi(varargin{i+1}, 'manual') || strcmpi(varargin{i+1}, 'interactive') )
                    appDataStruct.globalMode = lower(varargin{i+1});
                else
                    warning(sprintf('Specified mode descriptor not supported. Default values will be applied [%s].', appDataStruct.globalMode));
                end
            end
            if strcmpi( varargin{i}, 'magnifierShape' )
                if ischar(varargin{i+1}) &&...
                   ( strcmpi(varargin{i+1}, 'rectangle') || strcmpi(varargin{i+1}, 'ellipse') )
                    appDataStruct.magnifierShape = lower(varargin{i+1});
                else
                    warning(sprintf('Specified magnifier shape not supported. Default values will be applied [%s].', appDataStruct.magnifierShape));
                end
            end
            if strcmpi( varargin{i}, 'displayLinkStyle' )
                if ischar(varargin{i+1}) &&...
                   ( strcmpi(varargin{i+1}, 'straight') || strcmpi(varargin{i+1}, 'none') || strcmpi(varargin{i+1}, 'edges') )
                    if ~strcmpi(appDataStruct.magnifierShape, 'rectangle') && strcmpi(varargin{i+1}, 'edges')
                        warning(sprintf('Specified link style not supported. Default values will be applied for ''displayLinkStyle''[%s].', appDataStruct.linkDisplayStyle));
                    else
                        appDataStruct.linkDisplayStyle = lower(varargin{i+1});
                    end
                else
                    warning(sprintf('Specified descriptor not supported. Default values will be applied for ''displayLink''[%s].', appDataStruct.linkDisplayStyle));
                end
            end
            if strcmpi( varargin{i}, 'units' )
                if ischar(varargin{i+1}) && strcmpi(varargin{i+1}, 'pixels')
                    appDataStruct.globalUnits = lower(varargin{i+1});
                else
                    warning(sprintf('Specified units descriptor not supported. Default values will be applied [%s].', appDataStruct.globalUnits));
                end
            end
            if strcmpi( varargin{i}, 'edgewidth' )
                if length(varargin{i+1})==1 && isnumeric(varargin{i+1})
                    appDataStruct.globalEdgeWidth = varargin{i+1};
                else
                    warning(sprintf('Incorrect edge width value. Default value will be applied [%g].', appDataStruct.globalEdgeWidth ))
                end
            end
            if strcmpi( varargin{i}, 'edgecolor' )
                if ( length(varargin{i+1})==3 && isnumeric(varargin{i+1}) ) ||...
                   ( ischar(varargin{i+1}) )     
                    appDataStruct.globalEdgeColor = varargin{i+1};
                else
                    warning('Incorrect edge color value. Default black will be applied.');
                end
            end                      
            if strcmpi( varargin{i}, 'secondaryaxesfacecolor' )
                if ( length(varargin{i+1})==3 && isnumeric(varargin{i+1}) ) ||...
                   ( ischar(varargin{i+1}) )     
                    appDataStruct.secondaryAxesFaceColor = varargin{i+1};
                else
                    warning('Incorrect secondary axes face color value. Default white will be applied.');
                end
            end 
            
            if strcmpi( varargin{i}, 'secondaryaxesxlim' )
                if ( length(varargin{i+1})==2 && isnumeric(varargin{i+1}) )
                    appDataStruct.secondaryAxesXLim = varargin{i+1};
                else
                    warning('Incorrect secondary axes XLim value. Default white will be applied.');
                end
            end 
            
            if strcmpi( varargin{i}, 'secondaryaxesylim' )
                if ( length(varargin{i+1})==2 && isnumeric(varargin{i+1}) )
                    appDataStruct.secondaryAxesYLim = varargin{i+1};
                else
                    warning('Incorrect secondary axes YLim value. Default white will be applied.');
                end
            end             
            
            if strcmpi( varargin{i}, 'initialpositionsecondaryaxes' )
                if length(varargin{i+1})==4 && isnumeric(varargin{i+1})
                    appDataStruct.secondaryAxesPosition = varargin{i+1};
                else
                    warning('Incorrect initial position of secondary axes. Default values will be applied.')
                end
            end
            if strcmpi( varargin{i}, 'initialpositionmagnifier' )
                if length(varargin{i+1})==4 && isnumeric(varargin{i+1})
                    appDataStruct.magnifierPosition = varargin{i+1};
                else
                    warning('Incorrect initial position of magnifier. Default values will be applied.')
                end                    
            end
        end
        
    else
        error('Number of input arguments not supported.');
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ENTRY POINT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create secondary axes
if isempty(appDataStruct.secondaryAxesHandle)
    appDataStruct.secondaryAxesHandle = copyobj(appDataStruct.mainAxesHandle, appDataStruct.figureHandle);    
end

%Configure secondary axis
set( appDataStruct.secondaryAxesHandle, 'Color', get(appDataStruct.mainAxesHandle,'Color'), 'Box','on');
set( appDataStruct.secondaryAxesHandle, ...
                                        'LineWidth', appDataStruct.globalEdgeWidth,...
                                        'XColor', appDataStruct.globalEdgeColor,...
                                        'YColor', appDataStruct.globalEdgeColor,...
                                        'Color', appDataStruct.secondaryAxesFaceColor );
set( appDataStruct.figureHandle, 'CurrentAxes', appDataStruct.secondaryAxesHandle );
xlabel(''); ylabel(''); zlabel(''); title('');
axis( appDataStruct.secondaryAxesHandle, 'normal'); %Ensure that secondary axes are not resizing
set( appDataStruct.figureHandle, 'CurrentAxes', appDataStruct.mainAxesHandle );

%Default magnifier position
if isempty(appDataStruct.magnifierPosition)
    appDataStruct.magnifierPosition = computeMagnifierDefaultPosition();   
end

%Default secondary axes position
if isempty(appDataStruct.secondaryAxesPosition)
    appDataStruct.secondaryAxesPosition = computeSecondaryAxesDefaultPosition();
end

% #PATCH 1 (part 1)
toolArrayAux = get(appDataStruct.figureHandle, 'userdata');
set(appDataStruct.figureHandle, 'userdata', []);
% #END PATCH 1 (part 1)

%Set initial position of secondary axes
setSecondaryAxesPositionInPixels( appDataStruct.secondaryAxesPosition );
%Set initial position of magnifier
setMagnifierPositionInPixels( appDataStruct.magnifierPosition );                            

% #PATCH 1 (part 2)
set(appDataStruct.figureHandle, 'userdata', toolArrayAux);
% #END PATCH 1 (part 2)

%Update view limits on secondary axis
refreshSecondaryAxisLimits();

%Update link between secondary axes and magnifier
refreshMagnifierToSecondaryAxesLink();

%Set actions for interactive mode
if strcmpi( appDataStruct.globalMode, 'interactive')
    
    toolArray = get(appDataStruct.figureHandle, 'userdata');
    nTools = length(toolArray);
    if nTools == 0
        
        %Store figure position
        appDataStruct.figurePosition = getFigurePositionInPixels();
        
        %Store old callbacks
        appDataStruct.figureOldWindowButtonDownFcn = get( appDataStruct.figureHandle, 'WindowButtonDownFcn');
        appDataStruct.figureOldWindowButtonUpFcn = get( appDataStruct.figureHandle, 'WindowButtonUpFcn');
        appDataStruct.figureOldWindowButtonMotionFcn = get( appDataStruct.figureHandle, 'WindowButtonMotionFcn');
        appDataStruct.figureOldKeyPressFcn = get( appDataStruct.figureHandle, 'KeyPressFcn');
        appDataStruct.figureOldDeleteFcn = get( appDataStruct.figureHandle, 'DeleteFcn');
        appDataStruct.figureOldResizeFcn = get( appDataStruct.figureHandle, 'ResizeFcn');

        %Set service funcions to events
        set(    appDataStruct.figureHandle, ...
               'WindowButtonDownFcn',   @ButtonDownCallback, ...
               'WindowButtonUpFcn',     @ButtonUpCallback, ...
               'WindowButtonMotionFcn', @ButtonMotionCallback, ...
               'KeyPressFcn',           @KeyPressCallback, ...
               'DeleteFcn',             @DeleteCallback,...
               'ResizeFcn',             @ResizeCallback...
               );
    end
else
        
    %Set service funcions to events
    set(   appDataStruct.figureHandle, ...
           'WindowButtonDownFcn',   '', ...
           'WindowButtonUpFcn',     '', ...
           'WindowButtonMotionFcn', '', ...
           'KeyPressFcn',           '', ...
           'DeleteFcn',             '',...
           'ResizeFcn',             ''...           
           );
end

%Set focus
appDataStruct.focusOnThisTool = true;

%Compute unique ID of this magnifying tool, from handles of its elements
if verLessThan('matlab','8.4')
    toolId = appDataStruct.figureHandle + appDataStruct.mainAxesHandle +...
        appDataStruct.magnifierHandle + appDataStruct.linkHandle +...
        appDataStruct.secondaryAxesHandle;
else
    toolId = rand(1,1);
end
%Set ID of this magnifying tool        
appDataStruct.toolId = toolId;

%Get active figure
figureHandle = appDataStruct.figureHandle;

%Save object of this tool to userdata in figure object
toolArray = get(figureHandle, 'UserData');
if isempty(toolArray)
    toolArray = struct(appDataStruct);
    toolArray.focusOnThisTool = true;
else
    %Set focus to this tool
    %focusedTool = find([toolArray.focusOnThisTool] == 1);
    toolArray([toolArray.focusOnThisTool] == 1).focusOnThisTool = false;
        
    %search tool ID
    indexFoundToolId = find([toolArray.toolId] == toolId);    
    if isempty(indexFoundToolId)
        %If not found, create new
        indexFoundToolId = length(toolArray)+1;
    end
    toolArray(indexFoundToolId) = struct(appDataStruct);
    toolArray(indexFoundToolId).focusOnThisTool = true;
    
end
set( figureHandle, 'UserData', toolArray );

%Set callback global behaviour
set(appDataStruct.figureHandle, 'Interruptible', 'off');
set(appDataStruct.figureHandle, 'BusyAction', 'cancel');

%Return created object if requested
if nargout==1
    varargout{1} = appDataStruct;
end
    
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: refreshSecondaryAxisLimits
% 
% PURPOSE: Updates the view on the secondary axis, based on position and
% span of magnifier, and extend of secondary axis.
% 
% INPUT ARGUMENTS:
%                   appDataStructuct [struct 1x1]: global variable
% OUTPUT ARGUMENTS: 
%                   change 'XLim' and 'YLim' of secondary axis (ACTION)
%                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function refreshSecondaryAxisLimits()
        
global appDataStruct
if isempty(appDataStruct), position=[]; return; end

%If limits specified
if ~(isempty(appDataStruct.secondaryAxesXLim) ||...
   isempty(appDataStruct.secondaryAxesYLim))

    axis(appDataStruct.secondaryAxesHandle, ...
        [appDataStruct.secondaryAxesXLim, ...
        appDataStruct.secondaryAxesYLim]);
    
    appDataStruct.secondaryAxesXLim = [];
    appDataStruct.secondaryAxesYLim = [];
else
    %Get main axes limits, in axes units
    mainAxesXLim = get( appDataStruct.mainAxesHandle, 'XLim' );
    mainAxesYLim = get( appDataStruct.mainAxesHandle, 'YLim' );
    %Get position and size of main axes in pixels
    mainAxesPositionInPixels = getMainAxesPositionInPixels();
    %Get position and extend of magnifier, in pixels                      
    magnifierPosition = getMagnifierPositionInPixels();
    
    % Reflect it to log scale.
    switch get( appDataStruct.mainAxesHandle, 'XScale' )
        case 'linear'
            % The usual.
        case 'log'
            %%#TODO the error of Bode plot is here
        otherwise
            error('Not recognized X axis scale.')
    end
    
    switch get( appDataStruct.mainAxesHandle, 'YScale' )
        case 'linear'
            % The usual.
        case 'log'
            %%#TODO the error of Bode plot is here
        otherwise
            error('Not recognized X axis scale.')
    end
    
    xMainAxisPixels2UnitsFactor = determineSpan( mainAxesXLim(1), mainAxesXLim(2) )/mainAxesPositionInPixels(3); %Compute Pixels-to-axes units conversion factors
    magnifierPosition(1) = magnifierPosition(1) - mainAxesPositionInPixels(1); %Relative to the lower-left corner of the axes
    magnifierPosition(3) = magnifierPosition(3) * xMainAxisPixels2UnitsFactor; %Compute position and exted of magnifier, in axes units
    switch get( appDataStruct.mainAxesHandle, 'XDir' )
        case 'normal'
            magnifierPosition(1) = mainAxesXLim(1) + magnifierPosition(1)*xMainAxisPixels2UnitsFactor;
        case 'reverse'
            magnifierPosition(1) = mainAxesXLim(2) - magnifierPosition(1)*xMainAxisPixels2UnitsFactor - magnifierPosition(3);
        otherwise
            error('Not recognized X axis direction.')
    end
    
    yMainAxisPixels2UnitsFactor = determineSpan( mainAxesYLim(1), mainAxesYLim(2) )/mainAxesPositionInPixels(4);
    magnifierPosition(2) = magnifierPosition(2) - mainAxesPositionInPixels(2);
    magnifierPosition(4) = magnifierPosition(4) * yMainAxisPixels2UnitsFactor;
    switch get( appDataStruct.mainAxesHandle, 'YDir' )
        case 'normal'
            magnifierPosition(2) = mainAxesYLim(1) + magnifierPosition(2)*yMainAxisPixels2UnitsFactor;
        case 'reverse'
            magnifierPosition(2) = mainAxesYLim(2) - magnifierPosition(2)*yMainAxisPixels2UnitsFactor - magnifierPosition(4);
        otherwise
            error('Not recognized Y axis direction.')
    end
        
    secondaryAxisXlim = [magnifierPosition(1) magnifierPosition(1)+magnifierPosition(3)];
    secondaryAxisYlim = [magnifierPosition(2) magnifierPosition(2)+magnifierPosition(4)]; 
    
    % Apply the zoom factor to the secondary axis using the center and middle as anchor
    aux_secondaryAxisXlim =  mean(secondaryAxisXlim) + [-1, +1] * ...
                            determineSpan( secondaryAxisXlim(1), mean(secondaryAxisXlim) )* ...
                            appDataStruct.secondaryAxesZoomingFactor(1);
    aux_secondaryAxisYlim =  mean(secondaryAxisYlim) + [-1, +1] *...
                            determineSpan( secondaryAxisYlim(1), mean(secondaryAxisYlim) )* ...
                            appDataStruct.secondaryAxesZoomingFactor(2);

    if aux_secondaryAxisXlim(1)<aux_secondaryAxisXlim(2) &&...
       all(isfinite(aux_secondaryAxisXlim))     
        set( appDataStruct.secondaryAxesHandle, 'XLim', aux_secondaryAxisXlim );
    end
    if aux_secondaryAxisYlim(1)<aux_secondaryAxisYlim(2) &&...
       all(isfinite(aux_secondaryAxisYlim))             
        set( appDataStruct.secondaryAxesHandle, 'YLim', aux_secondaryAxisYlim );
    end

end

%Increase line width in plots on secondary axis
childHandle = get( appDataStruct.secondaryAxesHandle, 'Children');
for iChild = 1:length(childHandle)
    if strcmpi(get(childHandle(iChild), 'Type'), 'line')
        set(childHandle(iChild), 'LineWidth', 2);
    end
    if strcmpi(get(childHandle(iChild), 'Type'), 'image')
        %Do nothing for now
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: determineSpan
% 
% PURPOSE: Computes the distance between two real numbers on a 1D space.
% 
% INPUT ARGUMENTS:
%                   v1 [double 1x1]: first number
%                   v2 [double 1x1]: second number
% OUTPUT ARGUMENTS: 
%                   span [double 1x1]: computed span 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function span = determineSpan( v1, v2 )
span = abs(v2 - v1);
   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: ResizeCallback
% 
% PURPOSE: Service routine to Resize event.
% 
% INPUT ARGUMENTS:
%                   
% OUTPUT ARGUMENTS: 
%                   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ResizeCallback(src, ~)

global appDataStruct
if isempty(appDataStruct), position=[]; return; end

%Get userdata
toolArray = get(src, 'userdata');
if isempty(toolArray), return; end

nTools = length( toolArray );

%Store Old&New Figure positions
oldFigurePosition = toolArray(1).figurePosition;
newFigurePosition = getFigurePositionInPixels();

factor = [newFigurePosition(3)/oldFigurePosition(3), newFigurePosition(4)/oldFigurePosition(4)];
    
%Backup global appDataStruct 
appDataStructAux = appDataStruct;

for i=1:nTools
    %Modify global vaiable, accessed by functions called below
    appDataStruct = initializeToolStruct( toolArray(i) );
    
    %Set position of secondaryAxes (automatically modified)
    toolArray(i).secondaryAxesPosition = getSecondaryAxesPositionInPixels();
    setMagnifierPositionInPixels( toolArray(i).magnifierPosition .* [factor, factor]);                            
        
    %Update view limits on secondary axis  
    refreshSecondaryAxisLimits();
    %Update link between secondary axes and magnifier
    refreshMagnifierToSecondaryAxesLink();
    
    if i==1
        %Update figure position       
        toolArray(i).figurePosition = getFigurePositionInPixels();
        appDataStruct.figurePosition = toolArray(i).figurePosition;          
    end
end

%Update userdata
set(toolArray(1).figureHandle, 'userdata', toolArray);

%Update appDataStruct
appDataStruct = appDataStructAux;
%Get current position of seconday axes (in pixels)
appDataStruct.secondaryAxesPosition = getSecondaryAxesPositionInPixels();
%Get magnifier current position and size
appDataStruct.magnifierPosition = getMagnifierPositionInPixels();

clear appDataStructAux;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: KeyPressCallback
% 
% PURPOSE: Service routine to KeyPress event.
% 
% INPUT ARGUMENTS:
%                   
% OUTPUT ARGUMENTS: 
%                   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function KeyPressCallback(src,eventdata)

global appDataStruct
if isempty(appDataStruct), position=[]; return; end

currentCaracter = eventdata.Key;
currentModifier = eventdata.Modifier;

switch(currentCaracter)
    case {'leftarrow'} % left arrow
        %Move magnifier to the left
        if isempty(currentModifier)
            setMagnifierPositionInPixels( getMagnifierPositionInPixels() - [1, 0, 0, 0] );  
            
            toolArray = get( src, 'UserData' );
            focusedTool = find([toolArray.focusOnThisTool] == 1);                                                          
            toolArray(focusedTool) = updateToolId( toolArray, focusedTool, 'noToggle' );
            set( src, 'UserData', toolArray );
        end
        %Compress magnifier on the X axis
        if strcmp(currentModifier, 'shift')
            position = getMagnifierPositionInPixels();
            magnifierPosition(3) = position(3)*0.9;
            if strcmpi( appDataStruct.globalZoomMode, 'off')
                magnifierPosition(4) = position(4);
            else
                %If 'freezeZoomAspectRatio' to 'on', be consistent
                magnifierPosition(4) = position(4)*0.9; 
            end
            magnifierPosition([1, 2]) = position([1, 2]) - ...
                (-position([3, 4])+magnifierPosition([3, 4]))/2;
            setMagnifierPositionInPixels( magnifierPosition );
        end
        %Move secondary axes to the left        
        if strcmp(currentModifier, 'control')
            setSecondaryAxesPositionInPixels( getSecondaryAxesPositionInPixels() - [1, 0, 0, 0] );        
        end
        %Compress secondary axes on the X axis        
        if strcmp(currentModifier, 'alt')
            position = getSecondaryAxesPositionInPixels();
            secondaryAxesPosition(3) = position(3)*0.9;
            if strcmpi( appDataStruct.globalZoomMode, 'off')
                secondaryAxesPosition(4) = position(4);
            else
                %If 'freezeZoomAspectRatio' to 'on', be consistent
                secondaryAxesPosition(4) = position(4)*0.9; 
            end
            secondaryAxesPosition([1, 2]) = position([1, 2]) - ...
                (-position([3, 4])+secondaryAxesPosition([3, 4]))/2;
            setSecondaryAxesPositionInPixels( secondaryAxesPosition ); 
        end
        
    case {'rightarrow'} % right arrow
         %Move magnifier to the right
        if isempty(currentModifier)
            setMagnifierPositionInPixels( getMagnifierPositionInPixels() + [1, 0, 0, 0] ); 
            
            toolArray = get( src, 'UserData' );
            focusedTool = find([toolArray.focusOnThisTool] == 1);                                                          
            toolArray(focusedTool) = updateToolId( toolArray, focusedTool, 'noToggle' );
            set( src, 'UserData', toolArray );
            
        end
        %Expand magnifier on the X axis
        if strcmp(currentModifier, 'shift')
            position = getMagnifierPositionInPixels();
            magnifierPosition(3) = position(3)*1.1;
            if strcmpi( appDataStruct.globalZoomMode, 'off')
                magnifierPosition(4) = position(4);
            else
                %If 'freezeZoomAspectRatio' to 'on', be consistent
                magnifierPosition(4) = position(4)*1.1; 
            end
            magnifierPosition([1, 2]) = position([1, 2]) - ...
                (-position([3, 4])+magnifierPosition([3, 4]))/2;
            setMagnifierPositionInPixels( magnifierPosition );
        end
        %Move secondary axes to the right        
        if strcmp(currentModifier, 'control')
            setSecondaryAxesPositionInPixels( getSecondaryAxesPositionInPixels() + [1, 0, 0, 0] );      
        end   
        %Expand secondary axes on the X axis        
        if strcmp(currentModifier, 'alt')
            position = getSecondaryAxesPositionInPixels();
            secondaryAxesPosition(3) = position(3)*1.1;
            if strcmpi( appDataStruct.globalZoomMode, 'off')
                secondaryAxesPosition(4) = position(4);
            else
                %If 'freezeZoomAspectRatio' to 'on', be consistent
                secondaryAxesPosition(4) = position(4)*1.1; 
            end
            secondaryAxesPosition([1, 2]) = position([1, 2]) - ...
                (-position([3, 4])+secondaryAxesPosition([3, 4]))/2;
            setSecondaryAxesPositionInPixels( secondaryAxesPosition );  
        end
        
    case {'uparrow'} % up arrow
        %Move magnifier to the top
        if isempty(currentModifier)
            setMagnifierPositionInPixels( getMagnifierPositionInPixels() + [0, 1, 0, 0] );   
            
            toolArray = get( src, 'UserData' );
            focusedTool = find([toolArray.focusOnThisTool] == 1);                                                          
            toolArray(focusedTool) = updateToolId( toolArray, focusedTool, 'noToggle' );
            set( src, 'UserData', toolArray );
            
        end
        %Expand magnifier on the Y axis
        if strcmp(currentModifier, 'shift')
            position = getMagnifierPositionInPixels();
            if strcmpi( appDataStruct.globalZoomMode, 'off')
                magnifierPosition(3) = position(3);
            else
                %If 'freezeZoomAspectRatio' to 'on', be consistent
                magnifierPosition(3) = position(3)*1.1; 
            end
            magnifierPosition(4) = position(4)*1.1;
            magnifierPosition([1, 2]) = position([1, 2]) - ...
                (-position([3, 4])+magnifierPosition([3, 4]))/2;
            setMagnifierPositionInPixels( magnifierPosition );
        end
        %Move secondary axes to the top        
        if strcmp(currentModifier, 'control')
            setSecondaryAxesPositionInPixels( getSecondaryAxesPositionInPixels() + [0, 1, 0, 0] );                  
        end 
        %Expand secondary axes on the Y axis        
        if strcmp(currentModifier, 'alt')
            position = getSecondaryAxesPositionInPixels();
            if strcmpi( appDataStruct.globalZoomMode, 'off')
                secondaryAxesPosition(3) = position(3);
            else
                %If 'freezeZoomAspectRatio' to 'on', be consistent
                secondaryAxesPosition(3) = position(3)*1.1;
            end
            secondaryAxesPosition(4) = position(4)*1.1;
            secondaryAxesPosition([1, 2]) = position([1, 2]) - ...
                (-position([3, 4])+secondaryAxesPosition([3, 4]))/2;
            setSecondaryAxesPositionInPixels( secondaryAxesPosition );   
        end
        
    case {'downarrow'} % down arrow
        %Move magnifier to the bottom
        if isempty(currentModifier)
            setMagnifierPositionInPixels( getMagnifierPositionInPixels() - [0, 1, 0, 0] );      
            
            toolArray = get( src, 'UserData' );
            focusedTool = find([toolArray.focusOnThisTool] == 1);                                                          
            toolArray(focusedTool) = updateToolId( toolArray, focusedTool, 'noToggle' );
            set( src, 'UserData', toolArray );
            
        end
        %Compress magnifier on the Y axis
        if strcmp(currentModifier, 'shift')
            position = getMagnifierPositionInPixels();
            if strcmpi( appDataStruct.globalZoomMode, 'off')
                magnifierPosition(3) = position(3);
            else
                %If 'freezeZoomAspectRatio' to 'on', be consistent
                magnifierPosition(3) = position(3)*0.9; 
            end
            magnifierPosition(4) = position(4)*0.9;
            magnifierPosition([1, 2]) = position([1, 2]) - ...
                (-position([3, 4])+magnifierPosition([3, 4]))/2;
            setMagnifierPositionInPixels( magnifierPosition );
        end
        %Move secondary axes to the bottom        
        if strcmp(currentModifier, 'control')
            setSecondaryAxesPositionInPixels( getSecondaryAxesPositionInPixels() - [0, 1, 0, 0] );         
        end 
        %Compress secondary axes on the Y axis        
        if strcmp(currentModifier, 'alt')
            position = getSecondaryAxesPositionInPixels();
            if strcmpi( appDataStruct.globalZoomMode, 'off')
                secondaryAxesPosition(3) = position(3);
            else
                %If 'freezeZoomAspectRatio' to 'on', be consistent
                secondaryAxesPosition(3) = position(3)*0.9; 
            end
            secondaryAxesPosition(4) = position(4)*0.9;
            secondaryAxesPosition([1, 2]) = position([1, 2]) - ...
                (-position([3, 4])+secondaryAxesPosition([3, 4]))/2;
            setSecondaryAxesPositionInPixels( secondaryAxesPosition );        
        end      

    case {'tab'} % Tabulator
        %Switch focus to next magnifier instance on the current figure
        toolArray = get( src, 'UserData' );
        nTools = length(toolArray);
        focusedTool = find([toolArray.focusOnThisTool] == 1);
        if focusedTool ~= nTools
            nextFocusedTool = focusedTool+1;
        else
            nextFocusedTool = 1;
        end
        appDataStruct = initializeToolStruct( toolArray(nextFocusedTool) );
        appDataStruct.focusOnThisTool = 1;
        toolArray(focusedTool).focusOnThisTool = 0;
        toolArray(nextFocusedTool).focusOnThisTool = 1;        
        if not(isempty(toolArray(focusedTool).toolIdHandle))
            set(toolArray(focusedTool).toolIdHandle, 'BackgroundColor', 'black', 'Color', 'white');
            set(toolArray(nextFocusedTool).toolIdHandle, 'BackgroundColor', 'red', 'Color', 'white');
        end
        
        set( src, 'UserData', toolArray );
        
    case {'d'} % 'd'         
        %Delete focused instance
        if strcmp(currentModifier, 'control')
            toolArray = get( src, 'UserData' );
            nTools = length(toolArray);
            focusedTool = find([toolArray.focusOnThisTool] == 1);
                      
            delete(toolArray(focusedTool).magnifierHandle);
            delete(toolArray(focusedTool).linkHandle);
            delete(toolArray(focusedTool).secondaryAxesHandle);                                                     
            
            if nTools > 1
                %Set focus to next instance
                if focusedTool ~= nTools
                    nextFocusedTool = focusedTool+1;
                else
                    nextFocusedTool = 1;
                end
                toolArray(nextFocusedTool).focusOnThisTool = 1; 
                appDataStruct = initializeToolStruct( toolArray(nextFocusedTool) );

                toolArray(focusedTool) = [];
                set( src, 'UserData', toolArray );

            else
                %No instance to set focus on
                appDataStruct = [];
                set( src, 'UserData', [] );                
            
            end
        end
        
    case {'a'} % 'a'
        %Debug info
        if strcmp(currentModifier, 'control')
            fprintf('magnifyOnFigure active position and values\n')
            fprintf('Magnifier position: [%g %g %g %g];\n', getMagnifierPositionInPixels() );
            fprintf('Secondary axes position: [%g %g %g %g];\n', getSecondaryAxesPositionInPixels() );
            fprintf('Zoom factor: [%g %g];\n', appDataStruct.secondaryAxesZoomingFactor)
        end
        
    case {'q'} % 'q'
        %additional zooming factors reseted
        if strcmp(currentModifier, 'shift')
            appDataStruct.secondaryAxesZoomingFactor = [1, 1];
        end
        
    case {'i'} % 'i'
        %display/hide on-screen tool identifier 
        if strcmp(currentModifier, 'control')
            toolArray = get( src, 'UserData' );
            if any(arrayfun(@(a) ~isempty(a.toolIdHandle), toolArray))
                command = 'hide';
            else
                command = 'show';
            end
            %command = 'toggle';
            for iTool = 1:length(toolArray)
                toolArray(iTool) = updateToolId( toolArray, iTool, command );
            end
            set( src, 'UserData', toolArray );
        end
        
    case {'pageup'} % '+'
        %Increase additional zooming factor on X-axis
        if isempty(currentModifier)
            appDataStruct.secondaryAxesZoomingFactor(1) = appDataStruct.secondaryAxesZoomingFactor(1) - 0.1;
            if strcmpi( appDataStruct.globalZoomMode, 'on')
                appDataStruct.secondaryAxesZoomingFactor(2) = appDataStruct.secondaryAxesZoomingFactor(2) - 0.1;
            end
        end
        %Increase additional zooming factor on Y-axis        
        if strcmp(currentModifier, 'shift')
            appDataStruct.secondaryAxesZoomingFactor(2) = appDataStruct.secondaryAxesZoomingFactor(2) - 0.1;
            if strcmpi( appDataStruct.globalZoomMode, 'on')
                appDataStruct.secondaryAxesZoomingFactor(1) = ...
                    appDataStruct.secondaryAxesZoomingFactor(1) - 0.1;
            end
        end
        
    case {'pagedown'} % '-'
        %Redude additional zooming factor on X-axis
        if isempty(currentModifier)
            appDataStruct.secondaryAxesZoomingFactor(1) = appDataStruct.secondaryAxesZoomingFactor(1) + 0.1;
            if strcmpi( appDataStruct.globalZoomMode, 'on')
                appDataStruct.secondaryAxesZoomingFactor(2) = appDataStruct.secondaryAxesZoomingFactor(2) + 0.1;
            end
        end
        %Redude additional zooming factor on Y-axis        
        if strcmp(currentModifier, 'shift')
            appDataStruct.secondaryAxesZoomingFactor(2) = appDataStruct.secondaryAxesZoomingFactor(2) + 0.1;
            if strcmpi( appDataStruct.globalZoomMode, 'on')
                appDataStruct.secondaryAxesZoomingFactor(1) = appDataStruct.secondaryAxesZoomingFactor(1) + 0.1;
            end
        end        
        
    otherwise

        
end

%Update view limits on secondary axis
refreshSecondaryAxisLimits();

%Update link between secondary axes and magnifier
refreshMagnifierToSecondaryAxesLink();

% %Update userdata
% toolArray = get(src, 'userdata');
% focusedTool = find([toolArray.focusOnThisTool] == 1);
% toolArray(focusedTool) = appDataStruct;
% set(src, 'userData', toolArray); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: ButtonMotionCallback
% 
% PURPOSE: Service routine to ButtonMotion event.
% 
% INPUT ARGUMENTS:
%                   
% OUTPUT ARGUMENTS: 
%                   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ButtonMotionCallback(src, ~)

global appDataStruct
if isempty(appDataStruct), return; end

% pointerPos = get(appDataStructuct.figure.handle, 'CurrentPoint');
% disp(sprintf('X: %g ; Y: %g', pointerPos(1), pointerPos(2)) );

getPointerArea();

%If Left mouse button not pressed, exit
if appDataStruct.ButtonDown == false
    return
end


%If Left mouse button pressed while the pointer is moving (drag)
switch appDataStruct.pointerArea

    case 'insideSecondaryAxis'
        %Get current position of seconday axes (in pixels)
        appDataStruct.secondaryAxesPosition = getSecondaryAxesPositionInPixels();
       
        %Get pointer position on figure's frame
        currentPointerPositionOnFigureFrame = getPointerPositionOnFigureFrame();
        pointerPositionOnButtonDown = appDataStruct.pointerPositionOnButtonDown;
        
        %Modify position
        secondaryAxisPosition = appDataStruct.secondaryAxesPosition + ...
            [-pointerPositionOnButtonDown([1, 2])+currentPointerPositionOnFigureFrame([1, 2]) , 0, 0];
        appDataStruct.pointerPositionOnButtonDown = currentPointerPositionOnFigureFrame;
        
        %Set initial position and size of secondary axes
        setSecondaryAxesPositionInPixels( secondaryAxisPosition );
        
    case 'insideMagnifier'                 
        %Get magnifier current position and size
        appDataStruct.magnifierPosition = getMagnifierPositionInPixels();
        
        %Get pointer position on figure's frame
        currentPointerPosition = getPointerPositionOnFigureFrame();
        pointerPositionOnButtonDown = appDataStruct.pointerPositionOnButtonDown;
        
        %Modify magnifier position
        magnifierPosition = appDataStruct.magnifierPosition + ...
            [-pointerPositionOnButtonDown([1, 2])+currentPointerPosition([1, 2]), 0, 0];
        appDataStruct.pointerPositionOnButtonDown = currentPointerPosition;
        
        %Set initial position and size of magnifying rectangle
        setMagnifierPositionInPixels( magnifierPosition );
        
        %Refresh zooming on secondary axis, based on magnifier position and extend
        refreshSecondaryAxisLimits();    
        
        toolArray = get( src, 'UserData' );
        focusedTool = find([toolArray.focusOnThisTool] == 1);                                                          
        toolArray(focusedTool) = updateToolId( toolArray, focusedTool, 'noToggle' );
        set( src, 'UserData', toolArray );
                           
    otherwise
%         appDataStructuct.pointerArea

end

%Update link between secondary axes and magnifier
refreshMagnifierToSecondaryAxesLink();


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: ButtonDownCallback
% 
% PURPOSE: Service routine to ButtonDown event.
% 
% INPUT ARGUMENTS:
%                   
% OUTPUT ARGUMENTS: 
%                   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ButtonDownCallback(src, ~)

global appDataStruct
if isempty(appDataStruct), return; end

if strcmpi( get(appDataStruct.figureHandle, 'SelectionType'), 'normal' )
    
    %Respond to left mouse button
    appDataStruct.ButtonDown = true;
    %Get pointer position on figure's frame
    appDataStruct.pointerPositionOnButtonDown = getPointerPositionOnFigureFrame();

elseif strcmpi( get(appDataStruct.figureHandle, 'SelectionType'), 'alt' )
    
    %Display contextual menu?
    
elseif strcmpi( get(appDataStruct.figureHandle, 'SelectionType'), 'open' )
   
    %Is pointer on any active area?    
    toolArray = get(src, 'userdata');
    nTools = length(toolArray);
    focusedTool = find([toolArray.focusOnThisTool] == 1);
    nextFocusedTool = 0;
    foundActive = false;
    while nextFocusedTool<=nTools-1 && foundActive == false
        
        nextFocusedTool = nextFocusedTool+1; 
        appDataStructAux = appDataStruct;
        appDataStruct = initializeToolStruct( toolArray(nextFocusedTool) );
        getPointerArea();
        if ~strcmp( appDataStruct.pointerArea, 'none')
            foundActive = true;
        end               
        
    end
    if foundActive == true
       %Switch focus to next magnifier instance on the current figure
        appDataStruct = initializeToolStruct( toolArray(nextFocusedTool) );
        appDataStruct.focusOnThisTool = 1;
        toolArray(focusedTool).focusOnThisTool = 0;
        toolArray(nextFocusedTool).focusOnThisTool = 1;        
        if not(isempty(toolArray(focusedTool).toolIdHandle))
            set(toolArray(focusedTool).toolIdHandle,'BackgroundColor', 'black', 'Color', 'white');
            set(toolArray(nextFocusedTool).toolIdHandle,'BackgroundColor', 'red', 'Color', 'white');
        end        
        set( src, 'UserData', toolArray );
        
    else
        appDataStruct = appDataStructAux;
    end        
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: ButtonUpCallback
% 
% PURPOSE: Service routine to ButtonUp event.
% 
% INPUT ARGUMENTS:
%                   
% OUTPUT ARGUMENTS: 
%                   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ButtonUpCallback(src, ~)

global appDataStruct
if isempty(appDataStruct), return; end

% if strcmp(appDataStruct.pointerArea, 'insideMagnifier')
%     %Refresh zooming on secondary axis, based on magnifier position and extend
%     refreshSecondaryAxisLimits();   
% end

appDataStruct.ButtonDown = false;

toolArray = get(src, 'userdata');
%focusedTool = find([toolArray.focusOnThisTool] == 1);
toolArray([toolArray.focusOnThisTool] == 1).ButtonDown = false;
set(src, 'userdata', toolArray);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: DeleteCallback
% 
% PURPOSE: Service routine to Delete event.
% 
% INPUT ARGUMENTS:
%                   
% OUTPUT ARGUMENTS: 
%                   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function DeleteCallback(src, ~)

global appDataStruct
if isempty(appDataStruct), return; end

toolArray = get(src, 'UserData');

%Recover old callback handles from the first instance
set( src, 'WindowButtonDownFcn', toolArray(1).figureOldWindowButtonDownFcn );
set( src, 'WindowButtonUpFcn', toolArray(1).figureOldWindowButtonUpFcn );
set( src, 'WindowButtonMotionFcn', toolArray(1).figureOldWindowButtonMotionFcn );
set( src, 'KeyPressFcn', toolArray(1).figureOldKeyPressFcn );
set( src, 'DeleteFcn', toolArray(1).figureOldDeleteFcn );
set( src, 'ResizeFcn', toolArray(1).figureOldResizeFcn );

%Clear global variable when figure is closed
clear global appDataStructuct;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: getPointerPositionOnFigureFrame
% 
% PURPOSE: determine if the position of the mouse pointer on the figure frame, in pixels.
% 
% INPUT ARGUMENTS:
%                   none
% OUTPUT ARGUMENTS: 
%                   pointerPositionOnFigureFrame [double 1x2]: (X Y)
%                   position
%                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pointerPositionOnFigureFrame = getPointerPositionOnFigureFrame()

global appDataStruct
if isempty(appDataStruct), return; end

%Get position of mouse pointer on screen
defaultUnits = get(appDataStruct.figureHandle,'Units');
set(appDataStruct.figureHandle, 'Units', 'pixels');
pointerPositionOnFigureFrame = get(appDataStruct.figureHandle,'CurrentPoint');
set(appDataStruct.figureHandle, 'Units', defaultUnits);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: getPointerArea
% 
% PURPOSE: determine if the mouse pointer is on an active area. Change
% pointer image if this is the case, and communicate the status.
% 
% INPUT ARGUMENTS:
%                   appDataStructuct [struct 1x1]: global variable
% OUTPUT ARGUMENTS: 
%                   change image of pointer (ACTION)
%                   appDataStructuct.pointerArea: ID of the active area
%                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function getPointerArea()

global appDataStruct
if isempty(appDataStruct), return; end

%Get current pointer position on figure frame
pointerPositionOnFigureFrame = getPointerPositionOnFigureFrame();
%Get current secondaryAxes position
secondaryAxesPosition = getSecondaryAxesPositionInPixels();
%Get current magnifier position
magnifierPosition = getMagnifierPositionInPixels();

%If mouse pointer on the secondary axis
if isinside(pointerPositionOnFigureFrame, secondaryAxesPosition)
    %Pointer inside secondary axis
    set(appDataStruct.figureHandle, 'Pointer', 'fleur');
    appDataStruct.pointerArea = 'insideSecondaryAxis';
    
elseif isinside(pointerPositionOnFigureFrame, magnifierPosition)
    %Pointer inside magnifier
    set(appDataStruct.figureHandle, 'Pointer', 'fleur');
    appDataStruct.pointerArea = 'insideMagnifier';
     
else
    %Otherwise
    set(appDataStruct.figureHandle, 'Pointer', 'arrow');
    appDataStruct.pointerArea = 'none';
end
function inside = isinside(point, corners)
if all(point >= corners([1,2])) && all(point <= corners([1,2])+ corners([3,4]))
    inside = true;
    return
end
inside = false;
return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: getFigurePositionInPixels
% 
% PURPOSE: obtain the position and size of the figure, relative to the
% lower left corner of the screen, in pixels.
% 
% INPUT ARGUMENTS:
%                   none
% OUTPUT ARGUMENTS: 
%                   position [double 1x4]: 
%                               X of lower left corner of the figure frame
%                               Y of lower left corner of the figure frame
%                               Width of the figure frame
%                               Height of the figure frame
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function position = getFigurePositionInPixels()

global appDataStruct
if isempty(appDataStruct), return; end

defaultUnits = get(appDataStruct.figureHandle,'Units');
set(appDataStruct.figureHandle,'Units', 'pixels');
position = get(appDataStruct.figureHandle,'Position'); %pixels [ low bottom width height]
set(appDataStruct.figureHandle,'Units', defaultUnits);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: getMainAxesPositionInPixels
% 
% PURPOSE: obtain the position and size of the main axes, relative to the
% lower left corner of the figure, in pixels. This fucntion locates the
% lower-left corner of the displayed axes, accounting for all conditions of
% DataAspectRatio and PlotBoxAspectRatio.
% 
% INPUT ARGUMENTS:
%                   none
% OUTPUT ARGUMENTS: 
%                   position [double 1x4]: 
%                               X of lower left corner of the axis frame
%                               Y of lower left corner of the axis frame
%                               Width of the axis frame
%                               Height of the axis frame
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function position = getMainAxesPositionInPixels()

global appDataStruct
if isempty(appDataStruct), position=[]; return; end

%Characterize mainAxes in axes units
mainAxisXLim = get( appDataStruct.mainAxesHandle, 'XLim' );
mainAxisYLim = get( appDataStruct.mainAxesHandle, 'YLim' );

%Capture default units of mainAxes, and fix units to 'pixels'
defaultUnits = get(appDataStruct.mainAxesHandle,'Units');
set(appDataStruct.mainAxesHandle, 'Units', 'pixels');

%Obtain values in 'pixels'
mainAxesPosition = get(appDataStruct.mainAxesHandle, 'Position');
dataAspectRatioMode  = get(appDataStruct.mainAxesHandle, 'DataAspectRatioMode');
dataAspectRatio = get(appDataStruct.mainAxesHandle, 'DataAspectRatio');
plotBoxAspectRatioMode = get(appDataStruct.mainAxesHandle, 'PlotBoxAspectRatioMode');
plotBoxAspectRatio = get(appDataStruct.mainAxesHandle, 'PlotBoxAspectRatio');

%Determine correction values
dataAspectRatioLimits = (determineSpan(mainAxisXLim(1), mainAxisXLim(2) )/dataAspectRatio(1)) ...
    / (determineSpan(mainAxisYLim(1), mainAxisYLim(2))/dataAspectRatio(2));
plotBoxAspectRatioRelation = plotBoxAspectRatio(1)/plotBoxAspectRatio(2);
mainAxesRatio = mainAxesPosition(3)/mainAxesPosition(4);

%Id DataAspectRatio to auto and PlotBoxAspectRatio to auto

%Recover default units of mainAxes
position = mainAxesPosition;
if strcmpi( dataAspectRatioMode, 'manual')
    %If DataAspectRatio to manual
    if dataAspectRatioLimits <= mainAxesRatio
        position(3) = mainAxesPosition(4) * dataAspectRatioLimits;
        position(1) = mainAxesPosition(1) + (mainAxesPosition(3) - position(3))/2;
    else
        position(4) = mainAxesPosition(3) / dataAspectRatioLimits;
        position(2) = mainAxesPosition(2) + (mainAxesPosition(4) - position(4))/2;
    end
elseif strcmpi( plotBoxAspectRatioMode, 'manual')
    % Or PlotBoxAspectRatio to manual
    if plotBoxAspectRatioRelation <= mainAxesRatio
        position(3) = mainAxesPosition(4) * plotBoxAspectRatioRelation;
        position(1) = mainAxesPosition(1) + (mainAxesPosition(3) - position(3))/2;
    else
        position(4) = mainAxesPosition(3) / plotBoxAspectRatioRelation;
        position(2) = mainAxesPosition(2) + (mainAxesPosition(4) - position(4))/2;
    end
end

%Recover default units of mainAxes
set(appDataStruct.mainAxesHandle, 'Units', defaultUnits);

%Obtain 'real' position from a temporal axes
temporalAxes = axes('Visible', 'off');
set(temporalAxes, 'Units', 'pixels');
set(temporalAxes, 'Position', position );
position = get(temporalAxes, 'Position');
delete(temporalAxes);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: getMagnifierPositionInPixels
% 
% PURPOSE: obtain the position (of the lower left corner) and size of the 
% magnifier, relative to the lower left corner of the figure, in pixels.
% 
% INPUT ARGUMENTS:
%                   none
% OUTPUT ARGUMENTS: 
%                   position [double 1x4]: 
%                               X of lower left corner of the magnifier
%                               Y of lower left corner of the magnifier
%                               Width of the magnifier
%                               Height of the magnifier
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function position = getMagnifierPositionInPixels()

global appDataStruct
if isempty(appDataStruct), position=[]; return; end

defaultUnits = get(appDataStruct.magnifierHandle, 'Units');
set(appDataStruct.magnifierHandle, 'Units', 'pixels');
position = get(appDataStruct.magnifierHandle, 'Position');
set(appDataStruct.magnifierHandle, 'Units', defaultUnits );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: getSecondaryAxesPositionInPixels
% 
% PURPOSE: obtain the position and size of the secondary axis, relative to the
% lower left corner of the figure, in pixels. Includes legends and axes
% numbering
% 
% INPUT ARGUMENTS:
%                   none
% OUTPUT ARGUMENTS: 
%                   position [double 1x4]: 
%                               X of lower left corner of the axis frame
%                               Y of lower left corner of the axis frame
%                               Width of the axis frame
%                               Height of the axis frame
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function position = getSecondaryAxesPositionInPixels()

global appDataStruct
if isempty(appDataStruct), position=[]; return; end

defaultUnits = get(appDataStruct.secondaryAxesHandle,'Units'); 
set(appDataStruct.secondaryAxesHandle,'Units', 'pixels'); 
position = get(appDataStruct.secondaryAxesHandle,'Position'); %[ left bottom width height]
set(appDataStruct.secondaryAxesHandle,'Units', defaultUnits); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: setSecondaryAxesPositionInPixels
% 
% PURPOSE: fix the position and size of the secondary axis, relative to the
% lower left corner of the figure, in pixels. 
% 
% INPUT ARGUMENTS:
%                   position [double 1x4]: 
%                               X of lower left corner of the axis frame
%                               Y of lower left corner of the axis frame
%                               Width of the axis frame
%                               Height of the axis frame
% OUTPUT ARGUMENTS: 
%                   none     
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function setSecondaryAxesPositionInPixels( position )

global appDataStruct
if isempty(appDataStruct), return; end

%Get position of secondary axes
defaultUnits = get(appDataStruct.secondaryAxesHandle,'Units');
set(appDataStruct.secondaryAxesHandle, 'Units', 'pixels');
set(appDataStruct.secondaryAxesHandle, 'Position', position); 
% tightInset = get( appDataStruct.secondaryAxes.handle, 'TightInset' ); 
set(appDataStruct.secondaryAxesHandle,'Units', defaultUnits);

%Update appDataStruct
appDataStruct.secondaryAxesPosition = getSecondaryAxesPositionInPixels();

%Update 'userdata'
toolArray = get(appDataStruct.figureHandle, 'userdata');
if ~isempty(toolArray)
    %focusedTool = find([toolArray.focusOnThisTool] == 1);
    toolArray([toolArray.focusOnThisTool] == 1).secondaryAxesPosition = appDataStruct.secondaryAxesPosition;
    set(appDataStruct.figureHandle, 'userdata', toolArray);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: setMagnifierPositionInPixels
% 
% PURPOSE: fix the position and size of the magnifier, relative to the
% lower left corner of the figure, in pixels. 
% 
% INPUT ARGUMENTS:
%                   position [double 1x4]: 
%                               X of lower left corner of the magnifier
%                               Y of lower left corner of the magnifier
%                               Width of the magnifier frame
%                               Height of the magnifier frame
% OUTPUT ARGUMENTS: 
%                   none     
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function setMagnifierPositionInPixels( position )

global appDataStruct
if isempty(appDataStruct), return; end

%Limit position of magnifier within the main axes
mainAxesPosition = getMainAxesPositionInPixels();
if position(1)<mainAxesPosition(1)
    position(1) = mainAxesPosition(1);
elseif position(1)+position(3)>mainAxesPosition(1)+mainAxesPosition(3)
    position(1) = mainAxesPosition(1)+mainAxesPosition(3)-position(3);
end
if position(2)<mainAxesPosition(2)
    position(2) = mainAxesPosition(2);
elseif position(2)+position(4)>mainAxesPosition(2)+mainAxesPosition(4)
    position(2) = mainAxesPosition(2)+mainAxesPosition(4)-position(4);
end

%Create of set magnifier
if isempty(appDataStruct.magnifierHandle) 
   
    if strcmpi(appDataStruct.magnifierShape, 'rectangle')
        appDataStruct.magnifierHandle = ...
                       annotation(  'rectangle',...
                                    'Units', 'pixels',...
                                    'Position', position,...
                                    'LineWidth', appDataStruct.globalEdgeWidth,...
                                    'LineStyle', '-',...
                                    'EdgeColor', appDataStruct.globalEdgeColor...                                
                                    );
    end
    if strcmpi(appDataStruct.magnifierShape, 'ellipse')
        appDataStruct.magnifierHandle = ...
                       annotation(  'ellipse',...
                                    'Units', 'pixels',...
                                    'Position', position,...
                                    'LineWidth', appDataStruct.globalEdgeWidth,...
                                    'LineStyle', '-',...
                                    'EdgeColor', appDataStruct.globalEdgeColor...                                
                                    );
    end
    
else
   set( appDataStruct.magnifierHandle,...
        'Position', position,...
        'LineWidth', appDataStruct.globalEdgeWidth,...
        'EdgeColor', appDataStruct.globalEdgeColor ); 
end   

%Update appDataStruct
appDataStruct.magnifierPosition = getMagnifierPositionInPixels();

%Update 'userdata'
toolArray = get(appDataStruct.figureHandle, 'userdata');
if ~isempty(toolArray)
    %focusedTool = find([toolArray.focusOnThisTool] == 1);
    toolArray([toolArray.focusOnThisTool] == 1).magnifierPosition = appDataStruct.magnifierPosition;
    set(appDataStruct.figureHandle, 'userdata', toolArray);
end

         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: refreshMagnifierToSecondaryAxesLink
% 
% PURPOSE: Updates the line connection between the magnifier and the secondary axes.
% 
% INPUT ARGUMENTS:
%
% OUTPUT ARGUMENTS: 
%                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function refreshMagnifierToSecondaryAxesLink()
        
global appDataStruct
if isempty(appDataStruct), return; end

%Don't display link if not requestred
linkStyle = appDataStruct.linkDisplayStyle;
if strcmpi( linkStyle(1), 'none')
    return
end

%Get position and size of figure in pixels
figurePosition = getFigurePositionInPixels();

%Get position and size of secondary axes in pixels
secondaryAxesPosition = getSecondaryAxesPositionInPixels();

defaultUnits = get(appDataStruct.secondaryAxesHandle, 'Units');
set(appDataStruct.secondaryAxesHandle, 'Units', 'pixels');
tightInset = get(appDataStruct.secondaryAxesHandle, 'TightInset');
set(appDataStruct.secondaryAxesHandle, 'Units', defaultUnits);

%Get position and size of secondary axes in pixels
magnifierPosition = getMagnifierPositionInPixels();

if strcmpi( linkStyle, 'straight')

    %Magnifier Hot points
    magnifierHotPoints = [...
        magnifierPosition(1) + magnifierPosition(3)/2   magnifierPosition(2);...
        magnifierPosition(1) + magnifierPosition(3)     magnifierPosition(2)+magnifierPosition(4)/2;...
        magnifierPosition(1) + magnifierPosition(3)/2   magnifierPosition(2)+magnifierPosition(4);...
        magnifierPosition(1)                            magnifierPosition(2)+magnifierPosition(4)/2;...
        ];

    %Secondary axes Hot points
    secondaryAxesHotPoints = [...
        secondaryAxesPosition(1) + secondaryAxesPosition(3)/2   secondaryAxesPosition(2) - tightInset(2) - 2;...
        secondaryAxesPosition(1) + secondaryAxesPosition(3)     secondaryAxesPosition(2)+secondaryAxesPosition(4)/2;...
        secondaryAxesPosition(1) + secondaryAxesPosition(3)/2   secondaryAxesPosition(2)+secondaryAxesPosition(4);...    
        secondaryAxesPosition(1) - tightInset(1) - 2            secondaryAxesPosition(2)+secondaryAxesPosition(4)/2;...    
        ];
    
    %Minimize distance between hot spots
    L1 = size(magnifierHotPoints, 1);
    L2 = size(secondaryAxesHotPoints, 1);
    [iMagnifierHotPoints, iSecondaryAxesHotPoints] = meshgrid(1:L1, 1:L2);
    D2  =   ( magnifierHotPoints(iMagnifierHotPoints(:),1) - secondaryAxesHotPoints(iSecondaryAxesHotPoints(:), 1) ).^2 + ...
            ( magnifierHotPoints(iMagnifierHotPoints(:),2) - secondaryAxesHotPoints(iSecondaryAxesHotPoints(:), 2) ).^2;

    [~, I] = sort( D2, 'ascend' );

    X(1) = magnifierHotPoints(iMagnifierHotPoints(I(1)), 1);
    Y(1) = magnifierHotPoints(iMagnifierHotPoints(I(1)), 2);
    X(2) = secondaryAxesHotPoints(iSecondaryAxesHotPoints(I(1)), 1);
    Y(2) = secondaryAxesHotPoints(iSecondaryAxesHotPoints(I(1)), 2);
    
    %Plot/update line
    if isempty(appDataStruct.linkHandle)
        appDataStruct.linkHandle = annotation(  'line', X/figurePosition(3), Y/figurePosition(4),...
                                                'LineWidth', appDataStruct.globalEdgeWidth,...
                                                'Color', appDataStruct.globalEdgeColor );
    else
        set(appDataStruct.linkHandle,   'X', X/figurePosition(3), 'Y', Y/figurePosition(4),...
                                        'LineWidth', appDataStruct.globalEdgeWidth,...
                                        'Color', appDataStruct.globalEdgeColor );
    end
end

if strcmpi( linkStyle, 'edges')
    %Magnifier Hot points
    magnifierHotPoints = [...
        magnifierPosition(1) - 3                            magnifierPosition(2);...
        magnifierPosition(1) + magnifierPosition(3)     magnifierPosition(2);...    
        magnifierPosition(1) + magnifierPosition(3)     magnifierPosition(2)+magnifierPosition(4);...    
        magnifierPosition(1) - 3                           magnifierPosition(2)+magnifierPosition(4)...
        ];

    %Secondary axes Hot points
    secondaryAxesHotPoints = [...
        secondaryAxesPosition(1)                                secondaryAxesPosition(2);...
        secondaryAxesPosition(1) + secondaryAxesPosition(3)     secondaryAxesPosition(2);...
        secondaryAxesPosition(1) + secondaryAxesPosition(3)     secondaryAxesPosition(2)+secondaryAxesPosition(4);...
        secondaryAxesPosition(1)                                secondaryAxesPosition(2)+secondaryAxesPosition(4)...
        ];
    
    
    for i=1:4
        X(1) = magnifierHotPoints(i,1);
        Y(1) = magnifierHotPoints(i,2);
        X(2) = secondaryAxesHotPoints(i,1);
        Y(2) = secondaryAxesHotPoints(i,2);

        %If intersection with secondary Axes bottom edge
%         intersectionPoint = intersectionPointInPixels(...
%                     [X(1) Y(1) X(2) Y(2)], ...
%                     [secondaryAxesPosition([1, 2]), secondaryAxesPosition([1, 2])] + ...
%                     [0, 0, secondaryAxesPosition(3), 0] );
%         if ~isempty(intersectionPoint)                      
%             D2_1 = (X(1)-X(2))^2 + (Y(1)-Y(2))^2;
%             D2_2 = (X(1)-intersectionPoint(1))^2 + (Y(1)-intersectionPoint(2))^2;
%             if D2_2<D2_1
%                 %link to intersecting point
%                 X(2) = intersectionPoint(1);
%                 Y(2) = intersectionPoint(2);
%             end
%         end  
% 
%         %If intersection with secondary Axes top edge
%         intersectionPoint = intersectionPointInPixels(...
%                     [X(1) Y(1) X(2) Y(2)], ...
%                     [secondaryAxesPosition([1, 2]), secondaryAxesPosition([1, 2])] +...
%                     [0, secondaryAxesPosition([4, 3, 4])] );
%         if ~isempty(intersectionPoint)
%             D2_1 = (X(1)-X(2))^2 + (Y(1)-Y(2))^2;
%             D2_2 = (X(1)-intersectionPoint(1))^2 + (Y(1)-intersectionPoint(2))^2;
%             if D2_2<D2_1
%                 %link to intersecting point
%                 X(2) = intersectionPoint(1);
%                 Y(2) = intersectionPoint(2);
%             end
%         end 
% 
%         %If intersection with secondary Axes left edge
%         intersectionPoint = intersectionPointInPixels(...
%                     [X(1) Y(1) X(2) Y(2)], ...
%                     [secondaryAxesPosition(1), secondaryAxesPosition(1)] + ...
%                     [0, 0, 0, secondaryAxesPosition(4) ] );
%         if ~isempty(intersectionPoint)
%             D2_1 = (X(1)-X(2))^2 + (Y(1)-Y(2))^2;
%             D2_2 = (X(1)-intersectionPoint(1))^2 + (Y(1)-intersectionPoint(2))^2;
%             if D2_2<D2_1
%                 %link to intersecting point
%                 X(2) = intersectionPoint(1);
%                 Y(2) = intersectionPoint(2);
%             end
%         end 
% 
%         %If intersection with secondary Axes right edge
%         intersectionPoint = intersectionPointInPixels(...
%                     [X(1) Y(1) X(2) Y(2)], ...
%                     [secondaryAxesPosition([1,2]), secondaryAxesPosition([1,2])] + ...
%                     [secondaryAxesPosition(3), 0, secondaryAxesPosition([3, 4]) ] );
%         if ~isempty(intersectionPoint)
%             D2_1 = (X(1)-X(2))^2 + (Y(1)-Y(2))^2;
%             D2_2 = (X(1)-intersectionPoint(1))^2 + (Y(1)-intersectionPoint(2))^2;
%             if D2_2<D2_1
%                 %link to intersecting point
%                 X(2) = intersectionPoint(1);
%                 Y(2) = intersectionPoint(2);
%             end
%         end 

        %Plot/update line
        if isempty( appDataStruct.linkHandle )
            newlinkHandle = annotation(     'line', X/figurePosition(3), Y/figurePosition(4),...
                                            'LineWidth', appDataStruct.globalEdgeWidth,...
                                            'LineStyle', ':',...
                                            'Color', appDataStruct.globalEdgeColor );
            linkHandle  = appDataStruct.linkHandle;
            appDataStruct.linkHandle = [linkHandle newlinkHandle];
        
        else
            linkHandle = appDataStruct.linkhandle;
            set( linkHandle(i), 'X', X/figurePosition(3), 'Y', Y/figurePosition(4),...
                                'LineWidth', appDataStruct.globalEdgeWidth,...
                                'Color', appDataStruct.globalEdgeColor ); 
        end
        
    end
end

if strcmpi( linkStyle, 'elbow')

    %Magnifier Hot points
    magnifierHotPoints = [...
        magnifierPosition(1) + magnifierPosition(3)/2   magnifierPosition(2);...
        magnifierPosition(1) + magnifierPosition(3)     magnifierPosition(2)+magnifierPosition(4)/2;...
        magnifierPosition(1) + magnifierPosition(3)/2   magnifierPosition(2)+magnifierPosition(4);...
        magnifierPosition(1)                            magnifierPosition(2)+magnifierPosition(4)/2;...
        ];

    %Secondary axes Hot points
    secondaryAxesHotPoints = [...
        secondaryAxesPosition(1) + secondaryAxesPosition(3)/2   secondaryAxesPosition(2) - tightInset(2) - 2;...
        secondaryAxesPosition(1) + secondaryAxesPosition(3)     secondaryAxesPosition(2)+secondaryAxesPosition(4)/2;...
        secondaryAxesPosition(1) + secondaryAxesPosition(3)/2   secondaryAxesPosition(2)+secondaryAxesPosition(4);...    
        secondaryAxesPosition(1) - tightInset(1) - 2            secondaryAxesPosition(2)+secondaryAxesPosition(4)/2;...    
        ];
    
    
    %Allowed connections
%     iMagnifierHotPoints(1) = 1; 
%     iSecondaryAxesHotPoints(1) = 4;
%     iMagnifierHotPoints(2) = 1; 
%     iSecondaryAxesHotPoints(2) = 2;
%     iMagnifierHotPoints(3) = 2; 
%     iSecondaryAxesHotPoints(3) = 3;
%     iMagnifierHotPoints(4) = 2; 
%     iSecondaryAxesHotPoints(4) = 1;
%     iMagnifierHotPoints(5) = 3; 
%     iSecondaryAxesHotPoints(5) = 4;
%     iMagnifierHotPoints(6) = 3; 
%     iSecondaryAxesHotPoints(6) = 2;
%     iMagnifierHotPoints(7) = 4; 
%     iSecondaryAxesHotPoints(7) = 1;
%     iMagnifierHotPoints(8) = 4; 
%     iSecondaryAxesHotPoints(8) = 3;
%     iMagnifierHotPoints(9) = 1; 
%     iSecondaryAxesHotPoints(9) = 3;
%     iMagnifierHotPoints(10) = 2; 
%     iSecondaryAxesHotPoints(10) = 4;
%     iMagnifierHotPoints(11) = 3; 
%     iSecondaryAxesHotPoints(11) = 1;
%     iMagnifierHotPoints(12) = 4; 
%     iSecondaryAxesHotPoints(12) = 2;
    
    %Minimize distance between hot spots
    L1 = size(magnifierHotPoints, 1);
    L2 = size(secondaryAxesHotPoints, 1);
    [iMagnifierHotPoints, iSecondaryAxesHotPoints] = meshgrid(1:L1, 1:L2);
    D2  =   ( magnifierHotPoints(iMagnifierHotPoints(:),1) - secondaryAxesHotPoints(iSecondaryAxesHotPoints(:),1) ).^2 + ...
            ( magnifierHotPoints(iMagnifierHotPoints(:),2) - secondaryAxesHotPoints(iSecondaryAxesHotPoints(:),2) ).^2;

    [~, I] = sort( D2, 'ascend' );

    X(1) = magnifierHotPoints(iMagnifierHotPoints(I(1)),1);
    Y(1) = magnifierHotPoints(iMagnifierHotPoints(I(1)),2);
    X(2) = secondaryAxesHotPoints(iSecondaryAxesHotPoints(I(1)),1);
    Y(2) = secondaryAxesHotPoints(iSecondaryAxesHotPoints(I(1)),2);
    
    %Plot/update line
    if isempty( appDataStruct.linkHandle )
        newlinkHandle = annotation(    'line', X/figurePosition(3), Y/figurePosition(4),...
                                                'LineWidth', appDataStruct.globalEdgeWidth,...
                                                'Color', appDataStruct.globalEdgeColor );
        linkHandle  = appDataStruct.linkHandle;
        appDataStruct.linkHandle = [linkHandle newlinkHandle];
        
    else
        linkHandle = appDataStruct.linkhandle;
        set( linkHandle,    'X', X/figurePosition(3), 'Y', Y/figurePosition(4),...
                            'LineWidth', appDataStruct.globalEdgeWidth,...
                            'Color', appDataStruct.globalEdgeColor ); 

    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: intersectionPointInPixels
% 
% PURPOSE: Computes constrained intersection of two lines in pixels, on the 2D space
% 
% INPUT ARGUMENTS:
%                   line1 [double 1x4]: [Xstart Ystart Xend Yend]
%                   line2 [double 1x4]: [Xstart Ystart Xend Yend]
%
% OUTPUT ARGUMENTS: 
%                   intersectionPont [double 1x2]: [X Y] intersection
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function intersectionPoint = intersectionPointInPixels( line1, line2)
                    
%Cartessian caracterization of line 1          
X1(1) = line1(1);
Y1(1) = line1(2); 
X1(2) = line1(3);
Y1(2) = line1(4); 

a1 = (Y1(2) - Y1(1)) / (X1(2) - X1(1));
b1 = Y1(1) - X1(1)*a1;

%Cartessian caracterization of line 2              
X2(1) = line2(1);
Y2(1) = line2(2); 
X2(2) = line2(3);
Y2(2) = line2(4); 

a2 = (Y2(2) - Y2(1)) / (X2(2) - X2(1));
b2 = Y2(1) - X2(1)*a2;

%Intersection
if isfinite(a1) && isfinite(a2)
    intersectionPoint(1) = (b2-b1) / (a1-a2);
    intersectionPoint(2) = intersectionPoint(1)*a1 + b1;
end
%Pathologic case 1 (line2 x=constant)
if isfinite(a1) && ~isfinite(a2)
    intersectionPoint(1) = X2(1);
    intersectionPoint(2) = intersectionPoint(1)*a1 + b1;
end
%Pathologic case 2 (line1 x=constant)
if ~isfinite(a1) && isfinite(a2)
    intersectionPoint(1) = X1(1);
    intersectionPoint(2) = intersectionPoint(1)*a2 + b2;
end

if ~isinside(intersectionPoint, [X1, Y1, X2, Y2])
    intersectionPoint = [];
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: computeSecondaryAxesDefaultPosition
% 
% PURPOSE: obtain the default position and size of the secondary axis, relative to the
% lower left corner of the figure, in pixels. Includes legends and axes
% numbering
% 
% INPUT ARGUMENTS:
%                   none
% OUTPUT ARGUMENTS: 
%                   position [double 1x4]: 
%                               X of lower left corner of the axis frame
%                               Y of lower left corner of the axis frame
%                               Width of the axis frame
%                               Height of the axis frame
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function secondaryAxisPosition = computeSecondaryAxesDefaultPosition()

global appDataStruct
if isempty(appDataStruct), secondaryAxisPosition=[]; return; end

% If image, defualt aspect ratio of magnifier and secondary axes to [1, 1]
childHandle = get(appDataStruct.mainAxesHandle, 'Children');
plotFlag = ~isempty( find(strcmpi(get(childHandle, 'Type'), 'line'), 1) );
imageFlag = ~isempty( find(strcmpi(get(childHandle, 'Type'), 'image'), 1) );

%Get position and size of main Axis (left & bottom relative to figure frame)
mainAxesPosition = getMainAxesPositionInPixels();

if plotFlag
    %Set initial position and size for secondary axis
    secondaryAxisPosition([3, 4]) = mainAxesPosition([3, 4])* 0.3;
    secondaryAxisPosition([1, 2]) = mainAxesPosition([1, 2]) + ...
        mainAxesPosition([3, 4]) - secondaryAxisPosition([3, 4]) -10;
else%if imageFlag
    %Set initial position and size for secondary axis
    secondaryAxisPosition([3, 4]) = mainAxesPosition([3, 4])* 0.3;
    secondaryAxisPosition([1, 2]) = mainAxesPosition([1, 2]) + ...
        mainAxesPosition([3, 4]) - secondaryAxisPosition([3, 4]) -10;
end
                        
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: computeMagnifierDefaultPosition
% 
% PURPOSE: obtain the default position and size of the magnifier, relative to the
% lower left corner of the figure, in pixels. Includes legends and axes
% numbering
% 
% INPUT ARGUMENTS:
%                   none
% OUTPUT ARGUMENTS: 
%                   position [double 1x4]: 
%                               X of lower left corner of the rectangle
%                               Y of lower left corner of the rectangle
%                               Width of the rectangle
%                               Height of the rectangle
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function defaultPosition = computeMagnifierDefaultPosition()

global appDataStruct
if isempty(appDataStruct), defaultPosition=[]; return; end

% If image, defualt aspect ratio of magnifier and secondary axes to [1, 1]
childHandle = get(appDataStruct.mainAxesHandle, 'Children');
plotFlag = ~isempty( find(strcmpi(get(childHandle, 'Type'), 'line'), 1) );
imageFlag = ~isempty( find(strcmpi(get(childHandle, 'Type'), 'image'), 1) );

%Set initial position and size of magnifying rectangle
mainAxisXLim = get( appDataStruct.mainAxesHandle, 'XLim' );
mainAxisYLim = get( appDataStruct.mainAxesHandle, 'YLim' );
mainAxesPositionInPixels = getMainAxesPositionInPixels();
xMainAxisUnits2PixelsFactor = mainAxesPositionInPixels(3)/determineSpan( mainAxisXLim(1), mainAxisXLim(2) );
yMainAxisUnits2PixelsFactor = mainAxesPositionInPixels(4)/determineSpan( mainAxisYLim(1), mainAxisYLim(2) );

if plotFlag
    %Get main axis position and dimensions, in pixels
    magnifierPosition_W = determineSpan(mainAxisXLim(1), mainAxisXLim(2))*xMainAxisUnits2PixelsFactor*0.1;                        
    magnifierPosition_H = determineSpan(mainAxisYLim(1), mainAxisYLim(2))*yMainAxisUnits2PixelsFactor*0.3;     
    magnifierPosition_X = determineSpan(mean(mainAxisXLim), mainAxisXLim(1))*xMainAxisUnits2PixelsFactor - magnifierPosition_W/2;
    magnifierPosition_Y = determineSpan(mean(mainAxisYLim), mainAxisYLim(1))*yMainAxisUnits2PixelsFactor - magnifierPosition_H/2;
else
    %Get main axis position and dimensions, in pixels
    magnifierPosition_W = determineSpan(mainAxisXLim(1), mainAxisXLim(2))*xMainAxisUnits2PixelsFactor*0.1;                        
    magnifierPosition_H = determineSpan(mainAxisYLim(1), mainAxisYLim(2))*yMainAxisUnits2PixelsFactor*0.1;  
    magnifierPosition_X = determineSpan(mean(mainAxisXLim), mainAxisXLim(1))*xMainAxisUnits2PixelsFactor - magnifierPosition_W/2;
    magnifierPosition_Y = determineSpan(mean(mainAxisYLim), mainAxisYLim(1))*yMainAxisUnits2PixelsFactor - magnifierPosition_H/2;
end

defaultPosition = [magnifierPosition_X, magnifierPosition_Y, ...
                magnifierPosition_W, magnifierPosition_H] + [mainAxesPositionInPixels([1, 2]), 0, 0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: initializeToolStruct
% 
% PURPOSE: Set value for default properties
% 
% INPUT ARGUMENTS:
%                   none
% OUTPUT ARGUMENTS: 
%                   none
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                    
function obj = initializeToolStruct(varargin)

    if nargin == 0
        obj.toolId = [];
        obj.focusOnThisTool = true;
        obj.toolIdHandle = [];

        %figure
        obj.figureHandle = []; 
        obj.figurePosition = [];
        obj.figureOldWindowButtonDownFcn = [];
        obj.figureOldWindowButtonUpFcn = [];
        obj.figureOldWindowButtonMotionFcn = [];
        obj.figureOldKeyPressFcn = [];
        obj.figureOldDeleteFcn = [];
        obj.figureOldResizeFcn = [];                

        %main axes
        obj.mainAxesHandle = [];  

        %magnifier
        obj.magnifierHandle = [];
        obj.magnifierPosition = [];
        obj.magnifierShape = 'rectangle';                

        %link
        obj.linkHandle = [];
        obj.linkDisplayStyle = 'straight';

        %secondary axes
        obj.secondaryAxesHandle = [];
        obj.secondaryAxesFaceColor = 'white';
        obj.secondaryAxesPosition = [];
        obj.secondaryAxesXLim = [];
        obj.secondaryAxesYLim = [];
        obj.secondaryAxesZoomingFactor = [1, 1];

        %global
        obj.globalUnits = 'pixels';
        obj.globalMode = 'interactive';
        obj.globalEdgeWidth = 1;
        obj.globalEdgeColor = 'black';
        obj.globalZoomMode = 'off';                           

        %Temp
        obj.pointerArea = 'none';
        obj.ButtonDown = false;
        obj.pointerPositionOnButtonDown = [];
    end
    
    if nargin == 1 && isstruct(varargin{1})
        structIn = varargin{1};
        if all(isfield(structIn, {'toolId','focusOnThisTool',...
            'figureHandle', 'figurePosition', 'figureOldWindowButtonDownFcn',...
            'figureOldWindowButtonUpFcn', 'figureOldWindowButtonMotionFcn',...
            'figureOldKeyPressFcn', 'figureOldDeleteFcn', 'figureOldResizeFcn',...
            'mainAxesHandle', 'magnifierHandle', 'magnifierPosition', ...
            'magnifierShape', 'linkHandle', 'linkDisplayStyle', 'secondaryAxesHandle',...
            'secondaryAxesFaceColor', 'secondaryAxesPosition', 'secondaryAxesXLim',...
            'secondaryAxesYLim', 'secondaryAxesZoomingFactor', ...
            'globalUnits', 'globalMode', 'globalEdgeWidth', 'globalEdgeColor',...
            'globalZoomMode', 'pointerArea', 'ButtonDown', 'pointerPositionOnButtonDown'}))
            
        else
            error('Input structure not recognized');
        end
        
        obj = structIn;    
       
    end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: updateToolId
% 
% PURPOSE: Updated position and status of tool id
% 
% INPUT ARGUMENTS:
%                   toolArray structure of the tool in focus
% OUTPUT ARGUMENTS: 
%                   none
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
function toolArray = updateToolId( toolArray, toolNum, modeStr )

toolArray = toolArray(toolNum);
set(toolArray.figureHandle, 'currentAxes', toolArray.secondaryAxesHandle);

if strcmp(modeStr, 'toggle')
        if isempty(toolArray.toolIdHandle)
            modeStr = 'show';
        else
            modeStr = 'hide';
        end
end

switch modeStr
    case 'show'
            toolArray.toolIdHandle = text( ...
                mean(get(toolArray.secondaryAxesHandle, 'XLim')), ...
                mean(get(toolArray.secondaryAxesHandle, 'YLim')), ...
                num2str(toolNum));
            set(toolArray.toolIdHandle, 'FontSize', 30, 'FontWeight', 'bold' );
            if toolArray.focusOnThisTool
                set(toolArray.toolIdHandle,'BackgroundColor', 'red', 'Color', 'white');
            else
                set(toolArray.toolIdHandle,'BackgroundColor', 'black', 'Color', 'white');
            end
    case 'hide'
            delete(toolArray.toolIdHandle);
            toolArray.toolIdHandle = [];
    otherwise
        if not(isempty(toolArray.toolIdHandle))
            set(toolArray.toolIdHandle, 'Position', [ ...
                mean(get(toolArray.secondaryAxesHandle, 'XLim')), ...
                mean(get(toolArray.secondaryAxesHandle, 'YLim'))] );
            if toolArray.focusOnThisTool
                set(toolArray.toolIdHandle,'BackgroundColor', 'red', 'Color', 'white');
            else
                set(toolArray.toolIdHandle,'BackgroundColor', 'black', 'Color', 'white');
            end
        end
end

set(toolArray.figureHandle, 'currentAxes', toolArray.mainAxesHandle);
