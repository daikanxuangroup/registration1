function checkValidInput(str) {
	
	var inj_str = "and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare|;|or|-|+|,|(|)|<|>|!|&";

	var inj_stra = inj_str.split("|");

	for (var i = 0; i < inj_stra.length; i++)

	{

		if (str.indexOf(inj_stra[i]) >=0)

		{

			return false;

		}

	}

	return true;

}