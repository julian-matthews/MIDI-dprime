![alt_text][logo]

# `MIDI-d'`

###### *"The metacognitive measure that no-one asked for"*

***

#### [Julian Matthews](https://twitter.com/quined_quales), Mitch Catterall, [Thomas Andrillon](https://twitter.com/thandrillon), [Patrick Cooper](https://twitter.com/neurocoops), William Wong

***

## What is this?
**`MIDI-d'`** is a MATLAB function that sonifies the relationship between first-order and second-order behavioural judgments using [additive synthesis](https://en.wikipedia.org/wiki/Additive_synthesis)*. Metacognitive hits or misses of different magnitude are associated with increasingly complex harmonic tones. Hits build a warm squarewave and misses a sharp sawtoothwave. 

Our hope is that by sonifying a sequence of behavioural trials you might detect patterns of confidence and/or accuracy that would not otherwise be obvious were they represented in other modalities.

## Background
**`MIDI-d'`** was developed with financial support from **Melbourne-Monash Consciousness Research** as part of the 'Music To My Ears' project. Visit **MMCR** on [Twitter](https://twitter.com/MMConsciousness) or [Facebook](https://www.facebook.com/mmcr.edu.au/) to learn more.

## Required equipment

* [MATLAB 2016a or higher](https://www.mathworks.com/products/matlab.html)

## Getting started
Ensure [`MIDIdprime.m`](./MIDIdprime.m) is in your current workspace or MATLAB Path. The function takes three vectors as inputs: 

###### 1. `signal`
This is the "ground-truth" corresponding to whether the stimulus (or stimulus feature) was present (1) or absent (0) on that trial. It's usually a vector of 1s and 0s that is as long as your trial sequence.
###### 2. `decision`
These are your participant's first-order judgments of stimulus presence (1) or absence (0). It's usually a vector of 1s and 0s that is as long as your trial sequence (and therefore the same length as `signal`).
###### 3. `confidence`
These are your participant's second-order judgments, typically ratings of confidence or perceptual awareness. **`MIDI-d'`** was developed with four levels of confidence in mind (where 1=low and 4=high) but will work with more/fewer levels due to some audio trickery.

## Testmode
To sample the eight tones generated during development of this function include an optional fourth argument (e.g., `MIDIdprime(1,1,1,1)`). This will generate each tone in sequence from a large metacognitive hit (high confidence correct response) to a large metacognitive miss (high confidence incorrect response), 

***

![alt_text][avatar]


###### *OK, sure, it's not MIDI but the pun was irresistible.

[logo]: ../master/1500x500.jpeg "Melbourne Monash Consciousness Research"
[avatar]: https://avatars0.githubusercontent.com/u/18410581?v=3&s=96 "@quined_quales"
