json.extract! valet_datum, :id, :ticket, :requested, :accepted, :assigned, :completed, :description, :created_at, :updated_at
json.url valet_datum_url(valet_datum, format: :json)
