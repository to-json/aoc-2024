(import http)

# would probably just copy the module in and update these each day if i keep using janet
(def year 2024)
(def day 2)
# lmao securrrrre
(def cookiefile (string (os/getenv "HOME") "/.aoc-cookies.txt"))

# having too much fun here, this didn't need to be like this
(defn get-cookies [cookiefile]
  (->> (slurp cookiefile)
       (string/trim)
       (string/replace-all "\"" "")
       (string)))

# (get-cookies "./cookies.txt")

(defn get-input
  [year day]
  (let (cookies {"Cookie" (get-cookies cookiefile)}
                url (string "https://adventofcode.com/" (string year) "/day/" (string day) "/input"))
    (http/get url :follow-redirects true :headers cookies)))

(defn today []
  ((get-input year day) :body))

# lol this is probably more typing than just using parens but i like reading it
(defn lines []
  (->> (today)
       (string/split "\n")))

# (lines)
