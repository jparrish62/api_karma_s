class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :name,  :start_time, :basic_services,
                  :chemical_services,  :color_services,:treatment_services,
                  :braids, :comment,   :weave
end
