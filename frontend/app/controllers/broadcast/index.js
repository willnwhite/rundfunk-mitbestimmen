import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    back(){
      history.back();
    },
    respond(broadcast){
      broadcast.get('impressions.firstObject').save();
    }
  }
});
