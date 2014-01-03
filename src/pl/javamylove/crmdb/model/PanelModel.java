package pl.javamylove.crmdb.model;

public class PanelModel {

	private int nrCount;
	private int klientCount;
	private int aneksCount;
	private int terminCount;

	public int getNrCount() {
		return nrCount;
	}

	public void setNrCount(int nrCount) {
		this.nrCount = nrCount;
	}

	public int getKlientCount() {
		return klientCount;
	}

	public void setKlientCount(int klientCount) {
		this.klientCount = klientCount;
	}

	public int getAneksCount() {
		return aneksCount;
	}

	public void setAneksCount(int aneksCount) {
		this.aneksCount = aneksCount;
	}

	public int getTerminCount() {
		return terminCount;
	}

	public void setTerminCount(int terminCount) {
		this.terminCount = terminCount;
	}

	@Override
	public String toString() {
		return "PanelModel [nrCount=" + nrCount + ", klientCount="
				+ klientCount + ", aneksCount=" + aneksCount + ", terminCount="
				+ terminCount + "]";
	}

}
