require 'optparse'
require 'yaml'
require 'pp'

require File.dirname(__FILE__) + "/jobs"


CONFIG_FILE = File.join(ENV['HOME'],'.rubysauce.yaml')

cred = {}
cred = YAML::load_file(CONFIG_FILE) if(File.exists?(CONFIG_FILE))

OptionParser.new do |op|
  op.banner = "Usage: #{$0} [options] <list|job|results> [id]"
  op.on('-u', '--user USER','saucelabs user name') {|u| cred['user'] = u}
  op.on('-p', '--pass API_KEY', 'saucelabs api key') {|p| cred['password'] = p}
  op.on('-d', '--dir DESTDIR','output directory'){|d| cred['dir'] = d}

  op.parse!(ARGV)

  # EXEC
  client = RubySauce::Jobs.new(cred['user'],cred['password'])
  cmd = ARGV.shift
  case cmd
  when 'list'
    pp client.list
  when 'job'
    id = ARGV.shift
    pp client.job(id)
  when 'results'
    id = ARGV.shift
    if cred.has_key?('dir')
      client.results(id,cred['dir'])
    else
      client.results(id)
    end
  else
    pp client.list
  end
end
