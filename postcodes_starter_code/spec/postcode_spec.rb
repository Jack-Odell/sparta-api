require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @postcode_single = 'SG75PX'
      @response = @postcodesio.get_single_postcode(@postcode_single) #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_response_code(@postcode_single)).to eq(200)
    end

    it "should have a results hash" do
      expect(@response).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_postcode_length(@postcode_single)).to be_between(5, 7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_quality_key_length(@postcode_single)).to be_between(1, 9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@Postcodesio.get_eastings_int(@postcode_single)).to be_kind_of(Integer)
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@Postcodesio.get_northings_int(@postcode_single)).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.get_constituent(@postcode_single)).to be true
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.get_nhs_string(@postcode_single)).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_longtitude_float(@postcode_single)).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@postcodesio.get_latitude_float(@postcode_single)).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.get_parliment_string(@postcode_single)).to be_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.get_eur_elect_string(@postcode_single)).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.get_prime_care_string(@postcode_single)).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@postcodesio.get_region_string(@postcode_single)).to be_kind_of(String)
    end

    it "should return a parish string" do
      expect(@postcodesio.get_parish_string(@postcode_single)).to be_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@postcodesio.get_lsoa_string(@postcode_single)).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@postcodesio.get_msoa_string(@postcode_single)).to be_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.get_admin_district_string(@postcode_single)).to be_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.get_incode_length(@postcode_single)).to eq(3)
    end

    it "should return a incode string of 3-4 characters" do
      expect(@postcodesio.get_incode_length(@postcode_single)).to be_between(3, 4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @post_array = ["OX495NU", "M320JG", "NE301DP"]
      @response = @postcodesio.get_multiple_postcodes(@post_array) #Add in array of postcodes
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_multi_postcode_code(@post_array)).to eq(200)
    end

    it "should return the first query as the first postcode in the response" do
      expect(@postcodesio.get_first_postcode(@post_array)).to eq('OX495NU')
    end

    it "should return the second query as the first postcode in the response" do
      expect(@postcodesio.get_second_postcode(@post_array)).to eq('M320JG')
    end

    it "should have a results hash" do
      expect(@postcodesio.get_result_hash(@post_array)).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_multi_postcode_length(@post_array)).to be_between(5,7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_multi_quality_key_length(@post_array)).to be_between(1, 9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@Postcodesio.get_multi_eastings_int(@post_array)).to be_kind_of(Integer)
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@Postcodesio.get_multi_northings_int(@post_array)).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.get_multi_constituent(@post_array)).to be true
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.get_multi_nhs_string(@post_array)).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_multi_longitude_string(@post_array)).to be_kind_of(String)
    end

    it "should return a latitude float value" do
      pending

    end

    it "should return a parliamentary constituency string" do
      pending

    end

    it "should return a european_electoral_region string" do
      pending

    end

    it "should return a primary_care_trust string" do
      pending

    end

    it "should return a region string" do
      pending

    end

    it "should return a parish string" do
      pending

    end

    it "should return a lsoa string" do
      pending

    end

    it "should return a msoa string" do
      pending

    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      pending

    end

    it "should return a incode string of three characters" do
      pending

    end

    it "should return a msoa string" do
      pending

    end

    it "should return a incode string of 3-4 characters" do
      pending

    end

    it "should have a results hash" do
      pending

    end

    it "should return a postcode between 5-7 in length"  do
      pending

    end

    it "should return an quality key integer between 1-9" do
      pending

    end

    it "should return an ordnance survey eastings value as integer" do
      pending

    end

    it "should return an ordnance survey eastings value as integer" do
      pending

    end

    it "should return a country which is one of the four constituent countries of the UK" do
      pending

    end

    it "should return a string value for NHS authority " do
      pending
    end

    it "should return a longitude float value" do
      pending

    end

    it "should return a latitude float value" do
      pending

    end

    it "should return a parliamentary constituency string" do
      pending

    end

    it "should return a european_electoral_region string" do
      pending

    end

    it "should return a primary_care_trust string" do
      pending

    end

    it "should return a region string" do
      pending

    end

    it "should return a parish string" do
      pending

    end

    it "should return a lsoa string" do
      pending

    end

    it "should return a msoa string" do
      pending

    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      pending

    end

    it "should return a incode string of three characters" do
      pending

    end

    it "should return a msoa string" do
      pending

    end

    it "should return a incode string of 3-4 characters" do
      pending
    end

  end


end
