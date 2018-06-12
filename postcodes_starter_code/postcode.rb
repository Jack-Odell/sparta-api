require 'httparty'
require 'json'

class Postcodesio
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcodes_array)
    JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  def get_response_code(single_postcode)
    response = get_single_postcode(single_postcode)
    response['status']
  end

  def get_postcode_length(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['postcode'].length
  end

  def get_quality_key_length(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['quality']
  end

  def get_constituent(single_postcode)
    response = get_single_postcode(single_postcode)
    isTrue = false

    if response['result']['country'] == 'England'
      isTrue = true
    elsif response['result']['country'] == 'Nothern Ireland'
      isTrue = true
    elsif response['result']['country'] == 'Wales'
      isTrue = true
    elsif response['result']['country'] == 'Scotland'
      isTrue = true
    end
  end

  def get_nhs_string(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['nhs_ha']
  end

  def get_northings_int(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['northings']
  end

  def get_eastings_int(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['eastings']
  end

  def get_longtitude_float(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['longitude']
  end

  def get_latitude_float(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['latitude']
  end

  def get_parliment_string(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['parliamentary_constituency']
  end

  def get_eur_elect_string(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['european_electoral_region']
  end

  def get_prime_care_string(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['primary_care_trust']
  end

  def get_region_string(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['region']
  end

  def get_parish_string(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['parish']
  end

  def get_lsoa_string(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['lsoa']
  end

  def get_msoa_string(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['msoa']
  end

  def get_admin_district_string(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['codes']['admin_district']
  end

  def get_incode_length(single_postcode)
    response = get_single_postcode(single_postcode)
    response['result']['incode'].length
  end

  # Multiple postcodes

  def get_multi_postcode_code(post_array)
    response = get_multiple_postcodes(post_array)
    response['status']
  end

  def get_first_postcode(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][0]['query']
  end

  def get_second_postcode(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['query']
  end

  def get_result_hash(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']
  end

  def get_multi_postcode_length(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['postcode'].length
  end

  def get_multi_quality_key_length(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['quality']
  end

  def get_multi_eastings_int(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['eastings']
  end

  def get_multi_northings_int(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['northings']
  end

  def get_multi_constituent(post_array)
    response = get_multiple_postcodes(post_array)
    isTrue = false

    if response['result'][1]['result']['country'] == 'England'
      isTrue = true
    elsif response['result'][1]['result']['country'] == 'Nothern Ireland'
      isTrue = true
    elsif response['result'][1]['result']['country'] == 'Wales'
      isTrue = true
    elsif response['result'][1]['result']['country'] == 'Scotland'
      isTrue = true
    end
  end

  def get_multi_nhs_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['nhs_ha']
  end

  def get_multi_longitude_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['longitude']
  end

  def get_multi_latitude_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['latitude']
  end

  def get_multi_parliment_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['parliamentary_constituency']
  end

  def get_multi_eur_vote_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['european_electoral_region']
  end

  def get_multi_prime_care_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['primary_care_trust']
  end

  def get_multi_region_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['region']
  end

  def get_multi_parish_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['parish']
  end

  def get_multi_lsoa_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['lsoa']
  end

  def get_multi_msoa_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['msoa']
  end

  def get_multi_admin_district_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['admin_district']
  end

  def get_multi_incode_string(post_array)
    response = get_multiple_postcodes(post_array)
    response['result'][1]['result']['incode'].length
  end
end
