require_relative "model.rb"
require "sqlite3"

def upload_file(user_id, file_name, upload_date)
    db = SQLite3::Database.new("db/database.db")
    db.execute("INSERT INTO files (user_id, file_name, upload_date) values (?, ?, ?)", [user_id, file_name, upload_date])
end

def upload_avatar(slimroute, user_id)
    db = SQLite3::Database.new("db/database.db")
    db.execute("UPDATE users SET avatar=? WHERE user_id=?", [slimroute, user_id])
end

def user_info(user_id)
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("SELECT * FROM users WHERE user_id=?", user_id)[0]
end

def comment_info()
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("""
        SELECT comments.*, users.username FROM comments
        INNER JOIN users
        ON users.user_id = comments.user_id
        """)
end

def upload_comment(comment, user_id, parent_id, song_id)
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("INSERT INTO comments (comment, user_id, parent_id, song_id) VALUES (?, ?, ?, ?)", [comment, user_id, parent_id, song_id])
end

def confirm_user(emailreg)
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("SELECT user_id, password FROM users WHERE email=?", emailreg)
end

def create_user(username, email, password_digest)
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("INSERT INTO users (username, email, password) values (?,?,?)",[username, email, password_digest])
end

def user_comments(user_id)
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("SELECT * FROM comments WHERE user_id = ?", [user_id])
end

def user_files(user_id)
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("SELECT file_name FROM files WHERE user_id = ?", [user_id])
end

def delete_file(todo_id)
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("DELETE FROM files WHERE file_name = ?",todo_id)
end

def update_file(new_comment, comment_id)
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("UPDATE comments SET comment = ? WHERE comment_id = ?",[new_comment, comment_id])

end

def existing_emails()
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("SELECT email FROM users")
end

def file_info()
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("SELECT * FROM files")
end

def attempt_login(ip, attempts, latest_attempt)
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
#   Anv'nd inte INSERT använd UPDATE istället och uppdatera alla värden
#    db.execute("INSERT INTO attempt_login (ip, attempts) values (?, ?)", [ip, attempts])
    db.execute("UPDATE attempt_login SET ip = ?, attempts = ?, latest_attempt = ?", [ip, attempts, latest_attempt])
end

def last_login()
    db = SQLite3::Database.new("db/database.db")
    db.results_as_hash = true
    db.execute("SELECT latest_attempt FROM attempt_login")[0][0]
end