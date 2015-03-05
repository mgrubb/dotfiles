{:user
  {:plugins [[lein-localrepo "LATEST"]
             [lein-clean-m2 "LATEST"]
             [lein-gitify "LATEST"]
             [lein-outdated "LATEST"]
             [lein-midje "LATEST"]
             [lein-kibit "LATEST"]
             [lein-difftest "LATEST"]
             [lein-try "LATEST"]
             [lein-marginalia "LATEST"]
             [slamhound "LATEST"]
             [jonase/eastwood "LATEST"]
             [lein-bikeshed "LATEST"]
             [org.conjure/lein-conjure "LATEST"]
             [s3-wagon-private "LATEST"]
             [mvxcvi/whidbey "LATEST"]]
   :puget-options {:width 132}
   :aliases {"slamhound" ["run" "-m" "slam.hound"]}
   :signing {:gpg-key "8D0BFAB7"}
   :deploy-repositories [["releases" {:url "https://clojars.org/repo" :creds :gpg}]
                         ["snapshots" {:url "s3p://yggdrasil-private/snapshots/" :creds :gpg}]
                         ["private" {:url "s3p://yggdrasil-private/releases/" :creds :gpg}]]
   :injections [(require '[poker.refactor])
                (require 'spyscope.core)
                (defn classpath [] (seq (-> (ClassLoader/getSystemClassLoader) (.getURLs))))
                (defn show-classpath [] (doseq [url (classpath)] (println (.getFile url))))]
   :dependencies [; [com.stuartsierra/lazytest "1.2.3"]
                  [clj-stacktrace "0.2.8"]
                  [poker "0.1.0-SNAPSHOT"]
                  [spyscope "0.1.5"]]
                ; [skel/lein-template "1.0.0"]]
   }}
