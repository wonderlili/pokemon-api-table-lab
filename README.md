# Pokémon API Lab

## What are APIs?

A web Application Programming Interface (API) is a fancy term for data that lives on the Internet. The data is housed at an endpoint (represented by a url), which you can visit in your browser to view the data. Web APIs are often in JSON (JavaScript Object Notation) format, meaning that they look like giant Ruby hashes! This hash-like structure makes it easy for developers like you and me to retrieve and manipulate the API data to fit the needs of the program or application we're writing.

## Getting the Data

For this lab, you're going to be using the Pokéapi (http://pokeapi.co/) to manipulate some of beloved Charizard's details. Visit http://pokeapi.co/api/v2/pokemon/6/ to get to the information that the API has on Charizard -- the response is HUGE! For the purposes of this lab, let's just work with a much more manageable excerpt of the response. Copy and paste the following hash into your charizard_tables.rb file:

```ruby
charizard = {
	name: "charizard",
	weight: 905,
	abilities: [
		{
			slot: 3,
			is_hidden: true,
			ability: {
			url: "http://pokeapi.co/api/v2/ability/94/",
			name: "solar-power"
			}
		},
		{
			slot: 1,
			is_hidden: false,
			ability: {
			url: "http://pokeapi.co/api/v2/ability/66/",
			name: "blaze"
			}
		}
	],
	stats: [
		{
			stat: {
				url: "http://pokeapi.co/api/v2/stat/3/",
				name: "defense"
				},
			effort: 0,
			base_stat: 78
		},
		{
			stat: {
				url: "http://pokeapi.co/api/v2/stat/2/",
				name: "attack"
				},
			effort: 0,
			base_stat: 84
		},
		{
			stat: {
				url: "http://pokeapi.co/api/v2/stat/1/",
				name: "hp"
				},
			effort: 0,
			base_stat: 78
		}
	]
}
```

## Writing Methods

### Set-up

You're going to create two tables from Charizard's information using the terminal-table gem (https://rubygems.org/gems/terminal-table/versions/1.6.0). The first table should contain the character's statistics. The second table should contain the character's stats. Be sure to run the following command before running charizard_tables.rb:

> gem install terminal-table

Follow the instructions below to make some magic!

*Pro-tip: check out the "pry" gem to debug your program! Check out [this great blog post](http://www.alanmacdougall.com/blog/2012/06/08/interactive-debugging-with-pry/) or the [official pry documentation](http://pryrepl.org/) for more info.*


### Methods

#### 1. Get all of Charizard's stats types
Create a method `#get_stats_names` that retrieves all of the names of the abilities from the Charizard response. The return value of `#get_stats_names` should be the array ["defense", "attack", "hp"].


#### 2. Get all of Charizard's stats values

Create a method `#get_base_stats` that collects all of Charizard's reported stats. The method should return the array `[78, 84, 78]`.

#### 3. Create table with the information about Charizard's stats

Create a method `#create_stats_table` that prints out all of Charizard's statistics. Use the methods you've previously created (`#get_stats_names` and `#get_base_stats`) to populate the table structure according to terminal-table documentation. The final table should look something like this:

![ScreenShot](https://raw.github.com/alemosie/pokemon-api-table-lab/charizard_stats_table_example.png)

Be sure to check out the [terminal-table documentation](https://github.com/tj/terminal-table) for instructions on how to create and prettify tables!

#### 4. Get information about Charizard's abilities

Create a method `#get_ability_details` that collects all of the information about Charizard's abilities: name, slot value, and is_hidden boolean. The method should return the two-dimensional array `[["solar-power", 3, true], ["blaze", 1, false]]`.

#### 5. Create table with the information about Charizard's abilities

Create a method `#create_abilities_table` that prints out all of Charizard's abilities. Use the method you've previously created (#get_ability_details) to populate the table structure according to terminal-table documentation. The headers for the table should correspond to the values of your two-dimensional details array: `["name", "slot", "hidden"]`. The final table should look like this:

![ScreenShot](https://raw.github.com/alemosie/pokemon-api-table-lab/charizard_abilities_table_example.png)

## Challenges

Done with all of that? Check out these two challenges:

#### Challenge 1: Add more abilities to your 'charizard' base hash.

The excerpt only contains two of 100s of the abilities in the Pokemon API response. How would you change the charizard base hash? Would you have to change #get_ability_details to include the new information in your table?

#### Challenge 2: Change the titles of both tables ("Charizard's Stats" and "Charizard's Abilities") to be red and green, respectively.

When you're done with that, the table is your oyster -- color away to your heart's desire!
