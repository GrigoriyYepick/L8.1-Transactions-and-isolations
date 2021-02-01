# L8.1-Transactions-and-isolations
 
### Build:
```
docker-compose build

docker-compose up -d
```

### Init table
Open and execute script.
```
queries\init_table.sql
```

It will init Authors table with values:
```
"Id"	"FirstName"	"SecondName"	"Books_Count"
"1"	"Arthur"	"Clarke"	"21"
"2"	"Richard"	"Clarke"	"10"
"3"	"Susanna"	"Clarke"	"2"
"4"	"Arthur"	"Doyle"	        "33"
```

## Lost update
| lost_update.sql | lost_update_2.sql     | 
| ------------- | ----------------------- | 
| Starts transaction |      | 
| Calculates AVG books count  for authors with Name = 'Arthur'<br> AVG = 27     |  | 
|  | Starts transaction     | 
|  | Reads to var books count for author 'Arthur Doyle' |
|  | Updates books count for author 'Arthur Doyle' as [old value] + 100 |
|  | Commits transaction |
|  | New value<br><br><pre>"Id" "FirstName" "SecondName" "Books_Count"<br>"4"  "Arthur"    "Doyle"      "133" |
| Updates books count for authors with Name = 'Arthur' | |
| Commits transaction | |
| New values <br><br><pre>"Id" "FirstName" "SecondName" "Books_Count"<br>"1"  "Arthur"    "Clarke"     "27"<br>"4"  "Arthur"    "Doyle"      "27" |  |

## Dirty read

**Table values restored to initial state**

| dirty_reads.sql | dirty_reads_2.sql     | 
| ------------- | ----------------------- | 
| Starts transaction |      | 
| Updates book count for all rows with value 1     |  | 
|  | Starts transaction with READ UNCOMMITTED isolation level    | 
|  | Stores SUM of book count for all rows into var @books |
|  | Current value<br>"@books"<br>"4" |
| Rollbacks transaction |  |
| End values <br><br><pre>"Id" "FirstName" "SecondName" "Books_Count"<br>"1"  "Arthur"    "Clarke"     "21"<br>"2"  "Richard"   "Clarke"     "10"<br>"3"  "Susanna"   "Clarke"     "2"<br>"4"  "Arthur"    "Doyle"      "33" |  |

## Non repeatable read

**Table values restored to initial state**

| non_repeatable_read.sql | non_repeatable_read_2.sql     | 
| ------------- | ----------------------- | 
| Starts transaction with READ COMMITTED isolation level |      | 
| Stores SUM of book count for all rows into var @books     |  | 
| Current value<br>"@books"<br>"66" |  |
|  | Starts transaction    | 
|  | Updates book count for all rows with value 1 |
|  | Commits transaction |
| Stores SUM of book count for all rows into var @books again |  |
| Current value<br>"@books"<br>"4" |  |
| Commits transaction |  |

## Phantom reads

**Table values restored to initial state**

| phantom_reads.sql | phantom_reads_2.sql     | 
| ------------- | ----------------------- | 
| Starts transaction with REPEATABLE READ isolation level |      | 
| Stores SUM of book count for all rows into var @books2     |  | 
| Current value<br>"@books2"<br>"66" |  |
|  | Starts transaction    | 
|  | Inserts new rows into table<br><br><pre>"FirstName" "SecondName" "Books_Count"<br>"Agatha"    "Christie"   "74"<br>"Philip"    "Dick"       "44"<br> |
|  | Commits transaction |
| Stores SUM of book count for all rows into var @books2 again |  |
| Current value<br>"@books2"<br>"66" |  |
| Commits transaction |  |
