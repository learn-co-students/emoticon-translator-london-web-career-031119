# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # load the YML file
  emoticons = YAML.load_file(file_path)

  # create a result which is a hash with two keys (get_meaning and get_emoticon)
  # which have for now empty hashes as values
  result = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  # get_meaning = japanese emoticons
  result.each do |key, value|
    # if key equals to meaning, iterate over emoticons to translate english to japanese
    if key == "get_meaning"
      emoticons.each do |english, japanese|
        value[japanese[1]] = english
      end
    elsif key == "get_emoticon"
      emoticons.each do |english, japanese|
        value[japanese[0]] = japanese[1]
      end
    end
  end
  result
end

# load_library('lib/emoticons.yml')

def get_japanese_emoticon(file_path, en_emoticon)
  # code goes here
  # calls load_library
  loaded_lib = load_library(file_path)
  # checks if loaded_lib has the equivalent emoticon in japanese
  loaded_lib["get_emoticon"][en_emoticon] || "Sorry, that emoticon was not found"
end

# get_japanese_emoticon('lib/emoticons.yml', ">:(")

def get_english_meaning(file_path, jp_emoticon)
  # code goes here
  loaded_lib = load_library(file_path)
  # checks if loaded_lib has the equivalent emoticon in english
  loaded_lib["get_meaning"][jp_emoticon] || "Sorry, that emoticon was not found"
end
