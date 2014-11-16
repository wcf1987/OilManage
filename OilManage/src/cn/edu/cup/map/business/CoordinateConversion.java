/*
 * Author: Sami Salkosuo, sami.salkosuo@fi.ibm.com
 *
 * (c) Copyright IBM Corp. 2007
 */
package cn.edu.cup.map.business;

import static java.lang.Math.cos;

import static java.lang.Math.sin;
import static java.lang.Math.sqrt;
import static java.lang.Math.tan;

import java.util.Hashtable;
import java.util.Map;


public class CoordinateConversion
{

	// 
	/*
	 * 我国的经度范围西起 73°东至135°，可分成
	 * 六度带十一个（13号带—23号带），各带中央经线依次为（75°、81°、……123°、129°、135°） 三度带二十二
	 * 个（24号带—45号带）。各带中央经线依次为（72°、75°、……132°、135°） 六度带可用于中小比例尺（如
	 * 1：250000）测图，三度带可用于大比例尺（如 1：10000）测图，城建坐标多采用三度带的高斯投影
	 * （也就是1:5000，1:10000用3度带的高斯
	 * —克吕格投影，1：2万5至1:50万用6度带高斯—克吕格投影，1:100万用Lambert（正轴等角割圆锥投影
	 * ）或Alberts（正轴等积割圆锥投影）） //added by zhangjun at 2011-1-4
	 * --------------------
	 * ------------------------------------------------------
	 * ------------------------ 如何判断投影坐标是3度带坐标还是6度带坐标
	 * 如(4231898,21655933)其中21即为带号，同样所定义的东伪偏移值也需要加上带号，如21带的东伪偏移值为21500000米。
	 * 假如你的工作区经度在120度至126度范围，则该坐标系为6度带坐标系，该带的中央经度为123度
	 * 如(2949320,36353822)其中36即为带号，已知该地点位于贵阳市附近，而从地图上我们看到贵阳大概的经度是东经108度左右，因此可以
	 * 36*3=108，所以该坐标系为3度带坐标系，该带的中央经度为108度。而不可能为6度带：36*6=216。
	 */
	
	
	/**
	 * 西安80大地坐标转化为经纬度
	 * @param X  大地坐标X
	 * @param Y  大地坐标Y
	 * @return   返回double类型数组，第一项为精度，第二项为纬度
	 */
	public static double[] GaussProjInvCal(double X, double Y) {
		int ProjNo; // 带号
		int ZoneWide; // //带宽
		double longitude1, latitude1, longitude0,  X0, Y0, xval, yval;
		double e1, e2, f, a, ee, NN, T, C, M, D, R, u, fai, iPI;
		iPI = 0.0174532925199433; // //3.1415926535898/180.0;
		a = 6378140.0;
		f = 1 / 298.257; // 80年西安坐标系参数

		ZoneWide = 3; // //3度带宽
		ProjNo = (int) (X / 1000000L); // 查找带号
		// 判断带号，如果大于23说明是3度带宽，否则是6度带宽
		if (ProjNo > 23) {

			longitude0 = ProjNo * ZoneWide;
			longitude0 = longitude0 * iPI; // 中央经线
		} else {
			ZoneWide = 6;
			longitude0 = (ProjNo - 1) * ZoneWide + ZoneWide / 2;
			longitude0 = longitude0 * iPI; // 中央经线
		}
		// 减去带宽以及500km偏移
		X0 = ProjNo * 1000000L + 500000L;
		Y0 = 0;
		xval = X - X0;
		yval = Y - Y0; // 带内大地坐标
		e2 = 2 * f - f * f;
		e1 = (1.0 - sqrt(1 - e2)) / (1.0 + sqrt(1 - e2));
		ee = e2 / (1 - e2);
		M = yval;
		u = M / (a * (1 - e2 / 4 - 3 * e2 * e2 / 64 - 5 * e2 * e2 * e2 / 256));
		fai = u + (3 * e1 / 2 - 27 * e1 * e1 * e1 / 32) * sin(2 * u)
				+ (21 * e1 * e1 / 16 - 55 * e1 * e1 * e1 * e1 / 32)
				* sin(4 * u) + (151 * e1 * e1 * e1 / 96) * sin(6 * u)
				+ (1097 * e1 * e1 * e1 * e1 / 512) * sin(8 * u);
		C = ee * cos(fai) * cos(fai);
		T = tan(fai) * tan(fai);
		NN = a / sqrt(1.0 - e2 * sin(fai) * sin(fai));// 字串1
		R = a
				* (1 - e2)
				/ sqrt((1 - e2 * sin(fai) * sin(fai))
						* (1 - e2 * sin(fai) * sin(fai))
						* (1 - e2 * sin(fai) * sin(fai)));
		D = xval / NN;
		// 计算经度(Longitude) 纬度(Latitude)
		longitude1 = longitude0
				+ (D - (1 + 2 * T + C) * D * D * D / 6 + (5 - 2 * C + 28 * T
						- 3 * C * C + 8 * ee + 24 * T * T)
						* D * D * D * D * D / 120) / cos(fai);
		latitude1 = fai
				- (NN * tan(fai) / R)
				* (D * D / 2 - (5 + 3 * T + 10 * C - 4 * C * C - 9 * ee) * D
						* D * D * D / 24 + (61 + 90 * T + 298 * C + 45 * T * T
						- 256 * ee - 3 * C * C)
						* D * D * D * D * D * D / 720);
		// 转换为度 DD
		double longitude = longitude1 / iPI;
		double latitude = latitude1 / iPI;

		return new double[] { longitude, latitude };
	}


