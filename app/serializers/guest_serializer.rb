class GuestSerializer < ActiveModel::Serializer
  attributes :id, :name, :occupation 
end

# rails g serializer guest --no-test-framework