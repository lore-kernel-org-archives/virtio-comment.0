Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8761A0728
	for <virtio-comment@lists.linux.dev>; Mon, 30 Dec 2024 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735553670; cv=fail; b=AX+UMltuUWlUe1w5tG+EvUDut5wwv1iQoc2zvq30k5NmkL+o7hPWerfasp4NbuXObk2+tFwiVM37hOWT+/hx/+N18k1oxu5POZraAU07s/0jTXvtViJM64RQCEC5Of/JfZoxjTSvrnpJofztkQLaGY42XUammXfsxrqd+zNWZ6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735553670; c=relaxed/simple;
	bh=k/b0KC8Rs+x4EJpzQmwiwJARnzLVle78Gr5zBLKJLZ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A0JwVcyQbekJOm+qcW5ljb77zyHxooKVutuBrAXtIi3Mu5GaLkaWRJp1wxGXvqCB3pnU8zyk28darY9A3EfXEPG6NUPL4kD/o9xLOjK8lHfAKGT3FS/nr32FwAx92I5O7MUpG3hAnKCqlwQ5dOxhZmS6ykaKyLdBQVaHXJZd0JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ib94XhqV; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ib94XhqV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jfh6T4EaVzjqH51FnZ+daCpRWNm/XWju3tpCWDXIECdD0/k3O2pKifteBIqiBxdTLopsV1eIr6/1SThxJII9X5AW+njnf5eP/bafXl76OwggsykcfLAx7Ybo0bUOlnYEXsrqcJ/4SQa6op8+JPNYJ6e+IjFYR5JuaOwtCJqPh3nKJ6GPfNk1SsFW/sWsOv8R3XnDowsGvrZWJPDKjTjb3BM4CB9wsLW3p8uupOoyJ2IwxhFRni2ZUzxFR6uCg8rlwcqxcQN5AXTfiTTRShoCjQQOBajyILlJ4Mzl3cysFIMMBc6NubxH97qXIUs2ptMjJX1PmalzunnhflF+iZHzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/b0KC8Rs+x4EJpzQmwiwJARnzLVle78Gr5zBLKJLZ0=;
 b=hiGcMDfij/3kK3su0R6NkHT9nMayGaVTqnbTwpYL0k1VWq5Y/tD0tFDX+25Z9OPAyYpvYh4YJF+zjLVz6eGBQKP/LWXPGTI6zFG1k7jc/1IQq6AvkauEyNF7BDtK3ZbLbXipblqNBWBV0KZcY2uqIfG886KPHK+DlygVACSTz2MupBgZD61wh0/0xVzoIGmYpUhDrIsK/rsLmsnacD1Bw6G3uZNarCxyS/pkP3fhSZZUIa2kAySteZA6nluQSCws3ALKmrxUIICEAhQ1Us4iX3hvY9N2N5xvf5BYw8wvdMclDaRYVniNh9NTAzhVJ1xf2eP8Z+1EhSfjBglqoalosA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/b0KC8Rs+x4EJpzQmwiwJARnzLVle78Gr5zBLKJLZ0=;
 b=ib94XhqVJHZ5iVFgmlCrHa2WG4irzidJmxwYv/W8lLQtOYSy0FHVlH1NbozLmB66RVzXILMBO9RvpMXJbD4zDQABhmIO1nS30+E8D/t5/fdBlRFjzbsrMovsH+92MMrNAovDb93gzxgAqX4xz9dlO4D9F6qQBkciBVrmRPBPrgSgO6vFclw91lP6b7PVFE7UPsYQ/5HOSqhbQNNhC1YI7dsSiY0J+Q5oNgtx8h8eMYTVk6yXT9Nk4zowJdE5TYdjrml5IYmbjsLMsYdRivpK/Rxuc5P/PZKdUty+jvYehNIiIGMKd1OUabTzMtvY+LjFEJ+86mWEvoE6nV9qo2zujQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB7498.namprd12.prod.outlook.com (2603:10b6:610:143::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.16; Mon, 30 Dec
 2024 10:14:22 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 10:14:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
CC: "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>, "mst@redhat.com"
	<mst@redhat.com>, "niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v5] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v5] virtio-vsock: Add support for multi devices
Thread-Index: AQHbJeOUaqXq2o8qzUO1VqAKj4wkMLKZX2BAgD4S0gCAJ4OugIAABWFA
Date: Mon, 30 Dec 2024 10:14:22 +0000
Message-ID:
 <CY8PR12MB71958AF72E475E92236D15B6DC092@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241205062908.4193685-1-niuxuewei.nxw@antgroup.com>
 <20241230095433.830924-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20241230095433.830924-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB7498:EE_
x-ms-office365-filtering-correlation-id: eddf7b87-3481-4f8a-4d9a-08dd28babb1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lX48StoCUj1oLlvYTMzBV6M6Db3/WKWmF/zpAVRz1Y72SUB7HUUTY8Q+mEfC?=
 =?us-ascii?Q?d40P/dsm233YhFctKAPL05tUSLi757AIq0wdt/NAEdUIJY0GQqfD9081guKs?=
 =?us-ascii?Q?aHIQwBJNEe8Qm+Vi/UJNtpSCWajUZvPcho4H+lCkK2PwxmZKBpvjmsWl/Kxg?=
 =?us-ascii?Q?TwJzoNgaQ7AN0NEjxPfTkgVKYZCElbQGgwZTB1nNEVA8JQ82fap4J2+pzE4W?=
 =?us-ascii?Q?8FZ7h76YboKKZ0imWLh4RUU1pbSIMwkSng7zrUVf9lBy/Ouxf/94LUkcyxuL?=
 =?us-ascii?Q?9Xt9/Zj8dQuaPrAn8+jQZ29ifHRdrV+pgBRy/dwBUqPCw33v/LRL97mVmwPq?=
 =?us-ascii?Q?Hzhfvus0czV2go5K4R+z3pb2CALkkk9NJhtO/KpCf7VJbYolfzulsiDJs6jC?=
 =?us-ascii?Q?t9JwED9ZwitBJSbQq8lt3QjjVPs6RYq/LOsMtciecyeoTr4BkyAEQZEaCKad?=
 =?us-ascii?Q?w8UW7634jKDRi9Fp+QHHoSSpvbofnNCgjHQK7ZQQ58L/40A7eRPVTfV780n+?=
 =?us-ascii?Q?ZWlqujeT8JKDCZBR48OpkmspRZLcKDQS9dYaAZNrCMDFWO7R68xf5bbjcg9y?=
 =?us-ascii?Q?rAT9QaPLDELXW9ioXGr2zsSV5PdxI0HQ8p7KBLl48LaYM/ruR+zXgZG+bqyL?=
 =?us-ascii?Q?a7BtbWM2E/bLBL4hojKOWQrss7ds6Bsjwte4uzuADXqOVBTkEAstvSQiDarN?=
 =?us-ascii?Q?d6eiMfHUO+w1Z8uUiVkKVfQB+Y5YjQgPT9tXb5BCC+CqiVi5uiHhIh2T9cNF?=
 =?us-ascii?Q?HagFzFBGn0KKq2qQNhxapbK3aDarh+tMCw5wDLwSDnlG893+YOH2tm4trY4G?=
 =?us-ascii?Q?Foi82W3OMloiT/Ugw1BJTI5QRAcPnsrc8f7CYGGSuuMECwfpj8wLGvSfiDxj?=
 =?us-ascii?Q?RvRlO3uIUguKTFZ2qoFxzlxBItASY2eoufuOrVSZ4STAMUT5jZbOANCvt9kB?=
 =?us-ascii?Q?vaRVvI9mvq6sSq2YhAemzap7y5Ty/6/mFqO1SqELtBxbTsnPLa5vORgVZTFI?=
 =?us-ascii?Q?cJoJjaXAH/i+N/ATNZmx4IMSKYtRcjeEQtoilzkMM1b3QVcDpD09uX34KdQH?=
 =?us-ascii?Q?8UKxlTrfA8GtozIepRKyNK4+7WLojOcTV1Etv4eh5h4PgCxby4T10f6z737m?=
 =?us-ascii?Q?eRJTh5V391RaZ43VSoGEtmTys6w9logIL59xeNrzmiQ764FsLDWAuUl5mg/z?=
 =?us-ascii?Q?5NrhmCqLhzWREPAaIE2UhBcRR6Yy3BUy/Pj4bryq8xSSTQkgxj6im9Xl65SR?=
 =?us-ascii?Q?uGYSuGSXiNyZPb8lCdkLemszfb1hFcYDEcfrGG1snjyzuxhAWpmTPxz8oCBd?=
 =?us-ascii?Q?Lugx9mNet6qPbL8plk7bdZKccgrfTkI3KCAhgjliaL1BCeD00vSopFc45OOn?=
 =?us-ascii?Q?LpE1Jwh6qCL3MLn6hJIk2fXeTOy1X2cv9Cy3z4o0W1Ncy1Qhyi3E808NBGbC?=
 =?us-ascii?Q?G1e6P8i1fNiLQtWjYlPiJ8UYaM9kztVC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MwpnCAecDFm/WEcZg/i0Wo6dtr34MHTqAYfU/gIfZo3bTAPRWf+V75vzmDDe?=
 =?us-ascii?Q?x9YTnJh4P0NZpOG08xRm91PhGLkPcnsOtBYC9/4csPiBSXisPCoTd94otgnx?=
 =?us-ascii?Q?8yjbXuoFSRmoaurpSx9bPRsrX9hiXBJuSV/sHMyNdscmGOOOmS6WkJh1Tcdi?=
 =?us-ascii?Q?CI+MGtEmbhgdw9ZmLL90pqgBC9gsCX5aXnenpm41BxKtOQjJQgoK2EYY9AUg?=
 =?us-ascii?Q?a8ozNWueGfFGQxnD3UnsRR+3yrZSkheTDSKEF8HJRSW+3H/HJ53yFvwYl/b1?=
 =?us-ascii?Q?iXuP5Hii0ov1ESyXEtjyE7gXhgoEiEuHT2lyh3mkbL17pZzIcKR4ne1EbsWc?=
 =?us-ascii?Q?eL+k3QMGzYD/DfGqS9RaSuK5KEjhsTwkt/4Vt0vqBRJEj3RSjYR6AYtKFosP?=
 =?us-ascii?Q?qEafjHy6dSJgfypmQ/2vh8UZbSrsk+fxS9SfIN873+Fy4vyQyy8+9NjiFK2j?=
 =?us-ascii?Q?W/hz2e3xgmM29MieltqYHcGqCJDmCecOjRvyu0G+RCXh4Y1hhB3G0UBqNRIb?=
 =?us-ascii?Q?mLtc6q9ZZIxG8hZJ1wfHYMjmi+lbK8GRJM0xlxQblk7rh0JCn7SY9SFxAJrd?=
 =?us-ascii?Q?VgFfZ2XI+7PxAiXXxPvl4pQn3LF1ggAjyC/pUUAgI630ekBL30zugN7RKemS?=
 =?us-ascii?Q?/ntrigBVuY5R1lJbNSW5GZq60Fzb8/Mly2dW9L4RkuY+zCUb8TTSJJ7LBX0I?=
 =?us-ascii?Q?onaQzZAm6d8xcwtHmZywoo1h6xvBZEe/5f6nWRJlM6HeJVWGDw++XlPXhfca?=
 =?us-ascii?Q?hqKDfnKpLqr7Om2rOLp5QsnWQGoN1q2y5oDbsRLNqXF6N1NoocDTwSlBloop?=
 =?us-ascii?Q?wxHp9KiXw/8Gw/cCczUdm7lo9H3PkJsCUH94wU9Gc06Cc74jWn4uVt2kIBlY?=
 =?us-ascii?Q?/w+3ATASoCxHG8yoCgVWTyIkuUvcfRzJk5g5OH4HJTcLSCtnAOfsElKAfm9a?=
 =?us-ascii?Q?vhnLpFEN2qea0m4MVjkjMoYPNQGL8S8NSvg4WgtIVptqGqT46CkglbSV8TOa?=
 =?us-ascii?Q?aW/YUn8hox7YKANp+5GBH9TjPhbqvrnyTNkw4fY4TT8pXV14zTGliFeIxowk?=
 =?us-ascii?Q?mu68dTntW8BFx5Dlg8V681WPuE0YX72PNMP7uDfk3zrWA5mBFlOSDEGZKayK?=
 =?us-ascii?Q?P5VwijAVfZtpm9L5kIS3VxYCYI75yU9Z/SBxoastq2K9M1qOFOSaoXmgJklX?=
 =?us-ascii?Q?NopM2B4HhEApBAW+2nqP368jCPsc61YVULd+ypWDcHvRj9uDoYHJrk7KY+Ss?=
 =?us-ascii?Q?tI2+Rzks4eauZEckjmMg8zsYh0GKQjmwXO8/Di5tt5/zN9B/fBq603lCBsdB?=
 =?us-ascii?Q?Qr84Q3xtvKGium9H2efsAmwFmjN7ziHBY0JZyVfGYQiVNDuiSY9xe94Q2J3R?=
 =?us-ascii?Q?QTBI0skKSIansf5/ej4JEZ5jeJFCBy55v7j0w4BH/ZM/iA3VfJUt0Tuajj5d?=
 =?us-ascii?Q?jQ1BaEa/goH2kzuHH7/DKE+3F9nHDVKGQbRw/7JnxEQBhNqpLd+MPQAbzq8C?=
 =?us-ascii?Q?5//BRYhGBJ0jLH2raDgXB0KlCZEtzn51E6WpnwEiETASt2viaFUiw9ov0jI8?=
 =?us-ascii?Q?DWPI+QRB/ERJdfjlGbA=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eddf7b87-3481-4f8a-4d9a-08dd28babb1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 10:14:22.4561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IP5oSHv1sM6IA5bRCe4rbgED7ywOUFp9o8igaGDtTWEbQf3ym4JKG0gj6oBpL25p5rEvrzXr7MVo43FJgi59Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7498


> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: Monday, December 30, 2024 3:25 PM
>=20
> Ping Parav. I'd appreciate it if you can give me some feedback on this.
>=20
Sorry for the late response.
Catching up on many emails.
Will reply today.

> Thanks,
> Xuewei
