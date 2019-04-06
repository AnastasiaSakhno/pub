#!/bin/env ruby
# encoding: utf-8

class TableReservation < ActiveRecord::Base
  attr_accessible :chat_id, :date, :hall, :hour_from, :hour_to, :people_number, :table, :user_name, :user_phone, :status

  HALL1_TABLES = (1..13).map { |x| x.to_s }
  HALL2_TABLES = (1..23).map { |x| "П#{x}"}

  scope :for_date, ->(date) { where(date: date) }
  scope :for_hall, ->(hall) { where(hall: hall) }
  scope :for_hour_between, ->(hour_from, hour_to) { 
  	where("hour_from <= :hour_from AND hour_to >= :hour_to
  	 OR hour_from <= :hour_from AND hour_to <= :hour_to
  	 OR hour_from >= :hour_from AND hour_to >= :hour_to", { hour_from: hour_from, hour_to: hour_to }) }

  def self.latest(chat_id)
  	TableReservation.find_last_by_chat_id(chat_id)
  end

  def self.available_tables(chat_id)
  	latest = latest(chat_id)
  	all_tables = latest.hall == 1 ? HALL1_TABLES : HALL2_TABLES
  	reserved_tables = for_date(latest.date)
  						.for_hall(latest.hall)
  						.for_hour_between(latest.hour_from, latest.hour_to)
  						.pluck(ActiveRecord::Base.connection.quote_column_name(:table))
  	all_tables - reserved_tables
  end
end
