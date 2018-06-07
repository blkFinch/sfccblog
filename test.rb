Superbill.group(:encounter_form_id).having("count(encounter_form_id) > 1").each do |bill |
  old = Superbill.where(encounter_form_id: bill.encounter_form_id).where.not(id: bill.id)