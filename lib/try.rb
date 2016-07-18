require 'nokogiri'

def magic(x)
doc = Nokogiri::HTML(x)
keys = doc.at('img').keys
values = doc.at('img').values


hash_array = {}
keys.each_with_index do |key, index|
  hash_array[key.to_sym] = values[index]
end

p(hash_array.extract!(:src))
p hash_array

end

magic('<img src="images/demo-img-5.jpg"  alt=""   data-bgposition="center center" data-kenburns="on" data-duration="30000" data-ease="Linear.easeNone" data-scalestart="100" data-scaleend="125" data-rotatestart="0" data-rotateend="0" data-offsetstart="0 0" data-offsetend="0 0" data-bgparallax="10" class="rev-slidebg" data-no-retina>')