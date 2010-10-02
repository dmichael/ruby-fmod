<!-- Efficient, realtime audio for Ruby
==================================

Ruby is too slow to do realtime audio, but C is not. The best way to give Ruby robust audio capabilities is to use a native C/C++ library. The primary problem then is which library to choose and how to wire it into Ruby.

So how do you choose an audio library? Aside from writing one from scratch, there are a number of widely used preexisting C/C++ audio libraries. At the lowest level, there are projects like PortAudio which handle direct interfacing with the hardware only, requiring a programmer to feed it a stream of numbers representing a waveform. At the highest level, projects like CLAM, CSL, FMOD and others provide a full framework complete with voice management, sound file playback, and even synthesis. In these frameworks, the low level number pushing is well abstracted, leaving the programmer with a coarse interface to predefined functionality.

This Ruby library has chosen a high level framework as a basis for realtime audio. While it certainly is possible to get Ruby to push waveform representations to a low level API like PortAudio, doing so 44100 times a second is not playing to Ruby's strengths. By using a high level library, we trade flexible synthesis for a limited set of fast, efficient audio routines.

To get Ruby to use external native libraries, there are a few ways to go about it. You can write a C external, use the DL library available in the Ruby standard distribution, or you can use FFI. Having tried all three methods of interfacing with C, FFI is a clear winner. It is efficient, predictable, effortlessly cross platform, and decently well documented.

Ruby has been sorely lacking an audio framework, and an FMOD wrapper is a great place to start. This library is ultimately meant to be the basis of audio DSLs written in Ruby.  -->

FMOD for Ruby
-------------

*ruby-fmod* wraps the excellent [FMOD](http://www.fmod.org) C/C++ libraries using the equally excellent [FFI](http://github.com/ffi/ffi).

It is far from finished, but all the basic techniques for interfacing Ruby with the FMOD library are outlined. If you want to contribute to this project, please get in touch.

FMOD?
=====

"FMOD is a programming library and toolkit for the creation and playback of interactive audio. It supports all leading operating systems and game platforms." And now Ruby too. FMOD supports all sorts of audio file playback, surround sound and multichannel, as well as effects, VST plugins, 3D sound, and wavetable synthesis.

FMOD is not free, nor is it open source, but it does have a very [liberal license](http://www.fmod.org/index.php/sales). While commercial use is quite expensive, it is free to use in your non-commercial projects.

Installation
============

To use this Ruby library, you must have the FMOD on you machine. [Go get it](http://www.fmod.org/index.php/download). At the moment, only Mac OS X is supported, but adding Linux or Windows is likely as easy as pointing to the library locations.

That being said:

  gem install ruby-fmod
  
Usage
=====

  FMOD.init
  sound = FMOD::Sound.new(file)
  sound.play

