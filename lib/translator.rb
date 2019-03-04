# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  h  = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |k, v|
    # binding.pry
    japanese_emoticon = v[1]
    english_emoticon = v[0]
    h["get_meaning"][japanese_emoticon] = k
    h["get_emoticon"][english_emoticon] = japanese_emoticon
  end
  h
end


def get_japanese_emoticon(file_path, emoticon)
  h = load_library(file_path)
  gets_emoticon = h["get_emoticon"][emoticon]
  if !gets_emoticon.nil?
    gets_emoticon
  else
   "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  h = load_library(file_path)
  meaning = h["get_meaning"][emoticon]
   if !meaning.nil?
    meaning
  else
   "Sorry, that emoticon was not found"
 end
end
