![alt_text][logo]

# `MIDI-d'`
#### [Julian Matthews](https://twitter.com/quined_quales), Mitch Catterall, [Thomas Andrillon](https://twitter.com/thandrillon), [Patrick Cooper](https://twitter.com/neurocoops), William Wong

***

###### *"The metacognitive measure that no-one asked for"*

***

![alt_text][MIDIdprime]

## What is this?
**`MIDI-d'`** is a MATLAB function that sonifies the relationship between first-order and second-order behavioural judgments using [additive synthesis](https://en.wikipedia.org/wiki/Additive_synthesis). Metacognitive hits or misses of different magnitude are associated with increasingly complex tones. Hits build a pleasant harmonic and misses a dissonant clang. 

Our hope is that by sonifying a sequence of behavioural trials you might detect patterns of confidence and/or accuracy that would not otherwise be obvious where they represented in other modalities.

## Background
**`MIDI-d'`** was developed with financial support from **Melbourne-Monash Consciousness Research** as part of the 'Music To My Ears' project. Visit **MMCR** on [Twitter](https://twitter.com/MMConsciousness) or [Facebook](https://www.facebook.com/mmcr.edu.au/) to learn more.

## Required equipment

* [MATLAB 2018a or higher](https://www.mathworks.com/products/matlab.html)
* [MATLAB Audio Toolbox](https://mathworks.com/products/audio.html)

## Getting started
Ensure [`MIDIdprime.m`](./MIDIdprime.m) is in your current workspace or MATLAB Path. The function takes three vectors as inputs: 

###### 1. `signal`
This is the "ground-truth" corresponding to whether the stimulus (or stimulus feature) was present (1) or absent (0) on that trial. It's usually a vector of 1s and 0s that is as long as your trial sequence.
###### 2. `decision`
These are your participant's first-order judgments of stimulus presence (1) or absence (0). It's usually a vector of 1s and 0s that is as long as your trial sequence (and therefore the same length as `signal`).
###### 3. `confidence`
These are your participant's second-order judgments, typically ratings of confidence or perceptual awareness. **`MIDI-d'`** was developed with four levels of confidence in mind (where 1=low and 4=high) but will work with more/fewer levels.

***

![alt_text][avatar]

[MIDIdprime]: ../master/wowzers.png "MIDI-d'"
[logo]: ../master/1500x500.jpeg "Melbourne Monash Consciousness Research"
[avatar]: https://avatars0.githubusercontent.com/u/18410581?v=3&s=96 "@quined_quales"