	/**
	 * 经纬度转化为西安80大地坐标，默认为6度坐标系
	 * @param longitude  经度
	 * @param latitude  纬度
	 * @return   返回double类型数组，第一项为X，X第一二位为带号，第二项为Y
	 */
	public static double[] GaussProjCal(double longitude, double latitude) {
		int ProjNo = 0;
		int ZoneWide; // //带宽
		double longitude1, latitude1, longitude0,  X0, Y0, xval, yval;
		double a, f, e2, ee, NN, T, C, A, M, iPI;
		iPI = 0.0174532925199433; // //3.1415926535898/180.0;
		ZoneWide = 6; // //6度带宽
		a = 6378140.0;   // 长轴
		f = 1 / 298.257; // 80年西安坐标系参数
		//计算带号
		ProjNo = (int) (longitude / ZoneWide);
		longitude0 = ProjNo * ZoneWide + ZoneWide / 2;
		longitude0 = longitude0 * iPI;
	
		longitude1 = longitude * iPI; // 经度转换为弧度
		latitude1 = latitude * iPI; // 纬度转换为弧度
		e2 = 2 * f - f * f;
		ee = e2 * (1.0 - e2);
		NN = a / sqrt(1.0 - e2 * sin(latitude1) * sin(latitude1));
		T = tan(latitude1) * tan(latitude1);
		C = ee * cos(latitude1) * cos(latitude1);
		A = (longitude1 - longitude0) * cos(latitude1);

		M = a
				* ((1 - e2 / 4 - 3 * e2 * e2 / 64 - 5 * e2 * e2 * e2 / 256)
						* latitude1
						- (3 * e2 / 8 + 3 * e2 * e2 / 32 + 45 * e2 * e2 * e2
								/ 1024) * sin(2 * latitude1)
						+ (15 * e2 * e2 / 256 + 45 * e2 * e2 * e2 / 1024)
						* sin(4 * latitude1) - (35 * e2 * e2 * e2 / 3072)
						* sin(6 * latitude1));
		xval = NN
				* (A + (1 - T + C) * A * A * A / 6 + (5 - 18 * T + T * T + 72
						* C - 58 * ee)
						* A * A * A * A * A / 120);
		yval = M
				+ NN
				* tan(latitude1)
				* (A * A / 2 + (5 - T + 9 * C + 4 * C * C) * A * A * A * A / 24 + (61
						- 58 * T + T * T + 600 * C - 330 * ee)
						* A * A * A * A * A * A / 720);
		//加上偏移
		X0 = 1000000L * (ProjNo + 1) + 500000L;
		Y0 = 0;
		xval = xval + X0;
		yval = yval + Y0;
		double X = xval;
		double Y = yval;
		return new double[] { X, Y };
	} 
/*  public CoordinateConversion()
  {

  }*/

/*  public double[] utm2LatLon(String UTM)
  {
    UTM2LatLon c = new UTM2LatLon();
    return c.convertUTMToLatLong(UTM);
  }*/

