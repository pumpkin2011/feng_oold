$ ->
  $(document).on 'ready page:load', ->
    recruitment_fee_field($(":radio[name='job[gender]']:checked").val())
    management_fee_content()

  # 切换男女时
  $(":radio[name='job[gender]']").change (e) ->
    recruitment_fee_field($(this).val())

  recruitment_fee_field = (value) ->
    $female_field = $('.female_field')
    $male_field   = $('.male_field')
    if value == 'male'
      $female_field.hide()
      $male_field.show()
      $female_field.find("[name$='[_destroy]']").val('true')
      $male_field.find("[name$='[_destroy]']").val('false')
    else if value == 'female'
      $female_field.show()
      $male_field.hide()
      $female_field.find("[name$='[_destroy]']").val('false')
      $male_field.find("[name$='[_destroy]']").val('true')
    else
      $female_field.show()
      $male_field.show()
      $female_field.find("[name$='[_destroy]']").val('false')
      $male_field.find("[name$='[_destroy]']").val('false')

  # 切换招聘费和管理费时
  $(".fee_type").on 'click', (e) ->
    fee_field($(this).attr('id'))

  fee_field = (value) ->
    $recruitment = $('.recruitment_field')
    $management  = $('.management_field')
    if value == 'recruitment'
      $recruitment.find("[name$='[_destroy]']").val('false')
      $management.find("[name$='[_destroy]']").val('true')
    else if value == 'management'
      $recruitment.find("[name$='[_destroy]']").val('true')
      $management.find("[name$='[_destroy]']").val('false')
    else
      $recruitment.find("[name$='[_destroy]']").val('false')
      $management.find("[name$='[_destroy]']").val('false')

  # 管理费字幕
  $('.management_fee_input').on 'input', (e) ->
    management_fee_content()

  management_fee_content = ->
    months = $('.management_fee_input#job_management_fee_attributes_months').val()
    amount = $('.management_fee_input#job_management_fee_attributes_amount').val()
    $('#management_fee_months').html months || '__'
    $('#management_fee_amount').html amount || '__'
    $('#management_fee_day').html $('.management_fee_input#job_management_fee_attributes_day').val() || '__'
    $('#management_fee_deadline').html $('.management_fee_input#job_management_fee_attributes_deadline').val() || '__'
    $('#management_fee_amounts').html months * amount
