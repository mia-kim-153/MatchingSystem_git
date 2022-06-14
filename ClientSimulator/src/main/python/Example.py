'''
Example:
- Python version: 3.8.5
- Java version: 1.8.0_271
- Authors: Ivan Jericevich, Dharmesh Sing, Tim Gebbie
- Structure:
    1. Preliminaries
    2. Login and start session
    3. Submit orders
    4. Market data updates
    5. End session and logout
'''
#---------------------------------------------------------------------------------------------------


#----- Preliminaries -----#
# Import the Java-Python interface module
import jpype as jp
# Initialize/start the JVM and add the path to the ".jar" files containing the required java dependencies
jp.startJVM(jp.getDefaultJVMPath(), "-ea", classpath = "/home/ivanjericevich/CoinTossX/ClientSimulator/build/install/ClientSimulator/lib/*.jar") # Start JVM
# Import the class containing the required methods
utilities = jp.JClass("example.Utilities")
#---------------------------------------------------------------------------------------------------


#----- Login and start session -----#
# Define the client ID corresponding the client to be logged in as well as the security ID corresponding to the security in which they will trade
clientId = 1
securityId = 1
# Load the simulation settings as well as all client data (ports, passwords and IDs) and create/initialize client
client = utilities.loadClientData(clientId, securityId)
# Start trading session by Logging in client to the gateways and connecting to ports
client.sendStartMessage()
#---------------------------------------------------------------------------------------------------


#----- Submit orders -----#
# Arguments for "submitOrder": order ID, volume, price, side, order type, time in force, display quantity, min execution size, stop price
client.submitOrder("1", 1000, 99, "Buy", "Limit", "Day", 1000, 0, 0) # Buy limit order
client.submitOrder("2", 1000, 101, "Sell", "Limit", "Day", 1000, 0, 0) # Sell limit order
client.submitOrder("3", 1000, 0, "Buy", "Market", "Day", 1000, 0, 0) # Buy market order
client.submitOrder("4", 1000, 0, "Buy", "StopLimit", "Day", 1000, 0, 0) # Stop buy limit order
client.submitOrder("5", 1000, 0, "Buy", "Stop", "Day", 1000, 0, 0) # Stop buy market order
# Arguments for "cancelOrder": order id, side, price
client.cancelOrder("1", "Buy", 99) # Cancel limit order
#---------------------------------------------------------------------------------------------------


#----- Market data updates -----#
client.calcVWAP("Buy") # VWAP of buy side of LOB
client.getBid() # Best bid price
client.getBidQuantity() # Best bid volume
client.getOffer() # Best ask price
client.getOfferQuantity() # Best ask volume
client.isAuction() # Current trading session
client.lobSnapshot() # Snapshot of the entire LOB
client.getStaticPriceReference() # Static price reference at the end of a trading session
#---------------------------------------------------------------------------------------------------


#----- End session and logout -----#
# End trading session by logging out client and closing connections
client.sendEndMessage()
client.close()
# Stop JVM
jp.shutdownJVM()
#---------------------------------------------------------------------------------------------------