 /* public String latLon2UTM(double latitude, double longitude)
  {
    //LatLon2UTM c = new LatLon2UTM();
    return double latlon[] = GaussProjInvCal(x, y);

  }
  public double latLon2UTMX(double latitude, double longitude)
  {
    //LatLon2UTM c = new LatLon2UTM();
   // return c.convertLatLonToUTMX(latitude, longitude);
	 

  }*//*
  public double latLon2UTMY(double latitude, double longitude)
  {
    LatLon2UTM c = new LatLon2UTM();
    return c.convertLatLonToUTMY(latitude, longitude);

  }
  private void validate(double latitude, double longitude)
  {
    if (latitude < -90.0 || latitude > 90.0 || longitude < -180.0
        || longitude >= 180.0)
    {
      throw new IllegalArgumentException(
          "Legal ranges: latitude [-90,90], longitude [-180,180).");
    }

  }

  public String latLon2MGRUTM(double latitude, double longitude)
  {
    LatLon2MGRUTM c = new LatLon2MGRUTM();
    return c.convertLatLonToMGRUTM(latitude, longitude);

  }

  public double[] mgrutm2LatLon(String MGRUTM)
  {
    MGRUTM2LatLon c = new MGRUTM2LatLon();
    return c.convertMGRUTMToLatLong(MGRUTM);
  }

  public double degreeToRadian(double degree)
  {
    return degree * Math.PI / 180;
  }

  public double radianToDegree(double radian)
  {
    return radian * 180 / Math.PI;
  }

  private double POW(double a, double b)
  {
    return Math.pow(a, b);
  }

  private double SIN(double value)
  {
    return Math.sin(value);
  }

  private double COS(double value)
  {
    return Math.cos(value);
  }

  private double TAN(double value)
  {
    return Math.tan(value);
  }
*//*
  private class LatLon2UTM
  {
    public String convertLatLonToUTM(double latitude, double longitude)
    {
      validate(latitude, longitude);
      String UTM = "";

      setVariables(latitude, longitude);

      String longZone = getLongZone(longitude);
      LatZones latZones = new LatZones();
      String latZone = latZones.getLatZone(latitude);

      double _easting = getEasting();
      double _northing = getNorthing(latitude);

      UTM = longZone + " " + latZone + " " + ((int) _easting) + " "
          + ((int) _northing);
      // UTM = longZone + " " + latZone + " " + decimalFormat.format(_easting) +
      // " "+ decimalFormat.format(_northing);

      return UTM;

    }
    public double convertLatLonToUTMX(double latitude, double longitude)
    {
      validate(latitude, longitude);
      String UTM = "";

      setVariables(latitude, longitude);

      String longZone = getLongZone(longitude);
      LatZones latZones = new LatZones();
      String latZone = latZones.getLatZone(latitude);

      double _easting = getEasting();
      double _northing = getNorthing(latitude);

      UTM = longZone + " " + latZone + " " + ((int) _easting) + " "
          + ((int) _northing);
      // UTM = longZone + " " + latZone + " " + decimalFormat.format(_easting) +
      // " "+ decimalFormat.format(_northing);

      return _easting;

    }
    public double convertLatLonToUTMY(double latitude, double longitude)
    {
      validate(latitude, longitude);
      String UTM = "";

      setVariables(latitude, longitude);

      String longZone = getLongZone(longitude);
      LatZones latZones = new LatZones();
      String latZone = latZones.getLatZone(latitude);

      double _easting = getEasting();
      double _northing = getNorthing(latitude);

      UTM = longZone + " " + latZone + " " + ((int) _easting) + " "
          + ((int) _northing);
      // UTM = longZone + " " + latZone + " " + decimalFormat.format(_easting) +
      // " "+ decimalFormat.format(_northing);

      return _northing;

    }
    protected void setVariables(double latitude, double longitude)
    {
      latitude = degreeToRadian(latitude);
      rho = equatorialRadius * (1 - e * e)
          / POW(1 - POW(e * SIN(latitude), 2), 3 / 2.0);

      nu = equatorialRadius / POW(1 - POW(e * SIN(latitude), 2), (1 / 2.0));

      double var1;
      if (longitude < 0.0)
      {
        var1 = ((int) ((180 + longitude) / 6.0)) + 1;
      }
      else
      {
        var1 = ((int) (longitude / 6)) + 31;
      }
      double var2 = (6 * var1) - 183;
      double var3 = longitude - var2;
      p = var3 * 3600 / 10000;

      S = A0 * latitude - B0 * SIN(2 * latitude) + C0 * SIN(4 * latitude) - D0
          * SIN(6 * latitude) + E0 * SIN(8 * latitude);

      K1 = S * k0;
      K2 = nu * SIN(latitude) * COS(latitude) * POW(sin1, 2) * k0 * (100000000)
          / 2;
      K3 = ((POW(sin1, 4) * nu * SIN(latitude) * Math.pow(COS(latitude), 3)) / 24)
          * (5 - POW(TAN(latitude), 2) + 9 * e1sq * POW(COS(latitude), 2) + 4
              * POW(e1sq, 2) * POW(COS(latitude), 4))
          * k0
          * (10000000000000000L);

      K4 = nu * COS(latitude) * sin1 * k0 * 10000;

      K5 = POW(sin1 * COS(latitude), 3) * (nu / 6)
          * (1 - POW(TAN(latitude), 2) + e1sq * POW(COS(latitude), 2)) * k0
          * 1000000000000L;

      A6 = (POW(p * sin1, 6) * nu * SIN(latitude) * POW(COS(latitude), 5) / 720)
          * (61 - 58 * POW(TAN(latitude), 2) + POW(TAN(latitude), 4) + 270
              * e1sq * POW(COS(latitude), 2) - 330 * e1sq
              * POW(SIN(latitude), 2)) * k0 * (1E+24);

    }

    protected String getLongZone(double longitude)
    {
      double longZone = 0;
      if (longitude < 0.0)
      {
        longZone = ((180.0 + longitude) / 6) + 1;
      }
      else
      {
        longZone = (longitude / 6) + 31;
      }
      String val = String.valueOf((int) longZone);
      if (val.length() == 1)
      {
        val = "0" + val;
      }
      return val;
    }

    protected double getNorthing(double latitude)
    {
      double northing = K1 + K2 * p * p + K3 * POW(p, 4);
      if (latitude < 0.0)
      {
        northing = 10000000 + northing;
      }
      return northing;
    }

    protected double getEasting()
    {
      return 500000 + (K4 * p + K5 * POW(p, 3));
    }

    // Lat Lon to UTM variables

    // equatorial radius
    double equatorialRadius = 6378137;

    // polar radius
    double polarRadius = 6356752.314;

    // flattening
    double flattening = 0.00335281066474748;// (equatorialRadius-polarRadius)/equatorialRadius;

    // inverse flattening 1/flattening
    double inverseFlattening = 298.257223563;// 1/flattening;

    // Mean radius
    double rm = POW(equatorialRadius * polarRadius, 1 / 2.0);

    // scale factor
    double k0 = 0.9996;

    // eccentricity
    double e = Math.sqrt(1 - POW(polarRadius / equatorialRadius, 2));

    double e1sq = e * e / (1 - e * e);

    double n = (equatorialRadius - polarRadius)
        / (equatorialRadius + polarRadius);

    // r curv 1
    double rho = 6368573.744;

    // r curv 2
    double nu = 6389236.914;

    // Calculate Meridional Arc Length
    // Meridional Arc
    double S = 5103266.421;

    double A0 = 6367449.146;

    double B0 = 16038.42955;

    double C0 = 16.83261333;

    double D0 = 0.021984404;

    double E0 = 0.000312705;

    // Calculation Constants
    // Delta Long
    double p = -0.483084;

    double sin1 = 4.84814E-06;

    // Coefficients for UTM Coordinates
    double K1 = 5101225.115;

    double K2 = 3750.291596;

    double K3 = 1.397608151;

    double K4 = 214839.3105;

    double K5 = -2.995382942;

    double A6 = -1.00541E-07;

  }

  private class LatLon2MGRUTM extends LatLon2UTM
  {
    public String convertLatLonToMGRUTM(double latitude, double longitude)
    {
      validate(latitude, longitude);
      String mgrUTM = "";

      setVariables(latitude, longitude);

      String longZone = getLongZone(longitude);
      LatZones latZones = new LatZones();
      String latZone = latZones.getLatZone(latitude);

      double _easting = getEasting();
      double _northing = getNorthing(latitude);
      Digraphs digraphs = new Digraphs();
      String digraph1 = digraphs.getDigraph1(Integer.parseInt(longZone),
          _easting);
      String digraph2 = digraphs.getDigraph2(Integer.parseInt(longZone),
          _northing);

      String easting = String.valueOf((int) _easting);
      if (easting.length() < 5)
      {
        easting = "00000" + easting;
      }
      easting = easting.substring(easting.length() - 5);

      String northing;
      northing = String.valueOf((int) _northing);
      if (northing.length() < 5)
      {
        northing = "0000" + northing;
      }
      northing = northing.substring(northing.length() - 5);

      mgrUTM = longZone + latZone + digraph1 + digraph2 + easting + northing;
      return mgrUTM;
    }
  }

  private class MGRUTM2LatLon extends UTM2LatLon
  {
    public double[] convertMGRUTMToLatLong(String mgrutm)
    {
      double[] latlon = { 0.0, 0.0 };
      // 02CNR0634657742
      int zone = Integer.parseInt(mgrutm.substring(0, 2));
      String latZone = mgrutm.substring(2, 3);

      String digraph1 = mgrutm.substring(3, 4);
      String digraph2 = mgrutm.substring(4, 5);
      easting = Double.parseDouble(mgrutm.substring(5, 10));
      northing = Double.parseDouble(mgrutm.substring(10, 15));

      LatZones lz = new LatZones();
      double latZoneDegree = lz.getLatZoneDegree(latZone);

      double a1 = latZoneDegree * 40000000 / 360.0;
      double a2 = 2000000 * Math.floor(a1 / 2000000.0);

      Digraphs digraphs = new Digraphs();

      double digraph2Index = digraphs.getDigraph2Index(digraph2);

      double startindexEquator = 1;
      if ((1 + zone % 2) == 1)
      {
        startindexEquator = 6;
      }

      double a3 = a2 + (digraph2Index - startindexEquator) * 100000;
      if (a3 <= 0)
      {
        a3 = 10000000 + a3;
      }
      northing = a3 + northing;

      zoneCM = -183 + 6 * zone;
      double digraph1Index = digraphs.getDigraph1Index(digraph1);
      int a5 = 1 + zone % 3;
      double[] a6 = { 16, 0, 8 };
      double a7 = 100000 * (digraph1Index - a6[a5 - 1]);
      easting = easting + a7;

      setVariables();

      double latitude = 0;
      latitude = 180 * (phi1 - fact1 * (fact2 + fact3 + fact4)) / Math.PI;

      if (latZoneDegree < 0)
      {
        latitude = 90 - latitude;
      }

      double d = _a2 * 180 / Math.PI;
      double longitude = zoneCM - d;

      if (getHemisphere(latZone).equals("S"))
      {
        latitude = -latitude;
      }

      latlon[0] = latitude;
      latlon[1] = longitude;
      return latlon;
    }
  }

  private class UTM2LatLon
  {
    double easting;

    double northing;

    int zone;

    String southernHemisphere = "ACDEFGHJKLM";

    protected String getHemisphere(String latZone)
    {
      String hemisphere = "N";
      if (southernHemisphere.indexOf(latZone) > -1)
      {
        hemisphere = "S";
      }
      return hemisphere;
    }

    public double[] convertUTMToLatLong(String UTM)
    {
      double[] latlon = { 0.0, 0.0 };
      String[] utm = UTM.split(" ");
      zone = Integer.parseInt(utm[0]);
      String latZone = utm[1];
      easting = Double.parseDouble(utm[2]);
      northing = Double.parseDouble(utm[3]);
      String hemisphere = getHemisphere(latZone);
      double latitude = 0.0;
      double longitude = 0.0;

      if (hemisphere.equals("S"))
      {
        northing = 10000000 - northing;
      }
      setVariables();
      latitude = 180 * (phi1 - fact1 * (fact2 + fact3 + fact4)) / Math.PI;

      if (zone > 0)
      {
        zoneCM = 6 * zone - 183.0;
      }
      else
      {
        zoneCM = 3.0;

      }

      longitude = zoneCM - _a3;
      if (hemisphere.equals("S"))
      {
        latitude = -latitude;
      }

      latlon[0] = latitude;
      latlon[1] = longitude;
      return latlon;

    }

    protected void setVariables()
    {
      arc = northing / k0;
      mu = arc
          / (a * (1 - POW(e, 2) / 4.0 - 3 * POW(e, 4) / 64.0 - 5 * POW(e, 6) / 256.0));

      ei = (1 - POW((1 - e * e), (1 / 2.0)))
          / (1 + POW((1 - e * e), (1 / 2.0)));

      ca = 3 * ei / 2 - 27 * POW(ei, 3) / 32.0;

      cb = 21 * POW(ei, 2) / 16 - 55 * POW(ei, 4) / 32;
      cc = 151 * POW(ei, 3) / 96;
      cd = 1097 * POW(ei, 4) / 512;
      phi1 = mu + ca * SIN(2 * mu) + cb * SIN(4 * mu) + cc * SIN(6 * mu) + cd
          * SIN(8 * mu);

      n0 = a / POW((1 - POW((e * SIN(phi1)), 2)), (1 / 2.0));

      r0 = a * (1 - e * e) / POW((1 - POW((e * SIN(phi1)), 2)), (3 / 2.0));
      fact1 = n0 * TAN(phi1) / r0;

      _a1 = 500000 - easting;
      dd0 = _a1 / (n0 * k0);
      fact2 = dd0 * dd0 / 2;

      t0 = POW(TAN(phi1), 2);
      Q0 = e1sq * POW(COS(phi1), 2);
      fact3 = (5 + 3 * t0 + 10 * Q0 - 4 * Q0 * Q0 - 9 * e1sq) * POW(dd0, 4)
          / 24;

      fact4 = (61 + 90 * t0 + 298 * Q0 + 45 * t0 * t0 - 252 * e1sq - 3 * Q0
          * Q0)
          * POW(dd0, 6) / 720;

      //
      lof1 = _a1 / (n0 * k0);
      lof2 = (1 + 2 * t0 + Q0) * POW(dd0, 3) / 6.0;
      lof3 = (5 - 2 * Q0 + 28 * t0 - 3 * POW(Q0, 2) + 8 * e1sq + 24 * POW(t0, 2))
          * POW(dd0, 5) / 120;
      _a2 = (lof1 - lof2 + lof3) / COS(phi1);
      _a3 = _a2 * 180 / Math.PI;

    }

    double arc;

    double mu;

    double ei;

    double ca;

    double cb;

    double cc;

    double cd;

    double n0;

    double r0;

    double _a1;

    double dd0;

    double t0;

    double Q0;

    double lof1;

    double lof2;

    double lof3;

    double _a2;

    double phi1;

    double fact1;

    double fact2;

    double fact3;

    double fact4;

    double zoneCM;

    double _a3;

    double b = 6356752.314;

    double a = 6378137;

    double e = 0.081819191;

    double e1sq = 0.006739497;

    double k0 = 0.9996;

  }

  private class Digraphs
  {
    private Map digraph1 = new Hashtable();

    private Map digraph2 = new Hashtable();

    private String[] digraph1Array = { "A", "B", "C", "D", "E", "F", "G", "H",
        "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X",
        "Y", "Z" };

    private String[] digraph2Array = { "V", "A", "B", "C", "D", "E", "F", "G",
        "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V" };

    public Digraphs()
    {
      digraph1.put(new Integer(1), "A");
      digraph1.put(new Integer(2), "B");
      digraph1.put(new Integer(3), "C");
      digraph1.put(new Integer(4), "D");
      digraph1.put(new Integer(5), "E");
      digraph1.put(new Integer(6), "F");
      digraph1.put(new Integer(7), "G");
      digraph1.put(new Integer(8), "H");
      digraph1.put(new Integer(9), "J");
      digraph1.put(new Integer(10), "K");
      digraph1.put(new Integer(11), "L");
      digraph1.put(new Integer(12), "M");
      digraph1.put(new Integer(13), "N");
      digraph1.put(new Integer(14), "P");
      digraph1.put(new Integer(15), "Q");
      digraph1.put(new Integer(16), "R");
      digraph1.put(new Integer(17), "S");
      digraph1.put(new Integer(18), "T");
      digraph1.put(new Integer(19), "U");
      digraph1.put(new Integer(20), "V");
      digraph1.put(new Integer(21), "W");
      digraph1.put(new Integer(22), "X");
      digraph1.put(new Integer(23), "Y");
      digraph1.put(new Integer(24), "Z");

      digraph2.put(new Integer(0), "V");
      digraph2.put(new Integer(1), "A");
      digraph2.put(new Integer(2), "B");
      digraph2.put(new Integer(3), "C");
      digraph2.put(new Integer(4), "D");
      digraph2.put(new Integer(5), "E");
      digraph2.put(new Integer(6), "F");
      digraph2.put(new Integer(7), "G");
      digraph2.put(new Integer(8), "H");
      digraph2.put(new Integer(9), "J");
      digraph2.put(new Integer(10), "K");
      digraph2.put(new Integer(11), "L");
      digraph2.put(new Integer(12), "M");
      digraph2.put(new Integer(13), "N");
      digraph2.put(new Integer(14), "P");
      digraph2.put(new Integer(15), "Q");
      digraph2.put(new Integer(16), "R");
      digraph2.put(new Integer(17), "S");
      digraph2.put(new Integer(18), "T");
      digraph2.put(new Integer(19), "U");
      digraph2.put(new Integer(20), "V");

    }

    public int getDigraph1Index(String letter)
    {
      for (int i = 0; i < digraph1Array.length; i++)
      {
        if (digraph1Array[i].equals(letter))
        {
          return i + 1;
        }
      }

      return -1;
    }

    public int getDigraph2Index(String letter)
    {
      for (int i = 0; i < digraph2Array.length; i++)
      {
        if (digraph2Array[i].equals(letter))
        {
          return i;
        }
      }

      return -1;
    }

    public String getDigraph1(int longZone, double easting)
    {
      int a1 = longZone;
      double a2 = 8 * ((a1 - 1) % 3) + 1;

      double a3 = easting;
      double a4 = a2 + ((int) (a3 / 100000)) - 1;
      return (String) digraph1.get(new Integer((int) Math.floor(a4)));
    }

    public String getDigraph2(int longZone, double northing)
    {
      int a1 = longZone;
      double a2 = 1 + 5 * ((a1 - 1) % 2);
      double a3 = northing;
      double a4 = (a2 + ((int) (a3 / 100000)));
      a4 = (a2 + ((int) (a3 / 100000.0))) % 20;
      a4 = Math.floor(a4);
      if (a4 < 0)
      {
        a4 = a4 + 19;
      }
      return (String) digraph2.get(new Integer((int) Math.floor(a4)));

    }

  }

  private class LatZones
  {
    private char[] letters = { 'A', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K',
        'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Z' };

    private int[] degrees = { -90, -84, -72, -64, -56, -48, -40, -32, -24, -16,
        -8, 0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 84 };

    private char[] negLetters = { 'A', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K',
        'L', 'M' };

    private int[] negDegrees = { -90, -84, -72, -64, -56, -48, -40, -32, -24,
        -16, -8 };

    private char[] posLetters = { 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
        'X', 'Z' };

    private int[] posDegrees = { 0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 84 };

    private int arrayLength = 22;

    public LatZones()
    {
    }

    public int getLatZoneDegree(String letter)
    {
      char ltr = letter.charAt(0);
      for (int i = 0; i < arrayLength; i++)
      {
        if (letters[i] == ltr)
        {
          return degrees[i];
        }
      }
      return -100;
    }

    public String getLatZone(double latitude)
    {
      int latIndex = -2;
      int lat = (int) latitude;

      if (lat >= 0)
      {
        int len = posLetters.length;
        for (int i = 0; i < len; i++)
        {
          if (lat == posDegrees[i])
          {
            latIndex = i;
            break;
          }

          if (lat > posDegrees[i])
          {
            continue;
          }
          else
          {
            latIndex = i - 1;
            break;
          }
        }
      }
      else
      {
        int len = negLetters.length;
        for (int i = 0; i < len; i++)
        {
          if (lat == negDegrees[i])
          {
            latIndex = i;
            break;
          }

          if (lat < negDegrees[i])
          {
            latIndex = i - 1;
            break;
          }
          else
          {
            continue;
          }

        }

      }

      if (latIndex == -1)
      {
        latIndex = 0;
      }
      if (lat >= 0)
      {
        if (latIndex == -2)
        {
          latIndex = posLetters.length - 1;
        }
        return String.valueOf(posLetters[latIndex]);
      }
      else
      {
        if (latIndex == -2)
        {
          latIndex = negLetters.length - 1;
        }
        return String.valueOf(negLetters[latIndex]);

      }
    }

  }*/

}
