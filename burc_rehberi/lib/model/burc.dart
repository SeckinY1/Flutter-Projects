class Burc {
  final String burcAdi;
  final String burcTarihi;
  final String burcDetayi;
  final String burcKucukResmi;
  final String burcBuyukResmi;

  Burc(this.burcAdi, this.burcTarihi, this.burcDetayi, this.burcKucukResmi,
      this.burcBuyukResmi);

  @override
  String toString() {
    // TODO: implement toString
    return "$burcAdi - $burcBuyukResmi";
  }
}
