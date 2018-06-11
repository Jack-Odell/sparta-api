require 'httparty'
require 'json'

class Postcode
  include HTTParty

  attr_accessor :single_postcode_results, :multi_postcode_results

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_results = self.class.get("/postcodes/#{postcode}")
  end

  def get_multi_postcodes(postcodes_arr)
    @multi_postcode_results = self.class.post("/postcodes/", body: {'postcodes': postcodes_arr}).body
    @multi_postcode_results = JSON.parse(@multi_postcode_results)
  end
end


postcode = Postcode.new

postcode.get_single_postcode("SG75PX")
postcode.get_multi_postcodes(["OX495NU", "M320JG", "NE301DP"])

# p postcode.single_postcode_results.body
p postcode.multi_postcode_results
