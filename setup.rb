#!/usr/bin/env ruby
require 'fileutils'
require 'yaml'
require 'optparse'

PROJECT_ROOT = File.expand_path('..', __FILE__)   if !defined? PROJECT_ROOT
SCRIPT_PATH = File.join(PROJECT_ROOT)             if !defined? SCRIPT_PATH
CONFIG_PATH = File.join(PROJECT_ROOT)             if !defined? CONFIG_PATH

begin
  CONFIG = YAML.load_file(File.join(CONFIG_PATH, 'config.yml'))
rescue Errno::ENOENT
  msg = <<-HEREDOC

*** missing config.yml

    cp config.sample.yml config.yml

    and edit appropriately ...

  HEREDOC
  raise msg
end
