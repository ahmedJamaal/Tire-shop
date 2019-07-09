let BudgetData;
const url='http://localhost:8088/TiresShop_App/Api/Budget';



$.ajax({
  url: url,
})
.done(function(data) {
	BudgetData=data;
})
.fail(function(err) {
  console.log('Error: ' + err.status);
});

///start budgetController
var budgetController=(function() {

      var Expense =function(id,description,value,time,date){
        this.id=id;
        this.description=description;
        this.value=value;
        this.time=time;
        this.date=date;
        this.percentage=-1;
      };

      Expense.prototype.calculatePercentage=function(tottalIncome){
        if(tottalIncome >0 ){
            this.percentage=Math.round((this.value / tottalIncome)*100);
        }else {
              this.percentage=-1;
        }

      };
      Expense.prototype.getPercentage=function(){

        return this.percentage;
      };

      var Income =function(id,description,value,time,date){
        this.id=id;
        this.description=description;
        this.value=value;
        this.time=time;
        this.date=date;
      };
      var calculateTottal =function(type){
        var sum=0;
        data.allItems[type].forEach(function(currentElement) {

          sum =sum + currentElement.value;
        });
        data.totals[type]=sum;

      };
      var data={
        allItems: {
          expenses:[],
          income:[]
        },
        totals:{
          expenses:0,
          income:0
        },
        budget:0,
        precentage:-1
      };
      return{
        addItem:function(type,des,val,time,date){
          var newItem , ID;

          //create new ID
          if(data.allItems[type].length >0){
            ID=data.allItems[type][data.allItems[type].length -1].id + 1;
          }else{
            ID=0;
          }

          //create new item based on type income or expenses
          if(type ==='expenses'){
            newItem = new Expense(ID,des,val,time,date);
          } else if (type === 'income') {
            newItem = new Income(ID,des,val,time,date);
          }
          //push it into our data Structure
        data.allItems[type].push(newItem);
        return newItem;
      },

          deleteItem :function(type, id){
            //
            var ids , index;
            console.log(type);
           ids= data.allItems[type].map(function  (current) {

              return current.id;
            });
          index=ids.indexOf(id);
          console.log(index);

          if(index !==-1){
            data.allItems[type].splice(index,1);
          }
          },
         //
         calculateBudget: function(){

           //caculate tottal income and expense
           calculateTottal('expenses');
           calculateTottal('income');
           //calculate the budget :income-expense
            data.budget=data.totals.income - data.totals.expenses;
            if (data.totals.income >0) {
              data.precentage=Math.round((data.totals.expenses/data.totals.income)* 100);

            }else
            {
              data.precentage=-1;
            }
           //calculate the precentage % for inspect income and expenses

           //expample expenses=100 and income=200
           //spent= 100/200=0.5*100
         },
         calculatePercentage:function(){
           /*
           a=20
           b=10
           c=40 income=100
           c=40/100=40%

           */
           data.allItems.expenses.forEach(function(cur){
             cur.calculatePercentage(data.totals.income);
           });

         },
         getPercentages:function(){
           var allPercentage=data.allItems.expenses.map(function  (cur) {
             return cur.getPercentage();
           });
           return allPercentage;
         },
         getBudget:function(){
           return{
             budget:data.budget,
             totalIncome:data.totals.income,
             totalExpense:data.totals.expenses,
             percentage:data.precentage
           };

         },
        //public method to return entry object
        testing:function(){
          console.log(data);
        }
      };
}) ();
///end budgetController


