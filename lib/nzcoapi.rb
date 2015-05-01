# Set Version
VERSION = "0.1.0"

 
require 'httparty'
require 'base64'
require 'time'
require 'nokogiri'
require 'figaro'

module Nzcoapi
	include HTTParty
	include Nokogiri
	include Figaro
	base_uri "http://www.businessdata.govt.nz"
	format :xml


	@@access_key = YAML.load_file("config/application.yml")['nzcoapi_access_key']
	@@secret_key = YAML.load_file("config/application.yml")['nzcoapi_secret_key']
	@@timestamp = Time.now.rfc2822 + " GMT"
	headers "Timestamp" => Time.now.rfc2822 + " GMT"
  	headers "Access" => @@access_key
  	headers 'Accept' => "application/xml"

	def self.search_for_company(string)
		headers "Timestamp" => Time.now.rfc2822 + " GMT"
		@@timestamp = Time.now.rfc2822 + " GMT"

		stringtosign = "GET" + "\n" + "www.businessdata.govt.nz" + "\n" + "/data/app/ws/rest/companies/entity/search/v2.0/#{string}" + "\n" + @@timestamp + "\n" + @@access_key + "\n" + "application/xml" + "\n"

		headers "Authorization" => @@access_key + ":" + Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', @@secret_key, stringtosign))
		headers "Timestamp" => Time.now.rfc2822 + " GMT"

		Nokogiri::XML((get("/data/app/ws/rest/companies/entity/search/v2.0/#{string}").body), 'UTF-8')
	end

	def self.find_director(string)
		headers "Timestamp" => Time.now.rfc2822 + " GMT"
		@@timestamp = Time.now.rfc2822 + " GMT"

		stringtosign = "GET" + "\n" + "www.businessdata.govt.nz" + "\n" + "/data/app/ws/rest/companies/role/search/v1.0/size/200/type/DIR/#{string}" + "\n" + @@timestamp + "\n" + @@access_key + "\n" + "application/xml" + "\n"

		headers "Authorization" => @@access_key + ":" + Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', @@secret_key, stringtosign))

		Nokogiri::XML((get("/data/app/ws/rest/companies/role/search/v1.0/size/200/type/DIR/#{string}").body), 'UTF-8')

	end

	def self.find_company(id)
		headers "Timestamp" => Time.now.rfc2822 + " GMT"
		@@timestamp = Time.now.rfc2822 + " GMT"

		stringtosign = "GET" + "\n" + "www.businessdata.govt.nz" + "\n" + "/data/app/ws/rest/companies/entity/v2.0/#{id}" + "\n" + @@timestamp + "\n" + @@access_key + "\n" + "application/xml" + "\n"

		headers "Authorization" => @@access_key + ":" + Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', @@secret_key, stringtosign))

		Nokogiri::XML((get("/data/app/ws/rest/companies/entity/v2.0/#{id}").body), 'UTF-8')

	end



	def self.tagged(tag)
		retrieve_url get("/#{tag}.json")
	end



end

