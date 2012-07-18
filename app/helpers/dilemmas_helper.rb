module DilemmasHelper

  def bitly_body(body)

      Bitly.use_api_version_3

      bitly = Bitly.new("fencedweller", "R_7b81aebd65ac551c78983d0ae57a0253")
      u = bitly.shorten("http://fenced.herokuapp.com/dilemmas/7")
            
      return body
    end


end
