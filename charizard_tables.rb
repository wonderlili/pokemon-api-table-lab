require 'terminal-table'
require 'pry'
require 'colorize'

# insert your charizard base hash here!
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

# methods go here!
def get_stats_names(pokemon)
  pokemon[:stats].collect do |stat|
    stat[:stat][:name]
  end
end

def get_base_stats(pokemon)
  pokemon[:stats].collect do |stat|
    stat[:base_stat]
  end
end

def create_stats_table(pokemon)
  rows = []
  # rows << "CHARIZARD'S STATS"
  rows << get_stats_names(pokemon)
  rows << get_base_stats(pokemon)
  table = Terminal::Table.new :rows => rows, :title => "CHARIZARD'S STATS".colorize(:red)
  table.style = {:all_separators => true, :width => 60, :padding_left => 2, :border_x => ":", :border_i => "#"}
  puts table
end

def get_ability_details(pokemon)
  abil = []
  master_abil = []
  pokemon[:abilities].each do |ability|
     abil = []
     abil << ability[:ability][:name]
     abil << ability[:slot]
     abil << ability[:is_hidden]
     master_abil << abil
  end
  master_abil
end

def create_abilities_table(pokemon)
  rows = []
  rows << get_ability_details(pokemon)[0]
  rows << get_ability_details(pokemon)[1]
  table = Terminal::Table.new :rows => rows, :title => "CHARIZARD'S ABILITIES".colorize(:green), :headings => ["name", "slot", "hidden"]
  table.style = {:width => 60, :padding_left => 2, :border_x => ":", :border_i => "$"}
  puts table
end

# get_stats_names(charizard)
# get_base_stats(charizard)
create_stats_table(charizard)
7.times do
  puts " "
end
create_abilities_table(charizard)
