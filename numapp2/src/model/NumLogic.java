package model;

public class NumLogic {
	public void execute(Num num){
		String nums=num.getOrg();
		int numi=Integer.parseInt(nums);
		double ans=0;

		ans = (double) (numi * 2.54);
			num.setAns(ans);
	}
}