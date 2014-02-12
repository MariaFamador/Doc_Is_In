json.array! @appointments do |appointment|
  json.start appointment.starts_at
  json.title appointment.patient.initials
  json.url edit_appointment_url(appointment.id)
end
