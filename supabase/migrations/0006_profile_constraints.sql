-- Raise the avatar picker from 3 to 9 presets and constrain avatar_id to the
-- valid range at the DB level (previously unconstrained, see security review).
-- Also enforce the username format/length rule server-side as a backstop to
-- the client-side check in account.astro, since RLS lets a user write any
-- value to their own row directly via the API.

alter table public.profiles
  add constraint profiles_avatar_id_range check (avatar_id between 1 and 9);

alter table public.profiles
  add constraint profiles_username_format
    check (username is null or username ~ '^[a-zA-Z0-9_]{3,24}$');
