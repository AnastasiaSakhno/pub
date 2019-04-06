#!/bin/env ruby
# encoding: utf-8

class TableReservation < ActiveRecord::Base
  attr_accessible :chat_id, :date, :hall, :time_from, :time_to, :people_number, :table, :user_name, :user_phone, :status

  HALL1_TABLES = (1..13).map { |x| x.to_s }
  HALL2_TABLES = (1..23).map { |x| "П#{x}"}

  scope :for_date, ->(date) { where(date: date) }
  scope :for_hall, ->(hall) { where(hall: hall) }
  scope :for_time_between, ->(time_from, time_to) { 
  	where("time_from <= :time_from AND time_to >= :time_to
  	 OR time_from <= :time_from AND time_to <= :time_to
  	 OR time_from >= :time_from AND time_to >= :time_to", { time_from: time_from, time_to: time_to }) }
  scope :not_rejected, -> { where(arel_table[:status].not_eq(:rejected))}

  before_save :define_time_lasts_up, if: :time_from_changed?

  def self.latest(chat_id)
  	TableReservation.find_last_by_chat_id(chat_id)
  end

  def self.available_tables(chat_id)
  	latest = latest(chat_id)
  	all_tables = latest.hall == 1 ? HALL1_TABLES : HALL2_TABLES
  	reserved_tables = for_date(latest.date)
  						.for_hall(latest.hall)
  						.for_time_between(latest.time_from, latest.time_to)
  	all_tables - reserved_tables
  end

  private

  def define_time_lasts_up
    self.time_lasts_up = time_from + 30.minutes
  end
end
