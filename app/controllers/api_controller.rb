post '/api' do
  redirect "https://api.datamuse.com/words?ml=#{params[:word]}"
end
