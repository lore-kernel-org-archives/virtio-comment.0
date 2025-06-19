Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0869C4A06
	for <virtio-comment@lists.linux.dev>; Thu, 19 Jun 2025 05:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750310735; cv=fail; b=lPhjO5DbgS6QZfaLH/zY1Zxn6uaC/qbE7SFu9tVwhUkTrRoPld4SeJhlWpYN7WMUfzyloixlrH0Piuii7VBV4EaFSWFFuKoiCpv+pa8H6KfwfUXq4FfRNx2EVTTFY9akUQPiZbuhDjoMcVIpAh+CLKgZD2IJg7palKAw2U6FQzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750310735; c=relaxed/simple;
	bh=DCPZ7HFbmYmcbwa5BJjYixyg9wxijrdB1RJtjLetEHk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bx0atjFawnS7oJwhR+KlxD9xNtp4Cxe53M8+y+TqgYTidorPvnWwrvMAzUjHj9pR5HMxdUJDsmF+3TIEOA17U3EQbcw17zqdP3et6z76xb7NdRExOZn3q0a+SojmbtwnMqkHMST38cZhAW+d10AHvVlGUIS3rujjkeqO4vP6zVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ut8LiR7G; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ut8LiR7G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZEGM8AEVwCZ8zqpQX0pI5stA4gCpERqTToXkRSqBqUJ6dU5YwWZJMm4ghnT/tlhw4rCblo5WlSXfbYq78nsYBybZIWzUJWl2t/itN/G3IfOj9LvEygJ5r4/JCKXRSgzGeQn2Pz3uRDRkDa560lpCHpy8J0cyGwriL37J7D7YsKghm4VgshZpNfPtfiN4q6KO5t/sD0M8ZpP48pcqr66TobsoFfQypAYXlg5ruJyol7IlvVaq0EAcaqBpoYxISqIHogGlR3n2Wsu3oZfnCsWEjKnswpgySv8nNVMZQyTEh/1rwyDth0e1HGaxApRGYNC2/xn77iKp4s/yLzL3Pxw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7UsXOXSyMr/XunPkA6q7qLryDv9IQu8IlTnivkUwiM=;
 b=UTpFZ8LjVbdMY4mvvMF/73+HWvUdRhXMo8dVgmIUBniTGyVshZ0/fp1Nm6DTySYVj9/0g1Sgs6qbUHkws7+NT6Ct06LyvztGPAuPmHLSRZr8vtz01JNAOZJjuQi5k/MN77qe5iwnEy47iMhFDA24l/8c3mC5oORZRllVu3E6+O1d0nbak2k/45HMlPBXybOnLr5+l18bhvr0vYliE+QaggYDYJw1N0nR94hHsGZ2p5+NbtTB7ScAtbbBIm7Vzjmqdw+iPbuEz/Uo+T0dKNNAylFggLDEGiMD1+ssC6tqUF5cBNA/6RvHk2lwllrYDA/6cUWSJ5YTi3SE7IZ/ACTH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7UsXOXSyMr/XunPkA6q7qLryDv9IQu8IlTnivkUwiM=;
 b=ut8LiR7GJTORqzhJr5BlJ1eBy8USiI0jtscw8GXlvD5Ij5BcrMH0AN+zCf7QdgZEwOInpk810I/J+GtUuSjg/olAHWrrRkQwGL5E8Yg3iqm2JDsmv5BcjLYURw2xzlx15OyWNLbr3jiCfKlCodA/6uheR9vK5LpjG6/F000ieIMRS7kxLLUC6yrWlTz6AJcqLLxAqu7Dhqx1FnSrFH+Cjz2meHAs6VO2pSaT5QMhQfSdwNh9jzJdBOI8YmOdQs6nBwNH7pOt5IA0kppl7f8wso6unyTm9OLhbPWIDtssklugxsmiTrGe2TbyqnYhXCPI3gUQWhhXIyK8/6SsFyPsbA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN6PR12MB8542.namprd12.prod.outlook.com (2603:10b6:208:477::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 05:25:30 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Thu, 19 Jun 2025
 05:25:30 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
CC: "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>, "mst@redhat.com"
	<mst@redhat.com>, "niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Index:
 AQHbq7cy7Mcj3ywZwU+rYtE4WxELUrPZJsIAgADFHgCAKVi30IACkmoAgAAAtsCAAArbAIAAB65ggAAY2gCAAT4eMIAC+1QAgAASUJCAAAqsgIAAA5JA
Date: Thu, 19 Jun 2025 05:25:29 +0000
Message-ID:
 <CY8PR12MB7195C2745AA7465D34E86F7CDC7DA@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <CY8PR12MB7195BE725E1871233857FE57DC7DA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250619051033.1433974-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250619051033.1433974-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN6PR12MB8542:EE_
x-ms-office365-filtering-correlation-id: 8d0ac308-8f3f-4464-3efc-08ddaef1b4c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BNvXjgXyfYT+Eg5PUHWL+x7TrWUDHkk5Jsb8dwNye0mSCVrumxpdpkGwql?=
 =?iso-8859-1?Q?YFBz97N3pNZY/AlJhp0+5EJPzI5dBsz98OT8yWuhvDh+OlgrYNc4dyYYSl?=
 =?iso-8859-1?Q?NGbPnYi18LJEtp1Ajel1137sAylhGI+wbC/nqELrKQrPXPfHtihZPJu8Rl?=
 =?iso-8859-1?Q?XUFjpjCMjDTqUPs+AY+RMpnqCp+vRrjjtJEk21nTVbAI5LjGoqPqQzBFQn?=
 =?iso-8859-1?Q?AgVtoEelV3y0+mWD2loXUHlKvQk4nnpy0kKutkzCx61AqJlNf7utJYmsRC?=
 =?iso-8859-1?Q?WiOP0Y4OsA5hQJTW3PsZZrs3kZhiXZd9you4W3kHyP8DRu8pt4E3YtG6y2?=
 =?iso-8859-1?Q?E+L+XAssShUb9fv8jicEAaGKpsDcsDPktfIlah2ZKAnYloDClapmH/sw2y?=
 =?iso-8859-1?Q?gHScJ+3w/oBAO0lM4vYml5JNY72+r6bTwGe6MDNGdU/NmbkcqnIXUYzlc0?=
 =?iso-8859-1?Q?X3wrLkzLNK5XgAWS8FoWtRX1pFalDpFD7WteS0rskm0pAQD/2M8e1o9gyU?=
 =?iso-8859-1?Q?yDVsYS4F9b2yUC/bm0Hn0NWbz5vYTCIi8H/fhK+xv/l6X3fXM4WqUzcg1/?=
 =?iso-8859-1?Q?mbU35snnN4iWULNL4+PzQm2gZYpyvQsZGFHwtszeYbDmJviGuqPKnOFG7y?=
 =?iso-8859-1?Q?d5VmTzS/p7feVn/orCT9kTj1u5oh+g/yAwA0cHVQHSYpVe/RmTzeEcU0kg?=
 =?iso-8859-1?Q?rpjAtSakVuMG5efOM8kj1TG7WfqeppXenyUr7Of336SwFnqXUuX8HbiwZt?=
 =?iso-8859-1?Q?Xmf/IBP6WKX9cJHuErRQfPkor527SLnrd60knYGgGPPHd8Lw7w5SbYE2/e?=
 =?iso-8859-1?Q?oJcifV165Dbp6BvNJeWQNk+tZeKsUHtEE0rlYgfWWCV/90ZMGzbeyxrxvC?=
 =?iso-8859-1?Q?bfzBvzTxAVz02b5bwyiX47g7F1RCTOFYx3ZEyfevgZwtS0Q4aKLO7EqkoG?=
 =?iso-8859-1?Q?+lQUxCgR58G1Hfs4PE+Qq+NziA5cat60DdJJA2H0EPecKQeamO47DhySPk?=
 =?iso-8859-1?Q?ubisFEiTuRelCHE/QuL32nK5tQoLW/0N2kZqeub+A1qaDi8nl4HJ0Nzmav?=
 =?iso-8859-1?Q?AHJ3elJB4w308wX8c5w6kWQxv0zUF+sz1M8fovnEoK4ewd2h6sa4D3ylBH?=
 =?iso-8859-1?Q?Bixb/k+c5NWMGZjVPq//rrCcKS3O8Y0j/5Z+irgkbEKozuySbA5aVQCvYw?=
 =?iso-8859-1?Q?xxBTmQX5sBqVIji88Ar/AtwLl0WgAiJzuy5mmk2uPqYVK/gxUFE0ylHsVJ?=
 =?iso-8859-1?Q?jBIWs/iSxij3qR9f3Kw4kMLyrsPGgi0ngBbD+HbVJqJA/eKkGop5GkhkR3?=
 =?iso-8859-1?Q?qov+U5kL6yg/rmTMEVPNxbhqZ+r4VgLh1V48Tr5Is9gQjyI3M/StRfjeKq?=
 =?iso-8859-1?Q?m7GXitX4qUOEon8fYBZzhr//mqVzAplCbOcnfqRTvuFc02ig2LqgeebWR3?=
 =?iso-8859-1?Q?+8VlfZkdnMz9f7m+9QJpwYzBwDVV8DFbMc13T8iL9QNVbfUJb49bpOFj1N?=
 =?iso-8859-1?Q?A8tqnjw7bt+Y6xKtKAkDTQcx6PBN/I31IWcrJVxEfAwVwcc7HjDiDHnazY?=
 =?iso-8859-1?Q?g+Rcx/c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DqYg6aniiryypidR5wwgxitMSdwsjW7OiGXpNH2gy0quH2NVLTqqjDwY9t?=
 =?iso-8859-1?Q?Tov42s7Hs/WVTlo7910Iad6mrC1YK3q/3vJ3IDUKz8hrUl6y9dZSl4Dw9q?=
 =?iso-8859-1?Q?HKVN0CjI9kikPYnruzWd6aVPj28CeugYUq1Xd9inzICKflIsKLUiz+VvUA?=
 =?iso-8859-1?Q?EBcikcLh2jb1i53mdctwKZlYIO7yfJoS4wyUBJBHoPGKzbcxwVgRTF0App?=
 =?iso-8859-1?Q?bjG+XiOb5e2ttciVZFqhCD4lSRErW55SUJ/bWsYyBaN9crwF38zN5Ef7JG?=
 =?iso-8859-1?Q?5pmB5QcMywiSF+LinicX1BoCvWr9NTPf5OqPzEs7UFAqVGPi43n/pZbopd?=
 =?iso-8859-1?Q?1q9xnCbxMRErCkoFGr4VMRhO8LC+c+ZmBYn8xYGRJCiuK0iaOeA8eWE3Xa?=
 =?iso-8859-1?Q?K9m3I83gZGLFTeWuZTZ3BGf0PMaV+SBBjjdsb4RjJM172VbnaFC7tK/Enk?=
 =?iso-8859-1?Q?jranx+9WiZ3rcXJZvGhL3pV4fXhpzbW+QLVuQAszNHDjF1blyj2zybRgvv?=
 =?iso-8859-1?Q?HI06k90L3Huq18/lyUen+Dodk/ZE8Lu1njxdsab2U0v6HUT+jlLpjnrEBm?=
 =?iso-8859-1?Q?KwoUM+QyICaDa8uxp0p/LvSsj5Az6DT1bAuFxpgNvHoO42reGHd/N4otVd?=
 =?iso-8859-1?Q?6YKx1t/aNqawzAnCsbvW6Y9KEg+6toVC4audtFl1INa4svafsGMuKPozaQ?=
 =?iso-8859-1?Q?Hvme5KmykAC7c83yWzX2XnucRX5lLBGcS5qLug1Ndr97M/78+m1sCsb2cN?=
 =?iso-8859-1?Q?50sk3slsq4jyuAwV+zV4t3PyFknboutxIKYlDDXtMbMxMXRqiUGLBq2eBz?=
 =?iso-8859-1?Q?ASO6R3cSgNTP6W8GSpt7wP3A78HY7zFvorg93TQEZ+ZCPgCcLaohiACtEk?=
 =?iso-8859-1?Q?O9tDZNJFzOdQNMeo+yW1zO1SS0y939Bgr/ZC1G0cO3xyD9C+vKtoQGY+Hq?=
 =?iso-8859-1?Q?AJGlN/8kcWtCJbFz8+tfoiIN5VPK7Pg/RdlnXr3TWKLf1JgQuNhVDc+61w?=
 =?iso-8859-1?Q?MTFZxXtOusOruqQT46ezacYm6g++VIYyeZGyzVV+JqJ2dYuh80PHvYLr9S?=
 =?iso-8859-1?Q?ShvQsup3QOG5EoYKHgrCrBQyV+7a3TqFY1LJLtZz2yHZqQ983CGF2xVgHI?=
 =?iso-8859-1?Q?xsLPVDkaH0RIMjqNALUeyNhixIGUlpRL7KAo+JwbxVpFqR4SXUGf5S0spF?=
 =?iso-8859-1?Q?Jwf4Eqg60hdVcreWNaIAXxdPIIcoudmjGA1r6J/8N0zbBMkxk2ySbDvZWR?=
 =?iso-8859-1?Q?+ptkK2anSom7un2uKF72m49LPcGfq2XCqvpMYtPux2a2bzoUAOWIRD3xr8?=
 =?iso-8859-1?Q?psBQK9GwGulG2wq+rBCY7TShMFJ2lSxNqrNJddqpdCLYf9zv7JnS2YWaai?=
 =?iso-8859-1?Q?ten8f0WpDEBKxXiTMnIvqx4gpyFHNYTk+TJS1mehrK3LpopYAvM+v4aKBn?=
 =?iso-8859-1?Q?KrPQJUhDrXjVCoPKC/j5oAVB27HIo22FRgdzKvWBi5lTMt53CuZCLl9lcZ?=
 =?iso-8859-1?Q?FmRowDSkHFPk3sKUXjrIX0AApFX1EoobJKywnZffpN9GdFJN2MXgIj7x6P?=
 =?iso-8859-1?Q?BnISk3fYxll9QP1bDCPVINfTP1w7glXZ9Dqbg5IXQL7FMiKTC13HfcIHW+?=
 =?iso-8859-1?Q?ispUjomGRs0Dg+awr/Sqg00/mVezOaMWxvKzt2TqjqXONynLdhwB6jc/TL?=
 =?iso-8859-1?Q?yfHyuRHtVdWrUvvkSRI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0ac308-8f3f-4464-3efc-08ddaef1b4c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:25:29.9024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L2PAGEK5PFNl1jiyRpIqtL4Ug8nUTNwmL85Ut45apnjLiBZJAxaLM9Uh8bKLnd1zh87NBO8TwJDa3CazeeiSHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8542


> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: 19 June 2025 10:41 AM
>=20
> > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > Sent: 19 June 2025 08:57 AM
> > >
> > > Hi Parav,
> > >
> > > Could you please take a look at the diagram in [1]?
> > >
> > > IIUC, for VM0, there are two groups, and for VM1, there is only one g=
roup.
> > > Am I right? If yes, I think the group concept is reasonable but we
> > > don't need at this time.
> > >
> > > I think the first thing is to figure out how to pick the right group.
> > >
> > > Standard socket doesn't provide a way to access the group information=
.
> > >
> > > Source and destination are from `bind()` and `connect()`,
> > > respectively. If we don't call `bind()`, only the destination is know=
n.
> > >
> > > However, only destination is not enough to find the group. For
> > > example, the well-known CIDs (e.g. 2) are valid for all groups.
> > >
> > > 1:
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
o
> > > re.kernel.org%2Fvirtio-comment%2F20250618095139.1412138-1-
> niuxuewei.
> > >
> nxw%40antgroup.com%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C9d4a
> 762f95
> > >
> 49433be00208ddaeefa4ba%7C43083d15727340c1b7db39efd9ccc17a%7C0%7
> C0%7C
> > >
> 638859066500269242%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOn
> RydWUsI
> > >
> lYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
> %
> > >
> 7C0%7C%7C%7C&sdata=3DANv4q7h1Z1Jw5AyypDRE9brIbeyt4siy4g4hiYf8Lis%3
> D&re
> > > served=3D0
> >
> > Right. Sock addressing scheme is na=EFve presently to select the group.=
 Not
> sure when/how you or others plan to do.
> > This is transport layer problem to solve (not to confuse with transport=
 =3D
> pci/mmio etc).
> >
> > However, at device level, we should have the construct of grouping.
> > Without this construct, all devices will be part of single group and on=
e will
> not be able to build the group concept later.
> > So even if you don't need it explicitly now, grouping the device is wha=
t you
> need when connect() is called.
> >
> > So I was imagining a relatively simple scheme:
> > For example, virtio device level, some kind of group id is present.
> > So two devices which has same group id, are part of single group.
> > An example group id format can be a UUID.
> >
> > And this is completely optional for devices to implement.
> > Generic enough and usable beyond just vsock device in other use cases w=
e
> discussed in past.
>=20
> Fair enough.
>=20
> @Stefano, could you please take a look at this? I'd love to have some inp=
ut
> from you.
>=20
> A brief summary of the idea is: The config space will be extended to incl=
ude a
> group id.=20
UUIDs are long even though they are read only.
And config space is readable only after feature bits are negotiated.

I didn't think enough if the driver needs to know early enough when creatin=
g the 'struct virtio_device' with two legs of virtio_pci_dev * in it.
Need some more thoughts on it.

> The devices with the same group id are considered to be in the
> same group.
>
Sounds good.
=20
> Thanks,
> Xuewei
>=20
> > >
> > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > Sent: Monday, June 16, 2025 4:26 PM
> > > > >
> > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > Sent: Monday, June 16, 2025 2:30 PM
> > > > > > >
> > > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > > Sent: Monday, June 16, 2025 1:48 PM
> > > > > > > > >
> > > > > > > > > Hi, Parav.
> > > > > > > > >
> > > > > > > > > Thanks for your detailed comments.
> > > > > > > > >
> > > > > > > > > > Hi Xuewei,
> > > > > > > > > >
> > > > > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > > > > Sent: Monday, May 19, 2025 3:08 PM
> > > > > > > > > > >
> > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Ni=
u
> wrote:
> > > > > > > > > > > > > This patch brings a new feature, called "multi
> > > > > > > > > > > > > devices", to the virtio vsock. It introduces a
> > > > > "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > > > > > > feature bit, and a "device_order" field to the
> > > > > > > > > > > > > config for the virtio
> > > > > > > vsock.
> > > > > > > > > > > > >
> > > > > > > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > > > > > > >
> > > > > > > > > > > > > Vsock is a lightweight and widely used data
> > > > > > > > > > > > > exchange mechanism between host and guest.
> > > > > > > > > >
> > > > > > > > > > Even though it is the current use, the specification
> > > > > > > > > > does not prevent its usage
> > > > > > > > > between two guests via a host.
> > > > > > > > > > So we should not assume such guest <-> host
> > > > > > > > > > communication as the only
> > > > > > > > > case to add new feature.
> > > > > > > > > >
> > > > > > > > > > For example, in the spec only must requirement is that
> > > > > > > > > > src_cid =3D=3D
> > > > > > > > > config.guest_cid.
> > > > > > > > > > Dst_cid can be anything, it need not be well known 0x2
> > > > > > > > > > (for the
> > > host).
> > > > > > > > >
> > > > > > > > > Yes.
> > > > > > > > >
> > > > > > > > > > With this flexibility in the spec, one can connect
> > > > > > > > > > vsock devices with multiple
> > > > > > > > > different backends.
> > > > > > > > > >
> > > > > > > > > > For example,
> > > > > > > > > > QEMU can insert one vsock device for VM to HV
> communication.
> > > > > > > > >
> > > > > > > > > It is also able to communicate with other devices on the
> > > > > > > > > same host,
> > > i.e.
> > > > > > > > > VM-to-VM.
> > > > > > > > >
> > > > > > > > > > A real PCI device can insert one voscket device for
> > > > > > > > > > VM-to-VM
> > > > > > > > > communication bypassing a full TCP/IP stack.
> > > > > > > > >
> > > > > > > > > AFAIK, all devices are implemented in software. Is it a
> > > > > > > > > real PCI HW
> > > device?
> > > > > > > > >
> > > > > > > > Yes. virto PCI devices are implemented as hw or as vdpa
> > > > > > > > for many years now by
> > > > > > > cloud operators and by NIC vendors.
> > > > > > >
> > > > > > > Thanks for your confirmation.
> > > > > > >
> > > > > > > > > > This means there are two different backends.
> > > > > > > > > > And these two devices should not be grouped in the use
> > > > > > > > > > case you
> > > > > > > described.
> > > > > > > > >
> > > > > > > > > I think one group is enough for all use cases. It is
> > > > > > > > > required that CIDs are unique in global, i.e. all backend=
s.
> > > > > > > > >
> > > > > > > > > As your example, let me assume there are two VMs
> > > > > > > > >
> > > > > > > > > 1. VM0 (two vsock backends)
> > > > > > > > >     1.1 device0 (cid=3D3, default), backend is host kerne=
l (vhost-
> vsock);
> > > > > > > > >     1.2 device1 (cid=3D4), backend is HV (virtio-vsock).
> > > > > > > > > 2. VM1
> > > > > > > > >     2.1 device2 (cid=3D5, default), backend is host kerne=
l (vhost-
> vsock).
> > > > > > > > >
> > > > > > > > > The device0 is able to do VM0-HOST (src_cid=3D3,
> > > > > > > > > dst_cid=3D2) and
> > > > > > > > > VM0-VM1 (src_cid=3D3, dst_cid=3D5) communicatation, while
> > > > > > > > > the
> > > > > > > > > device1 is only able to do VM0-HV (src_cid=3D4, dst_cid=
=3D2)
> > > > > communicatation.
> > > > > > > > >
> > > > > > > > In example 1.1 and 1.2 no devices are grouped.
> > > > > > > > Your proposal of this patch wants to group the two devices
> > > > > > > > and pick one of
> > > > > > > them as default device.
> > > > > > >
> > > > > > > Yes. I just wonder if it is possible to have more than one
> > > > > > > groups in one
> > > guest?
> > > > > > >
> > > > > > For example
> > > > > > Group_1: two devices dev0 and dev1, implemented as PCI HW
> devices.
> > > > > > Group_2: two devices by QEMU SW implemented as sw backend.
> > > > > >
> > > > > > All the 4 devices has _F bit indicating they can be grouped.
> > > > > > But there is no indication that they are part of which group.
> > > > > > And hence the guest VM driver is in dark on how to forward
> > > > > > requests without
> > > > > the bind() call.
> > > > >
> > > > > I see. Thanks!
> > > > >
> > > > > My idea is that there is only one default device, no matter how
> > > > > many types of backends are. If the users intend to use other
> > > > > devices, `bind()` call
> > > is required.
> > > > >
> > > > > For example, we set `dev0` as the default device:
> > > > >
> > > > > 1. Do not call `bind()`: use dev0; 2. Call `bind(${dev0_cid})`:
> > > > > use dev1; ...
> > > > > 5. Call `bind(${dev4_cid})`: use dev4;
> > > > >
> > > > > Even though we introduce the group concept, if we don't call
> > > > > `bind()`, how does driver know which group to use? If the driver
> > > > > recoginizes the dst_cid, it can use the group to find the
> > > > > device, then the things will be complicated. The driver needs to
> > > > > know the
> > > relationship between the dst_cid and the group.
> > > > >
> > > > Based on the dst_cid picking the right vscock group would be
> > > > needed. This
> > > is vsock level issue at driver level.
> > > > Driver would need enough hints or encoding or of dst_cid or
> > > > something
> > > else.
> > > >
> > > > So even though we miss vsock level construct, it should be the
> > > > reason to not
> > > group the devices.
> > > > As both attempt to solve issue at different level.
> > > >
> > > > > WDYT?
> > > > >
> > > > > Thanks,
> > > > > Xuewei
> > > > >
> > > > > > > > If device0 and device1 are inserted to the VM0 with the
> > > > > > > > feature bit you
> > > > > > > suggested, the guest things that they are part of the same gr=
oup.
> > > > > > >
> > > > > > > In this patch, we don't allow to insert devices without the
> > > > > > > feature bit if there are already devices with the feature bit=
.
> > > > > > >
> > > > > > In above example of two groups, all the 4 devices spread
> > > > > > across two groups has
> > > > > the feature bit set.
> > > > > > Yet, they cannot be grouped correctly.
> > > > > > Driver driving blind thinks that all 4 devices are part of the =
same
> group.
> > > > > >
> > > > > > > As a result, there can be either multiple devices with the
> > > > > > > feature bit or just a single device.
> > > > > > >
> > > > > >
> > > > > > > > When bind() call is not done, host sw does not know which
> > > > > > > > device to pick up
> > > > > > > between device0 and device1 when binding the devices.
> > > > > > >
> > > > > > > Are you referring to an vsock application on the host? If
> > > > > > > yes, "host sw" is able to pick up one device according to
> > > > > > > the dst cid. For example, pick up
> > > > > > > device0 if `connect(3)` is called.
> > > > > > >
> > > > > > > Please be aware that the "host sw" can not pick up device1,
> > > > > > > since its device is not in the host kernel.
> > > > > > >
> > > > > > > > > In a word, a tuple identifies a connection.
> > > > > > > > >
> > > > > > > > > "Refuse to connect" will be raised if the device1
> > > > > > > > > attempts to connect to the device2. "They are not in the =
same
> group"
> > > > > > > > > is a reasonable
> > > > > > > explaination.
> > > > > > > > > Am I right?
> > > > > > > > >
> > > > > > > > During bind call, one needs to select the device when the
> > > > > > > > devices are coming
> > > > > > > from multiple different backends.
> > > > > > >
> > > > > > > Yes.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Xuewei
