module FMOD
  class Channel
    include Functions
    # pointer to the channel instance
    attr_reader :pointer
    
    def initialize(options = {})
      @system_pointer = FMOD.system.pointer
      @pointer = FFI::MemoryPointer.new(:pointer)
    end
    
    # result = FMOD_Channel_IsPlaying(channel, &playing);
    def playing?
      FFI::MemoryPointer.new(:int) do |ptr|
        error_check FMOD_Channel_IsPlaying(@pointer.read_pointer, ptr)
        return playing_ptr.read_int == 1
      end
    end
    
    def pause
      error_check FMOD_Channel_SetPaused(@pointer.read_pointer, ((paused?) ? 0 : 1))
      true
    end
    
    def paused?
      FFI::MemoryPointer.new(:int) do |ptr|
        error_check FMOD_Channel_GetPaused(@pointer.read_pointer, ptr)
        return ptr.read_int == 1
      end
    end
    
    def set_position(int = 0)
      error_check FMOD_Channel_SetPosition(@pointer.read_pointer, int, FMOD_TIMEUNIT_MS)
    end
    
    def pan=(float)
      float = 1.0 if float > 1.0
      float = 0.0 if float < 0.0
      error_check FMOD_Channel_SetPan(@pointer.read_pointer, float)
    end
    
    def frequency
      FFI::MemoryPointer.new(:float) do |ptr|
        error_check FMOD_Channel_GetFrequency(@pointer.read_pointer, ptr)
        return ptr.read_float
      end
    end
    
    def frequency=(float)
      error_check FMOD_Channel_SetFrequency(@pointer.read_pointer, float)
    end
    
  end
end