function [d,ME] = IntializeDisplay(skipSyncTests)

if nargin == 0
    skipSyncTests = 0;
end
try
    Screen('Preference','SkipSyncTests',skipSyncTests)
    
    
    % Get the screen numbers
    screens = Screen('Screens');
    
    % Draw to the external screen if avaliable
    screenNumber = min(screens);
    
    % Define black and white
    white = WhiteIndex(screenNumber);
    black = BlackIndex(screenNumber);
    
    
    [window, windowRect] = PsychImaging('OpenWindow', screenNumber, black)
    
    [screenXpixels, screenYpixels] = Screen('WindowSize', window);
    [xCenter, yCenter] = RectCenter(windowRect);
    
    





d.window = window;
d.windoRect = windowRect;
d.screenNumber = screenNumber;
d.white = white;
d.black = black;
d.screenXpixels = screenXpixels;
d.screenYpixels = screenYpixels;
d.xCenter = xCenter;
d.yCenter = yCenter;

catch ME
    d = [];
    ME = ME;
    sca;
    ShowCursor;
end
ME = [];