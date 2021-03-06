class CreatePlayerShotStats < ActiveRecord::Migration
  def change
    create_table :player_shot_stats, id: false do |t|
      t.primary_key :player_id
      t.integer :team_id
      t.integer :shots_att
      t.integer :shots_made
      t.float :shots_pct
      t.integer :right_corner_3_att
      t.integer :right_corner_3_made
      t.float :right_corner_3_pct_att
      t.float :right_corner_3_pct_made
      t.integer :right_wing_3_att
      t.integer :right_wing_3_made
      t.float :right_wing_3_pct_att
      t.float :right_wing_3_pct_made
      t.integer :straight_up_3_att
      t.integer :straight_up_3_made
      t.float :straight_up_3_pct_att
      t.float :straight_up_3_pct_made
      t.integer :left_wing_3_att
      t.integer :left_wing_3_made
      t.float :left_wing_3_pct_att
      t.float :left_wing_3_pct_made
      t.integer :left_corner_3_att
      t.integer :left_corner_3_made
      t.float :left_corner_3_pct_att
      t.float :left_corner_3_pct_made
      t.integer :right_baseline_2_att
      t.integer :right_baseline_2_made
      t.float :right_baseline_2_pct_att
      t.float :right_baseline_2_pct_made
      t.integer :right_wing_2_att
      t.integer :right_wing_2_made
      t.float :right_wing_2_pct_att
      t.float :right_wing_2_pct_made
      t.integer :straight_up_2_att
      t.integer :straight_up_2_made
      t.float :straight_up_2_pct_att
      t.float :straight_up_2_pct_made
      t.integer :left_wing_2_att
      t.integer :left_wing_2_made
      t.float :left_wing_2_pct_att
      t.float :left_wing_2_pct_made
      t.integer :left_baseline_2_att
      t.integer :left_baseline_2_made
      t.float :left_baseline_2_pct_att
      t.float :left_baseline_2_pct_made
      t.integer :right_high_paint_att
      t.integer :right_high_paint_made
      t.float :right_high_paint_pct_att
      t.float :right_high_paint_pct_made
      t.integer :left_high_paint_att
      t.integer :left_high_paint_made
      t.float :left_high_paint_pct_att
      t.float :left_high_paint_pct_made
      t.integer :right_low_paint_att
      t.integer :right_low_paint_made
      t.float :right_low_paint_pct_att
      t.float :right_low_paint_pct_made
      t.integer :left_low_paint_att
      t.integer :left_low_paint_made
      t.float :left_low_paint_pct_att
      t.float :left_low_paint_pct_made
      t.integer :at_rim_att
      t.integer :at_rim_made
      t.float :at_rim_pct_att
      t.float :at_rim_pct_made
      t.integer :corner_3_att
      t.integer :corner_3_made
      t.float :corner_3_pct_att
      t.float :corner_3_pct_made
      t.integer :wing_3_att
      t.integer :wing_3_made
      t.float :wing_3_pct_att
      t.float :wing_3_pct_made
      t.integer :baseline_2_att
      t.integer :baseline_2_made
      t.float :baseline_2_pct_att
      t.float :baseline_2_pct_made
      t.integer :wing_2_att
      t.integer :wing_2_made
      t.float :wing_2_pct_att
      t.float :wing_2_pct_made
      t.integer :high_paint_att
      t.integer :high_paint_made
      t.float :high_paint_pct_att
      t.float :high_paint_pct_made
      t.integer :low_paint_att
      t.integer :low_paint_made
      t.float :low_paint_pct_att
      t.float :low_paint_pct_made
      t.integer :threes_att
      t.integer :threes_made
      t.float :threes_pct_att
      t.float :threes_pct_made
      t.integer :outside_the_paint_att
      t.integer :outside_the_paint_made
      t.float :outside_the_paint_pct_att
      t.float :outside_the_paint_pct_made
      t.integer :in_the_paint_att
      t.integer :in_the_paint_made
      t.float :in_the_paint_pct_att
      t.float :in_the_paint_pct_made
      t.integer :short_att
      t.integer :short_made
      t.float :short_pct_att
      t.float :short_pct_made
      t.integer :mid_att
      t.integer :mid_made
      t.float :mid_pct_att
      t.float :mid_pct_made
      t.integer :long_att
      t.integer :long_made
      t.float :long_pct_att
      t.float :long_pct_made
      t.integer :jump_shots_att
      t.integer :jump_shots_made
      t.float :jump_shots_pct_att
      t.float :jump_shots_pct_made
      t.integer :hook_shots_att
      t.integer :hook_shots_made
      t.float :hook_shots_pct_att
      t.float :hook_shots_pct_made
      t.integer :tip_shots_att
      t.integer :tip_shots_made
      t.float :tip_shots_pct_att
      t.float :tip_shots_pct_made
      t.integer :layup_shots_att
      t.integer :layup_shots_made
      t.float :layup_shots_pct_att
      t.float :layup_shots_pct_made
      t.integer :dunk_shots_att
      t.integer :dunk_shots_made
      t.float :dunk_shots_pct_att
      t.float :dunk_shots_pct_made
      t.integer :at_rim_layup_shots_att
      t.integer :at_rim_layup_shots_made
      t.float :at_rim_layup_shots_pct_att
      t.float :at_rim_layup_shots_pct_made
      t.integer :at_rim_dunk_shots_att
      t.integer :at_rim_dunk_shots_made
      t.float :at_rim_dunk_shots_pct_att
      t.float :at_rim_dunk_shots_pct_made
      t.float :layup_shots_per_at_rim_shots_pct_att
      t.float :dunk_shots_per_at_rim_shots_pct_att

      t.timestamps
    end
  end
end
