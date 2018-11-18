package com

import grails.transaction.Transactional

@Transactional
class ViewTopicService {

    def serviceMethod() {

    }

    def getRecentTopics(){
        def Result = Topic.createCriteria().list {
            eq('visibility', Visibility.PUBLIC)
            order('dateCreated', 'desc')
            maxResults(10)
        }
        log.info("Result:" + Result)
        return Result
    }

    def getTopTopics(int mode){
        //mode = 0: Today, 1: 1 Week, 2: 1 Month, 3: 1 Year
        def dateTo = new Date();
        def dateFrom;
        if(mode == 0){
            dateFrom = dateTo;
        }
        else if(mode==1){
            dateFrom = dateTo - 7;
        }
        else if(mode ==2){
            dateFrom =  dateTo - 30;
        }
        else{
            dateFrom = dateTo - 365;
        }
        def Result = Subscription.createCriteria().list {
            between('dateCreated', dateFrom, dateTo)
            projections{
                groupProperty "topic"
                countDistinct("topic")
            }
        }
        return Result
    }
}
