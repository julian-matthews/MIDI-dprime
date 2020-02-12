![alt_text][logo]

# **MIDI-d'** - *The metacognitive measure that no-one asked for*

###### Julian Matthews, Mitch Catterall, Thomas Andrillon, Patrick Cooper, William Wong

***

## What is this?
`MIDI-d'` is a MATLAB function that sonifies the relationship between first-order and second-order behavioural judgments using [FM-synthesis](https://en.wikipedia.org/wiki/Frequency_modulation_synthesis). Metacognitive hits or misses of different magnitude are associated with increasingly complex tones. Hits build a rich harmonic and misses a dissonant clang.

## Background
`MIDI-d'` was developed with financial support from **Melbourne-Monash Consciousness Research** as part of the *Music To My Ears* project. Visit MMCR on [Twitter](https://twitter.com/MMConsciousness) or [Facebook](https://www.facebook.com/mmcr.edu.au/) to learn more.

## Required equipment

* [MATLAB 2018a or higher](https://www.mathworks.com/products/matlab.html)
* [Audio Toolbox](https://mathworks.com/products/audio.html)

## Getting started
Ensure `MIDIdprime.m` is in your current workspace or MATLAB Path. The function takes three vectors as inputs: 

1. `signal` - this is the "ground-truth" corresponding to whether the stimulus (stimulus feature) was present (`1`) or absent (`0`) on that trial. It's usually a vector of 1s and 0s that is as long as your trial sequence.
1. `decision` - these are your participant's first-order judgments of stimulus presence (`1`) or absence (`0`). It's usually a vector of 1s and 0s that is as long as your trial sequence (and therefore the same length as `signal`).
1. `confidence` - these are your participant`s second-order judgments, typically ratings of confidence or perceptual awareness. `MIDI-d'` was developed with 4 levels of confidence in mind (where 1=low and 4=high) but will work with more/fewer levels.

***

![alt_text][avatar]

[logo]: ../master/1500x1500.png "Melbourne Monash Consciousness Research"
[avatar]: https://avatars0.githubusercontent.com/u/18410581?v=3&s=96 "Julian Matthews"
