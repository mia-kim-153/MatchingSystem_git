package validation;

import common.OrderType;
import common.TimeInForce;
import leafNode.OrderEntry;
import sbe.msg.NewOrderEncoder;
import sbe.msg.OrderCancelReplaceRequestEncoder;

public class OpeningAuctionCallValidator implements SessionValidator {

    @Override
    public boolean isMessageValidForSession(OrderEntry orderEntry, int templateId) {

        //New or Amended Hidden Orders not allowed
        if(orderEntry.getType() == OrderType.HIDDEN_LIMIT.getOrderType() &&
                (templateId == NewOrderEncoder.TEMPLATE_ID || templateId == OrderCancelReplaceRequestEncoder.TEMPLATE_ID)){
            return false;
        }

        //Limit orders and Market orders with IOC or FOK time qualifiers not allowed
        if((orderEntry.getType() == OrderType.LIMIT.getOrderType() || orderEntry.getType() == OrderType.MARKET.getOrderType()) &&
            orderEntry.getTimeInForce() == TimeInForce.IOC.getValue() || orderEntry.getTimeInForce() == TimeInForce.FOK.getValue()){
            return false;
        }

        //Orders with OPG time qualifier are rejected during this session
        if(orderEntry.getTimeInForce() == TimeInForce.OPG.getValue()){
            return false;
        }


        return true;
    }
}
