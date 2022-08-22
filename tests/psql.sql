do
$$
declare
  count integer;
  hasErrors boolean := false;
begin
  raise notice '===============================================================';
  select count(*) into count from users;
  if count < 100 then
    hasErrors := true;
    raise notice '=!= found less than 100 users in DB after running seeds script, found only %', count;
  end if;

  select count(*) into count from items;
  if count < 100 then
    hasErrors := true;
    raise notice '=!= found less than 100 items in DB after running seeds script, found only %', count;
  end if;

  select count(*) into count from comments;
  if count < 100 then
    hasErrors := true;
    raise notice '=!= found less than 100 comments in DB after running seeds script, found only %', count;
  end if;

  if hasErrors = false then
    raise notice 'Great, looks like your database have some data in it';
  end if;

  raise notice '===============================================================';

  if hasErrors then
    raise exception '*** Found several errors, please fix them';
  end if;
end
$$
