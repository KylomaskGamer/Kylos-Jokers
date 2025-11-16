SMODS.Joker{ --Spirit of Jimbob
    key = "spiritofjimbob",
    config = {
        extra = {
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'Spirit of Jimbob',
        ['text'] = {
            [1] = 'All {C:attention}unenhanced played cards{} have a {C:green}#1# in #2#{}',
            [2] = 'chance to obtain a random {C:enhanced}Enhancement{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_jimbob"] = true },

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_kylomask_spiritofjimbob') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                        end
                    end
                    return false
                    end)()) then
                        if SMODS.pseudorandom_probability(card, 'group_0_dd49168e', 1, card.ability.extra.odds, 'j_kylomask_spiritofjimbob', false) then
                            local enhancement_pool = {}
                            for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                                if enhancement.key ~= 'm_stone' then
                                    enhancement_pool[#enhancement_pool + 1] = enhancement
                                end
                            end
                            local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                            context.other_card:set_ability(random_enhancement)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                            end
                        end
                    end
                end
}