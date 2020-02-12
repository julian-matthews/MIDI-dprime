%% MIDI-D': the metacognitive measure no-one asked for
% 
% Sonifies the relationship between accuracy and confidence data.
%
% INPUT(vectors):
% `signal` - ground-truth classified as present (1) or absent (0)
% `decision` - first-order judgments classified as present (1) or absent (0)
% `confidence` - integer confidence ratings, ideally from 1=low to 4=high
%
% MIDI-d' was developed with 4-level confidence ratings in mind and employs
% frequency-modulation to generate a complex harmonic waveform. It works
% with fewer levels but won't sound as harmonically rich. With more levels
% the timbre will become increasingly metallic.
%
% NOTE:
% MIDI-d' employs MATLAB's internal MIDI/audio tools , available in the
% MATLAB Audio Toolbox. There were substantial updates to Audio Toolbox in
% the MATLAB 2018a release. These permit MIDI send and receive messages, a
% requirement for MIDI-d' to work.
% tl;dr - you'll need Audio Toolbox in MATLAB 2018a or above
%
% MIDI-d' was developed with financial support from Melbourne-Monash
% Consciousness Research as part of the 'Music To My Ears' project:
% Julian Matthews, Mitch Catterall, Patrick Cooper, Thomas Andrillon, William Wong
%
% Visit MMCR (@MMConsciousness) on Twitter or Facebook to learn more.
%
% 02/2020 Julian Matthews (@quined_quales) made it
% 02/2020 Patrick Cooper (@neurocoops) tested it

function MIDIdprime( signal , decision , confidence )

dbstop if error

% Confirm inputs are vectors
if ~isvector(signal)
    disp('`signal` needs to be a vector');
elseif ~isvector(decision)
    disp('`decision` needs to be a vector');
elseif ~isvector(confidence)
    disp('`confidence` needs to be a vector');
end

if length(unique(confidence)) > 4
    disp('MIDIdprime works best with 4 confidence levels, see `notes`');
end

%% LET'S GET GOING
% Confirm inputs are same dimensions
if isequal(size(signal),size(decision)) && ...
        isequal(size(decision),size(confidence))
    
    % Confirm absolute confidence
    confidence = abs(confidence);
    
    % Play music through MATLAB's audioDeviceWriter
    deviceWriter = audioDeviceWriter('SampleRate',44100);
    
    % Preliminaries
    channel = 1;
    note = 64;
    velocity = 32;
    
    msg = midimsg('NoteOn',channel,note,velocity);
    amplitude = msg(1).Velocity/127;
    
    for trial = 1:length(signal)
        
        if isequal(signal(trial),decision(trial))
            frequency = [(440 * 2^((msg.Note-42)/12)),...
                (440 * 2^((msg.Note-90)/12)),...
                (440 * 2^((msg.Note-54)/12)),...
                (440 * 2^((msg.Note-66)/12)),...
                (440 * 2^((msg.Note-51)/6))];
            
            the_tones = confidence(trial) + 1;
            
        else
            frequency = [(440 * 2^((msg.Note-42)/32)),...
                (440 * 2^((msg.Note-54)/13)),...
                (440 * 2^((msg.Note-47)/20)),...
                (440 * 2^((msg.Note-66)/12)),...
                (440 * 2^((msg.Note-53)/6))];
            
            the_tones = confidence(trial);
        end
        
        osc = audioOscillator('SignalType','sine','Frequency',...
            frequency,'Amplitude',amplitude,'NumTones',the_tones,...
            'SampleRate',44100);
        
        tic
        if trial ~= length(signal)
            while toc < 0.2
                synthesizedAudio = osc();
                deviceWriter(synthesizedAudio);
            end
        else
            while toc < 0.65
                synthesizedAudio = osc();
                deviceWriter(synthesizedAudio);
            end
        end
        
    end
    
    release(deviceWriter)
    
else
    disp('One or more inputs have different dimensions, you''ll need to fix that');
end

end