defmodule SelphiCmsWeb.Live.LiveCom do
  #    use Surface.LiveView
  use SelphiCmsWeb, :surface_view

  alias SelphiDaisy.Badge
  alias SelphiDaisy.Button

  def render(assigns) do
    ~F"""
    <Badge>
     first badge
    </Badge>

    <Button label="ok"  />
    """
  end
end
