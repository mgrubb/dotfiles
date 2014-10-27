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
             [org.conjure/lein-conjure "LATEST"]]
   :aliases {"slamhound" ["run" "-m" "slam.hound"]}
   :signing {:gpg-key "8D0BFAB7"}
   :injections [(require '[poker.refactor])
                (defn classpath [] (seq (-> (ClassLoader/getSystemClassLoader) (.getURLs))))
                (defn show-classpath [] (doseq [url (classpath)] (println (.getFile url))))]
   :dependencies [; [com.stuartsierra/lazytest "1.2.3"]
                  [clj-stacktrace "LATEST"]
                  [poker "0.1.0-SNAPSHOT"]
                  ];[skel/lein-template "1.0.0"]]
   }}
