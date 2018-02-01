<?php
// Dari:
// 1. MUHAMMAD BAHAUDDIN ALFAN (160535611853)
// 2. MUHAMMAD DHANIAR RIEFQY ZAIN (160535611841)
// 3. MUHAMMAD ILHAM (160535611840)
// 4. MUHAMMAD RIZAL RUSDIANSYAH (160535611857)
// 5. MUKHAMMAD RIZQI IRFANDIANSYAH (160535611818)
// 6. NIENDHITTA TAMIA LASSELA (160535611823)
// 7. NUR CHOLIS MAJID (160535611843)
// 8. OEMAR SYARIF BURHAN (160535611844)
?>
<?php 
class Statistic{
    public function getJangkauan($min, $max){
        return $max-$min;
    }
    public function getBanyakKelas($n){
        return 1+3.3*log($n);
    }
    public function getPanjangKelas($jangkauan, $banyakKelas){
        return $jangkauan/banyakKelas;
    }
    public function getQuartil($Tb, $i, $n, $Fk, $f, $C){
        return $Tb + $C * ((($i * $n)/4 - $Fk)/$f);

    }
    public function getMean($intervalTengah , $frekuensi[] ){
        $mean = 0;
        for($i = 0; $i < count($intervalTengah); $i++){
            $mean += ($intervalTengah[i] * $frekuensi[$i]);
        }    
        return $mean;
    }
    public function getMedian($Tb, $n, $Fk, $f, $C){
        return $Tb + $C * ((((0.5 * $n) - $Fk)/$f);
    }
    public function getModus($TbM, $d1, $d2, $C){
        return $TbM + $C * ($d1 / ($d1 + $d2));
    }
    public function getStDev($data[]){
        return sqrt($this -> getVarian($data[]));
    }
    public function getVarian($data[]){
        $n = count($data);
        $a = 0;
        $b = 0;
        for($i = 0; $i < $n; $i++){
            $a += ($data[$i] * $data[i]);
            $b += $data[$i];
        }
        $b = $b * $b;
        return ($a - $b)/($n * ($n-1));
    }
    public function getKurtosis($mean, $data[], $f) {
        $n = count($data);
        $s = this -> getStDev($data);
        $sum = 0;
        for($i = 0; $i < $n; $i++)
        {
            $sum += ($data[$i] - $mean);
        }
        return ((1/$n) * pow($sum, 4) * $f) / pow($s, 4);
    }
    public function isLeptokurtik($kurtosis){
        if($kurtosis > 3) return true;
        else return false
    }

}
?>