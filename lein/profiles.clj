{:user
  {:plugins [[lein-localrepo "0.4.1"]
             [lein-clean-m2 "0.1.2"]
             [lein-gitify "0.1.0"]
             [lein-outdated "1.0.0"]
             [lein-midje "2.0.3"]
             [lein-kibit "[0.0.7,)"]
             [org.conjure/lein-conjure "1.0.0"]]
   :injections [(defn classpath [] (seq (-> (ClassLoader/getSystemClassLoader) (.getURLs))))
                (defn show-classpath [] (doseq [url (classpath)] (println (.getFile url))))]
   :dependencies [[com.stuartsierra/lazytest "1.2.3"]
                  [clj-stacktrace "0.2.5"]]
   :repositories [["stuart" "http://stuartsierra.com/maven2"]]}}
