require 'cora'
require 'siri_objects'
require 'mios'
require 'fuzzy_match'

class SiriProxy::Plugin::MiOSsiri < SiriProxy::Plugin
  def initialize(config)
    host = config["mios_host"]

    @mios = MiOS::Interface.new("http://" + host + ":3480")
  end

  def match(input)
    devices = Hash[@mios.devices.map{|d| [d.name, d]}]
    scenes = Hash[@mios.scenes.map{|s| [s.name, s]}]

    matcher = FuzzyMatch.new(devices.merge(scenes), :read => 0)
    return matcher.find(input)[1]
  end

  listen_for /(?:turn on|activate) (.*)/i do |input|
    result = match(input)
    if result.respond_to?('run!')
      result.run!
      say "Running #{result.name}"
    elsif result.respond_to?('on!') 
      result.on!
      say "Turning on #{result.name}"
    end
  end

  listen_for /(?:turn off|deactivate) (.*)/i do |input|
    result = match(input)
    if result.respond_to?('run!')
      result.run!
      say "Running #{result.name}"
    elsif result.respond_to?('off!') 
      result.off!
      say "Turning off #{result.name}"
    end
  end
end
