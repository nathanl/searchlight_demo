# TODO 

- Add examples of:
  - searchlight + sequel
  - searchlight in mounted Sinatra and Roda apps (new adapters needed?)
  - search with ransack (and others?)

- Add a multi-select (category?)
- See if remaining SL helpers needed
  - is checked? needed? Do "enough" databases understand form booleans?
    - see https://dba.stackexchange.com/questions/116799/do-relational-databases-typically-understand-1-and-0-as-booleans
    - I think I will keep but rename it because we Sequel + Postgres can query `IS TRUE` instead of `= '1'`. Users don't have to use it.
  - instead of filled?, can we just have blank? that matches ActiveSupport behavior? Less to explain
