# frozen_string_literal: true

class SeedNewVisitRequestAttendanceConfirmedEmail < ActiveRecord::Migration[5.2]
  def up
    EmailTemplate.create!(
      title:   'VisitRequestMailer#attendance_confirmed',
      subject: 'Thanks for confirming your visit',
      note:    'Will be sent when attendee answers YES in the final confirmation message',
      body:    File.read('db/seed/email_templates/attendance_confirmed.md')
    )
  end

  def down
    EmailTemplate.where(title: 'VisitRequestMailer#attendance_confirmed').delete_all
  end
end
