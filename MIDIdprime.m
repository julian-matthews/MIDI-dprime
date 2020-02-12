function MIDIdprime( signal , decision , confidence )
%MIDIDPRIME: the metacognitive measure no-one asked for
%   Sonifies the relationship between accuracy and confidence data.
%
%   MIDIDPRIME(signal,decision,confidence) where args are vectors.
%
%   `signal` - ground-truth (e.g., present=1,absent=0)
%   `decision` - first-order judgments (e.g., present=1,absent=0)
%   `confidence` - confidence ratings (e.g., 1=low to 4=high)
%
%   MIDI-d' was developed with 4-level confidence ratings in mind but
%   employs additive synthesis to generate complex harmonic waveforms.
%   With a greater breadth of confidence ratings these waveforms will
%   become increasingly rich but also more challenging to distinguish.
%
%   MIDI-d' was developed with financial support from Melbourne-Monash
%   Consciousness Research as part of the 'Music To My Ears' project:
%   J.Matthews, M.Catterall, P.Cooper, T.Andrillon, W.Wong
%
%   Visit MMCR (@MMConsciousness) on Twitter or Facebook to learn more.
%
%   02/2020 Julian (@quined_quales) made it
%   02/2020 Patrick (@neurocoops) tested it

% Modify `harmonics` to increase/decrease the richness of the tones to taste
harmonics = 10;

% Confirm inputs are vectors
if ~isvector(signal)
    disp('`signal` needs to be a vector');
elseif ~isvector(decision)
    disp('`decision` needs to be a vector');
elseif ~isvector(confidence)
    disp('`confidence` needs to be a vector');
end

%% LET'S GET GOING
% Confirm inputs are same dimensions
if isequal(size(signal),size(decision)) && ...
        isequal(size(decision),size(confidence))
    
    % Confirm absolute confidence
    confidence = abs(confidence);
    
    % Play audio through MATLAB's audioDeviceWriter
    deviceWriter = audioDeviceWriter('SampleRate',44100);
    
    for trial = 1:length(signal)
        
        if isequal(signal(trial),decision(trial))
            % Build square wave from sines
            % Odd harmonics
            while 1
                temp = 1:2:((harmonics*confidence(trial))+1);
                if length(temp) < 200
                    break
                else
                    harmonics = harmonics-1;
                end
            end
        else
            % Build sawtooth wave from sines
            % Every harmonic
            while 1
                temp = 1:(harmonics*(confidence(trial))/2);
                if length(temp) < 200
                    break
                else
                    harmonics = harmonics-1;
                end
            end
        end
        
        frequency = temp*100;
        amplitude = 1./temp;
        
        osc = audioOscillator('SignalType','sine','Frequency',...
            frequency,'Amplitude',amplitude*.7,'NumTones',length(frequency),...
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