///start UIController
var UIController =(function() {

    //contain SelectorIems
    var DOMstring={
      inputType: '.add__type',
      inputDescription: '.add__description',
      inputValue: '.add__value',
      inputBtn :'.add__btn',
      incomeContainer:'.income__list',
      expensesContainer:'.expenses__list',
      budgetLabble:'.budget__value',
      incomeLabble:'.budget__income--value',
      expenseLabble:'.budget__expenses--value',
      percentLabble:'.budget__expenses--percentage',
      container:'.container',
      dateLabel:'.budget__title--month'

    };
  return  {
    getinput: function() {
      var dateEgy=new Date();
      return {
        type: document.querySelector(DOMstring.inputType).value,
        description: document.querySelector(DOMstring.inputDescription).value,
        value: parseFloat(document.querySelector(DOMstring.inputValue).value),
        time: dateEgy.getHours()+":"+dateEgy.getMinutes(),
        date: dateEgy.getDate() +"/"+(dateEgy.getMonth()+1)+"/"+dateEgy.getFullYear()
      };

    },
    addListItem:function(obj,type){
      //create html String With placeholder text

      var html ,newHtml ,element;
      if(type === 'income'){
        element=DOMstring.incomeContainer;
        html='<div class="item clearfix" id="income-%id%"> <div class="item__description">%description%</div><div class="right clearfix"> <div class="item__value">+ %value%</div> <div class="item__delete"> <button class="item__delete--btn"><i class="fa fa-times-circle"></i></button> </div> </div></div>';

      }
      else if(type === 'expenses'){
              element=DOMstring.expensesContainer;
              html='<div class="item clearfix" id="expenses-%id%"><div class="item__description">%description%</div> <div class="right clearfix"><div class="item__value">- %value%</div> <div class="item__percentage">21%</div><div class="item__delete"> <button class="item__delete--btn"><i class="fa fa-times-circle"></i></button></div> </div> </div>';

      }

      //replace the placeholder text with some actut data
      newHtml=html.replace('%id%',obj.id);
      newHtml=newHtml.replace('%description%',obj.description);
      newHtml=newHtml.replace('%value%',obj.value);
      ///dom using insertAdjacentHtml
      document.querySelector(element).insertAdjacentHTML('beforeend',newHtml);
    },

    deleteListItem: function (selectorID) {
      var el=document.getElementById(selectorID);
      el.parentNode.removeChild(el);

    },

    displayBudget: function(obj){
      document.querySelector(DOMstring.budgetLabble).textContent=obj.budget;
      document.querySelector(DOMstring.incomeLabble).textContent=obj.totalIncome;
      document.querySelector(DOMstring.expenseLabble).textContent=obj.totalExpense;
      document.querySelector(DOMstring.percentLabble).textContent=obj.percentage;
      if (obj.percentage>0) {
          document.querySelector(DOMstring.percentLabble).textContent=obj.percentage+"%";
      }else{
        document.querySelector(DOMstring.percentLabble).textContent='---';
      }


    },
    //Get current Date
    displayDate:function(){
      var month,year,now;
      var m=["Jan","Feb","Mar","Apr","May","June","Jul","Aug","Sep","Oct","Nov","Dec"];
      console.log(m);
      now=new Date();
      month=m[now.getMonth()];
      year=now.getFullYear();
      document.querySelector(DOMstring.dateLabel).textContent=month +" , "+year;
      console.log(month +","+year);
    },
    getDOMstrings: function () {
      return DOMstring;
    }
  };

}) ();
/////////end UIController

//Global App controller
//control that handle budgetCtrl and UIController
var Controller =(function(budgetCtrl,UICtrl) {

//fileSystem
///var fileController=(function() {

// var readFile =(function  () {
//   debugger;
//   let data;
//   var client = new XMLHttpRequest();
//   client.onreadystatechange = function() {
//     data=client.responseText;
//   var data = JSON.readJson(data);
// };
//   client.open('GET', 'data.json');
//   client.send();
//   function readJson (data) {
//     debugger;
//   var obj = JSON.parse(data);
//   return obj;
// }
//   return data;
// });


//});

//function setupEventListeners in Apps
var setupEventListeners=function () {
  //get Dom String
  var DOM=UIController.getDOMstrings();
  document.querySelector(DOM.inputBtn).addEventListener('click',ctrlAddItem);
  document.addEventListener('keypress',function (event) {
  //using keycode enterKeyCode =14 and which in old browser

  if(event.keyCode ===13 || event.which ===13)
  {
    ctrlAddItem();
  }

});

document.querySelector(DOM.container).addEventListener('click',ctrlDeleteItem);
};

//
var updateBudget=function(){

  //1.caculate the budget
  budgetCtrl.calculateBudget();

  //2.return the budget
  var budget=budgetCtrl.getBudget();
///  console.log(budget);
  //3. display budget on UI
  UICtrl.displayBudget(budget);

};

var UpdatePercentage = function(){
  //1.calculate percentages
  budgetController.calculatePercentage();
  //2.read percentage from budget Controller
  var percentage=budgetController.getPercentages();
  console.log(percentage);
  //3.update the ui with new percentages


}
//
var ctrlAddItem = function() {
  var input,newItem;
  //1. get input data
  input=UICtrl.getinput();

  if( input.description !=="" && !isNaN(input.value) && input.value > 0){

console.log(input);
  //2. add item to budget Controller
 newItem = budgetCtrl.addItem(input.type,input.description,input.value,input.time,input.date);
  //3. add item to UI
  UICtrl.addListItem(newItem,input.type);
  //4. clear field
  ///UICtrl.clearFields();

  //5. calculate budget and update budget

  updateBudget();
  //6.calculate and update percentage
  UpdatePercentage();
  }
};

var ctrlDeleteItem =function (event) {
  var itemID,splitID,type,ID;
  itemID=event.target.parentNode.parentNode.parentNode.parentNode.id;
  if (itemID) {
      splitID=itemID.split('-');
      type=splitID[0];
      ID=parseInt(splitID[1]);

      //1.delete the item from data Structure
      budgetController.deleteItem(type,ID);

      //2.delete the item from UI
      UICtrl.deleteListItem(itemID);
      //3.update and show the new budget
      updateBudget();

      //4.calculate and update percentage
      UpdatePercentage();

  }

};
//add lisniner
//public function in controller
return{
  readFile:function () {
    var data = readFile();
    console.log(data);
  },
  init:function () {
    console.log("Application is Start Succefully");
    UICtrl.displayDate();
    UICtrl.displayBudget({
      budget:0,
      totalIncome:0,
      totalExpense:0,
      percentage:-1

    });
    setupEventListeners();
  }
};

})(budgetController,UIController);


Controller.init();
