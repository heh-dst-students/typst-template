#let default_style_config(
  decorations_color: rgb("#2F5496"),
  primary_color: rgb("#2756a2"),
  onprimary_color: rgb("#FFFFFF"),
) = {
  (
    decorations_color: decorations_color,
    primary_color: primary_color,
    onprimary_color: onprimary_color
  )
}

#let default_contact_config(
  address_line1: "Avenue Victor Maistriau 8a",
  address_line2: "B-7000 Mons",
  phone_nr_pretty: "+32 (0)65 33 81 54",
  phone_nr_short: auto,
  mail: "scitech-mons@heh.be",
) = {
  (
    address_line1: address_line1,
    address_line2: address_line2,
    phone_nr_pretty: phone_nr_pretty,
    phone_nr_short: if phone_nr_short == auto { 
      phone_nr_pretty.replace("(0)", "").replace(" ", "")
    } else { phone_nr_short },
    mail: mail
  )
}

#let default_naming_config(
  short_name: "DST",
  full_name: "Département des sciences et technologies",
  
  logo_title: "Sciences",
  logo_subtitle: "et technologies"
) = {
  (
    short_name: short_name,
    full_name: full_name,

    logo_title: logo_title,
    logo_subtitle: logo_subtitle
  )
}

// Les configs du DST sont les configurations par défaut
#let dst_naming_config() = { return default_naming_config }
#let dst_contact_config() = { return default_contact_config }
#let dst_style_config() = {
  default_style_config.with(
    primary_color: rgb("#E41513"),
    onprimary_color: rgb("#FFFFFF")
  )
}

#let dst_config(
  naming: dst_naming_config(),
  contact: dst_contact_config(),
  style: dst_style_config()
) = {
  (
    naming: naming(),
    contact: contact(),
    style: style()
  )
}

#let dss_ms_naming_config() = {
  default_naming_config.with(
    short_name: "DSS-MS",
    full_name: "Département des sciences sociales (Mons)",

    logo_title: "Sciences",
    logo_subtitle: "sociales"
  )
}

#let dss_ms_contact_config() = {
  default_contact_config.with(
    address_line1: "Avenue Victor Maistriau 13",
    address_line2: "B-7000 Mons",
    phone_nr_pretty: "+32 (0)65 39 48 90",
    mail: "social-mons@heh.be"
  )
}

#let dss_style_config() = {
  default_style_config.with(
    primary_color: rgb("#D4641B"),
    onprimary_color: rgb("#FFFFFF"),
  )
}

#let dss_ms_config(
  naming: dss_ms_naming_config(),
  contact: dss_ms_contact_config(),
  style: dss_style_config()
) = {
  (
    naming: naming(),
    contact: contact(),
    style: style()
  )
}

#let dss_to_naming_config() = {
  default_naming_config.with(
    short_name: "DSS-TO",
    full_name: "Département des sciences sociales (Tournai)",
  )
}

#let dss_to_contact_config() = {
  default_contact_config.with(
    address_line1: "Rue des Carmes 19B",
    address_line2: "B-7500 Tournai",

    phone_nr_pretty: "+32 (0)69 22 55 12",
    mail: "social-tournai@heh.be",
  )
}

#let dss_to_config(
  naming: dss_to_naming_config(),
  contact: dss_to_contact_config(),
  style: dss_style_config()
) = {
  (
    naming: naming(),
    contact: contact(),
    style: style()
  )
}

#let dsee_ms_naming_config() = {
  default_naming_config.with(
    short_name: "DSEE-MS",
    full_name: "Département des sciences de l'éducation et de l'enseignement (Mons)",

    logo_title: "Sciences de l'éducation",
    logo_subtitle: "et Enseignement"
  )
}

#let dsee_ms_contact_config() = {
  default_contact_config.with(
    address_line1: "Boulevard Albert-Elisabeth 2",
    address_line2: "B-7000 Mons",
    
    phone_nr_pretty: "+32 (0)65 33 76 66",
    mail: "peda-mons@heh.be",
  )
}

#let dsee_style_config() = {
  default_style_config.with(
    primary_color: rgb("#B73B6F"),
    onprimary_color: rgb("#FFFFFF"),
  )
}

#let dsee_ms_config(
  naming: dsee_ms_naming_config(),
  contact: dsee_ms_contact_config(),
  style: dsee_style_config()
) = {
  (
    naming: naming(),
    contact: contact(),
    style: style()
  )
}

#let dsee_to_naming_config() = {
  default_naming_config.with(
    short_name: "DSS-TO",
    full_name: "Département des sciences de l'éducation et de l'enseignement (Tournai)",
  )
}

#let dsee_to_contact_config() = {
  default_contact_config.with(
    address_line1: "Rue des Carmes 19B",
    address_line2: "B-7500 Tournai",

    phone_nr_pretty: "+32 (0)69 22 55 12",
    mail: "peda-tournai@heh.be",
  )
}

#let dsee_to_config(
  naming: dsee_to_naming_config(),
  contact: dsee_to_contact_config(),
  style: dsee_style_config()
) = {
  (
    naming: naming(),
    contact: contact(),
    style: style()
  )
}

#let deco_naming_config() = {
  default_naming_config.with(
    short_name: "DECO",
    full_name: "Département des sciences juridiques, économiques et de gestion",

    logo_title: "Sciences juridiques,",
    logo_subtitle: "économiques et de gestion",
  )
}

#let deco_contact_config() = {
  default_contact_config.with(
    address_line1: "Rue du Chambge 23",
    address_line2: "B-7500 Tournai",

    phone_nr_pretty: "+32 (0)69 22 67 72",
    mail: "eco-tournai@heh.be"
  )
}

#let deco_style_config() = {
  default_style_config.with(
    primary_color: rgb("#6770AC"),
    onprimary_color: rgb("#FFFFFF"),
  )
}

#let deco_config(
  naming: deco_naming_config(),
  contact: deco_contact_config(),
  style: deco_style_config()
) = {
  (
    naming: naming(),
    contact: contact(),
    style: style()
  )
}

