json.array!(@infoleys) do |infoley|
  json.extract! infoley, :id, :numero_ley, :fecha, :tipo, :exp_simpl, :cont_ley, :proy_ley
  json.url infoley_url(infoley, format: :json)
end
