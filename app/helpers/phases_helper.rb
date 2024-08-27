module PhasesHelper
  def status_color(status)
    case status
    when "pending"
      "bg-yellow-100 text-yellow-800"
    when "in_progress"
      "bg-blue-100 text-blue-800"
    when "completed"
      "bg-green-100 text-green-800"
    else
      "bg-gray-100 text-gray-800"
    end
  end
end
