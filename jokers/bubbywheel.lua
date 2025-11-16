SMODS.Joker{ --Bubby Wheel
    key = "bubbywheel",
    config = {
        extra = {
            odds = 4,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bubby Wheel',
        ['text'] = {
            [1] = 'When {C:tarot}Wheel of Fortune{} {C:attention}fails{},',
            [2] = '{C:green}flat 3 in 4{} to get another {C:tarot}Wheel of Fortune{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
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

    
    calculate = function(self, card, context)
        if context.pseudorandom_result  then
            if (not context.result and context.identifier == "wheel_of_fortune") then
                if SMODS.pseudorandom_probability(card, 'group_0_9aed9c93', 3, card.ability.extra.odds, 'j_kylomask_bubbywheel', true) then
                        SMODS.calculate_effect({func = function()
                            
                            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', key = 'c_wheel_of_fortune'})                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                    end
                                }))
                            end
                            delay(0.6)
                            
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Once again!", colour = G.C.PURPLE})
                            end
                            return true
                            end}, card)
                        end
                    end
                end
            end
}