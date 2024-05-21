variable "nic" {
  type = map(object({
    nicname = string
    location = string
    rgname = string
    vname = string
    sname = string
    pipname = optional(string)
  })
  )
}