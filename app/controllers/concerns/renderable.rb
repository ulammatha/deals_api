module Renderable
  def render_created_response(object, serializer)
    render(
      json: object,
      serializer: serializer,
      status: :created
    )
  end

  def render_ok_response(object, serializer)
    render(
      json: object,
      serializer: serializer,
      status: :ok
    )
  end

  def render_unprocessable_entity_response(error_messages)
    render(
      json: { errors: error_messages },
      status: :unprocessable_entity
    )
  end

  def render_unauthorized(error_messages)
    render(
      json: { errors: error_messages },
      status: :unauthorized
      )
  end
end
