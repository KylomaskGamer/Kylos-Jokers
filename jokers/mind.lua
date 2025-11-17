SMODS.Joker{ --Mind
    key = "mind",
    config = {
        extra = {
            source_rank_type = "all",
            target_rank = "5",
            source_rank_type = "all",
            target_rank = "4",
            source_rank_type = "all",
            target_rank = "3",
            source_rank_type = "all",
            target_rank = "2"
        }
    },
    loc_txt = {
        ['name'] = 'Mind',
        ['text'] = {
            [1] = 'All cards are considered',
            [2] = 'ranks {C:attention}2{}, {C:attention}3{}, {C:attention}4{} and {C:attention}5{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["kylomask_kylomask_jokers"] = true },

    
    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Combine ranks effect enabled
        -- Combine ranks effect enabled
        -- Combine ranks effect enabled
        -- Combine ranks effect enabled
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
        -- Combine ranks effect disabled
        -- Combine ranks effect disabled
        -- Combine ranks effect disabled
    end
}


local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_kylomask_mind")) then
        return 14
    end
    if next(SMODS.find_card("j_kylomask_mind")) then
        return 14
    end
    if next(SMODS.find_card("j_kylomask_mind")) then
        return 14
    end
    if next(SMODS.find_card("j_kylomask_mind")) then
        return 14
    end
    return original_id
end
