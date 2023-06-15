module LovesHelper
  def html_safe_newline(str)
    h(str).gsub(/\R/, "<br>").html_safe
  end
end
