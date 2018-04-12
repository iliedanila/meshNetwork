#ifndef node_hpp
#define node_hpp

#include <boost/asio.hpp>
#include <functional>
#include <vector>
#include <set>
#include <map>
#include <unordered_map>

#include "allMessages.hpp"
#include "connection.hpp"
#include "sendError.hpp"


using namespace boost::asio;
using namespace ip;

typedef std::shared_ptr<tcp::acceptor> SharedAcceptor;
typedef std::pair<std::string, uint32_t> NodeDistance;

namespace NetworkLayer
{
    
typedef std::function<void(std::string, SendError)> AckMessageCallback;

class Node
{
public:
    Node(std::string _name,	io_service& _io_service, bool _isLogger = false);
    ~Node();
    
    void Accept(unsigned short _port);
    void Connect(std::string _host, unsigned short _port, bool _reconnect = false);
    
    std::string& Name() { return name; }
    void Close();
    
    std::vector<std::string> GetAccessibleNodes();
    
    bool IsNodeAccessible(const std::string& nodeName);
    
    void NotifyNewNodeStatus(std::function<void(std::string, bool)> callback);
    
    void SndMessage(
        std::string destination,
        std::string data,
        std::function< void(std::string, SendError)> callback);
    
    void AcceptMessages(std::function< void(DataMessage&) > callback);

    void Log(const std::string& logMessage);

    io_service& IOService() const { return ioservice; }
    
private:
    friend struct MessageVisitor;
    
    SharedConnection AddConnection(tcp::socket&& socket, bool reconnect);

    void StartConnection(SharedConnection connection, Connection::Type type);
    
    void CloseConnection(SharedConnection);
    
    void SendRoutingToNewConnection(SharedConnection);
    
    void OnRead(MessageVariant, SharedConnection);
    
    void OnWrite(MessageVariant message, boost::system::error_code error) const;

    void OnReconnectTimer(
        std::shared_ptr<boost::asio::deadline_timer> timer,
        std::string host,
        unsigned short port,
        const boost::system::error_code& error);
    
    template <typename MessageT>
    void HandleMessage(MessageT&, SharedConnection);
    
    void ProcessAddNodePaths(
        RoutingMessage& message,
        RoutingMessage& reply,
        RoutingMessage& forward,
        SharedConnection connection);

    void ProcessFailedNodes(
        RoutingMessage& message,
        RoutingMessage& reply,
        RoutingMessage& forward,
        SharedConnection connection);

    void ProcessLogger(
        RoutingMessage& message,
        RoutingMessage& reply,
        RoutingMessage& forward);

    SharedConnection GetConnectionToNode(const std::string& nodeName);

    std::string name;
    std::set<SharedConnection> connections;
    std::map<std::string, uint32_t> nodeDistances;
    std::pair<std::string, uint32_t> loggerDistance;
    std::map<std::string, SharedConnection> nodePaths;
    std::unordered_map<std::size_t, AckMessageCallback> ackCallbacks;
    
    std::unique_ptr<tcp::acceptor> acceptor;
    
    bool closing;
    std::function<void(DataMessage&)> messageAcceptor;
    std::function<void(std::string, bool)> notifyNewNodeStatusCallback;
    
    tcp::socket connect_socket;
    tcp::socket accept_socket;
    io_context& ioservice;
    bool isLogger;
};
    
}

#endif /* node_hpp */
