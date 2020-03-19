require "slim"
require "sinatra"
require "sqlite3"
require "bcrypt"
require "highline/import"
require_relative "model.rb"

enable :sessions

db = SQLite3::Database.new("db/database.db")
db.results_as_hash = true

existing_emails = db.execute("SELECT email FROM users")

files = Dir.entries("public/audio")
files = files[2..files.length-1]
comp = Dir.entries("public/audio/Compositions")
#comp = db.execute("SELECT * FROM files")["file_name"]
comp = comp[2..comp.length-1]
trans = Dir.entries("public/audio/Transcriptions")
trans = trans[2..trans.length-1]
comp_without_ext = []
trans_without_ext = []

comp.each do |compos|
    comp_without_ext << File.basename(compos,File.extname(compos))
end

trans.each do |transis|
    trans_without_ext << File.basename(transis, File.extname(transis))
end

progproj = Dir.entries("public/programmingprojects")
progproj = progproj[2..progproj.length-1]

get("/") do
    session[:user_id] = nil
    slim(:index, locals:{files:files, comp:comp, trans:trans, progproj:progproj})
end

get("/must_be_logged_in_error") do
    redirect("/sign_in")
    # slim(:must_be_logged_in_error)
end

get("/index") do
    session[:user_id] = nil
    slim(:index, locals:{files:files, comp:comp, trans:trans, progproj:progproj})
end

get("/projects") do
    if session[:user_id] == nil 
        redirect('/must_be_logged_in_error')
    else
        slim(:projects, locals:{files:files, comp:comp, trans:trans, progproj:progproj})
    end
end

get("/upload") do
    if session[:user_id] == nil 
        redirect('/must_be_logged_in_error')
    else
        slim(:upload)
    end
end

post("/upload") do
    unless params[:file] &&
            (tempfile = params[:file][:tempfile]) &&
            (name = params[:file][:filename])
        @error = "No file selected"
        return slim(:upload)
    end

    upload_date = Time.new.inspect.split(" +")[0]
    db.execute("INSERT INTO files (user_id, file_name, upload_date) values (?, ?, ?)", [session[:user_id], name, upload_date])

    puts "Upload file, original name #{name.inspect}"
    fileextension = params[:file]["filename"]
    if File.extname("#{fileextension}") == ".mp3" or File.extname("#{fileextension}") == ".wav"
        folder = params[:folder]
        target = "public/audio/#{folder}/#{name}"
    else
        target = "public/img/#{name}"
        slimroute = "img/#{name}"
        db.execute("UPDATE users SET avatar=? WHERE user_id=#{session[:user_id]}", slimroute)
    end
    File.open(target, "wb") {|f| f.write tempfile.read}
    "Upload complete"
    redirect("/logged_in")
end

get("/web") do
    allinfo = db.execute("SELECT * FROM users WHERE user_id=?", session[:user_id])[0]
    slim(:web, locals: {allinfo: allinfo})
end

get("/error") do
    slim(:error)
end

get("/logged_in") do

    allinfo = db.execute("SELECT * FROM users WHERE user_id=?", session[:user_id])[0]
    allcommentinfo = db.execute("""
        SELECT comments.*, users.username FROM comments
        INNER JOIN users
        ON users.user_id = comments.user_id
        """)

    comments_info = {}

    allcommentinfo.each do |comment|
        if !comment["parent_id"]
            comments_info[comment["comment_id"]] = comment
            comment["replies"] = []
        else
            parent_id = comment["parent_id"]
            comments_info[parent_id]["replies"] << comment
        end
    end

    search = params[:search]
    if session[:user_id] == nil
        redirect('/must_be_logged_in_error')
    else
        slim(:logged_in, locals: {search: search, comments_info: comments_info.values, allinfo: allinfo, files:files, comp_without_ext: comp_without_ext, trans_without_ext: trans_without_ext, progproj:progproj})
    end
end

get("/:i/musicdisc") do
    song_id = params[:i]
    allinfo = db.execute("SELECT * FROM users WHERE user_id=?", session[:user_id])[0]
    allcommentinfo = db.execute("""
        SELECT comments.*, users.username FROM comments
        INNER JOIN users
        ON users.user_id = comments.user_id
        """)

    comments_info = {}

    allcommentinfo.each do |comment|
        if !comment["parent_id"]
            comments_info[comment["comment_id"]] = comment
            comment["replies"] = []
        else
            parent_id = comment["parent_id"]
            comments_info[parent_id]["replies"] << comment
        end
    end
    slim(:musicdisc, locals: {comments_info: comments_info.values, song_id: song_id})
end

=begin 
Om jag skulle vilja ha ett "main" kommentarfält på start sidan
post("/comment") do
    comment = params[:comment]
    parent_id = params[:parent_id]
    song_id = params[:id]
    db.execute("INSERT INTO comments (comment, user_id, parent_id, song_id) VALUES (?, #{session[:user_id]}, ?, ?)", [comment, parent_id, song_id])
    redirect("/logged_in")
end 
=end

post("/:id/comment") do
    comment = params[:comment]
    parent_id = params[:parent_id]
    song_id = params[:id]
    db.execute("INSERT INTO comments (comment, user_id, parent_id, song_id) VALUES (?, #{session[:user_id]}, ?, ?)", [comment, parent_id, song_id])
    redirect("/logged_in")
end

get("/sign_in") do
    slim(:sign_in)
end

post("/sign_in") do
    emailreg = params[:emailreg]
    session[:username] = emailreg
    passwordreg = params[:passwordreg]
    result = db.execute("SELECT user_id, password FROM users WHERE email=?", emailreg)

    if result.empty?
        redirect("/error")
    end

    password_digest_reg = result.first["password"]
    if BCrypt::Password.new(password_digest_reg) == passwordreg
        session[:user_id] = result.first["user_id"]
        redirect("/logged_in")
    else
        redirect("/error")
    end
end

get("/sign_up") do
    slim(:sign_up)
end

post("/sign_up") do
    username = params[:username]
    email = params[:email]
    session[:username] = email
    password = params[:password]
    password_digest = BCrypt::Password.create("#{password}")
    if existing_emails.include? email
        redirect("/error_email_exist") 
    else
        create_user = db.execute("INSERT INTO users (username, email, password) values (?,?,?)",[username, email, password_digest])
        redirect("/logged_in")
    end
end

get("/profile") do
    profile_pic = db.execute("SELECT avatar FROM users WHERE user_id = ?", [session[:user_id]])[0][0]
    user_comments = db.execute("SELECT * FROM comments WHERE user_id = ?", [session[:user_id]])

    comp_without_ext << File.basename(compos,File.extname(compos))
    trans_without_ext << File.basename(transis, File.extname(transis))

    user_songs = []
    user_files = db.execute("SELECT file_name FROM files WHERE user_id = ?", [session[:user_id]])
    user_files.each do |i|
        if File.extname(i["file_name"]) == ".mp3" || File.extname(i["file_name"]) == ".wav"
            user_songs << i["file_name"]
        end
    end

    slim(:profile, locals: {profile_pic: profile_pic, user_comments: user_comments, user_songs: user_songs})
end

post("/:id/delete") do
    todo_id = params[:id]
    db.execute("DELETE FROM files WHERE file_name = ?",todo_id)
    redirect("/profile")
end

post("/:id/edit") do
    comment_id = params[:id]
    new_comment = params[:comment]
    db.execute("UPDATE comments SET comment = ? WHERE comment_id = ?",[new_comment, comment_id])
    redirect("/profile")
end
