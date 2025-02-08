module ApplicationHelper
  def default_meta_tags
    {
      site: "Dinner Time !",
      title: "Find delicious recipes without wasting time or ingredients - your perfect meal starts here!",
      separator: "|",
      description: "Find delicious recipes without wasting time or ingredients - your perfect meal starts here!",
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url("favicon.ico") },
        { href: image_url("logo.jpg"), rel: "apple-touch-icon", sizes: "180x180", type: "image/jpg" },
      ],
      og: {
        site_name: "Dinner Time !",
        title: "Find delicious recipes without wasting time or ingredients - your perfect meal starts here!",
        description: "Find delicious recipes without wasting time or ingredients - your perfect meal starts here!",
        type: "website",
        url: request.original_url,
        image: image_url("logo.jpg"),
      },
    }
  end
end
