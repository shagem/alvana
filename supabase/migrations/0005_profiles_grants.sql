-- RLS policies on public.profiles were in place, but the underlying table-level
-- grants for the authenticated role were missing (PostgREST error 42501:
-- "permission denied for table profiles"). RLS only applies after the grant
-- check passes, so both are required.

grant select, insert, update on public.profiles to authenticated;
