-- Replace full_name with username + location on profiles.

alter table public.profiles
  add column username text unique,
  add column location text,
  drop column full_name;
