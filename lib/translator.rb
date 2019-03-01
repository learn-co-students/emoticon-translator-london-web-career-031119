# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  # load the emoticons YML file
  emoticons = YAML.load_file(file_path)

  # initialize a proper hash to return once formatted
  result = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  # format the result hash to get a meaning from a JP emoticon
  # or to get a JP emoticon equivalent for an english one
  result.each { |key, inner_hash|
    if key == "get_meaning"
      emoticons.each { |word, en_jp|
        inner_hash[en_jp[1]] = word
      }
    elsif key == "get_emoticon"
      emoticons.each { |word, en_jp|
        inner_hash[en_jp[0]] = en_jp[1]
      }
    end
  }

end

def get_japanese_emoticon(file_path, eng_emoticon)
  # call on our emoticon translator to get the JP equivalent
  load_library(file_path)["get_emoticon"][eng_emoticon] ||
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jp_emoticon)
  load_library(file_path)["get_meaning"][jp_emoticon] ||
  "Sorry, that emoticon was not found"
end
