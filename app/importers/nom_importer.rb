class NomImporter

  def import(nom_array)
    if has_expected_columns?(nom_array)
      brand_producer_id = 0

      nom_array.drop(2).each do |row|
        unless empty?(row)
          if producer_row?(row[2])
            brand_producer_id = create_or_update_producer(row)
          end
          Brand.create(name: row[4].to_s, producer_id: brand_producer_id)
        end

      end
    else
      puts 'invalid file format'
    end
  end

  private

  def create_or_update_producer(row)
    producer = Producer.create(name: row[0].to_s, address: row[1], nom: row[2].to_i, dot: row[3].to_i)
    producer.id
  end

  def producer_row?(cell)
    !cell.blank?
  end

  def empty?(row)
    row.nil? || row.empty?
  end

  def has_expected_columns?(nom_array)
    nom_array[1] == ["Empresa", "Dirección", "NOM", "DOT", "Marca"]
  end
end
