module JobHelper
  def render_recruitment_or_management(job, type, ele)
    mfee = job.management_fee.persisted?
    rfee = job.male_fees.first.persisted? || job.female_fees.first.persisted?

    if mfee == rfee && type == 'both' then
      'active'
    elsif mfee && type=='management' then
      'active'
    elsif rfee && type=='recruitment' then
      'active'
    else
      ''
    end
  end
end
