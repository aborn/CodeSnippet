
// 判断是否为字符串
typeof '' === 'string';

// 判断字符串是否包含子串，区分大小写
'Blue Whale'.includes('blue'); // returns false
'blue ss'.indexOf('blue');

// str.substring(indexStart[, indexEnd])


// 向下取整 floor
Math.floor( 45.95); // 45
// 向上取整 ceil
Math.ceil(.95) // 1

// 给定数字的值四舍五入到最接近的整数。
Math.round(20.49);   //20
Math.round(20.5);    //21


// For iterating on keys of Arrays, Strings, or Objects, use for .. in :
for (let key in yourobject) {
  console.log(key, yourobject[key]);
}

// With ES6, if you need both keys and values simultaneously, do
for (let [key, value] of Object.entries(yourobject)) {
    console.log(key, value);
}

// To avoid logging inherited properties, check with hasOwnProperty :
for (let key in yourobject) {
   if (yourobject.hasOwnProperty(key)) {
      console.log(key, yourobject[key]);
   }
}
