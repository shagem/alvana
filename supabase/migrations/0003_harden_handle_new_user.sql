-- Address Supabase linter warnings on public.handle_new_user:
-- pin search_path (security definer functions should never have a mutable one)
-- and revoke public/anon/authenticated EXECUTE (it should only run via the trigger).

alter function public.handle_new_user() set search_path = public, pg_temp;

revoke execute on function public.handle_new_user() from public, anon, authenticated;

-- public.rls_auto_enable() predates this repo's migration history (event trigger that
-- auto-enables RLS on any new public table). search_path is already pinned; just close
-- the "publicly executable" lint warnings the same way.
revoke execute on function public.rls_auto_enable() from public, anon, authenticated;
