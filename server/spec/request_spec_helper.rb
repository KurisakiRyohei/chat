module RequestSpecHelper
  def emulate_login(email, password)
    r = User.login(email, password)
    cookies['session_id'] = r.data.session_id
  end

  def parse_json(response)
    JSON.parse(response.body, symolize_name: true)
  end
end