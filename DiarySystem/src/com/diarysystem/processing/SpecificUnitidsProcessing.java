package com.diarysystem.processing;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.Format;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

public class SpecificUnitidsProcessing {

	private static final long serialVersionUID = 1L;
	static final String IP_UNIT = "IP";
	static final String SMTP_UNIT = "SMTP";

	static Connection conn1=null;
	static Connection conn2=null;
	static Connection conn3=null;
	static Connection conn4=null;

	static Statement stnew=null;
	static Statement buffst=null;
	static Statement buffstore=null;
	static Statement buffstore1=null;
	static Statement stexceptioncheck;

	static Statement stmtDCinvalid=null;
	static Statement stmtDC=null;
	static Statement  stmtDCpending=null;

	static Statement sttables=null;
	static Statement stdefault=null;
	static Statement stpending=null;
	static Statement stinvalid=null; 
	static Statement stvehdet=null;
	static Statement stexception=null;
	static Statement st=null;
	static Statement st1=null;
	static Statement sttime=null;
	static Statement st2=null;
	static Statement st3=null;
	static Statement st4=null;
	static Statement st5=null;
	static Statement stcheck=null;
	static Statement taxi1=null;
	static Statement taxi2=null;
	static Statement stdistcorr=null;
	static Statement stinsert=null;
	static Statement stinsertallconnectedunits=null;
	static Statement stchkallconnectedunits=null;
	static Statement stinsertonlinedata=null;
	static Statement stchkonlinedata=null;
	static Statement stquery=null;
	static Statement stvehcode=null;
	static Statement stunsendDataCorrection=null;
	static Statement stdistcorrCheck =null;

	static String invaliddata,subject,stamp,orignalstamp, dt,tm,lat,lon,latdir,tstamp,sen5,londir,dd,speed,distance,adc1,adc2,date1,time1,insertdate,inserttime,tbname,storeddate,storedtime,sen1,sen2,sen3,sen4,unittype,location;
	static Format frt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	static Format frt1=new SimpleDateFormat("yyyy-MM-dd");
	static Format frt2=new SimpleDateFormat("HH:mm:ss");
	static double insertlat,insertlong,part1,part2,part3,part4,part5,part6,fluelflow=0.0,oldlat=10.1,oldlon=100.0;
	static long VehMultiplicationFactor,srno;

	static String latestdata,  DistType;
	static int AvgSpeed,idledistance,DistCorrFactor,count;
	static Date DistCorrDateTime,sdate,stime;
	static long DistCorrDateTimemils,sdatemils;
	//slat,slon;
	static String datetime,lastReplacementDate;
	static String rmaildate,rmailtime,rstoreddate,rstoredtime;
	static String RDataMaildateTime,RDataStoredDateTime;
	static int correctdistretun1,returndist,sdist,distCorrFactor1,newDistCorrFactor,OverSpeedDurationInSecs;

	static String vehcode,ownername,customer,vehregno,unitid="",tablename;
	static boolean validStamp=true;
	static String routeFileCount;
	static String cardId;
	static boolean cellDetails= false;
	static String signalStrength="-";
	static String cellId="-";
	static String networkOperator="-";
	static String processDate = null;
	static String typeUnit = null;
	static boolean IP_DC = false;

