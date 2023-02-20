import scala.concurrent.duration._

import io.gatling.core.Predef._
import io.gatling.http.Predef._

// The class name need be same with the file name
class HelloWorldJava extends Simulation {

  val sentHeaders = Map(
    "X-bolt-testing" -> "true",
    "User-Agent" -> "gatling"
  )

  // get the target Domain to be load tested from user
  val domainName : String = java.lang.System.getProperty("domainName").toString

  val httpProtocol = http.baseUrl("https://" + domainName)

  // build the gatling scenario
  val scn = scenario("HelloWorldJava")
    .exec(http("request_1")
      .get("/hello-world-java/greeter")
      .headers(sentHeaders))
    .pause(5)

  // get the no of users from cli
  val noOfUsers = Integer.getInteger("noOfUsers", 1)

  //  get the User Ramp rate
  val rampRate = java.lang.Long.getLong("rampRate", 5)

  // Run the Gatling scenario with the user provided `noOfUsers` & `rampRate`
  setUp(
    scn.inject(rampUsers(noOfUsers).during(rampRate))
     .protocols(httpProtocol)
  )
}
