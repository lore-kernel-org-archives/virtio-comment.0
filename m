Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F365B1E0
	for <virtio-comment@lists.linux.dev>; Thu, 18 Jul 2024 08:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721291053; cv=fail; b=PX9iCzNiy4XA8l46dIdVN82h1JDueytZXJCGmUzVm0J7Jn63JODBKeCMPVj3Fi8gNIxb8bqQWsPFPgbAVDjwvlqDymRxkIpTGGAYnJzpA/zwIvA5Xw4yt/rVl3cT/Vr428UXue/LcsJBWxP9i0rK1D63AOO6BQ+XT/clOByLtp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721291053; c=relaxed/simple;
	bh=h5c1Zk5HQbvwleg9OLFW3EnB8Ki49+pA+ua1YAnMW2o=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=o+HKfKItot0HS4cJ8MXbQeTWIPuiQDzUAxiZIPcf7PIbDb2TPs3uTbBx19G3NHo/F62R39vj8hFTPWPign73i89B2ZLYOu96wleRRv39vwmHnPGlnRlsSMSPNEjNUIeuZOzgyU03imRRfoco9jBs8JrktXGKpmwv5I52jAqlxJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I30V1x024755
	for <virtio-comment@lists.linux.dev>; Thu, 18 Jul 2024 01:24:11 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erjfr9tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 18 Jul 2024 01:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPJWC1Rn5M7tVrElemyvPD3HBtC51Oh959oVdtFYxgn+0JH9wEM/wQ/N81jUlC9HKUA8DoawvMZbsXmJJXAiRU3VCfAlVWXMWx5eN2T5D/9+pdeBfzoua/1TYvHVPHklzLmlTt7xIfseYJvWmgu9ZtWOzc3QC6Kmf2IiUTqjKG6o2rAOmqiSnHkQrsJMrrfhg7Q/5bq661jC0zvLrDF7U0f1Nalh5Bc58gyE75nMMp3xt6kmYSZUVsAoVIY/ojT3JS1QjoU7Ne9JxgYJzTUUKp8xceNmR71zFQUL+7cuS9G0NuUtemFU6rU90harcOTrlAuAL3mS5TUZZvJLnCFcwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imLZTpiWsWSrEd6CG6Hu5LHRntDDCb/lLXUdmDQp3Os=;
 b=rbwTj/Dg4U7scu3+maI6BDCGEnkNoU/X01cBzGkTci4U4pA0Zj3FQXsQ5NOBoscqaiaVQJ4hmtw+NyqL5sAx4+xBItPAJnbsoV4S3Kpo0uYdlH/bCDiiPpTKgVcByonwtTgVikrjItHkrcYM7QzB96c1LwlOVfot3wX40te21CGIiRf4Yp5nBjG6K9Mhw0g/74QFYDNlc0Up5NPb0m3VnM6zvoakT+KWwq3yAi+ckpNkSJ/PmRewujjjDbEHPVffi1HlqdVbly5+kjwwNH53VV/r6LcCZkGAko6tuwVtrExmqQ4KKDRL1WlB47wFiNB0F412nxE8cP3GYkL+i1AIxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14)
 by PH0PR11MB5208.namprd11.prod.outlook.com (2603:10b6:510:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 08:24:08 +0000
Received: from PH7PR11MB8550.namprd11.prod.outlook.com
 ([fe80::ab5f:96f0:1c09:5f93]) by PH7PR11MB8550.namprd11.prod.outlook.com
 ([fe80::ab5f:96f0:1c09:5f93%4]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 08:24:07 +0000
From: "Wang, Min (Rocky) (CN)" <Min.Wang.CN@windriver.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Question about virtio camera
Thread-Topic: Question about virtio camera
Thread-Index: AdrY6pcgBt+fW0QBTkCTxLxkDCq3VQ==
Date: Thu, 18 Jul 2024 08:24:07 +0000
Message-ID:
 <PH7PR11MB855011A3CBA74EFD5FD239ABA3AC2@PH7PR11MB8550.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8550:EE_|PH0PR11MB5208:EE_
x-ms-office365-filtering-correlation-id: 989d0d5a-5dcb-46c2-d231-08dca702fe57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VkzEdCQToGFVmbD6lrThDFAX6Jn9ZjcfKG4bE7XnCBcqk+V8JF03B3bEif8c?=
 =?us-ascii?Q?EXYX28jkrfRfgq+e6ddI7T1X89A+aVdz/ze+yy03Nyox8JIXKRNEfUKcaC11?=
 =?us-ascii?Q?4HN9/9o9qRd8KDDACKpanL9xS3SNYSSGr/n742tdsK7eJzw7FNmB/w4jIRQJ?=
 =?us-ascii?Q?zqRk6jrRDYjaJBLBPokYqgeWcctXJymnGXRpC51I+ATLN4iNXmL+MF7Fcaf1?=
 =?us-ascii?Q?fs6EcqRQ6QmmwuSNLM0wj6jcKXnD2ZwmTamYhWrjNOYk9U4i7WzQfFg5yECW?=
 =?us-ascii?Q?I9cJEFSphl7CbI5W+UxyiQVIgZ1APyGIAFMpAqqfVKy7K5FO30E1xW34kdM2?=
 =?us-ascii?Q?g9ngF6Ujent1H5amutXOk3IgmNzoxE1TJTPaH4nzlKewZOx1nR/j36wSvX4i?=
 =?us-ascii?Q?X6cCiJFo6yAwijxAKMMXMK6peyjEmUaMwnjHqbmrJX9rdLCSpHcxgiOE+e95?=
 =?us-ascii?Q?70+/bRUeAjbk/ma+mhigpEupTsPLsdvzPDT4qDeRCKLFO9P9x3/095miqWoE?=
 =?us-ascii?Q?0W774TgKIcCeVaY63RLNm4rjHmyjlgUs+cA1CKGU8w4VmLlCE3mKz9XnvTE/?=
 =?us-ascii?Q?FRD3H8zhi0dnyQeI3KPuzd47fV4lvgS3qRYjEIWeax08kAVjPW/cPzOwEUNU?=
 =?us-ascii?Q?oy1reNLrRb5HhZngZvgFo4FvemMKg+2x752gJ9IYmXelc/mx0VAH6QwNeRRq?=
 =?us-ascii?Q?6jH1p2uCCIjqoi8MRtNH1UK3MSZqR6oMrRr6+/VtuxND9D498YdhrkzWyC7f?=
 =?us-ascii?Q?ZZk8M+Vh4m/h24mGedqy0C9jNDQ4pV+ArB/6nSiou0AFr0/LuQeEu8S6sLqi?=
 =?us-ascii?Q?rku7zrrahqbC2pxjBkaknGSGCZqhVytiebqKr5ITUjJu02aCNLogdcID00vb?=
 =?us-ascii?Q?39m15JQhOIZRc5MjMEgy8FaEoBPJxdxCMEWqxqNzMTqiarCI4NBiLNW7aQu4?=
 =?us-ascii?Q?CbD5E1ul1W7Y6Ndm10/ks7DQQ+1KZ0sbNNEPu8Rn64F5eauP9aP64MTE4Wvq?=
 =?us-ascii?Q?XTs2Q3yisuOj5q2pnDtUPUhxXeZRig0NTUsVaTvsJiIuhz8aFdjSKok7GCz3?=
 =?us-ascii?Q?tU62YeI5kwoZncZgHAXL8VPNvJh2mflf4SLbqoBBJZrFGiaHg8+beKY47+Bv?=
 =?us-ascii?Q?cIDsoVYLV5yPPUTlRk+bPqQm0XazpnEkAq7icdxLqNlFioIdwQwKK8X+5MXk?=
 =?us-ascii?Q?VtOLfl5D//GGGXQja8SVveru41iTqbRI74mrFMzyDhvZAo/Tc1pqOZIXTbN6?=
 =?us-ascii?Q?qlL2CdOtH61svUOseMc3jD3N8dnnPEwXq4P43MjY/iWBy79t6wTVVYtla9/V?=
 =?us-ascii?Q?nz1wsDa0Ck5SCqf7Yi4OLniEBJzVf9fXCp96V7RO4it9VjjGqoYdJtEgzMp/?=
 =?us-ascii?Q?sis7MV/9ZZuqHwZagCeXlJhg71cKE0bX3sckx/7n52K60PBKFQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dPMP28p8tDrXqBl62YmXABrb4wE/4rrduaVFlFT80eXvRMkhFXQegHUSTS6R?=
 =?us-ascii?Q?b9LEkpCfm4K/IJlVK8lNGi6DQCAVuVol9U/4J1TRXyWhgpkZsiOPYAdXhSIF?=
 =?us-ascii?Q?rA3Wc1Ku6B656RsbSIGfCBa4SrWOzJAhWZXUss51WaPoXQhzq9cdGI75Q9uj?=
 =?us-ascii?Q?9TNsKrDtn/344zxSYBd2dFzn1RISqFa8ilernw94DRdbq+jxhDzxy6NTDH3P?=
 =?us-ascii?Q?Duncc0IoSlgJ+Y6jtueZfmm5jE7nY5dyUeWMsBvsOSgRlwTk7A3ol6eWaPQh?=
 =?us-ascii?Q?Kt6ndaKWv8IVvgkQup8ZkTyhZ3PubAZR+BJQYP4WzUXszUrxc6OJ93SgC+1K?=
 =?us-ascii?Q?TEqi/lzIHgLD3+vMLYRkhI3SZU86TqgFNhoR5y4wUoV5t/YLaZSvpWF/2oL+?=
 =?us-ascii?Q?LVISRYewoDSfKACEZ2UgFXJj9GyfUww0tR7B79hKqJD1YL7NctVVgZomSvy7?=
 =?us-ascii?Q?YHyqBDxos7GKuvMLYI3a3XSjMB5nQ17rqkPQJ5/QxdIz1i6WiYn9oD+VH57U?=
 =?us-ascii?Q?GUlcHwCsHV2Bz3IIw6OtzqudVrF5g7nnZLmN841FK2a534AG1GuiL3l93PUC?=
 =?us-ascii?Q?8ZyqAetxXiDsjjad8p2fFydzV7zJLXs1hmsAUchHiZQ2E17rWsDPs9ZQwl1w?=
 =?us-ascii?Q?LFcYJlMk+oZ6R0yJOkp+3ZKMzRQsUCTkgqPUm3lvkswb23xIPkN3+fmscv9c?=
 =?us-ascii?Q?1wThM2pMIvNP0yJrBJD6X8kWOSMr0yGKoNnnT01i7/mUq6D49VfVTy3Yy+ff?=
 =?us-ascii?Q?j9y36d4PzVXQMOLWV7d2Xc2fJ+rYNta58+Rvv+xJnsQyZuXoSGiEfWbmsRCA?=
 =?us-ascii?Q?NGYO6ef0ZvJizpWAsNPwgzesgloOC2no6Fs5ykh+DHLarEvOtDOXnqr2EFjc?=
 =?us-ascii?Q?CM3yV1D9W1RD9gd1aCYbnhnzWtd/aY5kAvWfUUcVnwobRc23xAehDbQag0RT?=
 =?us-ascii?Q?kdIFu753ef9sGuW9lOYgZLRQlXpVYAPsM3aZJqAd/Vra112/JcZb/EoEM/SM?=
 =?us-ascii?Q?raOT6R2imC8zu626bEekxbn2hQnUFtbs3nzqLthX0JSkBCG6n8AFsu+dJtrv?=
 =?us-ascii?Q?kauGPZ38jWms+ucdD1V+dgKjBclhRk1t1k8hKneOGmzf0D03UwBu2psfQs3a?=
 =?us-ascii?Q?L+IjjLWudDiLYwWuMn4Q4i4NiJN0RBPPwYSMr3DMoH/GMtGGSv2vlvXI4h3j?=
 =?us-ascii?Q?rmGceKAq2S1sfLSubYko3YYeOc1J0669ElEyUtfH2oGRvfZdZmx4qDSxU9wk?=
 =?us-ascii?Q?ZPMZ4KXk8Pfp+0CKKWnxtSKHKaaAJC9FKg85jylq68MvHi2V1gLh3un8PufG?=
 =?us-ascii?Q?BFkHv1yqg03rrx+saoxF+Drv4Y3LXDSSq6tktWZfyU09lXQV51Ke6TCby6iP?=
 =?us-ascii?Q?FDv8oI7GksjzZRF7w+NHM6K+zWW+948mqj3dEFN8cxVBqGSnHYBcioB5/VAJ?=
 =?us-ascii?Q?poKc9MU6e2NE3HD605WtHyf6huOVWUZltWMWw4ndWa92oP2KlbHbxYeIjrAu?=
 =?us-ascii?Q?Ahk+WVPM7lfX+HePjJEvtRHbeCzGvwLzVzqsx/tgv6MrH648Q5GmxbHHIJdK?=
 =?us-ascii?Q?e1Is9cPRpAiZIwAbN92ZW8NSmxnpoHxI8NNmgO+oN3xylMwxtQBC4NQ0TQDJ?=
 =?us-ascii?Q?FQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB855011A3CBA74EFD5FD239ABA3AC2PH7PR11MB8550namp_"
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989d0d5a-5dcb-46c2-d231-08dca702fe57
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 08:24:07.8119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FxvEBBDk4S20Pl5jpmEUg+BiHPdxFLj6R0h/NnBnGwUviGhlnGBNNpO+V3ZL/G+TtHm7xLNBVTwMvXb4ZmIIHkKVgOYORgi7S9qCN0HUNYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5208
X-Proofpoint-ORIG-GUID: LavC_r5eWegU1LJdREy2amMix6kueZa9
X-Proofpoint-GUID: LavC_r5eWegU1LJdREy2amMix6kueZa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_04,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=689
 malwarescore=0 priorityscore=1501 mlxscore=0 clxscore=1031
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2407180054

--_000_PH7PR11MB855011A3CBA74EFD5FD239ABA3AC2PH7PR11MB8550namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Experts,

I noticed that virtio spec 1.3 has added camera, but only a camera ID(43) i=
s added, the other items such as Config Space, Device Operation, all is emp=
ty.

Is there any progress about camera part in new spec(maybe 1.4) could be sha=
red?

Best Regards
Rocky

--_000_PH7PR11MB855011A3CBA74EFD5FD239ABA3AC2PH7PR11MB8550namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:DengXian;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Hi Experts,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">I noticed that virtio spec 1.3 has a=
dded camera, but only a camera ID(43) is added, the other items such as Con=
fig Space, Device Operation, all is empty.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Is there any progress about camera p=
art in new spec(maybe 1.4) could be shared?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Best Regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Rocky<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_PH7PR11MB855011A3CBA74EFD5FD239ABA3AC2PH7PR11MB8550namp_--
