variable "default_webacls" {
  type = list(string)
  description = "Default WebACLs to for the dashboard filter."
  default = []
}

variable "threshold_allowed_caution" {
  type = number
  description = "Caution threshold for allowed requests. Reflected when the percentage of allowed requests drops below this number."
  default = 95
}

variable "threshold_allowed_warning" {
  type = number
  description = "Warning threshold for allowed requests. Reflected when the percentage of allowed requests drops below this number."
  default = 85
}

variable "threshold_blocked_caution" {
  type = number
  description = "Caution threshold for blocked requests. Reflected when the percentage of blocked requests rises above this number."
  default = 5
}

variable "threshold_blocked_warning" {
  type = number
  description = "Warning threshold for blocked requests. Reflected when the percentage of blocked requests rises above this number."
  default = 10
}

variable "threshold_counted_caution" {
  type = number
  description = "Caution threshold for counted requests. Reflected when the percentage of counted requests rises above this number."
  default = 5
}

variable "threshold_counted_warning" {
  type = number
  description = "Warning threshold for counted requests. Reflected when the percentage of counted requests rises above this number."
  default = 10
}

variable "threshold_limited_caution" {
  type = number
  description = "Caution threshold for rate limited requests. Reflected when the percentage of rate limited rises above below this number."
  default = 5
}

variable "threshold_limited_warning" {
  type = number
  description = "Warning threshold for rate limited requests. Reflected when the percentage of rate limited requests rises above this number."
  default = 10
}

variable "title" {
  type = string
  description = "Title of the dashboard."
  default = "Web Application Firewall (WAF)"
}
