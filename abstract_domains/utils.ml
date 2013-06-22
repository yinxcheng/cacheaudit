open Big_int
open NAD.DataStructures

(* Computes the logarithm to base 2 of a Bigint number, *)
(* the result is real-valued *)
let log2 x = log10 (float_of_big_int x) /. (log10 2.)

(* Gives the product of a list of Int64's; the result is a big_int*)
let prod l = List.fold_left (fun accum x -> 
  mult_big_int (big_int_of_int64 x) accum) unit_big_int l

let partition elts pfn = 
  NumSet.fold (fun addr csets -> 
  let bnr = (pfn addr) in
  let naset = try 
      IntMap.find bnr csets 
    with Not_found -> NumSet.empty in
  let naset = NumSet.add addr naset in
  IntMap.add bnr naset csets) elts IntMap.empty
