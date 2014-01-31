json.array! @appointments do |appointment|
  json.start appointment.starts_at
  json.title appointment.patient.initials
end

