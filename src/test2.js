function sum(s, n) {
  if(n == 0){
      return s;
  } else{
      return sum(s + n, n - 1);
  }
}

console.log(sum(1, 8000))