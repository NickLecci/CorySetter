-- Tabella contratti (pagamenti)
create table contratti (
  id uuid default gen_random_uuid() primary key,
  cliente text not null,
  pt_name text not null,
  pt_id uuid references personal_trainers(id) on delete set null,
  importo numeric not null,
  n_rate integer default 1,
  rate jsonb default '[]',
  created_at date default current_date
);

alter table contratti enable row level security;
create policy "Allow all" on contratti for all using (true) with check (true);
