(import "../aoc/aoc")

(def split-spaces (partial string/split " "))

(def convert-ints (partial map (fn [elem] (if (not (= elem "")) (int/to-number (int/s64 elem)) 0))))

(defn parse-report
  "turn a string report into an array of ints"
  [report]
  (->> report
       split-spaces
       convert-ints))

(defn perms [report]
  (seq
    [idx :range (0 (length report))]
    (let [p report]
      (array/remove (apply array p ) idx))
    ))

              (perms [ 1 3 6 7 9 ])
(defn gradual? [report]
  # (reduce2 (fn [a e] (let [diff (math/abs (- a e))] (and (> 4 diff) (< 0 diff)))) report)
  (all identity (seq
                  [idx :range (0 (length report))]
                  (if-let [right (get report (+ idx 1))
                           left (get report idx)
                           diff (math/abs (- left right))]
                    (and (> 4 diff) (< 0 diff))
                    true))))

(defn test-direction [dir-fn report]
  (apply + (seq
             [idx :range (0 (length report))]
             (if-let [right (get report (+ idx 1))
                      left (get report idx)]
               (if (dir-fn left right) 0 1)
               0))))

(defn ascending? [report] (= 0 (test-direction < report)))
(defn descending? [report] (= 0 (test-direction > report)))
(defn monodirectional? [report]
  (or (ascending? report) (descending? report)))

(defn safe? [ex] (and (monodirectional? ex) (gradual? ex)))

(defn multiversally-safe? [report] (any? (map safe? (perms report))))

(def example ["7 6 4 2 1"
              "1 2 7 8 9"
              "9 7 6 2 1"
              "1 3 2 4 5"
              "8 6 4 4 1"
              "1 3 6 7 9"
              "0 0 1 2 3"
              "0 1 1 2 3"
              "0 1 0 2 3"])


(defn main
  [& args]
  (print (aoc/today))

  (let (reports (aoc/lines))
    (->> reports
         (map parse-report)
         (map (fn [x] (print x) (print (safe? x)) x))
         (map multiversally-safe?)
         (reduce (fn [a e] (if e (+ 1 a) a)) 0)
         (print))))
