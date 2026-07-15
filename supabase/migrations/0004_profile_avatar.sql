-- Add a preset-avatar picker to profiles: avatar_id refers to a small fixed
-- set of images shipped in the app itself (src/assets/avatars)

alter table public.profiles
  add column avatar_id smallint not null default 1;
