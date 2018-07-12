var   canvas = document.querySelector('canvas'),
         ctx = canvas.getContext('2d'),
   particles = [],
patriclesNum = 50,
           w = 300,
           h = 500,
      colors = ['#26110e','#1c0402','#26110e','#26110e','#26110e'];
 
//canvas.width = 500;
//canvas.height = 500;
//canvas.style.left = (window.innerWidth - 500)/2+'px';

//if(window.innerHeight>500)
//canvas.style.top = (window.innerHeight - 500)/2+'px';
  
function Factory(){  
  this.x =  Math.round( Math.random() * w);
  this.y =  Math.round( Math.random() * h);
  this.rad = Math.round( Math.random() * 1) + 1;  //Math.round是一个计算机函数，可以用来进行数学运算。 给定数字的值 四舍五入到最接近的整数
  this.rgba = colors[ Math.round( Math.random() * 3) ]; //random() 方法可返回介于 0 ~ 1 之间的一个随机数。
  this.vx = Math.round( Math.random() * 2) - 1.5;
  this.vy = Math.round( Math.random() * 2) - 1.5;
}
   
function draw(){
  ctx.clearRect(0, 0, w, h);
  ctx.globalCompositeOperation = 'lighter';
  for(var i = 0;i < patriclesNum; i++){
    var temp = particles[i];
    var factor = 1;
     
    for(var j = 0; j<patriclesNum; j++){
      
       var temp2 = particles[j];
       ctx.linewidth = 0.1;
      
       if(temp.rgba == temp2.rgba && findDistance(temp, temp2)<50){
         // ctx.strokeStyle = temp.rgba;
        //  ctx.beginPath();
         // ctx.moveTo(temp.x, temp.y); //moveTo() 方法可把窗口的左上角移动到一个指定的坐标
         // ctx.lineTo(temp2.x, temp2.y); //lineTo() 方法添加一个新点，然后创建从该点到画布中最后指定点的线条（该方法并不会创建线条）
        //  ctx.stroke();
       //   factor++;
       }
    }
    
    
    ctx.fillStyle = temp.rgba;
    ctx.strokeStyle = temp.rgba;
    
    ctx.beginPath();
    ctx.arc(temp.x, temp.y, temp.rad*factor, 0, Math.PI*2, true);   //创建一个圆形：

    //context.arc(x,y,r,sAngle,eAngle,counterclockwise);
    //x 圆的中心的 x 坐标。 y 圆的中心的 y 坐标。 r   圆的半径。sAngle 起始角，以弧度计。（弧的圆形的三点钟位置是 0 度）。

    //eAngle  结束角，以弧度计。 counterclockwise 可选。规定应该逆时针还是顺时针绘图。False = 顺时针，true = 逆时针。

    ctx.fill();
    ctx.closePath();
    
    ctx.beginPath();
    ctx.arc(temp.x, temp.y, (temp.rad+1)*factor, 0, Math.PI*2, true);
    ctx.stroke();
    ctx.closePath();
    

    temp.x += temp.vx;
    temp.y += temp.vy;
    
    if(temp.x > w)temp.x = 0;
    if(temp.x < 0)temp.x = w;
    if(temp.y > h)temp.y = 0;
    if(temp.y < 0)temp.y = h;
  }
}

function findDistance(p1,p2){  
  return Math.sqrt( Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2) );    // sqrt() 方法可返回一个数的平方根。  Math.pow 返回指定数字的指定次幂。
}

window.requestAnimFrame = (function(){
  return  window.requestAnimationFrame       ||   //requestAnimationFrame解决了浏览器不知道javascript动画什么时候开始、不知道最佳循环间隔时间的问题。
          window.webkitRequestAnimationFrame ||
          window.mozRequestAnimationFrame    ||
          function( callback ){
            window.setTimeout(callback, 1000 / 60);
          };
})();

(function init(){
  for(var i = 0; i < patriclesNum; i++){
    particles.push(new Factory);
  }
})();

(function loop(){
  draw();
  requestAnimFrame(loop);
})();



  