	public static void processUnitIds(String unitidList) {
		
		try {
			GetConnection();
			@SuppressWarnings("unused")
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try{
				processDate = new SimpleDateFormat("yyyy_MM_dd").format(new java.util.Date());
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			//unitidList="6198";

			StringTokenizer unitTokenizer = new StringTokenizer(unitidList,",");
			while(unitTokenizer.hasMoreTokens())
			{
				unitid = unitTokenizer.nextToken();
				IP_DC = false;
				String sql= "";
				ResultSet rst=null;
				String sqltype = "select * from db_gps.t_ftplastdump where unitid='"+unitid+"'";
				ResultSet rstype = stvehcode.executeQuery(sqltype);
				if(rstype.next())
				{
					typeUnit = rstype.getString("unittype");
					System.out.println(unitid+" "+typeUnit);
				}

				if(IP_UNIT.equalsIgnoreCase(typeUnit))
				{
					try{
					tablename = "db_avlalldata.t_ip"+processDate;
					sql="select * from "+tablename+" where Status='Pending'  and unitid ='"+unitid+"' order by StoredTime  Desc limit 10";
					rst=stmtDCpending.executeQuery(sql);
					if(rst.next())
					{
						IP_DC = true;
						sql="select * from "+tablename+" where Status='Pending'  and unitid ='"+unitid+"' order by StoredTime  Desc limit 10";
						rst=stmtDCpending.executeQuery(sql);
					}
					else{
						IP_DC = false;
						sql="select * from "+tablename+" where Status='Pending'  and unitid ='"+unitid+"' order by StoredTime  Desc limit 10";
						rst=stpending.executeQuery(sql);
					}
					}
					catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
				}
				else if(SMTP_UNIT.equalsIgnoreCase(typeUnit))
				{
					tablename = "db_avlalldata.t_mails"+processDate;
					sql="select * from "+tablename+" where Status='Pending'  and unitid ='"+unitid+"' order by StoredTime  Desc limit 10";
					rst=stpending.executeQuery(sql);
				}
System.out.println(sql);
				try{
					String IGSTATUS = "-",ENSTATUS = "-",BTSTATUS = "-";
					//tablename=FindTableName();
					double voltage=0.0;

					double fuellevel=0.0;
					double rpmval=0.0;
					double RPM=0.0;
					double lat1=0.0;
					double lon1=0.0;
					int vcode=0;
					//tablename=FindTableName();

					//*************Query For perticular range of Unitid
					NumberFormat nf=NumberFormat.getInstance();
					nf.setMaximumFractionDigits(2);
					//	tablename="t_mails2011_06_01Processed";

					int i=1;
					System.out.println(rst.next());
					while(rst.next())
					{
						i++;
						if(!(unitid.equalsIgnoreCase(rst.getString("UnitId")))){
							oldlat=10.1;
							oldlon=100.0;
						}
						srno=rst.getLong("RID");
							System.out.println("RID::"+srno);
						unitid=rst.getString("UnitId");
						rmaildate = rst.getString("maildate");
						rmailtime = rst.getString("mailtime");
						rstoreddate = rst.getString("StoredDate");
						rstoredtime = rst.getString("StoredTime");

						RDataMaildateTime = rmaildate+" "+rmailtime;
						RDataStoredDateTime = rstoreddate+" "+rstoredtime;

						System.out.println("unitid ::"+unitid);
						//System.out.println("RDataStoredDateTime ::"+RDataStoredDateTime);

						if(rst.getString("Body").contains("TF")){
							String maildate = rst.getString("maildate");
							String mailtime = rst.getString("mailtime");
							String maildatetime = maildate+" "+mailtime;
							InsertIntoFtpDump(unitid,rst.getString("Body"), maildatetime);
						}
						else{
							StringTokenizer tempStringTokenizer = new StringTokenizer(rst.getString("Body"),"\n");
							while(tempStringTokenizer.hasMoreTokens())
							{
								String token=tempStringTokenizer.nextToken().toString();
								orignalstamp=token;
								token=token.replace(",," , ",0,");
								System.out.println("Getting Stamp::"+token);

								StringTokenizer stk= new StringTokenizer(token,",");
								java.util.Date date2=new Date();
								storeddate=frt1.format(date2);
								storedtime=frt2.format(date2);
								//System.out.println("NO of Token::"+stk.countTokens());


								if(stk.countTokens() >=10)
								{

									stamp=""; dt=""; tm="";	lat="";	lon="";	latdir=""; londir="";
									dd="";	speed=""; distance="";	adc1=""; adc2=""; date1="";	time1="";
									sen1="-";sen2="-";sen3="-";sen4="-";fluelflow=0.0;sen5="-";tstamp="";
									sdist=0;correctdistretun1=0;lastReplacementDate="";cellId="";networkOperator="";signalStrength="";
									cellDetails= false;					
									while(stk.hasMoreTokens())
									{

										String sql1="select * from t_vehicledetails where UnitId='"+unitid+"'";
										ResultSet rst1=stvehdet.executeQuery(sql1);
										if(rst1.next())
										{
											vehcode=rst1.getString("VehicleCode");
											ownername=rst1.getString("OwnerName");
											vehregno=rst1.getString("VehicleRegNumber");
											tbname="t_veh"+vehcode;
											//tbname="t_veh3218";
											DistCorrFactor=rst1.getInt("DistCorrFactor");
											DistCorrDateTime=rst1.getTimestamp("DistCorrDateTime");
											idledistance=rst1.getInt("idledistance"); 
											unittype=rst1.getString("Description");
											DistType=rst1.getString("DistType");
											AvgSpeed=rst1.getInt("AvgSpeed");
											OverSpeedDurationInSecs=rst1.getInt("OverSpeedDurationInSecs");
											//System.out.println("<<<<<<<<Overspeed>>>>>>>"+OverSpeedDurationInSecs);
											lastReplacementDate=rst1.getString("LastReplacementDate");

												System.out.println("VehicleDetails--->\ntable-->"+tbname+"\nvehcode-->"+vehcode+"\nDistCorrFactor-->"+DistCorrFactor+"\nidledistance-->"+idledistance+"\nDistType-->"+DistType+"\nAvgSpeed-->+"+AvgSpeed);
											String mulfact=rst1.getString("VehMultiplicationFactor");
											VehMultiplicationFactor=(60*Integer.parseInt(mulfact.substring(0,1))+Integer.parseInt(mulfact.substring(2,4)))*60000;
										}
										else
										{
											tbname="t_veh0";

											vehcode="0";
											//System.out.println(tbname);
											String sqlveh0data="select concat(TheDate,' ',TheTime) as Date from allconnectedunits where UnitId='"+unitid+"' ";
											ResultSet rstveh0=stvehdet.executeQuery(sqlveh0data);
											if(rstveh0.next())
											{
												DistCorrDateTime=rstveh0.getTimestamp("Date");
											}else
											{
												DistCorrDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("1999-01-01 00:00:01");
											}

											String mulfact1="5.3000";
											ownername="unidentified";
											//DistCorrDateTime="0000:00:00 ";
											DistCorrFactor=0;
											idledistance=0;

											VehMultiplicationFactor=(60*Integer.parseInt(mulfact1.substring(0,1))+Integer.parseInt(mulfact1.substring(2,4)))*60000;
										}

										if(stk.hasMoreTokens())
										{							
											stamp=stk.nextElement().toString();
											stamp=stamp.replace(" ", "");

										} // get Stamp.
										/*	if(stamp.equals("BS"))
								{
									TaxiDataProcessing(stamp, orignalstamp,vehcode,vehregno,ownername,unitid);
								}// if for taxi data processing.
										 */
										if(stk.hasMoreTokens())
										{
											dt=stk.nextElement().toString();
											date1=GetValidDate(dt);
											if(CheckValidDate(date1))	
											{
												if(stk.hasMoreTokens())	
												{
													tm=stk.nextElement().toString();
													time1=GetValidTime(tm);
													if(CheckValidTime(tm))
													{

														if(!(tbname.equalsIgnoreCase("t_veh0"))){
															String finaldate=date1+" "+time1;
															if(CheckUnitReplacemtntDate(lastReplacementDate,finaldate)) //if stamptime<lastUnitReplacement time, insert into t_veh0
															{ tbname="t_veh0"; vehcode="0"; }
														}
														if(stk.hasMoreTokens())
														{
															lat=stk.nextElement().toString();
															if(CheckValidLatLong(lat))
															{
																lat=""+Double.parseDouble(lat);
																insertlat=getLatLong(Double.parseDouble(lat));
																if(stk.hasMoreTokens())
																{
																	latdir=stk.nextElement().toString();

																}//if latindir.
																if(stk.hasMoreTokens())
																{
																	lon=stk.nextElement().toString();
																	if(CheckValidLatLong(lon))
																	{
																		lon=""+Double.parseDouble(lon);

																		insertlong=getLatLong(Double.parseDouble(lon));
																		if(stk.hasMoreTokens())
																		{
																			londir=stk.nextElement().toString();
																		}//  if longindir.
																		if(stk.hasMoreTokens())
																		{
																			dd=stk.nextElement().toString();
																			if(CheckValidDirectionDegree(dd))
																			{
																				dd=""+Double.parseDouble(dd);
																				if(stk.hasMoreTokens())
																				{
																					speed=stk.nextElement().toString();
																					if(CheckSpeedDistance(speed))
																					{
																						if(stk.hasMoreTokens())
																						{
																							distance=stk.nextElement().toString();
																							if(CheckSpeedDistance(distance))
																							{
																								if(stk.hasMoreTokens())
																									adc1=stk.nextElement().toString();

																								if("JD".equalsIgnoreCase(stamp)){
																									routeFileCount=adc1;
																									//System.out.println("route file count :"+routeFileCount);
																								}
																								//shweta: change as on 16-04-2011 to insert sensor values of AVL units
																								if(adc1.startsWith("$")){
																									try{
																										sen1 = adc1;
																										if(stk.hasMoreTokens())
																											sen2=stk.nextElement().toString();
																										if(stk.hasMoreTokens())
																											sen3=stk.nextElement().toString();
																										if(stk.hasMoreTokens())
																											sen4=stk.nextElement().toString();
																										if(stk.hasMoreTokens())
																											sen5=stk.nextElement().toString();
																									}
																									catch (Exception e) {
																										System.out.println("Exception in sensor"+e);
																										e.printStackTrace();
																									}

																								}
																								else if(adc1.startsWith("#")){
																									cellDetails = true;
																									signalStrength = adc1;
																									if(signalStrength.length()>=2)
																									{
																										signalStrength=signalStrength.replace("#", "");
																									}
																									if(stk.hasMoreTokens())
																										cellId=stk.nextElement().toString();
																									if(stk.hasMoreTokens())
																										networkOperator=stk.nextElement().toString();
																								}
																								else{
																									if(stk.hasMoreTokens())
																										adc2=stk.nextElement().toString();

																									try
																									{
																										if(stk.hasMoreTokens()){
																											sen1=stk.nextElement().toString();
																											if(sen1.startsWith("#"))	// CELL Details Capture
																											{
																												cellDetails = true;
																												signalStrength = sen1;
																												if(stk.hasMoreTokens())
																													cellId=stk.nextElement().toString();
																												if(stk.hasMoreTokens())
																													networkOperator=stk.nextElement().toString();

																												if(signalStrength.length()>=2)
																												{
																													//sen1=sen1.substring(1,sen1.length());
																													signalStrength=signalStrength.replace("#", "");
																													networkOperator=networkOperator.replace("\r", "");
																												}
																											}
																										}
																										if(stk.hasMoreTokens())
																											sen2=stk.nextElement().toString();
																										if(stk.hasMoreTokens()){
																											sen3=stk.nextElement().toString();
																											if(sen3.startsWith("#"))	// CELL Details Capture
																											{
																												cellDetails = true;
																												signalStrength = sen3;
																												if(stk.hasMoreTokens())
																													cellId=stk.nextElement().toString();
																												if(stk.hasMoreTokens())
																													networkOperator=stk.nextElement().toString();

																												if(signalStrength.length()>=2)
																												{
																													//sen1=sen1.substring(1,sen1.length());
																													signalStrength=signalStrength.replace("#", "");
																													networkOperator=networkOperator.replace("\r", "");
																												}
																											}
																										}
																										if(stk.hasMoreTokens())
																											sen4=stk.nextElement().toString();
																										if(stk.hasMoreTokens())
																											sen5=stk.nextElement().toString();
																									}
																									catch(Exception e){System.out.println("Exception in sen"+e);}
																								}
																								/*		if(stk.hasMoreTokens())	// CELL Details Capture
																						{
																							signalStrength = stk.nextElement().toString();
																							if(signalStrength.startsWith("#"))	
																							{
																								cellDetails = true;
																								if(stk.hasMoreTokens())
																									cellId=stk.nextElement().toString();
																								if(stk.hasMoreTokens())
																									networkOperator=stk.nextElement().toString();

																								if(signalStrength.length()>=2)
																								{
																									//sen1=sen1.substring(1,sen1.length());
																									signalStrength=signalStrength.replace("#", "");
																									networkOperator=networkOperator.replace("\r", "");
																								}
																							}
																						}*/

																								if(null==sen1)
																								{
																									sen1="-";
																								}
																								if(null==sen2)
																								{
																									sen2="-";
																								}
																								if(null==sen3)
																								{
																									sen3="-";
																								}
																								if(null==sen4)
																								{
																									sen4="-";
																								}
																								if(null==sen5)
																								{
																									sen5="-";
																								}

																								if(null !=unittype && unittype.equals("SMARTCARD"))
																								{
																									if(sen1.length()>2)
																									{
																										//sen1=sen1.substring(1,sen1.length());
																										sen1=sen1.replace("$", "");
																										sen2=sen2.replace("\r", "");
																									}
																								}

																								if(null !=unittype && unittype.equals("TEMPSENSOR"))
																								{
																									if(sen1.length()>2)
																									{
																										//sen1=sen1.substring(1,sen1.length());
																										sen1=sen1.replace("$", "");
																									}
																								}
																								if(null !=unittype && unittype.equals("FUELFLOW"))
																								{
																									sen1=sen1.replace("$", "");

																									if(stamp.equals("SI") && token.contains("$"))
																									{
																										try
																										{
																											if(sen1.contains("ION"))
																											{
																												IGSTATUS = "ON";

																											}
																											if(sen1.contains("IOF"))
																											{
																												IGSTATUS = "OF";
																											}

																											voltage=Double.parseDouble(sen2);
																											if(voltage>0.0)
																											{
																												fuellevel=getlevel(voltage,vehregno);

																											}


																											if(sen3.contains("EON"))
																											{
																												ENSTATUS = "ON";
																											}
																											if(sen3.contains("EOF"))
																											{
																												ENSTATUS = "OF";
																											}

																											rpmval=Double.parseDouble(sen4);
																											if(rpmval>0.0)
																											{																								  
																												RPM = (rpmval * 60) / 16;
																											}


																										}

																										catch(Exception e){System.out.println("Exce in fuel"+e);}

																									}


																								}

																								if(null !=unittype && unittype.equals("GENSETTRACK"))
																								{

																									tstamp=sen1;
																									sen1=sen2;
																									sen2=sen3;
																									sen3=sen4;
																									sen4=sen5;


																									try
																									{
																										try
																										{
																											part1=Double.parseDouble(sen2);
																											if(part1>0.0)
																											{

																												part1=part1/10.0;

																												sen2=nf.format(part1);
																											}
																										}
																										catch(Exception e){}

																										try
																										{
																											part2=Double.parseDouble(sen3);
																											if(part2>0.0)
																											{
																												//part2=(part2*250.0)/1010;
																												part2=(part2*250.0)/4095;
																												sen3=nf.format(part2);

																											}
																										}
																										catch(Exception e){}
																										try
																										{
																											part3=Double.parseDouble(sen4);
																											if(part3>0.0)
																											{
																												part3=part3/100;

																												sen4=nf.format(part3);
																											}
																										}
																										catch(Exception e){System.out.println("Exce "+e);}
																										System.out.println("tstamp"+tstamp);
																										System.out.println("sen1"+sen1);
																										System.out.println("sen2"+sen2);
																										System.out.println("sen3"+sen3);
																										System.out.println("sen4"+sen4);
																									}

																									catch(Exception e){
																										System.out.println("Exce "+e);
																										sen1="-";
																										sen2="-";
																										sen3="-";
																										sen4="-";

																									}

																								}

																								//System.out.println("Past Data");
																								//}
																								/////////////////////////////////////

																								date2=((DateFormat) frt).parse(date1+" "+time1);
																								date2.setTime(date2.getTime()+VehMultiplicationFactor);
																								insertdate=frt1.format(date2);
																								inserttime=frt2.format(date2);

																								//*******************Check For Date Time Is of Futer Date Time Or not
																								java.util.Date todaydtee= new java.util.Date();
																								String todaydatee;
																								int minsdiff=0;
																								todaydatee=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(todaydtee);
																								//System.out.println("Current DATE TIME-->"+todaydatee);
																								//System.out.println("Stamp Date Time-->"+thedate+" "+thetime);
																								//String sqldays="select DATEDIFF('"+thedate+"' , '"+todaydate+"') as days";
																								String sqldays1="SELECT TIMESTAMPDIFF(MINUTE , '"+todaydatee+"' , '"+insertdate+" "+inserttime+"' ) AS days ";
																								ResultSet rstdays=st.executeQuery(sqldays1);
																								if(rstdays.next())
																								{
																									minsdiff=rstdays.getInt("days");
																									//System.out.println("Result---->"+days);
																								}

																								if(minsdiff>30)
																								{
																									//System.out.println("Future Data"); //Do Nothing As data is of Futures Date Time and insert into invalid data
																									InsertInvalidData(srno,unitid,orignalstamp,storeddate,storedtime,"Future Data");
																								}
																								else
																								{
																									//System.out.println("Past Data"); //Go For Functions If Dat is of Current Data

																									String s="select (GLength( LineStringFromWKB( LineString( AsBinary( GeomFromText( 'POINT("+oldlat+" "+oldlon+")' ) ) , AsBinary( GeomFromText( 'POINT("+insertlat+" "+insertlong+")' ) ) ) ) ))*110  AS distance";
																									ResultSet r1=stinsert.executeQuery(s);
																									if(r1.next())
																									{
																										if(r1.getInt("distance")>=1)
																										{
																											location=GetWareHouseLocation(insertlat,insertlong,ownername,vehcode);
																											if(location.length()>100)
																											{
																												location=location.substring(0,98);
																											}
																											oldlat=insertlat;
																											oldlon=insertlong;
																										}
																									}// if finding the location.

																									DistCorrDateTimemils=DistCorrDateTime.getTime();
																									datetime=insertdate+" "+inserttime;
																									sdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
																									sdatemils=sdate.getTime();

																									if(DistCorrDateTimemils < sdatemils)
																									{
																										latestdata="true";
																									}
																									else
																									{
																										latestdata="false";
																									}


																									//	System.out.println("Latest Data-->"+latestdata);
																									if(tbname.equals("t_veh0"))
																									{
																										if(latestdata.equalsIgnoreCase("true"))
																										{
																											//	System.out.println("In Online Data");
																											InsertInAllConnectedUnits(insertdate,inserttime,unitid,"-",insertlat,insertlong,location);
																										}

																										sql="select * from t_veh0 where TheFieldDataDate='"+insertdate+"' and TheFieldDataTime='"+inserttime+"' and UnitId='"+unitid+"' AND TheFiledTextFileName like '"+stamp+"%'";
																										ResultSet rstcheck=stcheck.executeQuery(sql);

																										if(rstcheck.next())
																										{
																											//System.out.println("do nothing"); 
																										}
																										else
																										{
																											sql="insert into t_veh0 (UnitId,TheFieldDataDate,TheFieldDataTime,Latitude,LatitudeDir,Longitude,LongitudeDir,Speed,DirectionDegree,TheFiledTextFileName,TheFieldSubject,Distance,LatinDec,LonginDec,TheFieldDataStoredDate,TheFieldDataStoredTime,Sen1,Sen2,Sen3,Sen4,FuelLevel,Thefielddatadatetime,RDataMailDateTime,RDataStoredTime) values('"+unitid+"','"+insertdate+"','"+inserttime+"','"+lat+"','"+latdir+"','"+lon+"','"+londir+"','"+speed+"','"+dd+"','"+stamp+"','"+location+"','"+distance+"','"+insertlat+"','"+insertlong+"','"+storeddate+"','"+storedtime+"','"+sen1+"','"+sen2+"','"+sen3+"','"+sen4+"','"+fluelflow+"','"+insertdate+" "+inserttime+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";
																											String abcd=sql.replace("'","#");
																											abcd=abcd.replace(",","$");
																											stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd+"')");

																											try{
																												stinsert.executeUpdate(sql);
																											}
																											catch (Exception e) 
																											{
																												//									stinsert.executeQuery("repair table "+tbname);
																												System.out
																												.println("error inserting in veh0");
																												SaveException(e.toString(),"From Diary System :: exception at line 683 " );
																												e.printStackTrace();
																												//System.out.print(sql+" \n");
																												//System.out.print(tbname+" Repaired \n");
																											}																						

																										}
																									}
																									//	}// if for unidentified units.
																									else
																									{
																										sql="select * from "+tbname+" where TheFieldDataDate='"+insertdate+"' and TheFieldDataTime='"+inserttime+"' AND TheFiledTextFileName like '"+stamp+"%'";
																										//	System.out.println(sql);
																										ResultSet rstcheck=stcheck.executeQuery(sql);

																										if(rstcheck.next())
																										{
																											//	System.out.println("do nothing");

																										}
																										else
																										{
																											if(stamp.equalsIgnoreCase("NG") || stamp.equalsIgnoreCase("NGPRS") || stamp.equalsIgnoreCase("NGSM"))
																											{
																												int cc=0;
																												sql="insert into "+tbname+" (TheFieldDataDate,TheFieldDataTime,Latitude,LatitudeDir,Longitude,LongitudeDir,Speed,DirectionDegree,TheFiledTextFileName,TheFieldSubject,Distance,LatinDec,LonginDec,TheFieldDataStoredDate,TheFieldDataStoredTime,CDistance,Thefielddatadatetime,RDataMailDateTime,RDataStoredTime) values('"+insertdate+"','"+inserttime+"','"+lat+"','"+latdir+"','"+lon+"','"+londir+"','"+speed+"','"+dd+"','"+stamp+"','"+location+"',"+correctdistretun1+",'"+insertlat+"','"+insertlong+"','"+storeddate+"','"+storedtime+"',"+sdist+",'"+insertdate+" "+inserttime+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";
																												cc=stinsert.executeUpdate(sql);

																												if(cc>0){
																													//System.out.println("***********"+stamp+" inserted in vehcode table ******");
																												}
																												String abcd19=sql.replace("'","#");
																												abcd19=abcd19.replace(",","$");
																												stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd19+"')");


																												// Insert Cell Details
																												if(cellDetails==true)
																												{
																													String sqlcell = "insert into t_celldetails (vehiclecode,vehicleregnumber,ownername,unitid,thefielddatadatetime,stamp,signalstrength,cellid,networkoperator,latitude,longitude,location,RDataMailDateTime,RDataStoredTime) values ('"+vehcode+"','"+vehregno+"','"+ownername+"','"+unitid+"','"+insertdate+" "+inserttime+"','"+stamp+"','"+signalStrength+"','"+cellId+"','"+networkOperator+"','"+insertlat+"','"+insertlong+"','"+location+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";
																													stinsert.executeUpdate(sqlcell);
																													String abcd20=sqlcell.replace("'","#");
																													abcd20=abcd20.replace(",","$");
																													stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd20+"')");
																												}

																											}
																											else
																											{
																												if(stamp.equalsIgnoreCase("SI") || stamp.equalsIgnoreCase("ON") || stamp.equalsIgnoreCase("OF") || stamp.equalsIgnoreCase("SP") || stamp.equalsIgnoreCase("ST") || stamp.equalsIgnoreCase("JD")  || stamp.equalsIgnoreCase("DO") || stamp.equalsIgnoreCase("DS"))

																												{
																													if(!(vehcode.equalsIgnoreCase("0")))
																													{
																														try
																														{
																															//System.out.println("IN Try Distance");
																															sdist=Integer.parseInt(distance);
																														}catch(Exception e)
																														{
																															//System.out.println("IN Catch Distance");
																															sdist=Float.valueOf(distance).intValue();
																														}
																														//		System.out.println("Distance--->"+sdist);
																														//Function Call For Distance Correction	
																														validStamp = true;
																														correctdistretun1 =CorrectDist(vehcode, insertdate, inserttime, sdist, insertlat, insertlong, DistCorrFactor, AvgSpeed, stamp, latestdata, idledistance, DistType);
																														if(validStamp==false){
																															stamp=stamp+"1";
																														}
																														//distance=correctdistretun1;
																														//	System.out.println("rETURN fROM correctdistretun1--->");
																													}
																												}
																												else
																												{

																													/*if(stamp.equalsIgnoreCase("AC") || stamp.equalsIgnoreCase("DC") || stamp.equalsIgnoreCase("OS") || stamp.equalsIgnoreCase("OS1") || stamp.equalsIgnoreCase("OS2") || stamp.equalsIgnoreCase("VD") || stamp.equalsIgnoreCase("VC") || stamp.equalsIgnoreCase("ER") )
																									{*/
																													try
																													{
																														//System.out.println("IN Try Distance");
																														correctdistretun1=Integer.parseInt(distance);
																														sdist=Integer.parseInt(distance);
																													}
																													catch(Exception e)
																													{
																														//System.out.println("IN Catch Distance");
																														correctdistretun1=Float.valueOf(distance).intValue();
																														sdist=Float.valueOf(distance).intValue();              //new add 
																													}


																													if(stamp.equalsIgnoreCase("AC"))
																													{

																														vcode=Integer.parseInt(vehcode);
																														boolean rastatus=getGeofence(insertlat,insertlong,vcode,ownername);
																														if(rastatus==true)
																														{
																															//	 System.out.println("Insert in AC");
																															boolean changestamp = InsertInratable(vehcode,insertdate,inserttime,distance,speed,ownername,unitid);	 
																															if(changestamp==true){
																																stamp = "AC1";
																																//System.out.println("change stampe AC to AC1 : not inserted RA table");
																															}
																														}
																														else
																														{
																															stamp="AC1";
																															//System.out.println("change stampe AC to AC1 : geofence");
																														}


																													}
																													if(stamp.equalsIgnoreCase("DC"))
																													{
																														vcode=Integer.parseInt(vehcode);
																														boolean rastatus=getGeofence(insertlat,insertlong,vcode,ownername);
																														if(rastatus==true)
																														{
																															//	 System.out.println("Insert in DC");
																															boolean changestamp = InsertInrdtable(vehcode,insertdate,inserttime,distance,speed,ownername,unitid);
																															if(changestamp==true){
																																stamp = "DC1";
																																//System.out.println("change stamp DC to DC1 : not inserted in RD table");
																															}
																														}
																														else
																														{
																															//System.out.println("change stamp DC to DC1 : geofence");
																															stamp="DC1";
																														}


																														//correctdistretun1=Integer.parseInt(distance);
																													}
																													if(stamp.equalsIgnoreCase("OS"))
																													{

																														vcode=Integer.parseInt(vehcode);
																														boolean rastatus=getGeofence(insertlat,insertlong,vcode,ownername);
																														if(rastatus==true)
																														{
																															//	 System.out.println("Insert in OS");
																															boolean changestamp = InsertInostable(vehcode,insertdate,inserttime,distance,speed,ownername,OverSpeedDurationInSecs,unitid);
																															if(changestamp==true){
																																stamp = "OS3";
																																//System.out.println("Changed OS to OS3 : not insertted in OS table");
																															}
																														}
																														else
																														{
																															stamp="OS3";
																															// System.out.println("Changed OS to OS3 : geofence");
																														}

																														//correctdistretun1=Integer.parseInt(distance);
																													}

																												}																								
																												if(unittype.equals("TEMPSENSOR"))
																												{
																													sql="insert into "+tbname+" (TheFieldDataDate,TheFieldDataTime,Latitude,LatitudeDir,Longitude,LongitudeDir,Speed,DirectionDegree,TheFiledTextFileName,TheFieldSubject,Distance,LatinDec,LonginDec,TheFieldDataStoredDate,TheFieldDataStoredTime,Sen1,Sen2,Sen3,Sen4,FuelLevel,CDistance,Thefielddatadatetime,RDataMailDateTime,RDataStoredTime) values('"+insertdate+"','"+inserttime+"','"+lat+"','"+latdir+"','"+lon+"','"+londir+"','"+speed+"','"+dd+"','"+stamp+"','"+location+"',"+correctdistretun1+",'"+insertlat+"','"+insertlong+"','"+storeddate+"','"+storedtime+"','"+sen1+"','"+sen2+"','"+sen3+"','"+sen4+"','"+fluelflow+"',"+sdist+",'"+insertdate+" "+inserttime+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";
																												}
																												else if(unittype.equals("GENSETTRACK"))
																												{
																													sql="insert into "+tbname+" (TheFieldDataDate,TheFieldDataTime,Latitude,LatitudeDir,Longitude,LongitudeDir,Speed,DirectionDegree,TheFiledTextFileName,TheFieldSubject,Distance,LatinDec,LonginDec,TheFieldDataStoredDate,TheFieldDataStoredTime,Sen1,Sen2,Sen3,Sen4,FuelLevel,CDistance,ZoneDesc,Thefielddatadatetime,RDataMailDateTime,RDataStoredTime) values('"+insertdate+"','"+inserttime+"','"+lat+"','"+latdir+"','"+lon+"','"+londir+"','"+speed+"','"+dd+"','"+stamp+"','"+location+"',"+correctdistretun1+",'"+insertlat+"','"+insertlong+"','"+storeddate+"','"+storedtime+"','"+sen1+"','"+sen2+"','"+sen3+"','"+sen4+"','"+fluelflow+"',"+sdist+",'"+tstamp+"','"+insertdate+" "+inserttime+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";
																												}

																												else if(unittype.equals("FUELFLOW"))
																												{
																													sql="insert into "+tbname+" (TheFieldDataDate,TheFieldDataTime,Latitude,LatitudeDir,Longitude,LongitudeDir,Speed,DirectionDegree,TheFiledTextFileName,TheFieldSubject,Distance,LatinDec,LonginDec,TheFieldDataStoredDate,TheFieldDataStoredTime,FuelLevel,CDistance,EngineStatus,VoiceStatus,RegistrationNo,Thefielddatadatetime,RDataMailDateTime,RDataStoredTime) values('"+insertdate+"','"+inserttime+"','"+lat+"','"+latdir+"','"+lon+"','"+londir+"','"+speed+"','"+dd+"','"+stamp+"','"+location+"',"+correctdistretun1+",'"+insertlat+"','"+insertlong+"','"+storeddate+"','"+storedtime+"','"+fuellevel+"',"+sdist+",'"+ENSTATUS+"','"+IGSTATUS+"','"+RPM+"','"+insertdate+" "+inserttime+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";
																												}
																												else if(unittype.equalsIgnoreCase("SMARTCARD"))
																												{
																													sql="insert into "+tbname+" (TheFieldDataDate,TheFieldDataTime,Latitude,LatitudeDir,Longitude,LongitudeDir,Speed,DirectionDegree,TheFiledTextFileName,TheFieldSubject,Distance,LatinDec,LonginDec,Sen1,Sen2,TheFieldDataStoredDate,TheFieldDataStoredTime,CDistance,Thefielddatadatetime,RDataMailDateTime,RDataStoredTime) values('"+insertdate+"','"+inserttime+"','"+lat+"','"+latdir+"','"+lon+"','"+londir+"','"+speed+"','"+dd+"','"+stamp+"','"+location+"',"+correctdistretun1+",'"+insertlat+"','"+insertlong+"','"+sen1+"','"+sen2+"','"+storeddate+"','"+storedtime+"',"+sdist+",'"+insertdate+" "+inserttime+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";

																													if("I".equalsIgnoreCase(sen2) || "O".equalsIgnoreCase(sen2)){
																														String status="";
																														if("I".equalsIgnoreCase(sen2))
																														{
																															status = "IN";
																														}
																														else if("O".equalsIgnoreCase(sen2)){
																															status = "OUT";
																														}
																														String sqlmapCardIdcardrefNo ="SELECT * FROM db_gps.t_cardid where CardRefNo='"+sen1+"'";
																														ResultSet rscard = stinsert.executeQuery(sqlmapCardIdcardrefNo);
																														if(rscard.next()){
																															cardId = rscard.getString("CardID");
																														}
																														else{
																															cardId = "-";
																														}
																														//System.out.println("cardId==>"+cardId+"---- cardRefNo==>"+sen1);
																														String sqlinout = "insert into db_gps.t_inoutstudent (vehid,unitid,vehno,ownername,date,time,CardID,cardRefNo,status,location,lat,lon) values ('"+vehcode+"', '"+unitid+"','"+vehregno+"','"+ownername+"','"+insertdate+"','"+inserttime+"','"+cardId+"','"+sen1+"','"+status+"','"+location+"','"+lat+"','"+lon+"')";
																														//System.out.println("*******inout=====>"+sqlinout);
																														stinsert.executeUpdate(sqlinout);
																													}
																												}
																												else if("JD".equalsIgnoreCase(stamp))
																												{
																													sql="insert into "+tbname+" (TheFieldDataDate,TheFieldDataTime,Latitude,LatitudeDir,Longitude,LongitudeDir,Speed,DirectionDegree,TheFiledTextFileName,TheFieldSubject,Distance,LatinDec,LonginDec,Sen1,TheFieldDataStoredDate,TheFieldDataStoredTime,CDistance,Thefielddatadatetime,RDataMailDateTime,RDataStoredTime) values('"+insertdate+"','"+inserttime+"','"+lat+"','"+latdir+"','"+lon+"','"+londir+"','"+speed+"','"+dd+"','"+stamp+"','"+location+"',"+correctdistretun1+",'"+insertlat+"','"+insertlong+"','"+routeFileCount+"','"+storeddate+"','"+storedtime+"',"+sdist+",'"+insertdate+" "+inserttime+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";
																													//System.out.println(sql);
																													/* JD stamp is sent as an acknowledgment whenever any route file is downloaded. 
																													 * There can be multiple route file download for a unit.
																													 * t_newjrmstatus tabl consist of unitid,routeid,jrmstatus(default Pending), 
																													 * filecount, receivedfilecount etc.
																													 * 
																													 * JD consist of the routefilecount. when we receive JD stamp, 
																													 * we need to get the routeid for that unitid from t_ftplastdump
																													 * 
																													 *  if we get the routeid, then check where there is any record with pending status
																													 *  in t_newjrmstatus against the unitid and routeid.
																													 *  if yes then, receivedfilecount< routefile count sent in JD stamp
																													 *    if yes then update the receivedfilecount = routefile count sent in JD stamp 
																													 *     and receivedfilecountdatetime = JD stamp datetime
																													 *  also, where the receivedfilecount = filecount in t_newjrmstatus 
																													 *  then update jrmstatus='Processed'  
																													 */
																													String routeid="-";
																													System.out.println("JD>>> sqlupdt="+routeFileCount);
																													String sqlftp = "select * from db_gps.t_ftplastdump where unitid='"+unitid+"'";
																													ResultSet rsftp = stinsert.executeQuery(sqlftp);
																													if(rsftp.next())
																													{
																														routeid = rsftp.getString("routeid");
																													}

																													System.out.println("JD>>> routeid=>"+routeid);
																													if(!("-".equalsIgnoreCase(routeid)))
																													{
																														int receivedFileCount=0,fileCount=0;
																														String sqljrm = "select * from db_gps.t_newjrmstatus where unitid='"+unitid+"' and routeid='"+routeid+"' and jrmstatus='Pending'";
																														rsftp = stinsert.executeQuery(sqljrm);
																														if(rsftp.next())
																														{
																															receivedFileCount = Integer.parseInt(rsftp.getString("filereceived"));
																															fileCount =  Integer.parseInt(rsftp.getString("fileCount"));

																															if(receivedFileCount < Integer.parseInt(routeFileCount))
																															{
																																String sqlupdt = "update db_gps.t_newjrmstatus set filereceived='"+routeFileCount+"',datetime1='"+insertdate+" "+inserttime+"' where unitid='"+unitid+"' and routeid='"+routeid+"' and jrmstatus='Pending'";
																																System.out.println("JD>>> sqlupdt="+sqlupdt);
																																stquery.executeUpdate(sqlupdt);

																																if(Integer.parseInt(routeFileCount) == fileCount)
																																{
																																	sqlupdt = "update db_gps.t_newjrmstatus set jrmstatus='Processed' where unitid='"+unitid+"' and routeid='"+routeid+"' and jrmstatus='Pending'";
																																	stquery.executeUpdate(sqlupdt);
																																}
																															}
																														}
																													}

																												}
																												else
																												{
																													sql="insert into "+tbname+" (TheFieldDataDate,TheFieldDataTime,Latitude,LatitudeDir,Longitude,LongitudeDir,Speed,DirectionDegree,TheFiledTextFileName,TheFieldSubject,Distance,LatinDec,LonginDec,TheFieldDataStoredDate,TheFieldDataStoredTime,CDistance,Thefielddatadatetime,RDataMailDateTime,RDataStoredTime) values('"+insertdate+"','"+inserttime+"','"+lat+"','"+latdir+"','"+lon+"','"+londir+"','"+speed+"','"+dd+"','"+stamp+"','"+location+"',"+correctdistretun1+",'"+insertlat+"','"+insertlong+"','"+storeddate+"','"+storedtime+"',"+sdist+",'"+insertdate+" "+inserttime+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";	
																												}


																												try{
																													stinsert.executeUpdate(sql);
																													//System.out.println("sql>> veh "+sql);

																												}catch (Exception e) 
																												{
																													//		stinsert.executeQuery("repair table "+e);
																													//System.out.println("error inserting in vehcode");
																													e.printStackTrace();
																													//System.out.print(sql+" \n");
																													//System.out.print(tbname+" Repaired \n");
																												}

																												String abcd19=sql.replace("'","#");
																												abcd19=abcd19.replace(",","$");
																												stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd19+"')");


																												// Insert Cell Details
																												if(cellDetails==true)
																												{
																													String sqlcell = "insert into t_celldetails (vehiclecode,vehicleregnumber,ownername,unitid,thefielddatadatetime,stamp,signalstrength,cellid,networkoperator,latitude,longitude,location,RDataMailDateTime,RDataStoredTime) values ('"+vehcode+"','"+vehregno+"','"+ownername+"','"+unitid+"','"+insertdate+" "+inserttime+"','"+stamp+"','"+signalStrength+"','"+cellId+"','"+networkOperator+"','"+insertlat+"','"+insertlong+"','"+location+"','"+RDataMaildateTime+"','"+RDataStoredDateTime+"')";
																													stinsert.executeUpdate(sqlcell);
																													String abcd20=sqlcell.replace("'","#");
																													abcd20=abcd20.replace(",","$");
																													stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd20+"')");
																												}

																												//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`**** add Location & distance columns in t_vehcode_ds & t_vehall_ds tables ***~~~~~~~~~~~~~~~~~~~~~~`/ 
																												String sqll = "Select TheFieldDataDate,thefielddatatime,TheFieldDataDateTime from "+tbname+" where thefielddatadatetime >'"+insertdate+" "+inserttime+"' and TheFiledTextFileName in('SI','ON','OF','ST','SP') order by thefielddatadatetime ";
																												ResultSet rsl = stcheck.executeQuery(sqll);
																												if(rsl.next())
																												{

																												}
																												else{
																													String datedt="",timetm="",endlocation="No Data";
																													String kmgrt1000="-";
																													double startkm=0,endkm=0,LastDaykm=0,distinmonth=0;
																													double kmtravelled=0;
																													String sql11="Select Distance,TheFieldDataDate,thefielddatatime from "+tbname+" where thefielddatadate <'"+insertdate+"' and TheFiledTextFileName in('SI','ON','OF','ST','SP') order by thefielddatadate desc,thefielddatatime desc limit 1";
																													//System.out.println("sql1===>"+sql11);
																													ResultSet rs1=stinsert.executeQuery(sql11);

																													if(rs1.next())
																													{
																														startkm=rs1.getDouble("Distance");
																														//System.out.println("startkm===>"+startkm);

																														datedt=rs1.getString("TheFieldDataDate");
																														timetm=rs1.getString("thefielddatatime");
																													}
																													else{

																														//System.out.println("IN Else");
																														String sql12="Select Distance,TheFieldDataDate,thefielddatatime from "+tbname+" where thefielddatadate ='"+insertdate+"' and TheFiledTextFileName in('SI','ON','OF','ST','SP') order by thefielddatadate desc,thefielddatatime asc limit 1";
																														//System.out.println("sql12===>"+sql12);
																														ResultSet rs11=st.executeQuery(sql12);

																														if(rs11.next())
																														{
																															startkm=rs11.getDouble("Distance");
																															//System.out.println("startkm===>"+startkm);
																															datedt=rs11.getString("TheFieldDataDate");
																															timetm=rs11.getString("thefielddatatime");
																														}

																													}
																													//get the latest distance from t_vehcode for the previousday
																													String sql2="Select Distance,thefielddatadate,thefielddatatime,thefieldsubject from "+tbname+" where thefielddatadate='"+insertdate+"' and TheFiledTextFileName in('SI','ON','OF','ST','SP') order by thefielddatatime Desc limit 1";
																													//System.out.println("sql2-->"+sql2);
																													ResultSet rs2=stinsert.executeQuery(sql2);
																													if(rs2.next())
																													{
																														String pdate="",ptime="",psubj="";
																														//System.out.println("Inside if block");
																														endkm=rs2.getDouble("Distance");
																														//System.out.println("endkm===>"+endkm);
																														pdate=new SimpleDateFormat("dd-MMM-yy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("thefielddatadate")));
																														ptime=rs2.getString("thefielddatatime");
																														psubj=rs2.getString("thefieldsubject");
																														endlocation=pdate+" "+ptime+" "+psubj;

																														kmtravelled = endkm-startkm;
																													}

																													if((kmtravelled<0))
																													{
																														kmtravelled = getcorrectedkm(Integer.valueOf(vehcode).intValue(),insertdate);
																													}


																													/*----------------------------------------* Update dist & location in t_vehcode_ds table   *-----------------------------*/
																													String upsql="Select * from t_veh"+vehcode+"_ds where Thedate='"+insertdate+"' ";
																													ResultSet updaters=stexceptioncheck.executeQuery(upsql);
																													if(updaters.next())
																													{


																														String vehupsql=" update t_veh"+vehcode+"_ds set VehCode='"+vehcode+"',Distance='"+kmtravelled+"',Location='"+endlocation+"' where TheDate='"+insertdate+"'";
																														//System.out.println("vehupsql==>"+vehupsql);
																														String abcdds=vehupsql.replace("'","#");
																														abcdds=abcdds.replace(",","$");
																														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcdds+"')");
																														stexception.executeUpdate(vehupsql);

																														//	System.out.println("updated t_vehid_ds  in up sql"); 
																													}
																													else
																													{

																														String vehds="insert into t_veh"+vehcode+"_ds (TheDate,distance,Location,vehcode,UnitId,Version) values('"+insertdate+"','"+kmtravelled+"','"+endlocation+"','"+vehcode+"','"+unitid+"','-')";	 
																														//System.out.println("vehds==>"+vehds);
																														String abcdds=vehds.replace("'","#");
																														abcdds=abcdds.replace(",","$");
																														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcdds+"')");

																														stexception.executeUpdate(vehds);

																														//	System.out.println("Inserted into t_vehid_ds");

																													} 
																													String allq="" ,allinsert="";

																													String sqlall="select Distance from t_vehall_ds where Thedate='"+insertdate+"' and VehCode='"+vehcode+"'";
																													ResultSet allrs=stexceptioncheck.executeQuery(sqlall);
																													if(allrs.next())
																													{
																														allq="update t_vehall_ds set VehCode='"+vehcode+"',Distance='"+kmtravelled+"',Location='"+endlocation+"' where TheDate='"+insertdate+"' and VehCode='"+vehcode+"'";
																														//	System.out.println("updated t_vehall_ds==>"+allq);
																														String abcdds=allq.replace("'","#");
																														abcdds=abcdds.replace(",","$");
																														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcdds+"')");
																														stexception.executeUpdate(allq); 

																													}
																													else    
																													{
																														allinsert= "insert into t_vehall_ds (thedate,distance,Location,vehcode,UnitId,Version)values('"+insertdate+"','"+kmtravelled+"','"+endlocation+"','"+vehcode+"','"+unitid+"','-') ";	                 
																														//	System.out.println("inserted into t_vehall_ds ====>"+allinsert);
																														String abcdds=allinsert.replace("'","#");
																														abcdds=abcdds.replace(",","$");
																														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcdds+"')");
																														stexception.executeUpdate(allinsert);




																													}
																													/*-----------------------------------------------end of update daily summary tables --------------------------*/

																												}
																												//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`**** end of addition of Location & distance columns in t_vehcode_ds & t_vehall_ds tables ***~~~~~~~~~~~~~~~~~~~~~~`/



																												String newaddsql="";
																												if(stamp.equalsIgnoreCase("PF"))
																												{
																													newaddsql="insert into t_poweroff(VehCode,TheDate,TheTime,Lat,Lon)values('"+vehcode+"','"+insertdate+"','"+inserttime+"','"+lat+"','"+lon+"')";
																												}
																												else if(stamp.equalsIgnoreCase("PO"))
																												{
																													newaddsql="insert into t_poweron(VehCode,TheDate,TheTime,Lat,Lon)values('"+vehcode+"','"+insertdate+"','"+inserttime+"','"+lat+"','"+lon+"')";
																												}
																												else if(stamp.equalsIgnoreCase("BL"))
																												{
																													newaddsql="insert into t_lowbattery(VehCode,TheDate,TheTime,Lat,Lon)values('"+vehcode+"','"+insertdate+"','"+inserttime+"','"+lat+"','"+lon+"')";
																												}
																												else if(stamp.equalsIgnoreCase("NG"))
																												{
																													newaddsql="insert into t_nginformation(VehCode,TheDate,TheTime,Lat,Lon)values('"+vehcode+"','"+insertdate+"','"+inserttime+"','"+lat+"','"+lon+"')";
																												}
																												else if(stamp.equalsIgnoreCase("DO"))
																												{
																													newaddsql="insert into t_dooropen(VehCode,TheDate,TheTime,Lat,Lon)values('"+vehcode+"','"+insertdate+"','"+inserttime+"','"+lat+"','"+lon+"')";
																												}
																												else if(stamp.equalsIgnoreCase("DS"))
																												{
																													newaddsql="insert into t_doorclose (VehCode,TheDate,TheTime,Lat,Lon)values('"+vehcode+"','"+insertdate+"','"+inserttime+"','"+lat+"','"+lon+"')";
																												}
																												else
																												{

																												}
																												if(!newaddsql.equals(""))
																												{
																													try
																													{
																														st5.executeUpdate(newaddsql);


																														String abcd=newaddsql.replace("'","#");
																														abcd=abcd.replace(",","$");
																														st5.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd+"')");

																													}
																													catch(Exception e){System.out.println("Error in insertting PF PO BL NG");}
																												}


																											}
																										}

																										if(latestdata.equalsIgnoreCase("true"))
																										{
																											//	System.out.println("In Online Data");
																											InsertInOnlinedata(insertdate, inserttime, vehcode, vehregno,stamp, insertlat, insertlong, speed, correctdistretun1, location, ownername, unitid,sen1,sen2,sen3,sen4);
																											//InsertInTaxiOnlinedata(unitid,insertdate, inserttime, vehcode, stamp, insertlat, insertlong, speed, location);
																											InsertInAllConnectedUnits(insertdate,inserttime,unitid,vehregno,insertlat,insertlong,location);
																										}
																									}
																								}
																							}// check distance.
																							else
																							{
																								InsertInvalidData(srno,unitid,orignalstamp,storeddate,storedtime,"Distance Problem");
																							}
																						} //if distance.
																					}// check speed.
																					else
																					{
																						InsertInvalidData(srno,unitid,orignalstamp,storeddate,storedtime,"Speed Problem");
																					}
																				}// if speed.
																			}// check direction degree.
																			else
																			{
																				InsertInvalidData(srno,unitid,orignalstamp,storeddate,storedtime,"Direction Degree Problem");
																			}
																		}// if direction degree.
																	}// check longitude.
																	else
																	{
																		InsertInvalidData(srno,unitid,orignalstamp,storeddate,storedtime,"Longitude Problem");
																	}
																}// if longitude.
															}// check valid lat.
															else
															{
																InsertInvalidData(srno,unitid,orignalstamp,storeddate,storedtime,"Latitude Problem");
															}
														}// if latitude.
													} // check valid time.
													else
													{
														InsertInvalidData(srno,unitid,orignalstamp,storeddate,storedtime,"Time Problem");
													}
												}// if time.

											}// check valid date.
											else
											{
												InsertInvalidData(srno,unitid,orignalstamp,storeddate,storedtime,"Date Problem");
											}
										} // date if.

									} // while to process the stk token.

