class KadaikanrisReport < BaseReport
  def initialize(kadaikanris)
    @kadaikanris = kadaikanris
  end

  private

  attr_reader :kadaikanris

  def template_name
    'kadaikanris'
  end

  def build
    kadaikanris.each do |kadaikanri|
      report.list.add_row do |row|
        row.values no: kadaikanri.no,
                   entrydate: kadaikanri.entrydate,
                   updated_at: kadaikanri.updated_at,
                   reporter: kadaikanri.reporter,
                   location: kadaikanri.location,
                   content: kadaikanri.content,
                   plan: kadaikanri.plan,
                   status_name: kadaikanri.status.name
      end
      # フッタに現在時刻挿入
      report.list.on_footer_insert do |footer|
        footer.item(:today).value(Time.zone.now)
      end
    end
  end
end
