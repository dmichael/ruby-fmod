module FMOD
  def self.init
    @system = System.new
  end
  
  # Ruby version of the system
  def self.system
    @system
  end
  
  # This pointer is used by many of the sound functions
  def self.system_pointer
    @system.pointer
  end
end