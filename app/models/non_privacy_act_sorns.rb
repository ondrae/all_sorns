class NonPrivacyActSorns
  def self.run
    conditions = { term: 'Privacy Act of 1974; System of Records' }

    fields = ["html_url","title", "type"]

    search_options = {
      conditions: conditions,
      type: 'NOTICE',
      fields: fields,
      order: 'newest',
      per_page: 1000,
      page: 1
    }
    output = []
    search_fed_reg(search_options, output)
  end

  def self.search_fed_reg(search_options, output)
    sleep 1
    puts 'Asking for SORNs'

    result_set = FederalRegister::Document.search(search_options)

    result_set.results.each do |result|
      next unless result.type == 'Notice'
      # Skip those that include he title
      next if result.title.include?('Privacy Act of 1974')

      output << [result.title, result.html_url]
    end

    # Keep making more requests until there are no more.
    search_options[:page] = search_options[:page] + 1
    if search_options[:page] <= result_set.total_pages
      search_fed_reg(search_options, output)
    else
      CSV.open("tmp/non_privacy_act_results.csv", "wb") do |csv|
        csv << ["title","html_url"]
        output.each do |row|
          csv << row
        end
      end
    end
  end
end