									//--------------------------------------------------------------------------
									/* re-processing the processed data after we receive unsent data
									 * if latestdata = false then take next records from t_vehcode table where stamp = SI,ON,OF,ST,SP
									 * prevdist= next record dist
									 * apply distance correction to the next record stamps
									 * update t_distancecorrection_vehcode if record already exists
									 * else insert new
									 * get the new corrected distance
									 * if there is difference between prev dist and new corrected distance then 
									 * update the distance col in t_vehcode table with the new corrected distance 
									 */
									//TheFieldDataDate,TheFieldDataTime,Latitude,LatitudeDir,Longitude,LongitudeDir,Speed,DirectionDegree,TheFiledTextFileName,TheFieldSubject,Distance,LatinDec,LonginDec,TheFieldDataStoredDate,TheFieldDataStoredTime,Sen1,Sen2,Sen3,Sen4,FuelLevel,CDistance,Thefielddatadatetime
									if("false".equalsIgnoreCase(latestdata)){
										if(tbname.equals("t_veh0"))
										{

										}
										else{
											//System.out.println("unsent data stamp time===>"+insertdate+" "+inserttime);

											String sqlvehcode="SELECT * FROM db_gps."+tbname+" WHERE thefielddatadatetime > '"+ insertdate+" "+inserttime+"' AND TheFiledTextFileName in ('SI','ON','OF','ST','SP') order by thefielddatadatetime asc limit 1";
											//System.out.println(sqlvehcode);
											ResultSet rsvehcode = stvehcode.executeQuery(sqlvehcode);
											if(rsvehcode.next()){
												//CorrectDist(vehcode, insertdate, inserttime, sdist, insertlat, insertlong, DistCorrFactor, AvgSpeed, stamp, latestdata, idledistance, DistType);
												String recordDate = rsvehcode.getString("TheFieldDataDate");
												String recordTime = rsvehcode.getString("TheFieldDataTime");
												int recordDistance = rsvehcode.getInt("Distance");
												double recordLatitude = rsvehcode.getDouble("LatinDec");
												double recordLongitude = rsvehcode.getDouble("LonginDec");
												String recordStamp = rsvehcode.getString("TheFiledTextFileName");

												//System.out.println("unsent stamp==>"+stamp+"    ------   unsent data distance="+correctdistretun1);
												//System.out.println("next stamp dist="+recordDistance);

												if("SI".equalsIgnoreCase(stamp) || "ON".equalsIgnoreCase(stamp) || "OF".equalsIgnoreCase(stamp) || "SP".equalsIgnoreCase(stamp) || "ST".equalsIgnoreCase(stamp))
												{
													int newDistanceCorrection = distanceCorrectionForUnsendData(vehcode, recordDate, recordTime, recordDistance, recordLatitude, recordLongitude, DistCorrFactor, AvgSpeed, recordStamp, "false", idledistance, DistType);
													//System.out.println("newDistanceCorrection for next stamp===>"+newDistanceCorrection);
													int distDiff = newDistanceCorrection - recordDistance;
													//		System.out.println("dist diff====>"+distDiff);
													//int newRecordDistance = correctdistretun1 + distDiff;
													//int updateOtherRecordsWithDistace = newRecordDistance - recordDistance;
													//System.out.println("update with distdiff="+updateOtherRecordsWithDistace);

													if(distDiff!=0){
														String sqlvehcodeCorr = "UPDATE "+tbname+" SET Distance="+newDistanceCorrection+" WHERE thefielddatadatetime = '"+recordDate+" "+recordTime+"' AND TheFiledTextFileName IN ('SI','ON','OF','ST','SP')";
														//	System.out.println("sqlvehcodeCorr==="+sqlvehcodeCorr);
														stunsendDataCorrection.executeUpdate(sqlvehcodeCorr);

														String abcd=sqlvehcodeCorr.replace("'","#");
														abcd=abcd.replace(",","$");
														st5.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd+"')");
													}

													if(distDiff!=0){
														String sqlvehcodeCorr = "UPDATE "+tbname+" SET Distance=Distance+"+distDiff+" WHERE thefielddatadatetime > '"+recordDate+" "+recordTime+"' AND TheFiledTextFileName IN ('SI','ON','OF','ST','SP')";
														//	System.out.println("sqlvehcodeCorr==="+sqlvehcodeCorr);
														stunsendDataCorrection.executeUpdate(sqlvehcodeCorr);

														String abcd=sqlvehcodeCorr.replace("'","#");
														abcd=abcd.replace(",","$");
														st5.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd+"')");
													}
												}
											}
										}
									}
									if(tbname.equals("t_veh0"))
									{

									}
									else{
										//insert in t_repeatDayEnd table
										java.util.Date sysDate = new java.util.Date();
										String date11 = new SimpleDateFormat("yyyy-MM-dd").format(sysDate);
										java.util.Date dt11 = new SimpleDateFormat("yyyy-MM-dd").parse(date11);
										java.util.Date dt22 = new SimpleDateFormat("yyyy-MM-dd").parse(insertdate);
										//System.out.println("current datetime"+dt11);
										//System.out.println("stamp datetime"+dt22);
										if(dt22.before(dt11)){
											String sqlDayEnd = "SELECT * FROM db_gps.t_repeatDayEnd WHERE vehicleCode='"+vehcode+"' AND DataDate='"+insertdate+"'";
											ResultSet rsDayEnd = stunsendDataCorrection.executeQuery(sqlDayEnd);
											if(rsDayEnd.next()){
												String sqlUpdate = "UPDATE db_gps.t_repeatDayEnd SET DayEndStatus='Pending' WHERE vehicleCode='"+vehcode+"' AND DataDate='"+insertdate+"'";
												stvehcode.executeUpdate(sqlUpdate);
												//	System.out.println("***inserted in repoestdayend***");

												/*String abcd=sqlUpdate.replace("'","#");
									abcd=abcd.replace(",","$");
									st5.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd+"')");*/
											}
											else{
												String sqlUpdate = "INSERT INTO db_gps.t_repeatDayEnd (vehicleCode,vehRegNumber,transporter,DataDate,dayendStatus) values ('"+vehcode+"','"+vehregno+"','"+ownername+"','"+insertdate+"','Pending')";
												stvehcode.executeUpdate(sqlUpdate);

												/*String abcd=sqlUpdate.replace("'","#");
									abcd=abcd.replace(",","$");
									st5.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd+"')");*/
											}
										}
									}
									//--------------------------------------------------------------------------

								} // if to check the stamp length.
								else
								{
									if(token.length() >1)
									{
										//System.out.println(token);
										InsertInvalidData(srno,unitid,token,storeddate,storedtime,"Stamp Problem");
									}
								}// else to enter invalid stamp.
							}// tempStringTokenizer while .
						}

						sql="update "+tablename+" set Status='Processed' where RID='"+srno+"'";
						System.out.println(sql);
						int kk=0;
						if(IP_UNIT.equalsIgnoreCase(typeUnit))
						{
							if(IP_DC == true)
								kk=stmtDC.executeUpdate(sql);
							else
								kk=st3.executeUpdate(sql);
						}
						else if(SMTP_UNIT.equalsIgnoreCase(typeUnit))
						{
							kk=st3.executeUpdate(sql);
						}
						if(kk>0)
						{
							System.out.println(">>>>>>>>>>>>updated");
						}
					}
				}//Main While End Here.
				catch (Exception e) 
				{
					//String sql="update "+tablename+" set Status='Processed' where RID='"+srno+"'";
					//st3.executeUpdate(sql);
					System.out.print("Extract Exception ---->"+e);
					//e.printStackTrace();
					SaveException(e.toString(),"MailExtracter Greater than 3000 Processing at line 819 (!!! EXTRACT EXCEPTION !!!) " );
					String sqlexec="update "+tablename+" set Status='Exception' where RID='"+srno+"'";
					if(IP_UNIT.equalsIgnoreCase(typeUnit))
					{
						if(IP_DC == true)
							stmtDC.executeUpdate(sqlexec);
						else
							st3.executeUpdate(sqlexec);
					}
					else if(SMTP_UNIT.equalsIgnoreCase(typeUnit))
					{
						st3.executeUpdate(sqlexec);
					}

				}

			}

			CloseConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private static int distanceCorrectionForUnsendData(String vehcode2, String insertdate2, String inserttime2, int sdist2, double insertlat2, double insertlong2, int distCorrFactor2, int avgSpeed2, String stamp2, String latestdata2, int idledistance2, String distType2) throws SQLException 
	{
		//		System.out.println("CorrectDist Parameter--->(vehcode2-->"+vehcode2+",insertdate2-->"+insertdate2+",inserttime2-->"+inserttime2+",sdist2-->"+sdist2+",insertlat2-->"+insertlat2+",insertlong2-->"+insertlong2+",distCorrFactor2-->"+distCorrFactor2+",avgSpeed2-->"+avgSpeed2+",stamp2-->"+stamp2+",latestdata2-->"+latestdata2+",idledistance2-->"+idledistance2+",distType2-->"+distType2);
		int correctdistretun=0;
		double LDistDiff=0.0,timediff=0.0,AvgSp=0.0,LAvgSp=0.0,querylat=0.0,querylong=0.0;
		int DistDiff=0,querydist=0,querystampdist=0;
		String querydate="",querytime="",querystamp="";
		int CorrectDistance1;
		double perofDiff=0,lper = 80,hper = 120;

		if(latestdata2.equalsIgnoreCase("true"))
		{
			CorrectDistance1=sdist2+distCorrFactor2;
		}
		else
		{
			String sql2="Select newcorrfactor from t_distancecorrection_"+vehcode+" where vehid="+vehcode+" and newstampdatetime<'"+insertdate2+" "+inserttime2+"'  order by newstampdatetime desc limit 1";
			//		System.out.println(sql2);
			ResultSet rst2;
			rst2 = stdistcorr.executeQuery(sql2);
			if(rst2.next())
			{
				distCorrFactor2=rst2.getInt("newcorrfactor");
				CorrectDistance1=sdist2+distCorrFactor2;
			}
			else
			{
				distCorrFactor2=0;
				CorrectDistance1=sdist2+distCorrFactor2;
			}
		}


		String sql3="Select latindec,longindec,thefielddatadate,thefielddatatime,Distance,TheFiledTextFileName,CDistance from t_veh"+vehcode+" where thefielddatadatetime<'"+insertdate2+" "+inserttime2+"' and TheFiledTextFileName in('SI','ON','OF','ST','SP')  order by thefielddatadatetime desc limit 1";
		ResultSet rst3;
		rst3 = st1.executeQuery(sql3);

		if(rst3.next())
		{

			querydist=rst3.getInt("Distance");
			querydate=rst3.getString("TheFieldDataDate");
			querytime=rst3.getString("thefielddatatime");
			querystamp=rst3.getString("TheFiledTextFileName");
			querylat=rst3.getDouble("latindec");
			querylong=rst3.getDouble("longindec");
			querystampdist=rst3.getInt("CDistance");


			//	System.out.println("Last Record--->(QueryDist-->"+querydist+",QueryDate--->"+querydate+",QueryTime--->"+querytime+",QueryStamp-->"+querystamp+",QueryLat-->+"+querylat+",QueryLong-->"+querylong+")");
			LDistDiff = (GetDistance(querylat, querylong, insertlat2, insertlong2)) / 1000;
			DistDiff = CorrectDistance1 - querydist;
			//		System.out.println("LDistDiff-->"+LDistDiff);
			//		System.out.println("DistDiff-->"+DistDiff);
			timediff = GetTimeDiff(insertdate2, inserttime2, insertlat2, querydate , querytime);
			//			System.out.println("timediff-->"+timediff);
			//		AvgSp=DistDiff/timediff;
			LAvgSp=LDistDiff/timediff;
			//	System.out.println("LavgSp==>"+LAvgSp);
			if(LAvgSp > (avgSpeed2))
			{
				validStamp=false;
				return sdist2;
			}


			if(DistDiff==0 && !(distType2.equalsIgnoreCase("UnitDistance") ))
			{
				LDistDiff = (GetDistance(querylat, querylong, insertlat2, insertlong2)) / 1000; ///***
				double add =(int) Math.round(LDistDiff*1.1);
				correctdistretun=(int) (CorrectDistance1+add);
			}
			else
			{
				if(distType2.equalsIgnoreCase("UnitDistance"))
				{
					if(DistDiff<0)
					{
						newDistCorrFactor=distCorrFactor2+(querydist - CorrectDistance1);
						//				System.out.println("1-newDistCorrFactor--->"+newDistCorrFactor);
						if(latestdata2.equalsIgnoreCase("true") && !(sdist2==0))
						{
							String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
							//					System.out.println("1Query to update DistCorrFactor in Vehicledetails--->"+sql5);

							String abcd18=sql5.replace("'","#");
							abcd18=abcd18.replace(",","$");
							stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd18+"')");

							st4.executeUpdate(sql5);
						}	
						correctdistretun=sdist2+newDistCorrFactor;
						//				System.out.println("1-correctdistretun--->"+correctdistretun);
						if(!(sdist2==0)){
							String sql6="";
							String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
							ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
							if(rscheck.next()){
								sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
								//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
								stdistcorr.executeUpdate(sql6);
							}
							else{
								sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
								//				System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
								stdistcorr.executeUpdate(sql6);
							}
							//Buffer query added date 2011/07/03


							String abcd007=sql6.replace("'","#");
							abcd007=abcd007.replace(",","$");
							stdistcorr.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcd007+"')");

						}


					}
					else
					{
						correctdistretun=CorrectDistance1;
					}
				}
				else
				{
					if((LDistDiff*1000)< idledistance2)           //ie. if veh not moved    //
					{
						//				System.out.println("IN (LDistDiff*1000)< idledistance2");
						newDistCorrFactor=distCorrFactor2 - (CorrectDistance1 - querydist);
						//				System.out.println("2-newDistCorrFactor--->"+newDistCorrFactor);

						if(latestdata2.equalsIgnoreCase("true"))
						{
							String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
							//					System.out.println("2Query to update DistCorrFactor in Vehicledetails--->"+sql5);

							st4.executeUpdate(sql5);

							String abcd16=sql5.replace("'","#");
							abcd16=abcd16.replace(",","$");
							stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd16+"')");

						}

						correctdistretun=sdist2 + newDistCorrFactor; ///***
						//				System.out.println("2-correctdistretun--->"+correctdistretun);

						String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
						ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
						if(rscheck.next()){
							String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
							//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
							stdistcorr.executeUpdate(sql6);

							String abcd16=sql6.replace("'","#");
							abcd16=abcd16.replace(",","$");
							stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd16+"')");
						}
						else{
							String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
							//				System.out.println("2Query to Insert into t_distancecorrection_vehcode--->"+sql6);
							stdistcorr.executeUpdate(sql6);

							String abcd16=sql6.replace("'","#");
							abcd16=abcd16.replace(",","$");
							stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd16+"')");
						}

					}
					else  //latlongdist>250meters
					{
						if(DistDiff<0)
						{
							//	newDistCorrFactor=distCorrFactor2 + (querydist - CorrectDistance1);
							//if(stamp2.equalsIgnoreCase("OF")) // If OF stamp then add lat long difference.
							//{
							//Modify date 07/March/2011
							//In of Stamp we were getting wrong Lat and lon .Due to wrong lat and lon distacorrection was wrong.
							try
							{
								double calof=(int) (Math.round(LDistDiff*1.1));
								double avg1=calof/timediff;
								AvgSp=DistDiff/timediff;

								AvgSp = Math.abs(AvgSp);
								//			System.out.println("lat lon avg speed="+avg1);
								//			System.out.println("DistDiff avg speed="+AvgSp);
								if(avg1< (avgSpeed2))///***
								{
									correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
								}
								else
								{
									correctdistretun=querydist;	
								}
							}
							catch(Exception e)
							{
								System.out.println("Exception In of Stamp cal"+e);

							}

							newDistCorrFactor=correctdistretun-sdist2;  //***
							/*}
							else
							{
								correctdistretun=sdist2 + newDistCorrFactor;
							}*/

							//			
							if(latestdata2.equalsIgnoreCase("true") && !("OF".equalsIgnoreCase(stamp2) && sdist2==0))  ///*** why this condition?
							{
								String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
								//					System.out.println("3Query to update DistCorrFactor in Vehicledetails--->"+sql5);

								st4.executeUpdate(sql5);

								String abcd14=sql5.replace("'","#");
								abcd14=abcd14.replace(",","$");
								stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd14+"')");

							}	
							if(stamp2.equalsIgnoreCase("OF") && sdist2==0){

							}
							else
							{
								String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
								ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
								if(rscheck.next()){
									String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
									//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
									stdistcorr.executeUpdate(sql6);

									String abcd14=sql6.replace("'","#");
									abcd14=abcd14.replace(",","$");
									stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd14+"')");

								}
								else{
									String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
									//				System.out.println("3Query to Insert into t_distancecorrection_vehcode--->"+sql6);
									stdistcorr.executeUpdate(sql6);

									String abcd14=sql6.replace("'","#");
									abcd14=abcd14.replace(",","$");
									stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd14+"')");


								}
							}
						}
						else
						{
							if(timediff>0)
							{
								//					System.out.println("IN (timediff>0)");
								AvgSp=DistDiff/timediff;
								AvgSp = Math.abs(AvgSp);
								LAvgSp=LDistDiff/timediff;
								if(LAvgSp < (avgSpeed2))  ///*** not required
								{
									if(AvgSp > avgSpeed2)
									{
										//						System.out.println("IN (AvgSp > avgSpeed2)");
										correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
										//						System.out.println("4-correctdistretun--->"+correctdistretun);
										newDistCorrFactor=correctdistretun - sdist2;
										//newDistCorrFactor=CorrectDistance1;
										//					System.out.println("4-newDistCorrFactor--->"+newDistCorrFactor);

										if(latestdata2.equalsIgnoreCase("true"))
										{
											String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
											//						System.out.println("4Query to update DistCorrFactor in Vehicledetails--->"+sql5);

											String abcd12=sql5.replace("'","#");
											abcd12=abcd12.replace(",","$");
											stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

											st4.executeUpdate(sql5);
										}
										String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
										ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
										if(rscheck.next()){
											String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
											//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
											stdistcorr.executeUpdate(sql6);

											String abcd12=sql6.replace("'","#");
											abcd12=abcd12.replace(",","$");
											stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

										}
										else{
											String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
											//						System.out.println("4Query to Insert into t_distancecorrection_vehcode--->"+sql6);
											stdistcorr.executeUpdate(sql6);

											String abcd12=sql6.replace("'","#");
											abcd12=abcd12.replace(",","$");
											stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

										}
									}else
									{// lat lon dist is correct
										//if(timediff>0)
										//{
										AvgSp=LDistDiff/timediff;
										if(AvgSp<avgSpeed2) //two condtn if percentage of dist diff >120 of <80 then correct the distance else the correcteddist from unit is correct
										{
											//							System.out.println("IN (AvgSp < avgSpeed2)");
											if(!(DistDiff==1))
											{
												perofDiff=(DistDiff/LDistDiff)*100;
												if(perofDiff > hper) 
												{
													//								System.out.println("IN (perofDiff > hper)");
													correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
													//							System.out.println("6-correctdistretun--->"+correctdistretun);
													newDistCorrFactor=correctdistretun - sdist2;
													//							System.out.println("6-newDistCorrFactor--->"+newDistCorrFactor);

													if(latestdata2.equalsIgnoreCase("true"))
													{
														String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
														//							System.out.println("6Query to update DistCorrFactor in Vehicledetails--->"+sql5);

														String abcd8=sql5.replace("'","#");
														abcd8=abcd8.replace(",","$");
														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd8+"')");

														st4.executeUpdate(sql5);
													}

													String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
													ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
													if(rscheck.next()){
														String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
														//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
														stdistcorr.executeUpdate(sql6);

														String abcd12=sql6.replace("'","#");
														abcd12=abcd12.replace(",","$");
														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

													}
													else{
														String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
														//					System.out.println("6Query to Insert into t_distancecorrection_vehcode--->"+sql6);
														stdistcorr.executeUpdate(sql6);

														String abcd12=sql6.replace("'","#");
														abcd12=abcd12.replace(",","$");
														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

														/////
													}
												}else
												{
													if(perofDiff<lper)
													{
														//							System.out.println("IN (perofDiff < Lper)");

														correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
														//System.out.println("7-correctdistretun--->"+correctdistretun);
														newDistCorrFactor=correctdistretun - sdist2;

														if(latestdata2.equalsIgnoreCase("true"))
														{
															String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
															//							System.out.println("7Query to update DistCorrFactor in Vehicledetails--->"+sql5);

															String abcd6=sql5.replace("'","#");
															abcd6=abcd6.replace(",","$");
															stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd6+"')");

															st4.executeUpdate(sql5);
														}

														String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
														ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
														if(rscheck.next()){
															String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
															//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
															stdistcorr.executeUpdate(sql6);

															String abcd12=sql6.replace("'","#");
															abcd12=abcd12.replace(",","$");
															stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

														}
														else{
															String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
															//							System.out.println("7Query to Insert into t_distancecorrection_vehcode--->"+sql6);
															stdistcorr.executeUpdate(sql6);

															String abcd12=sql6.replace("'","#");
															abcd12=abcd12.replace(",","$");
															stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

														}
													}else
													{
														//							System.out.println("IN eLSE");
														correctdistretun=CorrectDistance1;
													}
													//System.out.println("7-newDistCorrFactor--->"+newDistCorrFactor);
												}
											}else if(DistDiff == 1 && ("OF".equals(querystamp) || "ON".equals(stamp2))){

												perofDiff=(DistDiff/LDistDiff)*100;
												if(perofDiff > hper) 
												{
													//								System.out.println("IN (perofDiff > hper)");
													correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
													//							System.out.println("6-correctdistretun--->"+correctdistretun);
													newDistCorrFactor=correctdistretun - sdist2;
													//							System.out.println("6-newDistCorrFactor--->"+newDistCorrFactor);

													if(latestdata2.equalsIgnoreCase("true"))
													{
														String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
														//							System.out.println("6Query to update DistCorrFactor in Vehicledetails--->"+sql5);

														String abcd8=sql5.replace("'","#");
														abcd8=abcd8.replace(",","$");
														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd8+"')");

														st4.executeUpdate(sql5);
													}

													String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
													ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
													if(rscheck.next()){
														String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
														//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
														stdistcorr.executeUpdate(sql6);
													}
													else{
														String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
														//					System.out.println("6Query to Insert into t_distancecorrection_vehcode--->"+sql6);
														stdistcorr.executeUpdate(sql6);
														/////
													}
												}else
												{
													if(perofDiff<lper)
													{
														//							System.out.println("IN (perofDiff < Lper)");

														correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
														//System.out.println("7-correctdistretun--->"+correctdistretun);
														newDistCorrFactor=correctdistretun - sdist2;

														if(latestdata2.equalsIgnoreCase("true"))
														{
															String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
															//							System.out.println("7Query to update DistCorrFactor in Vehicledetails--->"+sql5);

															String abcd6=sql5.replace("'","#");
															abcd6=abcd6.replace(",","$");
															stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd6+"')");

															st4.executeUpdate(sql5);
														}

														String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
														ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
														if(rscheck.next()){
															String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
															//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
															stdistcorr.executeUpdate(sql6);
														}
														else{
															String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
															//							System.out.println("7Query to Insert into t_distancecorrection_vehcode--->"+sql6);
															stdistcorr.executeUpdate(sql6);
														}
													}else
													{
														//							System.out.println("IN eLSE");
														correctdistretun=CorrectDistance1;
													}
													//System.out.println("7-newDistCorrFactor--->"+newDistCorrFactor);
												}

											}else
											{
												correctdistretun=CorrectDistance1;
											}
										}else
										{
											correctdistretun=CorrectDistance1;
										}
										//}jkll
									}
								}
								else
								{
									newDistCorrFactor=distCorrFactor2 + (querydist - CorrectDistance1);
									//newDistCorrFactor=distCorrFactor2;//+(CorrectDistance1 - querydist);
									//			System.out.println("5-newDistCorrFactor--->"+newDistCorrFactor);

									if(latestdata2.equalsIgnoreCase("true"))
									{
										String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
										//				System.out.println("5Query to update DistCorrFactor in Vehicledetails--->"+sql5);
										st4.executeUpdate(sql5);

										String abcd12=sql5.replace("'","#");
										abcd12=abcd12.replace(",","$");
										stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

									}

									correctdistretun=sdist2 + newDistCorrFactor;
									//			System.out.println("5-correctdistretun--->"+correctdistretun);
									String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
									ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
									if(rscheck.next()){
										String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
										//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
										stdistcorr.executeUpdate(sql6);

										String abcd12=sql6.replace("'","#");
										abcd12=abcd12.replace(",","$");
										stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

									}
									else{

										String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
										//			System.out.println("5Query to Insert into t_distancecorrection_vehcode--->"+sql6);
										stdistcorr.executeUpdate(sql6);

										String abcd12=sql6.replace("'","#");
										abcd12=abcd12.replace(",","$");
										stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

									}
								}
							}else
							{
								correctdistretun=CorrectDistance1;
							}
							//*********************************
						}
					}
				}
			}
		}
		else
		{
			correctdistretun=CorrectDistance1;
		}

		return correctdistretun;


	}
	//***************** End of Distance correction due to unsend data**********************//


	private static double getlevel(double voltage, String vehregno2)
	{
		double get=0.0;
		try
		{

			String sql="Select * from t_fuelleveldatanew where vehregno='"+vehregno2+"' and voltage<="+voltage+" and voltage <>0 order by voltage desc limit 1";
			//System.out.println("Query Fuel"+sql);
			ResultSet rsfuel=st5.executeQuery(sql);
			if(rsfuel.next())
			{
				get=rsfuel.getDouble("Ltr");
			}
			else

			{
				get=0.0;
			}
		}
		catch(Exception e){System.out.println("Exception getting fuellevel"+e);}
		return get;
	}
	private static boolean InsertInostable(String vehcode2, String insertdate2, String inserttime2, String distance2, String speed2, String ownername, int overSpeedDurationInSecs, String unitid2) throws SQLException, ParseException {
		java.util.Date today2= new java.util.Date();
		String tdy2="",aaj2="";
		String sqlupdtosds="";
		//int os=0;
		tdy2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(today2);
		boolean flag = false;

		double  speed=Double.parseDouble(speed2);
		String toDate="",toTime="";
		int duration = Integer.parseInt(distance2);
		if(speed>10.00 && speed<120.00 && duration>=overSpeedDurationInSecs)
		{
			flag=false;
			String osqltimediff=" SELECT DATE_ADD('"+insertdate2+" "+inserttime2+"',INTERVAL "+distance2+" SECOND) as timeadd ";
			ResultSet osrstdiff=stexception.executeQuery(osqltimediff);
			if(osrstdiff.next())
			{
				String  ctotime=osrstdiff.getString("timeadd");
				//  System.out.println("ctotime"+ctotime);
				toDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ctotime));
				toTime = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ctotime));

			}
			String sqlchck = "select * from "+tbname+"_overspeed where VehCode='"+vehcode2+"' and FromDate='"+insertdate2+"' and FromTime='"+inserttime2+"' and ToDate='"+toDate+"' and ToTime='"+toTime+"' and Speed='"+speed2+"' and Duration='"+distance2+"'";
			ResultSet rs = stexception.executeQuery(sqlchck);
			if(rs.next()){
				System.out.println("already present===>"+sqlchck);
			}
			else
			{
				rs=null;
				String sqlos="insert into "+tbname+"_overspeed(VehCode,FromDate,FromTime,ToDate,ToTime,Speed,Duration) values('"+vehcode2+"','"+insertdate2+"','"+inserttime2+"','"+toDate+"','"+toTime+"','"+speed2+"','"+distance2+"')";

				String abcd001=sqlos.replace("'","#");
				abcd001=abcd001.replace(",","$");
				stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcd001+"')");

				stexception.executeUpdate(sqlos);
			}
			int oscount =0;
			String sqloscount = "SELECT count(*) AS OSCount FROM db_gpsExceptions."+tbname+"_overspeed WHERE FromDate='"+insertdate2+"'";
			ResultSet rsoscount = stexception.executeQuery(sqloscount);
			if(rsoscount.next()){
				oscount = rsoscount.getInt("OSCount");
			}
			//--------------------update t_vehcode_ds table--------------------------
			String sqlosds="select * from db_gpsExceptions."+tbname+"_ds where TheDate='"+insertdate2+"'";
			ResultSet rstosds=stexception.executeQuery(sqlosds);
			if(rstosds.next())
			{
				sqlupdtosds="Update "+tbname+"_ds set OSCount="+oscount+" where TheDate='"+insertdate2+"'";
			}else
			{
				sqlupdtosds="Insert into "+tbname+"_ds(VehCode,TheDate,OSCount,UnitId,Version) values('"+vehcode2+"','"+insertdate2+"',1,'"+unitid2+"','-')";
			}

			//System.out.println("insert overspeed in DS table query-->"+sqlupdtosds);

			String abcd002=sqlupdtosds.replace("'","#");
			abcd002=abcd002.replace(",","$");
			stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcd002+"')");

			stexception.executeUpdate(sqlupdtosds);
			//---------------end of t_vehcode_ds table-------------------------------

			//**************update t_vehall_ds table*********************************
			String sqlvehallupdate="";
			String sqlvehall = "SELECT * FROM db_gpsExceptions.t_vehall_ds WHERE VehCode='"+vehcode2+"' AND TheDate='"+insertdate2+"'";
			ResultSet rsvehall = stexception.executeQuery(sqlvehall);

			if(rsvehall.next()){
				sqlvehallupdate="Update t_vehall_ds set OSCount="+oscount+" WHERE VehCode='"+vehcode2+"' AND TheDate='"+insertdate2+"'";
			}
			else
			{
				sqlvehallupdate="Insert into t_vehall_ds(VehCode,TheDate,OSCount,UnitId,Version) values('"+vehcode2+"','"+insertdate2+"',1,'"+unitid2+"','-')";
			}

			String sqlvehallupdate002=sqlvehallupdate.replace("'","#");
			sqlvehallupdate002=sqlvehallupdate002.replace(",","$");
			stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+sqlvehallupdate002+"')");

			stexception.executeUpdate(sqlvehallupdate);

			//*****************end of update t_vehall_ds table**************************
			aaj2=new SimpleDateFormat("yyyy-MM-dd").format(today2);
			if(insertdate2.equalsIgnoreCase(aaj2))
			{
				String sqlosonline="Update t_onlinedata set OSCount='"+oscount+"' where VehicleCode='"+vehcode2+"'";

				//System.out.println("Update onlinedata for OS-->"+sqlosonline);

				String abcd003=sqlosonline.replace("'","#");
				abcd003=abcd003.replace(",","$");
				stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd003+"')");

				stinsertonlinedata.executeUpdate(sqlosonline);
			}
		}
		else{
			flag=true;
		}
		return flag;
	}
	private static boolean InsertInrdtable(String vehcode2, String insertdate2, String inserttime2, String distance2, String speed2,String ownername, String unitid2) throws SQLException, ParseException {
		java.util.Date today= new java.util.Date();
		String tdy="";
		String sqlupdtrdds="";
		boolean flag=false;
		int	DecelerationSpeedVarLimit=0;

		double speed=Double.parseDouble(speed2);
		double dist=Double.parseDouble(distance2);
		double diff=speed-dist;
		double abs=Math.abs(diff);

		String fromDateTime="",toDateTime="";
		boolean  processflag = true;
		String sqladdsecs = "SELECT DATE_SUB('"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(insertdate2+" "+inserttime2))+"', INTERVAL 2 SECOND) AS fromdatetime";
		ResultSet rsaddsecs = stdefault.executeQuery(sqladdsecs);
		if(rsaddsecs.next()){
			fromDateTime = rsaddsecs.getString("fromdatetime");
		}

		String sqlsubsecs = "SELECT DATE_ADD('"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(insertdate2+" "+inserttime2))+"', INTERVAL 2 SECOND) AS todatetime";
		ResultSet rssubsecs = stdefault.executeQuery(sqlsubsecs);
		if(rssubsecs.next()){
			toDateTime = rssubsecs.getString("todatetime");
		}

		String sqlvehcode = "SELECT * FROM db_gps."+tbname+" WHERE Thefielddatadatetime BETWEEN '"+fromDateTime+"' AND '"+toDateTime+"'";
		ResultSet rsvehcode = stdefault.executeQuery(sqlvehcode);
		while(rsvehcode.next()){
			String vehcodeStamp = rsvehcode.getString("TheFiledTextFileName");
			String fileddatetime = rsvehcode.getString("Thefielddatadatetime");
			if("AC".equalsIgnoreCase(vehcodeStamp) || "AC1".equalsIgnoreCase(vehcodeStamp)){
				//*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
				processflag = false;
				String updateStamp = "UPDATE db_gps."+tbname+" SET TheFiledTextFileName='AC1' WHERE Thefielddatadatetime='"+fileddatetime+"'";

				String updateStamp005=updateStamp.replace("'","#");
				updateStamp005=updateStamp005.replace(",","$");
				stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+updateStamp005+"')");

				stquery.executeUpdate(updateStamp);
			}
		}

		if(processflag==false){
			flag = true;
		}
		else{
			String sqlDefaultvals = "SELECT DecelerationSpeedVarLimit FROM db_gps.t_defaultvals WHERE OwnerName='"+ownername+"'";
			ResultSet rsdefault = stdefault.executeQuery(sqlDefaultvals);
			if(rsdefault.next()){
				DecelerationSpeedVarLimit = rsdefault.getInt("DecelerationSpeedVarLimit");
			}
			else{
				String sqldefault = "SELECT DecelerationSpeedVarLimit FROM db_gps.t_defaultvals WHERE OwnerName='Default'";
				ResultSet rsdefault1 = stdefault.executeQuery(sqldefault);
				if(rsdefault1.next()){
					DecelerationSpeedVarLimit = rsdefault1.getInt("DecelerationSpeedVarLimit");
				}
			}

			if(speed==0.00 || dist ==0.00 || abs < DecelerationSpeedVarLimit){
				flag = true;
			}
			else{
				if(speed<120.00 && dist<120.00 && abs>DecelerationSpeedVarLimit && speed>5.00 && dist>5.00)
				{
					flag=false;
					tdy=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(today);
					String sqlchck = "select * from "+tbname+"_rd where VehCode='"+vehcode2+"' and TheDate='"+insertdate2+"' and TheTime='"+inserttime2+"' and FromSpeed='"+distance2+"' and ToSpeed='"+speed2+"'";
					ResultSet rs = stexception.executeQuery(sqlchck);
					if(rs.next()){
						System.out.println("already present===>"+sqlchck);
					}else{
						rs = null;
						String sqlrd="insert into "+tbname+"_rd(VehCode,TheDate,TheTime,FromSpeed,ToSpeed) values('"+vehcode2+"','"+insertdate2+"','"+inserttime2+"','"+distance2+"','"+speed2+"')";


						//System.out.println("insert RD query-->"+sqlrd);

						String abcd004=sqlrd.replace("'","#");
						abcd004=abcd004.replace(",","$");
						stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcd004+"')");

						stexception.executeUpdate(sqlrd);
					}
					int rdcount=0;
					String sqlrdcount = "SELECT count(*) AS RDCount FROM db_gpsExceptions."+tbname+"_rd WHERE TheDate='"+insertdate2+"'";
					ResultSet rsrdcount = stexception.executeQuery(sqlrdcount);
					if(rsrdcount.next()){
						rdcount = rsrdcount.getInt("RDCount");
					}

					//----------------------------------------------------------------------------------------
					String sqlrdds="select * from db_gpsExceptions."+tbname+"_ds where TheDate='"+insertdate2+"'";
					ResultSet rstrsds=stexception.executeQuery(sqlrdds);
					if(rstrsds.next())
					{
						sqlupdtrdds="Update "+tbname+"_ds set RDCount="+rdcount+" where TheDate='"+insertdate2+"'";
					}else
					{
						sqlupdtrdds="Insert into "+tbname+"_ds(VehCode,TheDate,RDCount,UnitId,Version) values('"+vehcode2+"','"+insertdate2+"',1,'"+unitid2+"','-')";
					}

					//System.out.println("insert RD in DS table query-->"+sqlupdtrdds);

					String abcd005=sqlupdtrdds.replace("'","#");
					abcd005=abcd005.replace(",","$");
					stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcd005+"')");

					stexception.executeUpdate(sqlupdtrdds);
					//----------------------------------------------------------------------------------------

					//**************update t_vehall_ds table*********************************
					String sqlvehallupdate="";
					String sqlvehall = "SELECT * FROM db_gpsExceptions.t_vehall_ds WHERE VehCode='"+vehcode2+"' AND TheDate='"+insertdate2+"'";
					ResultSet rsvehall = stexception.executeQuery(sqlvehall);

					if(rsvehall.next()){
						sqlvehallupdate="Update t_vehall_ds set RDCount="+rdcount+" WHERE VehCode='"+vehcode2+"' AND TheDate='"+insertdate2+"'";
					}
					else
					{
						sqlvehallupdate="Insert into t_vehall_ds(VehCode,TheDate,RDCount,UnitId,Version) values ('"+vehcode2+"','"+insertdate2+"',1,'"+unitid2+"','-')";
					}

					String sqlvehallupdate005=sqlvehallupdate.replace("'","#");
					sqlvehallupdate005=sqlvehallupdate005.replace(",","$");
					stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+sqlvehallupdate005+"')");

					stexception.executeUpdate(sqlvehallupdate);

					//************end of update t_vehall_ds table*****************************
					java.util.Date today2= new java.util.Date();
					String tdy2="",aaj2="";
					aaj2=new SimpleDateFormat("yyyy-MM-dd").format(today2);
					if(insertdate2.equalsIgnoreCase(aaj2))
					{
						String sqlosonline="Update t_onlinedata set RDCount='"+rdcount+"' where VehicleCode='"+vehcode2+"'";

						//System.out.println("Update onlinedata for OS-->"+sqlosonline);

						String abcd003=sqlosonline.replace("'","#");
						abcd003=abcd003.replace(",","$");
						stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd003+"')");

						stinsertonlinedata.executeUpdate(sqlosonline);
					}
				}
				else{
					flag=true;
				}
			}
		}
		return flag;
	}

	private static boolean InsertInratable(String vehcode2, String insertdate2, String inserttime2, String distance2, String speed2, String ownername, String unitid2) throws SQLException, ParseException {
		java.util.Date today1= new java.util.Date();
		String tdy1="";
		String sqlupdtrads="";
		tdy1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(today1);
		boolean flag=false;
		int AccelerationSpeedVarLimit = 0;
		// Add new code date 2011-02-04

		double speed=Double.parseDouble(speed2);
		double dist=Double.parseDouble(distance2);
		double diff=speed-dist;
		double abs=Math.abs(diff);
		//dist = from speed
		//speed = to speed
		String fromDateTime="",toDateTime="";
		boolean  processflag = true;
		String sqladdsecs = "SELECT DATE_SUB('"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(insertdate2+" "+inserttime2))+"', INTERVAL 2 SECOND) AS fromdatetime";
		ResultSet rsaddsecs = stdefault.executeQuery(sqladdsecs);
		if(rsaddsecs.next()){
			fromDateTime = rsaddsecs.getString("fromdatetime");
		}

		String sqlsubsecs = "SELECT DATE_ADD('"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(insertdate2+" "+inserttime2))+"', INTERVAL 2 SECOND) AS todatetime";
		ResultSet rssubsecs = stdefault.executeQuery(sqlsubsecs);
		if(rssubsecs.next()){
			toDateTime = rssubsecs.getString("todatetime");
		}

		String sqlvehcode = "SELECT * FROM db_gps."+tbname+" WHERE Thefielddatadatetime BETWEEN '"+fromDateTime+"' AND '"+toDateTime+"'";
		ResultSet rsvehcode = stdefault.executeQuery(sqlvehcode);
		while(rsvehcode.next()){
			String vehcodeStamp = rsvehcode.getString("TheFiledTextFileName");
			String fileddatetime = rsvehcode.getString("Thefielddatadatetime");
			if("DC".equalsIgnoreCase(vehcodeStamp) || "DC1".equalsIgnoreCase(vehcodeStamp)){
				//*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
				processflag = false;
				String updateStamp = "UPDATE db_gps."+tbname+" SET TheFiledTextFileName='DC1' WHERE Thefielddatadatetime='"+fileddatetime+"'";

				String updateStamp005=updateStamp.replace("'","#");
				updateStamp005=updateStamp005.replace(",","$");
				stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+updateStamp005+"')");

				stquery.executeUpdate(updateStamp);
			}
		}

		if(processflag==false){
			flag = true;
		}
		else{
			String sqlDefaultvals = "SELECT AccelerationSpeedVarLimit FROM db_gps.t_defaultvals WHERE OwnerName='"+ownername+"'";
			ResultSet rsdefault = stdefault.executeQuery(sqlDefaultvals);
			if(rsdefault.next()){
				AccelerationSpeedVarLimit = rsdefault.getInt("AccelerationSpeedVarLimit");
			}
			else{
				String sqldefault = "SELECT AccelerationSpeedVarLimit FROM db_gps.t_defaultvals WHERE OwnerName='Default'";
				ResultSet rsdefault1 = stdefault.executeQuery(sqldefault);
				if(rsdefault1.next()){
					AccelerationSpeedVarLimit = rsdefault1.getInt("AccelerationSpeedVarLimit");
				}
			}

			if(speed==0.00 || dist ==0.00 || abs < AccelerationSpeedVarLimit){
				flag = true;
			}

			else{
				if(speed<120.00 && dist<120.00 && abs>AccelerationSpeedVarLimit && speed>5.00 && dist>5.00)
				{
					flag=false;	
					String sqlchck = "select * from "+tbname+"_ra where VehCode='"+vehcode2+"' and TheDate='"+insertdate2+"' and TheTime='"+inserttime2+"' and FromSpeed='"+distance2+"' and ToSpeed='"+speed2+"'";
					ResultSet rs = stexception.executeQuery(sqlchck);
					if(rs.next())
					{
						System.out.println("already present===>"+sqlchck);
					}
					else{
						rs=null;
						String sqlra="insert into "+tbname+"_ra(VehCode,TheDate,TheTime,FromSpeed,ToSpeed) values('"+vehcode2+"','"+insertdate2+"','"+inserttime2+"','"+distance2+"','"+speed2+"')";

						String abcd006=sqlra.replace("'","#");
						abcd006=abcd006.replace(",","$");
						stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcd006+"')");

						stexception.executeUpdate(sqlra);
					}
					int racount=0;
					String sqlracount = "SELECT count(*) AS RACount FROM db_gpsExceptions."+tbname+"_ra WHERE TheDate='"+insertdate2+"'";
					ResultSet rsracount = stexception.executeQuery(sqlracount);
					if(rsracount.next()){
						racount = rsracount.getInt("RACount");
					}
					//---------------------------------------------------------------------------
					String sqlrdds="select * from db_gpsExceptions."+tbname+"_ds where TheDate='"+insertdate2+"'";
					ResultSet rstrsds=stexception.executeQuery(sqlrdds);
					if(rstrsds.next())
					{
						sqlupdtrads="Update "+tbname+"_ds set RACount="+racount+" where TheDate='"+insertdate2+"'";
					}else
					{
						sqlupdtrads="Insert into "+tbname+"_ds(VehCode,TheDate,RACount,UnitId,Version) values('"+vehcode2+"','"+insertdate2+"',1,'"+unitid2+"','-')";
					}

					//System.out.println("insert RD in DS table query-->"+sqlupdtrads);

					String abcd007=sqlupdtrads.replace("'","#");
					abcd007=abcd007.replace(",","$");
					stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcd007+"')");

					stexception.executeUpdate(sqlupdtrads);
					//----------------------------------------------------------------------------------------

					//**************update t_vehall_ds table*********************************
					String sqlvehallupdate="";
					String sqlvehall = "SELECT * FROM db_gpsExceptions.t_vehall_ds WHERE VehCode='"+vehcode2+"' AND TheDate='"+insertdate2+"'";
					ResultSet rsvehall = stexception.executeQuery(sqlvehall);

					if(rsvehall.next()){
						sqlvehallupdate="Update t_vehall_ds set RACount="+racount+" WHERE VehCode='"+vehcode2+"' AND TheDate='"+insertdate2+"'";
					}
					else
					{
						sqlvehallupdate="Insert into t_vehall_ds(VehCode,TheDate,RACount,UnitId,Version) values('"+vehcode2+"','"+insertdate2+"',1,'"+unitid2+"','-')";
					}
					//NO BUFFER QUERY FOR sqlvehallupdate***********
					String sqlvehallupdate007=sqlvehallupdate.replace("'","#");
					sqlvehallupdate007=sqlvehallupdate007.replace(",","$");
					stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+sqlvehallupdate007+"')");

					stexception.executeUpdate(sqlvehallupdate);

					//************end of update t_vehall_ds table*****************************
					java.util.Date today2= new java.util.Date();
					String tdy2="",aaj2="";
					aaj2=new SimpleDateFormat("yyyy-MM-dd").format(today2);
					if(insertdate2.equalsIgnoreCase(aaj2))
					{
						String sqlosonline="Update t_onlinedata set RACount='"+racount+"' where VehicleCode='"+vehcode2+"'";

						//System.out.println("Update onlinedata for OS-->"+sqlosonline);

						String abcd003=sqlosonline.replace("'","#");
						abcd003=abcd003.replace(",","$");
						stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd003+"')");

						stinsertonlinedata.executeUpdate(sqlosonline);
					}
				}
				else{
					flag=true;
				}
			}
		}
		return flag;
	}
	private static int CorrectDist(String vehcode2, String insertdate2, String inserttime2, int sdist2, double insertlat2, double insertlong2, int distCorrFactor2, int avgSpeed2, String stamp2, String latestdata2, int idledistance2, String distType2) throws SQLException {

		//	System.out.println("CorrectDist Parameter--->(vehcode2-->"+vehcode2+",insertdate2-->"+insertdate2+",inserttime2-->"+inserttime2+",sdist2-->"+sdist2+",insertlat2-->"+insertlat2+",insertlong2-->"+insertlong2+",distCorrFactor2-->"+distCorrFactor2+",avgSpeed2-->"+avgSpeed2+",stamp2-->"+stamp2+",latestdata2-->"+latestdata2+",idledistance2-->"+idledistance2+",distType2-->"+distType2);
		int correctdistretun=0;
		double LDistDiff=0.0,timediff=0.0,AvgSp=0.0,LAvgSp=0.0,querylat=0.0,querylong=0.0;
		int DistDiff=0,querydist=0,querystampdist=0;
		String querydate="",querytime="",querystamp="";
		int CorrectDistance1;
		double perofDiff=0,lper = 80,hper = 120;

		if(latestdata2.equalsIgnoreCase("true"))
		{
			CorrectDistance1=sdist2+distCorrFactor2;
		}
		else
		{
			String sql2="Select newcorrfactor from t_distancecorrection_"+vehcode+" where vehid="+vehcode+" and newstampdatetime<'"+insertdate2+" "+inserttime2+"'  order by newstampdatetime desc limit 1";
			//System.out.println(sql2);
			ResultSet rst2;
			rst2 = stdistcorr.executeQuery(sql2);
			if(rst2.next())
			{
				distCorrFactor2=rst2.getInt("newcorrfactor");
				CorrectDistance1=sdist2+distCorrFactor2;
			}
			else
			{
				distCorrFactor2=0;
				CorrectDistance1=sdist2+distCorrFactor2;
			}
		}


		//if(stamp.equalsIgnoreCase("AC") || stamp.equalsIgnoreCase("DC") || stamp.equalsIgnoreCase("OS") || stamp.equalsIgnoreCase("OS1") || stamp.equalsIgnoreCase("OS2") || stamp.equalsIgnoreCase("VD") || stamp.equalsIgnoreCase("VC") || stamp.equalsIgnoreCase("ER") )
		//	System.out.println("CorrectDistance1--->"+CorrectDistance1);
		String sql3="Select latindec,longindec,thefielddatadate,thefielddatatime,Distance,TheFiledTextFileName,CDistance from t_veh"+vehcode+" where thefielddatadatetime<'"+insertdate2+" "+inserttime2+"' and TheFiledTextFileName in('SI','ON','OF','ST','SP')  order by thefielddatadatetime desc limit 1";
		ResultSet rst3;
		rst3 = st1.executeQuery(sql3);

		if(rst3.next())
		{

			querydist=rst3.getInt("Distance");
			querydate=rst3.getString("TheFieldDataDate");
			querytime=rst3.getString("thefielddatatime");
			querystamp=rst3.getString("TheFiledTextFileName");
			querylat=rst3.getDouble("latindec");
			querylong=rst3.getDouble("longindec");
			querystampdist=rst3.getInt("CDistance");

			//System.out.println("Last Record--->(QueryDist-->"+querydist+",QueryDate--->"+querydate+",QueryTime--->"+querytime+",QueryStamp-->"+querystamp+",QueryLat-->+"+querylat+",QueryLong-->"+querylong+")");
			LDistDiff = (GetDistance(querylat, querylong, insertlat2, insertlong2)) / 1000;
			DistDiff = CorrectDistance1 - querydist;
			//System.out.println("LDistDiff-->"+LDistDiff);
			//System.out.println("DistDiff-->"+DistDiff);
			timediff = GetTimeDiff(insertdate2, inserttime2, insertlat2, querydate , querytime);
			//System.out.println("timediff-->"+timediff);
			//	AvgSp=DistDiff/timediff;
			LAvgSp=LDistDiff/timediff;
			if(LAvgSp > (avgSpeed2))
			{
				validStamp=false;
				return sdist2;
			}
			if(DistDiff==0 && !(distType2.equalsIgnoreCase("UnitDistance")) )
			{
				LDistDiff = (GetDistance(querylat, querylong, insertlat2, insertlong2)) / 1000;
				double add =(int) Math.round(LDistDiff*1.1);
				correctdistretun=(int) (CorrectDistance1+add);
			}
			else
			{
				if(distType2.equalsIgnoreCase("UnitDistance"))
				{
					if(DistDiff<0)
					{
						newDistCorrFactor=distCorrFactor2+(querydist - CorrectDistance1);
						//		System.out.println("1-newDistCorrFactor--->"+newDistCorrFactor);
						if(latestdata2.equalsIgnoreCase("true") && !(sdist2==0))
						{
							String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
							//	System.out.println("1Query to update DistCorrFactor in Vehicledetails--->"+sql5);

							String abcd18=sql5.replace("'","#");
							abcd18=abcd18.replace(",","$");
							stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd18+"')");

							st4.executeUpdate(sql5);
						}	
						correctdistretun=sdist2+newDistCorrFactor;
						//	System.out.println("1-correctdistretun--->"+correctdistretun);
						if(!(sdist2==0)){
							String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
							//	System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
							stdistcorr.executeUpdate(sql6);

							//Buffer query added date 2011/07/03


							String abcd007=sql6.replace("'","#");
							abcd007=abcd007.replace(",","$");
							stdistcorr.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gpsExceptions','"+abcd007+"')");

						}


					}
					else
					{
						correctdistretun=CorrectDistance1;
					}
				}
				else
				{
					if((LDistDiff*1000)< idledistance2)                                          //
					{
						//	System.out.println("IN (LDistDiff*1000)< idledistance2");
						newDistCorrFactor=distCorrFactor2 - (CorrectDistance1 - querydist);
						//	System.out.println("2-newDistCorrFactor--->"+newDistCorrFactor);

						if(latestdata2.equalsIgnoreCase("true"))
						{
							String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
							//	System.out.println("2Query to update DistCorrFactor in Vehicledetails--->"+sql5);

							String abcd16=sql5.replace("'","#");
							abcd16=abcd16.replace(",","$");
							stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd16+"')");

							st4.executeUpdate(sql5);
						}

						correctdistretun=sdist2 + newDistCorrFactor;
						//	System.out.println("2-correctdistretun--->"+correctdistretun);
						String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
						//	System.out.println("2Query to Insert into t_distancecorrection_vehcode--->"+sql6);
						stdistcorr.executeUpdate(sql6);

					}
					else
					{
						if(DistDiff<0)
						{

							//	newDistCorrFactor=distCorrFactor2 + (querydist - CorrectDistance1);

							//if(stamp2.equalsIgnoreCase("OF")) // If OF stamp then add lat long difference.
							//{

							//Modify date 07/March/2011
							//In of Stamp we were getting wrong Lat and lon .Due to wrong lat and lon distacorrection was wrong.

							try
							{
								double calof=(int) (Math.round(LDistDiff*1.1));
								double avg1=calof/timediff;
								AvgSp=DistDiff/timediff;
								AvgSp = Math.abs(AvgSp);
								if(avg1< (avgSpeed2))
								{
									correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
								}
								else
								{
									correctdistretun=querydist;	
								}

								//	System.out.println("correctdistretun>>"+correctdistretun);
							}
							catch(Exception e)
							{
								System.out.println("Exception In of Stamp cal"+e);

							}

							newDistCorrFactor=correctdistretun-sdist2;
							/*}
							else
							{
								correctdistretun=sdist2 + newDistCorrFactor;
							}*/

							if(latestdata2.equalsIgnoreCase("true") && !("OF".equalsIgnoreCase(stamp2) && sdist2==0))
							{
								String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";

								String abcd14=sql5.replace("'","#");
								abcd14=abcd14.replace(",","$");
								stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd14+"')");

								st4.executeUpdate(sql5);
							}	

							if(stamp2.equalsIgnoreCase("OF") && sdist2==0){

							}
							else{
								//		System.out.println("3-correctdistretun--->"+correctdistretun);
								String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
								//	System.out.println("3Query to Insert into t_distancecorrection_vehcode--->"+sql6);
								stdistcorr.executeUpdate(sql6);
							}
						}
						else
						{
							if(timediff>0)
							{
								//		System.out.println("IN (timediff>0)");
								AvgSp=DistDiff/timediff;
								AvgSp = Math.abs(AvgSp);
								LAvgSp=LDistDiff/timediff;
								if(LAvgSp < (avgSpeed2))
								{
									if(AvgSp > avgSpeed2)
									{
										//	System.out.println("IN (AvgSp > avgSpeed2)");
										correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
										//	System.out.println("4-correctdistretun--->"+correctdistretun);
										newDistCorrFactor=correctdistretun - sdist2;
										//newDistCorrFactor=CorrectDistance1;
										//	System.out.println("4-newDistCorrFactor--->"+newDistCorrFactor);

										if(latestdata2.equalsIgnoreCase("true"))
										{
											String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
											//	System.out.println("4Query to update DistCorrFactor in Vehicledetails--->"+sql5);

											String abcd12=sql5.replace("'","#");
											abcd12=abcd12.replace(",","$");
											stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd12+"')");

											st4.executeUpdate(sql5);
										}
										String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
										//	System.out.println("4Query to Insert into t_distancecorrection_vehcode--->"+sql6);
										stdistcorr.executeUpdate(sql6);
									}else
									{
										//if(timediff>0)
										//{
										AvgSp=LDistDiff/timediff;
										if(AvgSp<avgSpeed2)
										{
											//		System.out.println("IN (AvgSp < avgSpeed2)");
											if(!(DistDiff==1))
											{
												perofDiff=(DistDiff/LDistDiff)*100;
												if(perofDiff > hper)
												{
													//	System.out.println("IN (perofDiff > hper)");
													correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
													//	System.out.println("6-correctdistretun--->"+correctdistretun);
													newDistCorrFactor=correctdistretun - sdist2;
													//	System.out.println("6-newDistCorrFactor--->"+newDistCorrFactor);

													if(latestdata2.equalsIgnoreCase("true"))
													{
														String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
														//	System.out.println("6Query to update DistCorrFactor in Vehicledetails--->"+sql5);

														String abcd8=sql5.replace("'","#");
														abcd8=abcd8.replace(",","$");
														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd8+"')");

														st4.executeUpdate(sql5);
													}
													String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
													//	System.out.println("6Query to Insert into t_distancecorrection_vehcode--->"+sql6);
													stdistcorr.executeUpdate(sql6);
													/////
												}else
												{
													if(perofDiff<lper)
													{
														//		System.out.println("IN (perofDiff < Lper)");

														correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
														//System.out.println("7-correctdistretun--->"+correctdistretun);
														newDistCorrFactor=correctdistretun - sdist2;

														if(latestdata2.equalsIgnoreCase("true"))
														{
															String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
															//	System.out.println("7Query to update DistCorrFactor in Vehicledetails--->"+sql5);

															String abcd6=sql5.replace("'","#");
															abcd6=abcd6.replace(",","$");
															stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd6+"')");

															st4.executeUpdate(sql5);
														}
														String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
														//	System.out.println("7Query to Insert into t_distancecorrection_vehcode--->"+sql6);
														stdistcorr.executeUpdate(sql6);
													}else
													{
														//	System.out.println("IN eLSE");
														correctdistretun=CorrectDistance1;
													}
													//System.out.println("7-newDistCorrFactor--->"+newDistCorrFactor);
												}
											}else if(DistDiff == 1 && ("OF".equals(querystamp) || "ON".equals(stamp2))){

												perofDiff=(DistDiff/LDistDiff)*100;
												if(perofDiff > hper) 
												{
													//								System.out.println("IN (perofDiff > hper)");
													correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
													//							System.out.println("6-correctdistretun--->"+correctdistretun);
													newDistCorrFactor=correctdistretun - sdist2;
													//							System.out.println("6-newDistCorrFactor--->"+newDistCorrFactor);

													if(latestdata2.equalsIgnoreCase("true"))
													{
														String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
														//							System.out.println("6Query to update DistCorrFactor in Vehicledetails--->"+sql5);

														String abcd8=sql5.replace("'","#");
														abcd8=abcd8.replace(",","$");
														stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd8+"')");

														st4.executeUpdate(sql5);
													}

													String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
													ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
													if(rscheck.next()){
														String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
														//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
														stdistcorr.executeUpdate(sql6);
													}
													else{
														String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
														//					System.out.println("6Query to Insert into t_distancecorrection_vehcode--->"+sql6);
														stdistcorr.executeUpdate(sql6);
														/////
													}
												}else
												{
													if(perofDiff<lper)
													{
														//							System.out.println("IN (perofDiff < Lper)");

														correctdistretun=(int) (querydist + Math.round(LDistDiff*1.1));
														//System.out.println("7-correctdistretun--->"+correctdistretun);
														newDistCorrFactor=correctdistretun - sdist2;

														if(latestdata2.equalsIgnoreCase("true"))
														{
															String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
															//							System.out.println("7Query to update DistCorrFactor in Vehicledetails--->"+sql5);

															String abcd6=sql5.replace("'","#");
															abcd6=abcd6.replace(",","$");
															stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd6+"')");

															st4.executeUpdate(sql5);
														}

														String sqlcheck = "SELECT * FROM t_distancecorrection_"+vehcode+" WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
														ResultSet rscheck = stdistcorrCheck.executeQuery(sqlcheck);
														if(rscheck.next()){
															String sql6="UPDATE t_distancecorrection_"+vehcode+" SET PrevCorrFactor='"+distCorrFactor2+"', PrevStampDateTime='"+querydate+" "+querytime+"', PreStamp='"+querystamp+"', PrevDist='"+querydist+"'  WHERE NewStampDateTime = '"+insertdate2+" "+inserttime2+"'";
															//			System.out.println("1Query to Insert into t_distancecorrection_vehcode--->"+sql6);
															stdistcorr.executeUpdate(sql6);
														}
														else{
															String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
															//							System.out.println("7Query to Insert into t_distancecorrection_vehcode--->"+sql6);
															stdistcorr.executeUpdate(sql6);
														}
													}else
													{
														//							System.out.println("IN eLSE");
														correctdistretun=CorrectDistance1;
													}
													//System.out.println("7-newDistCorrFactor--->"+newDistCorrFactor);
												}

											}else
											{
												correctdistretun=CorrectDistance1;
											}
										}else
										{
											correctdistretun=CorrectDistance1;
										}
										//}jkll
									}
								}
								else
								{
									newDistCorrFactor=distCorrFactor2 + (querydist - CorrectDistance1);
									//newDistCorrFactor=distCorrFactor2;//+(CorrectDistance1 - querydist);
									//	System.out.println("5-newDistCorrFactor--->"+newDistCorrFactor);

									if(latestdata2.equalsIgnoreCase("true"))
									{
										String sql5="Update t_vehicledetails set DistCorrFactor='"+newDistCorrFactor+"',DistCorrDatetime='"+insertdate2+" "+inserttime2+"' where vehiclecode='"+vehcode+"'";
										//		System.out.println("5Query to update DistCorrFactor in Vehicledetails--->"+sql5);
										st4.executeUpdate(sql5);
									}

									correctdistretun=sdist2 + newDistCorrFactor;
									//		System.out.println("5-correctdistretun--->"+correctdistretun);

									String sql6="Insert into t_distancecorrection_"+vehcode+" (vehid,PrevCorrFactor,NewCorrFactor,PrevStampDateTime,NewStampDateTime,PreStamp,NewStamp,PrevDist,NewDist,Reason) values('"+vehcode+"','"+distCorrFactor2+"','"+newDistCorrFactor+"','"+querydate+" "+querytime+"','"+insertdate2+" "+inserttime2+"','"+querystamp+"','"+stamp2+"','"+querydist+"','"+correctdistretun+"','New Dist<PrevDist Unit Replacement or Distance Reset')";
									//		System.out.println("5Query to Insert into t_distancecorrection_vehcode--->"+sql6);
									stdistcorr.executeUpdate(sql6);
								}
							}else
							{
								correctdistretun=CorrectDistance1;
							}
							//*********************************
						}
					}
				}
			}
		}
		else
		{
			correctdistretun=CorrectDistance1;
		}

		return correctdistretun;


	}

	private static double GetTimeDiff(String insertdate2, String inserttime2,double insertlat2, String querydate, String querytime) throws SQLException {
		double Tdiff=0.0;
		String sql6="select HOUR(TIMEDIFF('"+insertdate2+" "+inserttime2+"','"+querydate+" "+querytime+"'))+MINUTE(TIMEDIFF('"+insertdate2+" "+inserttime2+"','"+querydate+" "+querytime+"'))/60+SECOND(TIMEDIFF('"+insertdate2+" "+inserttime2+"','"+querydate+" "+querytime+"'))/3600 as time";
		ResultSet rst6=sttime.executeQuery(sql6);
		if(rst6.next())
		{
			Tdiff  =rst6.getDouble("time");
		}
		return Tdiff;
	}
	private static double GetDistance(double querylat2,double querylong2,double insertlat2, double insertlong2) throws SQLException {
		double LDiff = 0;
		double earthRadius = 3958.75;
		double dLat = Math.toRadians(insertlat2 - querylat2);//(28.55332-28.55332);
		double dLng = Math.toRadians(insertlong2 - querylong2);//(77.07488-77.07488);
		double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(Math.toRadians(querylat2)) * Math.cos(Math.toRadians(insertlat2)) * Math.sin(dLng/2) * Math.sin(dLng/2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		double dista = earthRadius * c;
		//System.out.println("Distance calculated>>>>>>>>>>>>>>"+new Float(dista).floatValue());
		LDiff=dista*1609.344;
		//System.out.println(LDiff);

		return LDiff;
	}


	public static void GetConnection()
	{
		try
		{
			Class.forName("org.gjt.mm.mysql.Driver");
			//*************************Connection for DB on 203.199.134.130 Server
			// 	conn1= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_gps","java","transjava!1");
			//	conn2= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_avlalldata","java","transjava!1");
			//	conn3= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_avlalldata","java","transjava!1");
			//  conn4= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_gpsExceptions","java","transjava!1");

			//*************************Connection for DB on 202.65.131.44 And 203.199.134.130 Server
			//conn1= DriverManager.getConnection("jdbc:mysql://203.199.134.128/db_gps","java","transjava!1");
			//conn2= DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_avlalldata","java","transjava!1");
			//conn3= DriverManager.getConnection("jdbc:mysql://203.199.134.128/db_avlalldata","java","transjava!1");
			//conn4= DriverManager.getConnection("jdbc:mysql://203.199.134.128/db_gpsExceptions","java","transjava!1");


			//connection for hydrabaad server

			conn1= DriverManager.getConnection("jdbc:mysql://182.18.129.62/db_gps","java","transjava!1");
			conn2= DriverManager.getConnection("jdbc:mysql://182.18.129.62/db_avlalldata","java","transjava!1");
			conn3= DriverManager.getConnection("jdbc:mysql://203.199.134.128/db_avlalldata","java","transjava!1");
			conn4= DriverManager.getConnection("jdbc:mysql://182.18.129.62/db_gpsExceptions","java","transjava!1");

			// and make two stament conn3 to 2;
			/*	conn1= DriverManager.getConnection("jdbc:mysql://182.18.129.62/db_gps","java","transjava!1");
			conn2= DriverManager.getConnection("jdbc:mysql://182.18.129.62/db_avlalldata","java","transjava!1");

		   conn4= DriverManager.getConnection("jdbc:mysql://182.18.129.62/db_gpsExceptions","java","transjava!1");
			 */
			/*  conn1= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_gps","java","transjava!1");
			conn2= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_avlalldata","java","transjava!1");

		   conn4= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_gpsExceptions","java","transjava!1");*/


			//connection for DATA Center Server
			/*
		    conn1= DriverManager.getConnection("jdbc:mysql://202.65.131.44/db_gps","java","transjava!1");
			conn2= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_avlalldata","java","transjava!1");
			conn3= DriverManager.getConnection("jdbc:mysql://202.65.131.44/db_avlalldata","java","transjava!1");
		    conn4= DriverManager.getConnection("jdbc:mysql://202.65.131.44/db_gpsExceptions","java","transjava!1");
			 */



			//		System.out.println("Connection Successfull");
			stvehcode = conn1.createStatement();
			stunsendDataCorrection = conn1.createStatement();
			stdistcorrCheck=conn2.createStatement();

			stdefault = conn1.createStatement();
			sttables=conn2.createStatement();
			stpending=conn2.createStatement();
			stinvalid=conn2.createStatement();
			stvehdet=conn1.createStatement();
			stexception=conn4.createStatement();
			stexceptioncheck=conn4.createStatement();
			stinsert=conn1.createStatement();
			stinsertallconnectedunits=conn1.createStatement();
			stchkallconnectedunits=conn1.createStatement();
			stinsertonlinedata=conn1.createStatement();
			stchkonlinedata=conn1.createStatement();
			stdistcorr=conn2.createStatement();      //conn changes 
			stcheck=conn1.createStatement();
			sttime=conn2.createStatement();           //conn changes
			stquery=conn2.createStatement();
			st=conn1.createStatement();
			st1=conn1.createStatement();
			st2=conn2.createStatement();
			st3=conn2.createStatement();
			st4=conn1.createStatement();
			st5=conn1.createStatement();

			stmtDC = conn3.createStatement();
			stmtDCinvalid = conn3.createStatement();
			stmtDCpending = conn3.createStatement();

			stnew=conn1.createStatement();
			buffstore=conn1.createStatement();
			buffstore1=conn1.createStatement();
			buffst=conn1.createStatement();
			System.out.println("conn successfull");

		}catch (Exception e) {
			System.out.print("GetConnection Exception ---->"+e);
			e.printStackTrace();
			SaveException(e.toString(),"MailExtracter Greater than 3000 Processing at line 1502 (!!! GET CONNECTION EXCEPTION !!!)" );
		}
	}
	public static void CloseConnection() {
		try{

			sttables.close();
			stpending.close();
			stinvalid.close();
			stquery.close();
			stvehdet.close();
			stexception.close();
			stexceptioncheck.close();
			stinsert.close();
			stinsertallconnectedunits.close();
			stchkallconnectedunits.close();
			stinsertonlinedata.close();
			stchkonlinedata.close();
			stdistcorr.close();
			stcheck.close();
			sttime.close();
			st.close();
			st1.close();
			st2.close();
			st3.close();
			st4.close();
			st5.close();

			stnew.close();     
			buffstore.close();
			buffstore1.close();
			buffst.close();  

			stvehcode.close();
			stdistcorrCheck.close();
			stunsendDataCorrection.close();
			conn1.close();
			conn2.close();
			//  conn3.close();
			conn4.close();
		}catch (Exception e) {
			System.out.print("CloseConnection Exception---->"+e);
			SaveException(e.toString(),"MailExtracter Greater than 3000 Processing at line 1534 (!!! CLOSE CONNECTION EXCEPTION !!!)" );
		}

	}

	public static String GetValidDate(String dt)
	{
		if(dt.length()==6)
		{

			date1="20"+dt.substring(4,6)+"-"+dt.substring(2,4)+"-"+dt.substring(0,2);

		}
		return date1;

	}
	public static boolean CheckValidDate(String date1)
	{
		boolean flag=false;
		try{
			if(date1.length()==10){
				Integer.parseInt(date1.substring(0,4));
				Integer.parseInt(date1.substring(5,7));
				Integer.parseInt(date1.substring(8,10));
				java.util.Date checkdate=(Date) frt1.parseObject(date1);
				java.util.Date today=new Date();
				if(today.getTime() > checkdate.getTime())
				{
					flag=true;
				}
			}
		}catch(Exception e)
		{
			return flag;
		}
		return flag;
	}

	public static boolean CheckUnitReplacemtntDate(String replacementDate,String date1)
	{
		boolean flag=false;
		try{
			java.util.Date stampDateInDateFormat=(Date) frt.parseObject(date1);
			java.util.Date replacementDateinDateFormat=(Date) frt.parseObject(replacementDate);
			long abc=stampDateInDateFormat.getTime();
			abc=abc+19800000;
			//     System.out.println("stampDateInDateFormat.getTime()-->"+abc);

			if(replacementDateinDateFormat.getTime() > abc)
			{
				flag=true;
			}
		}catch(Exception e)
		{
			System.out.println("Exception in CheckUnitreplacement "+e);
			SaveException(e.toString(),"From Diary System :: Exception in CheckUnitreplacement  at line 1606");
			return flag;
		}
		return flag;
	}


	public static String GetValidTime(String tm)
	{
		if(tm.length()==6)
		{
			time1=tm.substring(0,2)+":"+tm.substring(2,4)+":"+tm.substring(4,6);						
		}
		return time1;
	}
	public static boolean CheckValidTime(String tm)
	{
		boolean flag=false;
		try{
			if(tm.length()==6){
				Integer.parseInt(tm.substring(0,2));
				Integer.parseInt(tm.substring(2,4));
				Integer.parseInt(tm.substring(4,6));
				flag=true;
			}
		}catch(Exception e)
		{
			return flag;
		}
		return flag;	
	}
	public static boolean CheckValidLatLong(String latlong)
	{
		int a=latlong.indexOf('.');

		boolean flag=false;
		if(a==5 || a==4)
		{
			try{
				if(Double.parseDouble(latlong)> 0.0)
				{
					flag=true;
				}
			}
			catch(Exception e)
			{
				return flag;
			}

		}
		else
		{
			flag=false;
		}

		return flag;

	}
	public static double getLatLong(double value)
	{
		double val=(Math.floor(value/100)+((value/100)-Math.floor(value/100))/60*100);
		String var=""+val;
		if(var.length()>7){
			var=var.substring(0,7);
			val=Double.parseDouble(var);
		}
		return val;

	}
	public static boolean CheckValidDirectionDegree(String latlong)
	{
		boolean flag=false;
		try{
			Double.parseDouble(latlong);

			flag=true;

		}catch(Exception e)
		{
			return flag;
		}
		return flag;
	}
	public static boolean CheckSpeedDistance(String SpeedDistance)
	{
		boolean flag=false;
		try
		{
			if(Double.parseDouble(SpeedDistance) >= 0)
				flag=true;
		}catch(Exception e)
		{
			return flag;
		}
		return flag;
	}
	public static String GetWareHouseLocation(double lat, double lon,String ownernameve,String vehcode)
	{
		double lat11=lat;
		double lon11=lon;
		String directionWare="";
		try
		{

			String owner=ownername;
			String veh=vehcode;

			if(veh.equals("0"))
			{
				location=GetLocation(lat,lon);
			}
			else
			{
				customer="('Nothing',";
				String sql2="Select * from t_group where vehcode='"+veh+"'";
				ResultSet rst3=st1.executeQuery(sql2);
				while(rst3.next())
				{
					customer=customer+"'"+rst3.getString("GPName")+"',";
				}
				customer=customer+"'"+owner+"')";
				//	sql2="SELECT WAREHOUSECODE, WAREHOUSE,WType,Latitude,Longitude,((ACOS(SIN(" + lat + " * PI() / 180) * SIN(latitude * PI() / 180) + COS(" + lat + " * PI() / 180) * COS(latitude * PI() / 180) * COS((" + lon + " - longitude) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) AS distance FROM t_warehousedata where owner in " +customer+ "  order by distance asc limit 1";
				//	distance_haversine function returns distance in meter.
				//	sql2="SELECT WAREHOUSECODE, WAREHOUSE,WType,Latitude,Longitude,distance_haversine_meter ("+lat+","+lon+",latitude,longitude) as distance  FROM t_warehousedata where owner in " +customer+ "  order by distance asc limit 1";
				sql2="SELECT WAREHOUSECODE, WAREHOUSE,WType,Latitude,Longitude, (2.0 * 3958.75 * ATAN(SQRT(SIN(RADIANS(latitude - "+lat+")*0.5) * SIN(RADIANS(latitude - "+lat+")*0.5) + COS(RADIANS("+lat+")) * COS(RADIANS(latitude)) *SIN(RADIANS(longitude - "+lon+")*0.5) *SIN(RADIANS(longitude - "+lon+")*0.5)), SQRT(1.0-(SIN(RADIANS(latitude - "+lat+")*0.5) *SIN(RADIANS(latitude - "+lat+")*0.5) +COS(RADIANS("+lat+")) * COS(RADIANS(latitude)) *SIN(RADIANS(longitude - "+lon+")*0.5) *SIN(RADIANS(longitude - "+lon+")*0.5)) )) * 1609.344) as distance  FROM t_warehousedata where owner in " +customer+ "  order by distance asc limit 1";
				ResultSet rst4=st1.executeQuery(sql2);
				if(rst4.next())
				{
					double dist=rst4.getDouble("distance");
					System.out.println("WareHouse dist=>"+dist);
					double latware=rst4.getDouble("Latitude");
					double lonware=rst4.getDouble("Longitude");
					if(dist < 5000.0) // dist < 5km
					{
						if(dist<= 500.0)
							location="At "+rst4.getString("WAREHOUSE")+"-"+rst4.getString("WType");
						else{
							if(latware >lat11)
							{
								directionWare="South";
							}
							else
							{
								directionWare="North";
							}
							if(lonware > lon11)
							{
								directionWare=directionWare+" West of";
							}
							else
							{
								directionWare=directionWare+" East of";
							}
							NumberFormat nf = NumberFormat.getNumberInstance();
							nf.setMaximumFractionDigits(2) ;
							dist = dist/1000; //covert to km
							location=""+nf.format(dist)+" kms "+directionWare+" "+rst4.getString("WAREHOUSE")+"-"+rst4.getString("WType");
						}

					}
					else
					{
						location=GetLocation(lat,lon);
					}
				}
				else
				{
					location=GetLocation(lat,lon);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Warehouse location=>"+location);
		return location;
	}
	public static String GetLocation(double lat, double lon)
	{
		try
		{
			String direction;
			double lon2,lat2;
			double lat1=lat;
			double lon1=lon;
			//String sql3="SELECT city,lat,lon,((ACOS(SIN(" + lat + " * PI() / 180) * SIN(lat * PI() / 180) + COS(" + lat + " * PI() / 180) * COS(lat * PI() / 180) * COS((" + lon + " - lon) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) AS distance FROM t_citylatlong order by  distance ASC limit 1";
			//	String sql3="SELECT city,lat,lon,distance_haversine_meter("+lat+","+lon+",lat,lon) as distance   FROM t_citylatlong order by  distance ASC limit 1";
			String sql3="SELECT city,lat,lon,(2.0 * 3958.75 * ATAN(SQRT(SIN(RADIANS(lat - "+lat+")*0.5) * SIN(RADIANS(lat - "+lat+")*0.5) + COS(RADIANS("+lat+")) * COS(RADIANS(lat)) *SIN(RADIANS(lon - "+lon+")*0.5) *SIN(RADIANS(lon - "+lon+")*0.5)), SQRT(1.0-(SIN(RADIANS(lat - "+lat+")*0.5) *SIN(RADIANS(lat - "+lat+")*0.5) +COS(RADIANS("+lat+")) * COS(RADIANS(lat)) *SIN(RADIANS(lon - "+lon+")*0.5) *SIN(RADIANS(lon - "+lon+")*0.5)) )) * 1609.344) as distance   FROM t_citylatlong order by  distance ASC limit 1";

			ResultSet rst5=st1.executeQuery(sql3);
			if(rst5.next())
			{
				String dst=""+rst5.getDouble("distance");
				System.out.println("WareHouse dist=>"+dst);
				lat2=rst5.getDouble("lat");
				lon2=rst5.getDouble("lon");
				if(dst.length() >5)
				{
					dst=dst.substring(0,4);
				}
				double dist1=Double.parseDouble(dst);

				if(lat2 >lat1)
				{
					direction="South";
				}
				else
				{
					direction="North";
				}
				if(lon2 > lon1)
				{
					direction=direction+" West of";
				}
				else
				{
					direction=direction+" East of";
				}
				if(dist1 <= 500)
				{
					location="At "+rst5.getString("city");
				}else
				{
					dist1 = dist1/1000; //covert to km
					NumberFormat nf = NumberFormat.getNumberInstance();
					nf.setMaximumFractionDigits(2);
					//dist1 = dist1/1000; //covert to km
					location=""+nf.format(dist1)+" kms "+direction+" "+rst5.getString("city");
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		System.out.println("citylatlong location=>"+location);
		return location;
	}
	public static void InsertInAllConnectedUnits(String thedate, String thetime, String unitid, String vehregno, double latitude, double longitude, String loc)
	{

		try
		{
			Date d=new Date();
			String d1=new SimpleDateFormat("yyyy-MM-dd").format(d);
			Date dtTmp = new SimpleDateFormat("yyyy-MM-dd").parse(thedate);
			Date cdate=new SimpleDateFormat("yyyy-MM-dd").parse(d1);
			long diff = cdate.getTime() - dtTmp.getTime();

			if(diff>=0)
			{

				/*java.util.Date todaydte= new java.util.Date();
			String todaydate;
			int days=0;
			todaydate=new SimpleDateFormat("yyyy-MM-dd").format(todaydte);
			String sqldays="select DATEDIFF('"+thedate+"' , '"+todaydate+"') as days";
			ResultSet rstdays=stinsert.executeQuery(sqldays);
			if(rstdays.next())
			{
				days=rstdays.getInt("days");
			}
			if(days<1)
			{*/
				String sql="select * from allconnectedunits where UnitID='"+unitid+"'";
				ResultSet r1=stchkallconnectedunits.executeQuery(sql);
				if(r1.next())
				{
					sql="update allconnectedunits set VehNo ='"+vehregno+"',TheDate='"+thedate+"',TheTime='"+thetime+"',Location='"+loc+"',Latindec='"+latitude+"',LonginDec='"+longitude+"' where UnitID='"+unitid+"' and concat(TheDate,TheTime) < '"+thedate+thetime+"'";
				}
				else
				{
					sql="insert into allconnectedunits (UnitID ,VehNo,TheDate,TheTime,Location,Latindec,LonginDec) values ('"+unitid+"','"+vehregno+"','"+thedate+"','"+thetime+"','"+loc+"','"+latitude+"','"+longitude+"')";
				}
				stinsertallconnectedunits.executeUpdate(sql);

				String abcd4=sql.replace("'","#");
				abcd4=abcd4.replace(",","$");
				stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd4+"')");

				//	System.out.println("Insertted in allconnected unit");

			}

		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings("deprecation")
	public static void InsertInOnlinedata(String thedate, String thetime, String vehcode, String vehregno,String stamp, double latitude, double longitude, String speed, int distance, String loc, String owner, String uid, String sen1, String sen2, String sen3, String sen4)
	{
		double mils=0.0;
		String timediff="-";
		NumberFormat nf1=NumberFormat.getInstance();
		nf1.setMaximumFractionDigits(2);
		try
		{
			java.util.Date todaydte= new java.util.Date();
			String todaydate;
			int days=0;
			todaydate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(todaydte);
			String sqldays="select DATEDIFF('"+thedate+"' , '"+todaydate+"') as days";
			String sqldays1="SELECT TIMESTAMPDIFF(MINUTE , '"+todaydate+"' , '"+thedate+" "+thetime+"' ) AS days ";
			ResultSet rstdays=stinsert.executeQuery(sqldays);
			double prevSpeed=0;
			if(rstdays.next())
			{
				days=rstdays.getInt("days");
			}
			//	System.out.println("timediff==="+timediff);
			if(days<1)
			{
				double speed1=0.0;
				speed1=Double.parseDouble(speed);

				if(speed1==0.0 && stamp.equals("SI"))
				{
					String sqlprev = "select * from db_gps.t_veh"+vehcode+" where thefielddatadatetime<'"+thedate+" "+thetime+"' and TheFiledTextFileName='SI' order by thefielddatadatetime desc limit 1";
					ResultSet rs = stinsert.executeQuery(sqlprev);
					if(rs.next())
					{
						prevSpeed = rs.getDouble("speed");
						System.out.println("prevspeed=>"+prevSpeed);
					}
					if(prevSpeed==0){
						String sql = "select * from db_gps.t_veh"+vehcode+" where speed>0 and TheFiledTextFileName='SI' order by thefielddatadatetime desc limit 1";
						ResultSet rsnewdtime=st5.executeQuery(sql);
						if(rsnewdtime.next())
						{
							String sql1="select * from db_gps.t_veh"+vehcode+" where TheFieldDataDateTime>'"+rsnewdtime.getString("TheFieldDataDate")+" "+rsnewdtime.getString("TheFieldDataTime")+"' and TheFiledTextFileName='SI' order by thefielddatadatetime asc limit 1";
							System.out.println("sql=>"+sql1);
							ResultSet rs1 = stinsert.executeQuery(sql1);
							if(rs1.next())
							{
								date1=rs1.getString("TheFieldDataDate");
								time1=rs1.getString("TheFieldDataTime");

								String prevdate=date1+" "+time1;
								System.out.println("prevdate=>"+prevdate);
								Date pvdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(prevdate);				       


								Date cdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate+" "+thetime);
								System.out.println("cdate=>"+cdate);
								String date2=frt.format(cdate);
								Date cdate1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2);

								long hrdiff=0;
								long hrs=0,mins=0;
								double hrslong=0.00;
								long x=cdate.getMinutes();
								long y=pvdate.getMinutes();
								long timediff11=cdate.getTime()-pvdate.getTime();//msec
								long mins11=timediff11/1000/60;

								if(mins11>=60)
								{
									hrdiff=mins11/60;//2

									if((y>x)&&(x!=0))
									{
										mins=y-x;
										mins=60-mins;
										timediff = hrdiff+":"+mins;
										//out.print(hrdiff+":"+mins);
									}
									else if((x>y)&&(y!=0))
									{
										mins=x-y;
										timediff = hrdiff+":"+mins;
										//out.print(hrdiff+":"+mins);
									}else if(x==y)
									{
										mins=x-y;
										timediff = hrdiff+":"+mins;
										//out.print(hrdiff+":"+mins);
									}
									else if((x==0)&&(y>x))
									{
										mins=60-y;
										timediff = hrdiff+":"+mins;
										//out.print(hrdiff+":"+mins);
									}else if(y==0)
									{
										mins=x+y;
										timediff = hrdiff+":"+mins;
										//out.print(hrdiff+":"+mins);
									}
								}
								else
								{
									hrdiff=0;
									mins=mins11;
									timediff = hrdiff+":"+mins;
									//out.print(hrdiff+":"+mins);
								}
								/*mils=cdate1.getTime()-pvdate.getTime();
								mils=mils/(1000*60);
								mils=mils/60;
								timediff=nf1.format(mils);
								System.out.println("timediff"+timediff);*/
								System.out.println(">>>>>>>>>>>timediff>>>>>>>>."+timediff);
							}
						}
					}

					/*String newdtime="select TheFieldDataDate,TheFieldDataTime from t_veh"+vehcode+" where speed=0 and TheFiledTextFileName='SI'  order by thefielddatadatetime desc limit 1";
					ResultSet rsnewdtime=st5.executeQuery(newdtime);
					if(rsnewdtime.next())
					{
						String date1=rsnewdtime.getString("TheFieldDataDate");

						String time1=rsnewdtime.getString("TheFieldDataTime");
						String prevdate=date1+" "+time1;
						// System.out.println("Prevdate"+prevdate);

						Date pvdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(prevdate);				       


						Date cdate=new Date();
						String date2=frt.format(cdate);
						Date cdate1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2);

						mils=cdate1.getTime()-pvdate.getTime();
						mils=mils/(1000*60);
						mils=mils/60;
						timediff=nf1.format(mils);

						//	System.out.println("Time in hours"+timediff);


					}*/

				}

				String sql="select * from t_onlinedata where VehicleCode='"+vehcode+"'";
				ResultSet r=stchkonlinedata.executeQuery(sql);

				if(r.next())
				{

					if(speed1>120.0)
					{
						speed1=0;
						speed=speed1+"";

					}

					if(stamp.equalsIgnoreCase("SI"))
					{

						sql="update t_onlinedata set VehicleCode='"+vehcode+"',VehicleRegNo='"+vehregno+"',TheID='"+stamp+"',TheDate='"+thedate+"',TheTime='"+thetime+"',TheSpeed='"+speed+"',TheDistance='"+distance+"',LatitudePosition='"+latitude+"',LongitudePosition='"+longitude+"',Location='"+loc+"',UnitID='"+uid+"',Transporter='"+owner+"',TimeDiff='"+timediff+"',sen1='"+sen1+"',sen2='"+sen2+"',sen3='"+sen3+"',sen4='"+sen4+"' where concat(TheDate,TheTime) < '"+thedate+thetime+"' and VehicleCode='"+vehcode+"'";
					}
					else
					{
						sql="update t_onlinedata set VehicleCode='"+vehcode+"',VehicleRegNo='"+vehregno+"',TheID='"+stamp+"',TheDate='"+thedate+"',TheTime='"+thetime+"',TheSpeed='"+speed+"',LatitudePosition='"+latitude+"',LongitudePosition='"+longitude+"',Location='"+loc+"',UnitID='"+uid+"',Transporter='"+owner+"',sen1='"+sen1+"',sen2='"+sen2+"',sen3='"+sen3+"',sen4='"+sen4+"' where concat(TheDate,TheTime) < '"+thedate+thetime+"' and VehicleCode='"+vehcode+"'";
					}

				}
				else
				{
					if(speed1>120.0)
					{
						speed1=0;
						speed=speed1+"";

					}
					if(stamp.equalsIgnoreCase("SI"))
					{
						sql="insert into t_onlinedata (VehicleCode,VehicleRegNo,TheID,TheDate,TheTime,TheSpeed,TheDistance,LatitudePosition,LongitudePosition,Location,Transporter,UnitID,Sen1,Sen2,Sen3,Sen4) values('"+vehcode+"','"+vehregno+"','"+stamp+"','"+thedate+"','"+thetime+"','"+speed+"','"+distance+"','"+latitude+"','"+longitude+"','"+loc+"','"+owner+"','"+uid+"','"+sen1+"','"+sen2+"','"+sen3+"','"+sen4+"')";
					}else
					{
						sql="insert into t_onlinedata (VehicleCode,VehicleRegNo,TheID,TheDate,TheTime,TheSpeed,LatitudePosition,LongitudePosition,Location,Transporter,UnitID,Sen1,Sen2,Sen3,Sen4) values('"+vehcode+"','"+vehregno+"','"+stamp+"','"+thedate+"','"+thetime+"','"+speed+"','"+latitude+"','"+longitude+"','"+loc+"','"+owner+"','"+uid+"','"+sen1+"','"+sen2+"','"+sen3+"','"+sen4+"')";
					}

				}
				String abcd1=sql.replace("'","#");
				abcd1=abcd1.replace(",","$");
				stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd1+"')");

				stinsertonlinedata.executeUpdate(sql);
				System.out.println("inserted in online data~~");
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void InsertInvalidData(long srno,String UnitId, String Stamp,String sdate,String stime,String Problem)
	{
		try
		{
			if(IP_UNIT.equalsIgnoreCase(typeUnit))
			{
				String sqlunprocessed="Update db_avlalldata."+tablename+" set UnProcessedStamps='"+Stamp+"' where RID='"+srno+"'";
				if(IP_DC == true)
					stmtDCinvalid.executeUpdate(sqlunprocessed);
				else
					stinvalid.executeUpdate(sqlunprocessed);
			}
			else if(SMTP_UNIT.equalsIgnoreCase(typeUnit))
			{
				String sqlunprocessed="Update db_avlalldata."+tablename+" set UnProcessedStamps='"+Stamp+"' where RID='"+srno+"'";
				stinvalid.executeUpdate(sqlunprocessed);
			}


			String sql1="insert into db_gps.t_invaliddata (UnitId,Stamp,StoredDate,StoredTime,Problem) values('"+UnitId+"','"+Stamp+"','"+sdate+"','"+stime+"','"+Problem+"')";
			stinsert.executeUpdate(sql1);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public static boolean getGeofence(double lat1, double lon1, int vehid, String transporter) {

		boolean flag=true; 
		try{
			String customer="",customer1="";  
			String geosql="select * from t_group where VehCode='"+vehid+"'"; 
			ResultSet geors=st5.executeQuery(geosql);
			if(geors.next())
			{
				customer1=geors.getString("GPNAME");

				if(!(geors.isFirst()))  
				{
					while(geors.next())
					{
						customer1=customer1+","+geors.getString("GPNAME");     
					}
				}
			}else{
				customer1="---";
			}
			//  System.out.println("customer===>"+customer);    
			double dist=0;
			String geolocation="Select WareHouseCode,wAREHOUSE,WType,Latitude,longitude, (2.0 * 3958.75 * ATAN(SQRT(SIN(RADIANS(latitude - "+lat1+")*0.5) * SIN(RADIANS(latitude - "+lat1+")*0.5) + COS(RADIANS("+lat1+")) * COS(RADIANS(latitude)) *SIN(RADIANS(longitude - "+lon1+")*0.5) *SIN(RADIANS(longitude - "+lon1+")*0.5)), SQRT(1.0-(SIN(RADIANS(latitude - "+lat1+")*0.5) *SIN(RADIANS(latitude - "+lat1+")*0.5) +COS(RADIANS("+lat1+")) * COS(RADIANS(latitude)) *SIN(RADIANS(longitude - "+lon1+")*0.5) *SIN(RADIANS(longitude - "+lon1+")*0.5)) )) * 1609.344)  AS distance  from t_warehousedata where owner in('"+customer1+"','"+transporter+"')  order by distance asc";
			// String geolocation="Select WareHouseCode,wAREHOUSE,WType,Latitude,longitude, distance_haversine_meter ("+lat1+","+lon1+",latitude,longitude)  AS distance  from t_warehousedata where owner in('"+customer1+"','"+transporter+"')  order by distance asc";
			// System.out.println("geolocation==>"+geolocation);
			ResultSet geol= st5.executeQuery(geolocation);  
			if(geol.next())
			{
				dist=geol.getDouble("distance");
				if(dist<=500) //geofence dist <=500 m
				{
					flag=false;
				}
				else{
					flag=true;
				}
			}else
			{
				flag=true;
			}

			//  System.out.println("dist===>"+dist);    
			//  System.out.println("flag===>"+flag);    

		}catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	///////////////////////////////////////////////////////////////

	private static int getcorrectedkm(int vehid, String previousday)
	{
		System.out.println("In getCorrected km");

		int Startdist=0,CumDist=0,DistDiff=0;
		String Prevtime="00:00:00",Currtime="00:00:00",Corr="",DiffTime="00:00:00";
		long prevms=0,currms=0,diffms=0,tenmins=0;
		Date difftime=new Date();

		try{
			String sqlkm="Select TheFieldDataDate,TheFieldDatatime,TheFiledTextFileName,Distance from t_veh"+vehid+" where thefielddatadate='"+previousday+"' and TheFiledTextFileName='SI' order by thefielddatatime";
			ResultSet rskm=st.executeQuery(sqlkm);
			if(rskm.next())
			{
				Startdist=rskm.getInt("Distance");
				System.out.println("startDist==>"+Startdist);

				//Prevtime=rskm.getString("TheFieldDatatime");
				prevms=rskm.getLong("TheFieldDatatime");
			}

			while(rskm.next())
			{
				DistDiff=rskm.getInt("Distance")-Startdist;
				//Currtime=rskm.getString("TheFieldDatatime");
				System.out.println("DistDiff==>"+DistDiff);

				currms=rskm.getLong("TheFieldDatatime");
				diffms=currms-prevms;
				difftime.setTime(diffms);
				DiffTime=frt2.format(difftime);
				tenmins=10*60*1000; // conversion of "00:10:00" into msec

				if((DistDiff < 10)&&(DistDiff >= 0))
				{
					CumDist=CumDist+DistDiff;
					System.out.println("CumDist<10 &&  >0==>"+CumDist);
					Corr="No";
				}
				else if(DistDiff < 0)
				{
					Corr="Yes";
					System.out.println("Corr<0==>"+Corr);
				}
				else 
				{
					if(diffms<tenmins) //check if Currtime-Prevtime < "00:10:00"
					{
						Corr="Yes";
						System.out.println("Corr<tenmins==>"+Corr);
					}
					else
					{
						Corr="Dataloss";

						if(DistDiff < 100)
						{
							CumDist = CumDist + DistDiff;

							System.out.println("CumDist<100==>"+CumDist);
						}
					}
				}

			}

		}catch (Exception e) {
			System.out.println("Exceptions in getCorrectedKm() ----->"+e);
			e.printStackTrace();
		}
		System.out.println(" REturning Cun DistCumDist==>"+CumDist);
		return CumDist;
	}


	/////////////////////////////////////////////////////////////////////
	//---------------------------------INSERT IN FTP DUMP TABLES FOR AVL UNITS--------------------------------------------------------

	private static void InsertIntoFtpDump(String unitid,String body,String maildatetime) {
		// TODO Auto-generated method stub
		body = body+"$";
		try{
			String uid="",codeversion="",WN="",FW="",SM="",IMEI="",fromid="", VC1="",VC2="",TX="",ST="",APN="",JS="",unittype="",server="";
			/*  int uindex=0,uendind=0,TF_index=0;
			  uindex=body.indexOf("UI");

              if(uindex>=0){
			        	      // uendind=body.indexOf("$",uindex);
			        	       TF_index = body.indexOf("_TF,");
			        	       String ui=body.substring(uindex, TF_index);
						       System.out.println("ui==>"+ui);
						       uid=ui.substring(2);
							   System.out.println("uid==>"+uid);
		                    }	  */

			uid = unitid;
			if(uid.length()>2)
			{

				int c=0,endindex=0;
				c=body.indexOf("CV:");
				//  System.out.println("c==>"+c);      
				if(c>0){
					endindex=body.indexOf(",",c);
					if(endindex>0){
						String cv=body.substring(c, endindex);
						//System.out.println("cv==>"+cv);
						codeversion=cv.substring(3);
						System.out.println("codeversion==>"+codeversion);
					}  
				}          



				int cindx=0,cendx=0;  
				cindx=body.indexOf("CODE VERSION:");
				System.out.println("cindx==>"+cindx);
				if(cindx>0){
					cendx=body.indexOf(",",cindx); 
					System.out.println("cendx==>"+cendx);
					String cv=body.substring(cindx,cendx);
					// System.out.println("cv==>"+cv);
					codeversion=cv.substring(13);
					System.out.println("codeversion==>"+codeversion);
				}
				int wndex=0,enedx=0  ; 
				wndex=body.indexOf("WN:");
				if(wndex>0){
					enedx=body.indexOf(",",wndex);
					System.out.println("enedx==>"+enedx);
					String wn=body.substring(wndex,enedx);
					//System.out.println("wn==>"+wn);
					WN=wn.substring(3);
					//  System.out.println("WN==>"+WN);
				}
				int wndex1=0,enedx1=0  ; 
				wndex1=body.indexOf("WMSN:");
				System.out.println("wndex1==>"+wndex1);
				if(wndex1>0){
					enedx1=body.indexOf(",",wndex1);
					String wn1=body.substring(wndex1,enedx1);
					WN=wn1.substring(5);
					//System.out.println("WN==>"+WN);
				}
				int smdex=0,smedx=0;
				smdex=body.indexOf("SM:");
				System.out.println("smdex==>"+smdex);
				if(smdex>0){
					smedx=body.indexOf(",",smdex);
					String sm=body.substring(smdex,smedx);
					//System.out.println("sm==>"+sm);
					SM=sm.substring(3);
					System.out.println("SM==>"+SM);
				}
				int smdex1=0,smedx1=0;
				smdex1=body.indexOf("Sim:");
				if(smdex1>0){
					smedx1=body.indexOf(",",smdex1);
					String sm1=body.substring(smdex1,smedx1);
					SM=sm1.substring(4);
					// System.out.println("SM==>"+SM);
				}
				int fwdex=0,fwedx=0;
				fwdex=body.indexOf("FW:");
				if(fwdex>0){
					fwedx=body.indexOf(",",fwdex);
					String fw=body.substring(fwdex,fwedx);
					FW=fw.substring(3);
					// System.out.println("FW==>"+FW);
				}	
				int fwdex1=0,fwedx1=0;
				fwdex1=body.indexOf("ATI3:");
				if(fwdex1>0){
					fwedx1=body.indexOf(",",fwdex1);
					String fw1=body.substring(fwdex1,fwedx1);
					FW=fw1.substring(5);
					//System.out.println("FW==>"+FW);
				}
				int imeidx=0,imeiedx=0;
				imeidx=body.indexOf("IMEI:");
				if(imeidx>0){
					imeiedx=body.indexOf(",",imeidx);
					String imei=body.substring(imeidx,imeiedx);
					//System.out.println("imei==>"+imei);
					IMEI=imei.substring(5);
					System.out.println("IMEI==>"+IMEI);
				}	
				int typeindex=0,typeendx=0;
				typeindex=body.indexOf("UnitType:");
				if(typeindex>0){
					typeendx=body.indexOf(",",typeindex);
					String utype=body.substring(typeindex,typeendx);
					//System.out.println("utype=>>"+utype);
					unittype=utype.substring(9);
					//System.out.println("unittype=>>"+unittype);
				}
				int typeindex1=0,typeendx1=0;
				typeindex1=body.indexOf("TT:");
				if(typeindex1>0){
					typeendx1=body.indexOf(",",typeindex1);
					String utype1=body.substring(typeindex1,typeendx1);
					//System.out.println("utype1=>>"+utype1);
					unittype=utype1.substring(3);
					System.out.println("unittype=>>"+unittype);

				}
				if(unittype.equals("FTP")){           
					int serverindx=0,serverendx=0;
					serverindx=body.indexOf("FTPserver:");   
					if(serverindx>0){
						serverendx=body.indexOf(",",serverendx);
						String srv=body.substring(serverendx,serverendx);
						server=srv.substring(10);
						//System.out.println("server==>"+server);
					}
				}
				else if(unittype.equals("IP")){
					int serverindx1=0,serverendx1=0;
					serverindx1=body.indexOf("IPserver:");
					if(serverindx1>0){
						serverendx1=body.indexOf(",",serverindx1);
						String srv=body.substring(serverindx1,serverendx1);
						server=srv.substring(9);
						// System.out.println("server==>"+server);
					}
					int serverindx=0,serverendx=0;
					serverindx=body.indexOf("IPS:");
					if(serverindx>0){
						serverendx=body.indexOf(",",serverindx);
						String srv=body.substring(serverindx,serverendx);
						server=srv.substring(4);
						System.out.println("server==>"+server);
					}
				}
				else if(unittype.equals("SMTP")){
					int serdx=0,srvendx=0;
					serdx=body.indexOf("SS:");
					if(serdx>0){
						srvendx=body.indexOf(",",serdx);
						String srv=body.substring(serdx,srvendx);
						server=srv.substring(3);
						//System.out.println("server==>"+server);
					}
					int serdx1=0,srvendx1=0;
					serdx1=body.indexOf("Server:");
					if(serdx1>0){
						srvendx1=body.indexOf(",",serdx1);
						String srv=body.substring(serdx1,srvendx1);
						server=srv.substring(7);
						//System.out.println("server==>"+server);
					}
				} 
				int frdex=0,frendx=0;
				String from="";
				frdex=body.indexOf("From:");
				if(frdex>0){
					frendx=body.indexOf(",",frdex);
					from=body.substring(frdex,frendx);
					fromid=from.substring(5);
					//System.out.println("fromid==>"+fromid);
				}
				int frdex1=0,frendx1=0;
				frdex1=body.indexOf("IPport:");
				if(frdex1>0){
					frendx1=body.indexOf(",",frdex1);
					from=body.substring(frdex1,frendx1);
					fromid=from.substring(7);
					// System.out.println("fromid==>"+fromid);
				}
				int ipdex1=0,ipendx1=0;
				ipdex1=body.indexOf("IPP:");
				if(ipdex1>0){
					ipendx1=body.indexOf(",",ipdex1);
					from=body.substring(ipdex1,ipendx1);
					fromid=from.substring(4);
					System.out.println("fromid==>"+fromid);
				}
				int fdex1=0,fendx1=0;
				fdex1=body.indexOf("Fr:");
				if(fdex1>0){
					fendx1=body.indexOf(",",fdex1);
					from=body.substring(fdex1,fendx1);
					fromid=from.substring(3);
					//  System.out.println("fromid==>"+fromid);
				}
				int todex=0,toendx=0;
				String TOID="-",to="";
				todex=body.indexOf("To:");
				if(todex>0){
					toendx=body.indexOf(",",todex);
					to=body.substring(todex,toendx);
					System.out.println("to==>"+to);
					TOID=to.substring(3);
					//  System.out.println("TOID==>"+TOID);
				}
				String ftpserver="-",fsrv="";
				int ftpdx=0,ftpedx=0; 
				ftpdx=body.indexOf("Dota FTPserver:");
				System.out.println("ftpdx==>"+ftpdx);
				if(ftpdx>0){
					ftpedx=body.indexOf(",",ftpdx);
					fsrv=body.substring(ftpdx,ftpedx);
					ftpserver= fsrv.substring(15);
					//   System.out.println("ftpserver==>"+ftpserver);
				}  
				int ftpdx1=0,ftpedx1=0; 
				ftpdx1=body.indexOf("DFS:");
				System.out.println("ftpdx1==>"+ftpdx1);
				if(ftpdx1>0){
					ftpedx1=body.indexOf(",",ftpdx1);
					fsrv=body.substring(ftpdx1,ftpedx1);
					ftpserver= fsrv.substring(4);
					// System.out.println("ftpserver==>"+ftpserver);
				}  
				int userdx=0,useredx=0; 
				String user="-",us="";
				userdx=body.indexOf("DUN:");
				if(userdx>0){
					useredx=body.indexOf(",",userdx);
					us=body.substring(userdx,useredx);
					user= us.substring(4);
					// System.out.println("user==>"+user);
				}  
				int userdx1=0,useredx1=0; 
				userdx=body.indexOf("Username:");
				if(userdx1>0){
					useredx1=body.indexOf(",",userdx1);
					us=body.substring(userdx1,useredx1);
					user= us.substring(9);
					// System.out.println("user==>"+user);
				}  
				String vc="";
				int caldx=0,caledx=0; 
				caldx=body.indexOf("VC1:");
				if(caldx>0){
					caledx=body.indexOf(",",caldx);
					vc=body.substring(caldx,caledx);
					VC1= vc.substring(4);
					// System.out.println("VC1==>"+VC1);
				}  
				int noldx1=0,noledx1=0; 
				noldx1=body.indexOf("No1:");
				if(noldx1>0){
					noledx1=body.indexOf(",",noldx1);
					vc=body.substring(noldx1,noledx1);
					VC1= vc.substring(4);
					//System.out.println("VC1==>"+VC2);
				}  
				int caldx1=0,caledx1=0;
				String vc1="";
				caldx1=body.indexOf("VC2:");
				if(caldx1>0){
					caledx1=body.indexOf(",",caldx1);
					System.out.println(caledx1);
					vc1=body.substring(caldx1,caledx1);
					VC2= vc1.substring(4);
					//System.out.println("VC2==>"+VC2);
				}  
				int noldx=0,noledx=0; 
				noldx=body.indexOf("No2:");
				if(noldx>0){
					noledx=body.indexOf(",",noldx);
					vc1=body.substring(noldx,noledx);
					VC2= vc1.substring(4);
					//System.out.println("VC2==>"+VC2);
				}  
				int txldx=0,txledx=0; 
				String tx="";
				txldx=body.indexOf("Tx:");
				if(txldx>0){
					txledx=body.indexOf(",",txldx);
					tx=body.substring(txldx,txledx);
					System.out.println("tx"+tx);
					TX= tx.substring(3);
					// System.out.println("TX==>"+TX);
				}  
				int txldx1=0,txledx1=0; 
				txldx1=body.indexOf("Tx Interval:");
				if(txldx1>0){
					txledx1=body.indexOf(",",txldx1);
					tx=body.substring(txldx1,txledx1);
					TX= tx.substring(12);
					System.out.println("TX==>"+TX);
				}
				int stldx=0,stledx=0;
				String st="";
				stldx=body.indexOf("St:");
				if(stldx>0){
					stledx=body.indexOf(",",stldx);
					System.out.println("st indx==>"+stledx);
					st=body.substring(stldx,stledx);
					ST= st.substring(3);
					System.out.println("ST==>"+ST);
					int apldx=0,apledx=0;
					apldx=body.indexOf("APN:");
					System.out.println("APN index===>"+apldx);
					if(apldx<0){
						apledx=body.indexOf(",RMC STRING:");
						String	apn=body.substring(stledx+1,apledx);
						APN = apn;
						System.out.println("APN value===>"+apn);
					}
				}
				int stldx1=0,stledx1=0;
				stldx1=body.indexOf("St Interval:");
				if(stldx1>0){
					stledx1=body.indexOf(",",stldx1);
					st=body.substring(stldx1,stledx1);
					ST= st.substring(12);
					// System.out.println("ST==>"+ST);
				}
				int apldx=0,apledx=0;
				apldx=body.indexOf("APN:");
				if(apldx>0){
					apledx=body.indexOf(",",apldx);
					String	apn=body.substring(apldx,apledx);
					System.out.println("apn==>"+apn);
					APN= apn.substring(4);
					System.out.println("APN==>"+APN);
				}

				int jsdx=0,jsedx=0;
				jsdx = body.indexOf("JS");
				if(jsdx>0){
					jsedx = body.indexOf(",",jsdx);
					String js = body.substring(jsdx,jsedx);
					System.out.println("js===>"+js);
					JS = js.substring(3);
				}

				int rmcdx=0,rmcedx=0;
				String RMC="-";
				rmcdx=body.indexOf("RMC STRING:");
				if(rmcdx>0){

					int chgpdx=0,chgpedx=0;
					String Chaned="-";
					chgpdx=body.indexOf(",CHANGED PARAMETER:"); //if changed parameter present then use index of that to extract RMC String else use indesx of "$" concatenated  at end of string.
					if(chgpdx>0){
						String	rmc=body.substring(rmcdx,chgpdx);
						RMC= rmc.substring(11);
					}
					else{
						rmcedx=body.indexOf("$");
						String	rmc=body.substring(rmcdx,rmcedx);
						// System.out.println("rmc==>"+rmc);
						RMC= rmc.substring(11);
					}
					if(RMC==""){
						RMC="-";
					}
					System.out.println("RMC==>"+RMC);
				}
				//
				int chgpdx=0,chgpedx=0;
				String Chaned="-";
				chgpdx=body.indexOf("CHANGED PARAMETER:");
				if(chgpdx>0){
					chgpedx=body.indexOf("$",chgpdx);
					String	chg=body.substring(chgpdx,chgpedx);
					//System.out.println("chg==>"+chg);
					Chaned= chg.substring(18);
					//System.out.println("Chaned==>"+Chaned);
				}
				//System.out.println("Chaned==>"+Chaned);
				java.util.Date upddt=new Date();
				String updtdt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(upddt);   
				String rmcdate="-",rmctime="-",location="-";
				double rmclat=0,rmclon=0;
				if(!(Chaned.equals("-"))){
					String chande=" insert into t_smsstatusunittrackfiles(UnitId,Message,StoredDateTime,FileDateTime)values('"+uid+"','"+Chaned+"','"+updtdt+"','"+maildatetime+"')";
					stnew.executeUpdate(chande);

					String bcd=chande.replace("'","#");	
					bcd=bcd.replace(",","$");			
					buffst.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+bcd+"')");   


				}
				String save="insert into t_ftpdump(StoredDateTime,Filedatetime,FileName,UnitID,WMSN,SimNo,UnitType,Server,FromID,ToID,FTPServer,Username,Callno1,CallNo2,TXInterval,StInterval,CodeVersion,IMEI_No,FW,APN,JS,RmcString,rmcdate,rmctime,rmclat,rmclon,location)values('"+updtdt+"','"+maildatetime+"','-','"+uid+"','"+WN+"','"+SM+"','"+unittype+"','"+server+"','"+fromid+"','"+TOID+"','"+ftpserver+"','"+user+"','"+VC1+"','"+VC2+"','"+TX+"','"+ST+"','"+codeversion+"','"+IMEI+"','"+FW+"','"+APN+"','"+JS+"','"+ RMC+"','"+rmcdate+"','"+rmctime+"','"+rmclat+"','"+rmclon+"','"+location+"')";   
				stnew.executeUpdate(save);
				System.out.println("savedump==>"+save);
				System.out.println("Inserted into t_ftpdump=================>");

				String bcd1=save.replace("'","#");	
				bcd1=bcd1.replace(",","$");			
				String buff="Insert into t_sqlquery (dbname,query) values ('db_gps','"+bcd1+"')";
				buffstore.executeUpdate(buff);
				System.out.println("bufff==>"+buff);
				//buffstore.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+bcd1+"')");   


				String dumpdetete="";
				dumpdetete="DELETE from t_ftplastdump where UnitID='"+uid+"'";
				stnew.executeUpdate(dumpdetete);
				System.out.println("deletedumplast==>"+dumpdetete);
				System.out.println("deleted from t_ftplastdump"); 

				String acd=dumpdetete.replace("'","#");	
				acd=acd.replace(",","$");			
				buffstore.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+acd+"')");   



				String savelasrdump="Select * from t_ftpdump where unitid='"+uid+"' order by Filedatetime desc limit 1";
				ResultSet lsatdump=stnew.executeQuery(savelasrdump);

				System.out.println("savelasrdump====>"+savelasrdump);
				if(lsatdump.next()){
					String savel="Insert into t_ftplastdump(StoredDateTime,Filedatetime,FileName,UnitID,WMSN,SimNo,UnitType,Server,FromID,ToID,FTPServer,Username,Callno1,CallNo2,TXInterval,StInterval,CodeVersion,FW,APN,JS,RmcString,rmcdate,rmctime,Rmclat,Rmclon,Location,IMEI_No)values('"+lsatdump.getString("StoredDateTime")+"','"+lsatdump.getString("Filedatetime")+"','"+lsatdump.getString("FileName")+"','"+lsatdump.getString("UnitID")+"','"+lsatdump.getString("WMSN")+"','"+lsatdump.getString("SimNo")+"','"+lsatdump.getString("UnitType")+"','"+lsatdump.getString("Server")+"','"+lsatdump.getString("FromID")+"','"+lsatdump.getString("ToID")+"','"+lsatdump.getString("FTPServer")+"','"+lsatdump.getString("Username")+"','"+lsatdump.getString("Callno1")+"','"+lsatdump.getString("CallNo2")+"','"+lsatdump.getString("TXInterval")+"','"+lsatdump.getString("StInterval")+"','"+lsatdump.getString("CodeVersion")+"','"+lsatdump.getString("FW")+"','"+lsatdump.getString("APN")+"','"+lsatdump.getString("JS")+"','"+lsatdump.getString("RmcString")+"','"+lsatdump.getString("rmcdate")+"','"+lsatdump.getString("rmctime")+"','"+lsatdump.getString("rmclat")+"','"+lsatdump.getString("rmclon")+"','"+lsatdump.getString("location")+"','"+lsatdump.getString("IMEI_No")+"')";
					st1.executeUpdate(savel);
					System.out.println("inserted into t_ftplastdump");

					String last=savel.replace("'","#");	
					last=last.replace(",","$");			
					buffstore1.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+last+"')");   
				}

			}
		}catch(Exception e){
			SaveException(e.toString(),"at line 3411");
		}

	}

	//-----------------------------------------------------------------------------------




	public static void SaveException(String exceptionCaught,String exceptionAt){
		try{
			BufferedWriter writer = null;
			try{
				writer = new BufferedWriter( new FileWriter( "/home/javaprg24/Ip_Processing_LOG.txt",true));
				//	writer = new BufferedWriter( new FileWriter( "/home/shweta/Desktop/Ip_Processing_LOG.txt",true));
				writer.write( "Exception Caught At Time : "+new java.util.Date());
				writer.newLine();
				writer.write(  "Exception                : "+exceptionCaught.toString());
				writer.newLine();
				writer.write( "Exception Caught At      : "+exceptionAt );
				writer.newLine();
				writer.write("----------------------------------------------------------------------------------------------------------------");
				writer.newLine(); 	writer.newLine();  writer.newLine();
				writer.flush();
				System.out.println("write successful in CATCH block");
			}catch (Exception ee) {
				System.out.println("xx"+ee);
				//ee.printStackTrace();
			}
			finally
			{		try	{
				if ( writer != null)
					writer.close( );
			}
			catch ( IOException e)	{	}
			}
		}catch (Exception e) { }
	}



}
