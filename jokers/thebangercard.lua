SMODS.Joker{ --The Banger Card
    key = "thebangercard",
    config = {
        extra = {
            mult = 20
        }
    },
    loc_txt = {
        ['name'] = 'The Banger Card',
        ['text'] = {
            [1] = 'Plays music from',
            [2] = '{C:spectral}KylomaskGamer{}\'s {C:attention}ytdlp',
            [3] = 'folder{}, and gives',
            [4] = '{C:red}+2{} Mult for each {C:green}.ogg file{} in',
            [5] = 'there as of {C:attention}Nov. 13 2025{}',
            [6] = '{C:inactive}(Currently{} {C:red}+20{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_jimbob"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_kylomask_thebangercard" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_kylomask_thebangercard" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end