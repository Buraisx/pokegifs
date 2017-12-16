class PokemonController < ApplicationController
	def index
		render json:{"message": "ok"}
	end
	def show
		res  = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}")
		body = JSON.parse(res.body)
		name = body["name"]
		id = body["id"]
		type = body["types"][0]["type"]["name"]


		res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=aHtC6smrcaWbfwhKHkW5m1pJ0e1Ae4Ke&q=#{params[:id]}&rating=g")
		body = JSON.parse(res.body)
		gif_url = body["data"][0]["url"]

		render json: 
		{
			"id": id,
			"name": name,
			"type": type,
			"gif": gif_url

		}
	end
	def team
		# THIS DOES NOT WORK
		6.times do
			pokemon = Random.new
			res  = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{pokemon.rand(600).to_s}")
			body = JSON.parse(res.body)
			name = body["name"]
			id = body["id"]
			type = body["types"][0]["type"]["name"]


			res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=aHtC6smrcaWbfwhKHkW5m1pJ0e1Ae4Ke&q=pokemon&rating=g")
			body = JSON.parse(res.body)
			gif_url = body["data"][0]["url"]

			render json: 
			{
				"id": id,
				"name": name,
				"type": type,
				"gif": gif_url

			}
		end
	end
end
