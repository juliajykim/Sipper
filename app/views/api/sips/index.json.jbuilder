# json.array! @sips, :id, :body  #return array of all sips! 
# [{id:1, body:'sip1'}, {id:2, body:'sip2'}, {id:3, body:'sip3'}...]


@sips.each do |sip|
    json.set! sip.id do #turn sip.id into a key fo the individual sip obj
        json.extract! sip, :id, :body #each sip will have its' data stored under a key of its' id
        # json.partial! 'api/sips/sip', sip: sip

        json.author do #setting another key 'author'
            json.extract! sip.author, :id, :username
                          #belongs to association in sip model
        end # N+1 query :( => can be solved by adding Active Record Sip.all.includes(:author) in controller
    end
end
# => returns obj of sips with key of its' id & nested key author
# {
#  1: {id:1, body:'sip1', author:{id:1 username: 'goat'}}, 
#  2: {id:2, body:'sip2', author:{id:2 username: 'goat2'}}, 
#  3: {id:3, body:'sip3', author:{id:3 username: 'goat3'}}
# } 