package bean;

import java.util.Vector;

@SuppressWarnings("serial")
public class Cart implements java.io.Serializable {

	private Vector vct;

	public Cart() {
		vct = new Vector();
	}

	public MyItem[] getStat() {
		if( vct == null )
			return null;
		if( vct.size() == 0)
			return null;

		MyItem[] itemList = new MyItem[vct.size()];
		for(int i = 0 ; i <vct.size(); i++){
			itemList[i] = (MyItem)vct.elementAt(i);
		}

		return itemList;
	}

	@SuppressWarnings("unchecked")
	public void add(MyItem it){
		boolean blnFlag = false;
		int intNum = 0;

		if(vct != null){
			for(int i = 0; i < vct.size(); i++) {
				MyItem item = (MyItem)vct.elementAt(i);

				if(it.getId() == item.getId() ) {
					intNum = item.getCount() + it.getCount();
					item.setCount(intNum);
					vct.setElementAt(item,i);
					blnFlag = true;
					break;
				}
			}
		}
		if (! blnFlag){
			vct.addElement(it);
		}
	}

	public void delete(int id ) {
		change(id,0);
	}

	@SuppressWarnings("unchecked")
	public void change(int id, int number){
		if(vct != null){
			for(int i = 0; i < vct.size(); i++){
				MyItem item = (MyItem)vct.elementAt(i);

				if( id == item.getId() ){
					if(number <= 0){
						vct.removeElementAt(i);
					}else{
						item.setCount(number);
						vct.setElementAt(item, i);
					}
					break;
				}
			}
		}
	}

	public void clearAll() {
		if(vct != null){
			vct.removeAllElements();
		}
	}

}
