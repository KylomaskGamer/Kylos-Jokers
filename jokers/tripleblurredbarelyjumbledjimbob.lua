SMODS.Joker{ --Triple-Blurred Barely Jumbled Jimbob
    key = "tripleblurredbarelyjumbledjimbob",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Triple-Blurred Barely Jumbled Jimbob',
        ['text'] = {
            [1] = 'All {C:spades}Spades{} count as {C:hearts}Hearts{},',
            [2] = 'All {C:clubs}Clubs{} count as {C:diamonds}Diamonds{},',
            [3] = 'and {C:attention}vice vera{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    atlas = 'Joker',
    pools = { ["kylomask_kylomask_jokers"] = true, ["kylomask_jimbob"] = true },

    
    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Combine suits effect enabled
        -- Combine suits effect enabled
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Combine suits effect disabled
        -- Combine suits effect disabled
    end
} 
      
local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
    if not ret and not SMODS.has_no_suit(self) then
        if next(SMODS.find_card("j_modprefix_tripleblurredbarelyjumbledjimbob")) then
            -- If checking for Spades and card is Hearts, return true
            if suit == "Spades" and self.base.suit == "Hearts" then
                ret = true
            end
            -- If checking for Hearts and card is Spades, return true
            if suit == "Hearts" and self.base.suit == "Spades" then
                ret = true
            end
            -- If checking for Diamonds and card is Clubs, return true
            if suit == "Diamonds" and self.base.suit == "Clubs" then
                ret = true
            end
            -- If checking for Clubs and card is Diamonds, return true
            if suit == "Clubs" and self.base.suit == "Diamonds" then
                ret = true
            end
        end
    end
    return ret
end
