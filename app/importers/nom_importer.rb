class NomImporter
  def self.import(nom_array)

    if nom_array[1] == ["Empresa", "Dirección", "NOM", "DOT", "Marca"]

      brand_producer_id = 0
      nom_array.drop(2).each do |row|

        #guard against nil rows
        if row
          if is_producer_row(row[2])
            producer = Producer.create(name: row[0].to_s, address: row[1], nom: row[2].to_i, dot: row[3].to_i)
            brand_producer_id = producer.id
          end
          Brand.create(name: row[4].to_s, producer_id: brand_producer_id)
        end
      end
    else
      puts 'invalid file format'
    end
  end

  def self.is_producer_row(cell)
    !cell.blank?
  end
  private_class_method :is_producer_row

end
