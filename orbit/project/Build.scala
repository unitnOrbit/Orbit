import sbt._
import Keys._
import PlayProject._

object ApplicationBuild extends Build {

    val appName         = "orbit"
    val appVersion      = "0.9"

    val appDependencies = Seq(
      // Add your project dependencies here,
      "mysql" % "mysql-connector-java" % "5.1.18",
      "joda-time" % "joda-time" % "2.1"
    )

    val main = PlayProject(appName, appVersion, appDependencies, mainLang = JAVA).settings(
      // Add your own project settings here
    )

}
