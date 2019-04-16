module TableReservationsHelper
  def statuses
    t('activerecord.attributes.table_reservation.statuses').map { |st|
      OpenStruct.new(id: st[0], name: st[1])
    }
  end
end