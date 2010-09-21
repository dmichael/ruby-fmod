module FMOD
  class Sound
    include Functions
    attr_reader :channel
    
    def initialize(file, options = {})
      @system_pointer  = FMOD.system.pointer
      @channel = options[:channel] || Channel.new
      @file = file
    end
    
    def play
      play_stream
    end
    
    def play_sound
      sound_ptr = FFI::MemoryPointer.new(:pointer)
      # FMOD_RESULT = FMOD_System_CreateStream(system, "wave.mp3", FMOD_DEFAULT, 0, &sound);
      error_check FMOD_System_CreateStream(@system_pointer.read_pointer, @file, FMOD_DEFAULT, 0, sound_ptr);

      # FMOD_RESULT = FMOD_System_PlaySound(system, FMOD_CHANNEL_FREE, sound1, 0, &channel);
      error_check FMOD_System_PlaySound(@system_pointer.read_pointer, FMOD_CHANNELINDEX[:FMOD_CHANNEL_FREE], sound_ptr.read_pointer, 0, @channel.pointer);
      true
    end
    
    def play_stream  
      sound_ptr = FFI::MemoryPointer.new(:pointer)
      # FMOD_RESULT = FMOD_System_CreateSound(system, "drumloop.wav", FMOD_SOFTWARE, 0, &sound);
      error_check FMOD_System_CreateSound(@system_pointer.read_pointer, @file, FMOD_DEFAULT, 0, sound_ptr);

      # FMOD_RESULT = FMOD_System_PlaySound(system, FMOD_CHANNEL_FREE, sound1, 0, &channel);
      error_check FMOD_System_PlaySound(@system_pointer.read_pointer, FMOD_CHANNELINDEX[:FMOD_CHANNEL_FREE], sound_ptr.read_pointer, 0, @channel.pointer);
      true
    end
    
  end 
end