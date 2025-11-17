SMODS.Booster {
    key = 'jimbob_pack',
    loc_txt = {
        name = "Jimbob Pack",
        text = {
            [1] = 'Select {C:attention}1{} from {C:attention}4{} Jimbob Jokers',
            [2] = 'Standard Odds'
        },
        group_name = "kylomask_boosters"
    },
    config = { extra = 4, choose = 1 },
    weight = 3,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "kylomask_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            3,
            0.05
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('kylomask_jimbob_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "kylomask_jimbob",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "kylomask_jimbob_pack"
            }
        elseif selected_index == 2 then
            return {
            key = "j_kylomask_kylomaskgamer",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "kylomask_jimbob_pack"
            }
        end
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}
