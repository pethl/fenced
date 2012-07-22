module DilemmasHelper

  def bitly_body(short_url)

      long_url= "http://fenced.herokuapp.com/dilemmas/" + self.id
      Bitly.use_api_version_3
      bitly = Bitly.new('fencedweller','R_7b81aebd65ac551c78983d0ae57a0253')
      short_url = bitly.shorten(long_url)  
            
      return short_url
    end
    
end


