SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {10,13,18,29,6,30,17,2,8,20,24,23,19,25,9,11,5,27,22,12,4,7,28,3,15,26,21,16,1,14}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
SMODS.ObjectType({
    key = "kylomask_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "kylomask_kylomask_jokers",
    cards = {
        ["j_kylomask_avocado"] = true,
        ["j_kylomask_bloojimbob"] = true,
        ["j_kylomask_briskicedtea"] = true,
        ["j_kylomask_bubbywheel"] = true,
        ["j_kylomask_cousinofjimbob"] = true,
        ["j_kylomask_credeviljimbob"] = true,
        ["j_kylomask_fatassjimbob"] = true,
        ["j_kylomask_geenjimbob"] = true,
        ["j_kylomask_goldenjimbob"] = true,
        ["j_kylomask_jimbobs23rddebt"] = true,
        ["j_kylomask_jimbobs748thdebt"] = true,
        ["j_kylomask_jollyjimbob"] = true,
        ["j_kylomask_kylomaskgamer"] = true,
        ["j_kylomask_mind"] = true,
        ["j_kylomask_noveltyknickknacks"] = true,
        ["j_kylomask_reedjimbob"] = true,
        ["j_kylomask_sillyjimbob"] = true,
        ["j_kylomask_spiritofjimbob"] = true,
        ["j_kylomask_stalejimbob"] = true,
        ["j_kylomask_swswswswwcwbcccbcwcwrwrw"] = true,
        ["j_kylomask_thebangercard"] = true,
        ["j_kylomask_thebob"] = true,
        ["j_kylomask_thejim"] = true,
        ["j_kylomask_themofjimbob"] = true,
        ["j_kylomask_tripleblurredbarelyjumbledjimbob"] = true,
        ["j_kylomask_tsunami"] = true,
        ["j_kylomask_vvvvvvvrrrrrrrrrrmrmmmmmmmmmmrmmrmrrrrrr"] = true,
        ["j_kylomask_wonkyjimbob"] = true,
        ["j_kylomask_yeloojimbob"] = true
    },
})

SMODS.ObjectType({
    key = "kylomask_jimbob",
    cards = {
        ["j_kylomask_bloojimbob"] = true,
        ["j_kylomask_briskicedtea"] = true,
        ["j_kylomask_bubbywheel"] = true,
        ["j_kylomask_cousinofjimbob"] = true,
        ["j_kylomask_credeviljimbob"] = true,
        ["j_kylomask_fatassjimbob"] = true,
        ["j_kylomask_geenjimbob"] = true,
        ["j_kylomask_goldenjimbob"] = true,
        ["j_kylomask_jimbob"] = true,
        ["j_kylomask_jimbobs23rddebt"] = true,
        ["j_kylomask_jimbobs748thdebt"] = true,
        ["j_kylomask_jollyjimbob"] = true,
        ["j_kylomask_reedjimbob"] = true,
        ["j_kylomask_sillyjimbob"] = true,
        ["j_kylomask_spiritofjimbob"] = true,
        ["j_kylomask_stalejimbob"] = true,
        ["j_kylomask_thebangercard"] = true,
        ["j_kylomask_thebob"] = true,
        ["j_kylomask_thejim"] = true,
        ["j_kylomask_themofjimbob"] = true,
        ["j_kylomask_tsunami"] = true,
        ["j_kylomask_vvvvvvvrrrrrrrrrrmrmmmmmmmmmmrmmrmrrrrrr"] = true,
        ["j_kylomask_wonkyjimbob"] = true,
        ["j_kylomask_yeloojimbob"] = true
    },
})

SMODS.ObjectType({
    key = "kylomask_mycustom_jokers",
    cards = {
        ["j_kylomask_jimbob"] = true
    },
})

SMODS.ObjectType({
    key = "kylomask_legendary",
    cards = {
        ["j_kylomask_kylomaskgamer"] = true
    },
})