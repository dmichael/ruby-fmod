$:.unshift(File.join(File.dirname(__FILE__), 'fmod'))

require 'rubygems'
require 'ffi'

require 'constants'
require 'enums'
require 'functions'
         
require 'system'
require 'sound'
require 'channel'

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