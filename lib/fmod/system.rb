module FMOD
  class System
    include Functions
    # pointer to the system instance
    attr_reader :pointer
        
    def initialize
      # FMOD_SYSTEM *system;      
      # result = FMOD_System_Create(&system);
      # result = FMOD_System_Init(system, 32, FMOD_INIT_NORMAL, NULL);
      @pointer = FFI::MemoryPointer.new(:pointer)
      error_check FMOD_System_Create(@pointer)  
      error_check FMOD_System_Init(@pointer.read_pointer, 32, FMOD_INIT_NORMAL, nil)
    end
    
    def version
      # unsigned int version;
      # result = FMOD_System_GetVersion(system, &version);
      FFI::MemoryPointer.new(:int) do |version_ptr|
        error_check FMOD_System_GetVersion(@pointer.read_pointer, version_ptr);
        return version_ptr.read_int
      end
    end
    
    
    def driver_count
      # unsigned int numdrivers;
      # result = FMOD_System_GetNumDrivers(system, &numdrivers);
      count_ptr = FFI::MemoryPointer.new(:int)
      error_check FMOD_System_GetNumDrivers(@pointer.read_pointer, count_ptr)
      count_ptr.read_int
    end
    
    def software_channels
      num_ptr = FFI::MemoryPointer.new(:int)
      error_check FMOD_System_GetSoftwareChannels(@pointer.read_pointer, num_ptr)
      num_ptr.read_int
    end
    
    def hardware_channels
      num2d = FFI::MemoryPointer.new(:int)
      num3d = FFI::MemoryPointer.new(:int)
      total = FFI::MemoryPointer.new(:int)
      error_check FMOD_System_GetHardwareChannels(@pointer.read_pointer, num2d, num3d, total)
      
      {
        :num2d => num2d.read_int,
        :num3d => num3d.read_int,
        :total => total.read_int,
      }
    end
  end
end