module ActiveApplication
  module BaseHelper
    def application_name
      t("application.name", default: "Active Application")
    end
  end
end
