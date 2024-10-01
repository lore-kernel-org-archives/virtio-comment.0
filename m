Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A112119D096
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 09:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773975; cv=fail; b=Am+ZG8+4S7lr3iRqXBgRU6EA3k6up2s6rShU5tjGLwiji0O3jXBbp/Hi8Chx6yGeDtd5DsUjOV94x/CjIZLEblOvKM2WPi5UV3onG6jtZW1/Wf9IgFCQ+FNUVgn+jTHz4ir0cA4HpU71bGlFWbEj/2HUWf4AbS3dOa+whGkOnyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773975; c=relaxed/simple;
	bh=AMAsrULJLfYLIIKYlDgpV1BjEDxXrb6kwQci1c+eMMQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ADMqwPkxtc347FydfJ6TGrwzDotiYIzZs4sx2d0yiPE4yP8yH2uxrhyjQ+NLqP3Q+77UQYCtbtvjxJCGsFwGbFTlkGCiJ+uNrx4J0qgBUrVyI/mkjX8wBrjdCun/UPFqkn1JsaHsA5P33Ug8KucBXYDlKlogqGg2E8mn8r36BZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FWEEDG//; arc=fail smtp.client-ip=40.107.100.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FWEEDG//"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF+NOTVL6apcCKN+bHTQIqrID6Tb+Po7GWEVns2NmUhxy0wBOc+ZDErYoUPdfvvKUSm+629p3hqu8qbzQgQzmTV24cWTdvCWrmsS8w2j0U4odETyNCR3nOXluAJ6AuATMQtPM18YOfq9UdBDU5Rr6fYOdyTLff2nI5gkvl2QYVfUv1JCIRNWZm/nJ8JxYR/f+FyfBnkFNjhseNDee0KS4d/rsZgYq2lBKlP0QYkJxR6tHxB7WA+TO0JLxXoKyz9gDJCa1LKE/u+C0yamTvDwQfvcl+yHxsJ2xsjdY73dxbH0hg2dk9k5dPi118EcCtLdXXvu19Rbyt8JYW068VOsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMAsrULJLfYLIIKYlDgpV1BjEDxXrb6kwQci1c+eMMQ=;
 b=jvsdyFICIcMFADpysjZTBnwsu66B4Wi8B6YEomRLFPKN9gsGEAp4lcJjkKvtDYyWTrer8zfZcLef74fFrWPKnHEnS0KI9hQqyhuzHIi7lTNesexjqplyJYm7xR4696E+gH+YsKimG4/n2nDwPRTeLlBzPReIVFDYdcRFmU1mXKYu8TzpGJuDfWNNjJw1im+RuKAtiMr/eC9veuu9UFVCelV3mHuT3aDc5JsXz2hKsgnHUX/BnIEdSL4A9X793OrMDAHArPMfGV63zBL259yVpu+fLTIKXXGGIgOf/tVlyhvI430PuheA3PsuogZltfrUuhQkgcPb24ZHxElLyD/YnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMAsrULJLfYLIIKYlDgpV1BjEDxXrb6kwQci1c+eMMQ=;
 b=FWEEDG//msXadj6cIZj8GjE4Zyh+4DLdHWet4FSuSKiLaumEZzEqPv4W3eKFo5UzVQ0JTz6VUPil70FcfoR2ruFefFTMmj075k7gi8hc+5hFphzSTiMq16726Sf6ollthEB1uHzN/cPlBmmZujZ2MPrPmzYGlHU3RrDLx1RdlbzG8gRw7psEZocJWBqh2d75ZsvFbNfZt8mndtPGDfMpCbxpEIH9uitBtCPoN0qatltddLO45883uDbyaXThLYMFqI3GzYoKKIuDzeTAT8ei3+jUwG7sWwxrL4nuPBXfGxacksb7xx2pAxGyMz2Q9C+yv4ol2mA3GSvsZ88sWOGG8w==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by PH0PR12MB7813.namprd12.prod.outlook.com (2603:10b6:510:286::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 09:12:47 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 09:12:47 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Albert Esteve <aesteve@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"aiswarya.cyriac@opensynergy.com" <aiswarya.cyriac@opensynergy.com>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index: AQHbACulN7OJ8hVWBUuunhxN0rzrwbJoLecAgAmAf7CAAAvJUIAAA7uAgAAFCAA=
Date: Tue, 1 Oct 2024 09:12:47 +0000
Message-ID:
 <IA0PR12MB8713117B5F5C8996DA2D7B8DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <87ikucrysk.fsf@redhat.com>
In-Reply-To: <87ikucrysk.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|PH0PR12MB7813:EE_
x-ms-office365-filtering-correlation-id: eb2110c9-3110-4262-42a6-08dce1f93779
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SUJMeFZDQi9NZ2xXNUhVcjFnOTBaaU56VThGTnJNTmVIRCtHRHZGa3IwLzhV?=
 =?utf-8?B?VWc3YkkzQ3owZ3F2QmUvSFhqWVN6K1paM3F4aS9YaFFYekwzL0RrbGxvWVVo?=
 =?utf-8?B?cUJEYTZ2dCtRS3RnczJEYXp4WTI2Q3hjdXorQTk0YlVzVnphYkRhNWk3all4?=
 =?utf-8?B?ZTZ6OEs0NnhVT2gweEw1Tm9YOWlqZzdwTGovcXgxelg5UzV2TW9IVUJMY21E?=
 =?utf-8?B?RVFKYW1WalRtMkc1dkJUNFFoZE4vcUR6ZU83OXNQTVZqYTRyekdRbzY5QnlI?=
 =?utf-8?B?ejYrbkJMMk1pek96VzNBS1dzZHk0WHNmRjZ2TUlJWU1YdS9LS3Jka0hCU2hh?=
 =?utf-8?B?QUxUN1FleElDMXNZUXgvSUFkQTluVXZURU5OTlE2MFhEdXNjNm44d25lOWdv?=
 =?utf-8?B?ZmhQbkpCOFRGeFIwUUJTMWdrSE42dzRvUjdBUVhFQlFQVDJ0UjlVNjJSeDgv?=
 =?utf-8?B?VFY2R252bTNXRUUyT3VtN2pvVjRrbmFMSGFlYkJoOVBWckUzNUo0M2M4U1Jn?=
 =?utf-8?B?Nm1PU3dMaGZldlZ2ZFVmbXBENXhQVU9NU0M1WE4xWis4MGpaRFJBUW1QQThj?=
 =?utf-8?B?S1NnTDlScWRCamhpRHdXUDJsMFo3dENjMWx5N3ZlUHpvcWpCdnlkUFZXc3Bh?=
 =?utf-8?B?RWUydTBoSkZMK0NCaWUyOTZ5ankyNVMyZEY1UDhIR252WVBaVmtZMWZUOTlz?=
 =?utf-8?B?NHNYYlFxSjJuNmhjU3lHZ2Z6QUczMVFNWWhJZDRyVGNrSWl4TGNmMnNQcDZK?=
 =?utf-8?B?OWhSYmRSYTlMdldRR3QrM09ScEUzU25YaHk5bUI1d3lhRU1DYVhhZEdiUERE?=
 =?utf-8?B?Z2Jpb3o1RlN1WVZyWnRZQzMyeXRKcFBEQ2dESUxFRzZtd1kyRWpQTVZVeWtP?=
 =?utf-8?B?YTR0Z1FGTStzM2taMGRPd3NueE5NdnRmQlh1VFZ3WCtUb3M4ZXYvZG1JQjF6?=
 =?utf-8?B?S2xmQnJrNnZYWjhOSEd5SHRCV211ejY3K2dlL1F0T3ROck9FWE96bloyQlZO?=
 =?utf-8?B?WE16dTBWbDdpMzlJMkxmcjlhdDV1REh2TFhOaGZrQ24rajhyRFc3eEx5QjFn?=
 =?utf-8?B?eEpTekFhZmtLNi94eHRQSDBDMGpyYkE1YjZoblBzWTlHeUY1c0lIQ0FiU2ZC?=
 =?utf-8?B?VXBySElleUdxSzZIV3FOUDNFV3F6VFUwYXJ5a2JocFc0YzRXeXk1UEdydkRy?=
 =?utf-8?B?NWZnalpmaVNNVm5FQUJoZ0lPQkNKd0JFRmx4TGNWVjJiWmpKVDZUa3pLY1BG?=
 =?utf-8?B?enFpZC82Q3kwRU1VTmtqS2NYeVFZZkdIZEkzbnlWeFpZT3dJWEl6Rm9ORVgz?=
 =?utf-8?B?Lzd4R1ZiZWROQXdSVkI4a3hpd1lhajZyU0xWWUU1SHl0SDJiY3Y3aEYwT0Iw?=
 =?utf-8?B?bVZSZUx1V3B1QkE2eEx0cEZBckp0UTlESWRJc2d2UHJMK0xsaTJucFZ6R3hx?=
 =?utf-8?B?RnhTNjBuM3kyYTlPNHozWFVVdGp0VU8rRzVKZERRL005QzYxWVZlYXVJd1dp?=
 =?utf-8?B?elh1SC9kak5CdkFxK2JReE1OVUFxbklKdlhZRnVTU2RmV3pqaHZoZVpWdTRP?=
 =?utf-8?B?emV6UGZpZ3Z6eVUwNEltNVMwQUhvbWp0amxyYzEvWjFVZW1UUzhoZUZSQ1RJ?=
 =?utf-8?B?MVlVWE90RGhscW9OOVFLNFJDK3Z1YUhuRytTZ0o5ZHZ6Y21WRjluZkRqaTlQ?=
 =?utf-8?B?dDc4cHdaOTR0dFQ4dGM5eW9mSGd2RVlHRDBRTDQzb3dBMGJCQ1VmN2U2YjdC?=
 =?utf-8?B?TC8zUTF5anh6dWZaL0x0eWdkR0IzaE03cW9BQzM0YmRuM21SVmVVVC9LMDZS?=
 =?utf-8?B?THlQV0l6Q3dMUmlyS2lTQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFpVOEUvdHVOanFReTY5ZUpnQjVGZUdTeTFDZG9ZS3hTaUFQRDRsbU9UY2JL?=
 =?utf-8?B?WkhSQjdNdEk1V1R1c2hOV05IcHN6L1dEaGVwcEk4cFE0VCtXN2lQbU9OUnRF?=
 =?utf-8?B?cktZNE9ZaGFSYkVLRFR0WEtIMHBrT2I3NHMzME1wdWJMbHk4WlZ0NGtrMyta?=
 =?utf-8?B?QXVkK0x6R24raFRTTzA2cFlHSEN5UUF4UThsanJzaTVqZWx2Rk9sdVJlenJ4?=
 =?utf-8?B?TmRyT0JhTksvYUlaOGk3Vi9oUHNldk9ZTHZOOEJ1anNNQTJXRkMybHNpeEU0?=
 =?utf-8?B?c01GbUNwVFlxUEVZUlZTMEREMlVsMFdFMjdzdjZycThkZmtHbHJsL3hUcVd2?=
 =?utf-8?B?RlVKNmYwNXJiTlRwWmF2QWZGUlU4Z2FqQkJqNGZHK2lKN2IrZFhBMDBkcENx?=
 =?utf-8?B?OGVNTTdCT1J0WnB0YmFVSjllQm5vcDlHMDdTRXQ5b29iWFV0ZmxPNEl3RXE0?=
 =?utf-8?B?b3BWaUdlRUpqRkh4bngyc1dyQ0MzSlZwOGkrLzR1czlHTjVkMGpETlpVL21y?=
 =?utf-8?B?N05Mbi9JZDF0VWt4Tlh3a2xILzg3RXF2aG50Nm1OYkRnYVBPS01yRFMxK0Mv?=
 =?utf-8?B?d1M2eG91dGkwRXBqeXowZE1HQkJhZlYwa2owRFY1WlREMW5oQUY0Y1pCNHh4?=
 =?utf-8?B?U2sxUllQMUgyZHlPRzUzMUo5Q1hNaE5HOE1LSGlXNy9mdkhYMmRkSjBNVWNT?=
 =?utf-8?B?MDRpdEM1N2ZzVFlBYkRCaGxNTlQyQjZlUjhpaWI0ZkVLWDZJekt0ZG5Zaks5?=
 =?utf-8?B?d0ZQOVlXTFJ6ODIyeVQrcktWM1A2TEFtVThLUXVYNWtjR3IvVXErY3o3akls?=
 =?utf-8?B?WExscmN4SzhhNHBNUmRBa3lRYlF4NTlxQWU2OVZyTitPOFJFdmtvNWdqSERw?=
 =?utf-8?B?YWxvYmhqbXZyYi9Bd0JEL2tnMllybWM4N2RTNEJLa2JtUHkvOFF0UmZ1NXlh?=
 =?utf-8?B?Mm1maVcrVGJHcFVjZlpWbEN3ejdnUDgrNnlFTGIwQVRzeUhyNVBITDI5bStT?=
 =?utf-8?B?M1BzNXZoUkphNU9ZUlgyWHpvam9lb1N5YVp6OEVkRmxqZVI1ampjMHJDdnZE?=
 =?utf-8?B?YXhaT0pyZHR2eUs5OUgrc0Y1di9WTHZ5TEtWNUliaWJ2Y21iVjNWVThkdTRz?=
 =?utf-8?B?cFVWWXRmYVlQalFSYTVaVFdONHVlVXdRdUU3S3BlMTk1Qlk0Z1hDdnBiWGtF?=
 =?utf-8?B?cDJKT0FBZzBKQ2ErZXp3aDFvNzJqUm1kZTRHcWY2dGI2T09TeEY4ZkgzaUlU?=
 =?utf-8?B?UmFJamx0OW9jL2JxYTZ1N000RHZETTMxMVZnOGxZNzRwVkNiRjJ3bFFrMUQy?=
 =?utf-8?B?S0RsaDNwbmQwTExsL2Z3bk94bkp2Z3VkSzZMWS9WODYxTEcxUUxZTVg1MVE2?=
 =?utf-8?B?ZU0yZ2NUQXpidUVYcFBHM2tOdjRpSDNkazc5S0xpYVFwZXh2YXdHY3FPR2N1?=
 =?utf-8?B?b3lOeTRtaUpOU0JTUUFtTnhRbTBXdmpObk41UEZMZnRvZkZkTFdQK2tuZ0h6?=
 =?utf-8?B?NTJMUUtKcWxQaFZjdTlWY2xCanFJNkdjdmtYaUlhVUloMnQ1WlVaOXQ2ZGNQ?=
 =?utf-8?B?enFKaVFheXU1SE02bndaWStGWWJzY2xsa0I5aEkvRzF3RjNvc21kVGVQbmlU?=
 =?utf-8?B?dlBLcGRaWVBvc25WeWtzdjZ4K1QzR0Z0S1Q0N0tBN1U1MFJiZVpLcWVpYWk4?=
 =?utf-8?B?bnpSN3pXZGxTMzNXN0tKYitPY3ExaGZic2xtR1k1K0xJdk9LK2hZU3d3cld2?=
 =?utf-8?B?WEtLNFMxdXlKRm5rSzR4eVNNcG9HK2ZmQmc0MWxQKzQ1Y3dsdnVDaUp2VDA2?=
 =?utf-8?B?RjBqU2RCYW1OTm8zbXkxM2llaUQ2TTBoa0lONlpNbjJJZklCMStWdmZqUFB6?=
 =?utf-8?B?WEcycDNVaEh4TmY4c0YxNjBXT1FKckI0aGxIdnkwYUFTcnlDZDZaRU9CU3Vt?=
 =?utf-8?B?dlU3QVdjSzE2dzR0N3pYb3NYZnRDSXdUdDBnNnRhWW9KWUNiYm11SXJRMS9l?=
 =?utf-8?B?Y3hLSHJtVEhGS3hKaVhaYXc3ZTY4bnVMZ0w1RFBwRHF0TGgvcXRFSEhma2Q5?=
 =?utf-8?B?S2pNUU5xY3pZSW1ucUNHRDI0Qm5sRjZoeWJidU1FYU1CRFU3SE1EeUdWR0tK?=
 =?utf-8?Q?71C4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2110c9-3110-4262-42a6-08dce1f93779
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 09:12:47.3239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxwnVKdrXd1fx6y72vOyXx4tnQwuAJcGk2lOJeePtyLlMoWakADbltCd2gTT0X3ubKdEpzIZJIKnOG91tk9yeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7813

DQo+IEZyb206IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBPY3RvYmVyIDEsIDIwMjQgMjoyMiBQTQ0KPiANCj4gT24gVHVlLCBPY3QgMDEgMjAyNCwg
UGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+ID4+IEZyb206IFBh
cmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgT2N0b2Jl
ciAxLCAyMDI0IDE6MzUgUE0NCj4gPj4gVG86IEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0
LmNvbT47DQo+ID4+IHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldjsgYWlzd2FyeWEuY3ly
aWFjQG9wZW5zeW5lcmd5LmNvbQ0KPiA+PiBDYzogYWNvdXJib3RAY2hyb21pdW0ub3JnDQo+ID4+
IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNdIGNvbnRlbnQ6IFJlc2VydmUgSUQgZm9yIG1lZGlhIGRl
dmljZQ0KPiA+Pg0KPiA+PiBIaSBBbGJlcnQsDQo+ID4+DQo+ID4+IEZyb206IEFsYmVydCBFc3Rl
dmUgPGFlc3RldmVAcmVkaGF0LmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIg
MjUsIDIwMjQgMTI6MjAgUE0NCj4gPj4NCj4gPj4NCj4gPj4gT24gRnJpLCBTZXAgNiwgMjAyNCBh
dCA5OjA44oCvQU0gQWxiZXJ0IEVzdGV2ZQ0KPiA+PiA8bWFpbHRvOmFlc3RldmVAcmVkaGF0LmNv
bT4NCj4gPj4gd3JvdGU6DQo+ID4+IFJlc2VydmUgZGV2aWNlIElEIDQ5IGZvciBtZWRpYSBkZXZp
Y2UuDQo+ID4+IENvbXBhdGlibGUgd2l0aCB2aWRlbyBlbmNvZGVyLCB2aWRlbyBkZWNvZGVyLCBh
bmQgY2FwdHVyZSBkZXZpY2VzLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbGJlcnQgRXN0
ZXZlIDxtYWlsdG86YWVzdGV2ZUByZWRoYXQuY29tPg0KPiA+PiAtLS0NCj4gPj4gwqBjb250ZW50
LnRleCB8IDIgKysNCj4gPj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4+
DQo+ID4+IGRpZmYgLS1naXQgYS9jb250ZW50LnRleCBiL2NvbnRlbnQudGV4IGluZGV4IDBhNjJk
Y2UuLjZkNmIzZDggMTAwNjQ0DQo+ID4+IC0tLSBhL2NvbnRlbnQudGV4DQo+ID4+ICsrKyBiL2Nv
bnRlbnQudGV4DQo+ID4+IEBAIC03MzksNiArNzM5LDggQEAgXGNoYXB0ZXJ7RGV2aWNlIFR5cGVz
fVxsYWJlbHtzZWM6RGV2aWNlIFR5cGVzfQ0KPiA+PiDCoFxobGluZQ0KPiA+PiDCoDQ1wqAgwqAg
wqAgwqAgwqAmwqAgwqBTUEkgbWFzdGVyIFxcDQo+ID4+IMKgXGhsaW5lDQo+ID4+ICs0OcKgIMKg
IMKgIMKgIMKgJsKgIMKgTWVkaWEgZGV2aWNlIFxcDQo+ID4+ICtcaGxpbmUNCj4gPj4gwqBcZW5k
e3RhYnVsYXJ9DQo+ID4+DQo+ID4+IFRoZSBpZCA0OCByZXF1ZXN0IHdhcyBtYWRlIHNldmVyYWwg
bW9udGhzIGFnbyBpbiBNYXktMjQgZm9yIHVzYiwgbm8NCj4gPj4gZnVydGhlciBpbnRlcmVzdCBo
YXMgYmVlbiBzaG93biBvbiBpdC4NCj4gPj4gQmV0dGVyIHRvIGF2b2lkIGhvbGVzIGluIHRoZSBk
ZXZpY2UgaWQgYXNzaWdubWVudC4NCj4gPj4gU28gaWQgNDggd291bGQgYmUgYmV0dGVyIHRvIHVz
ZSBmb3IgbWVkaWEgdGhhdCBoYXMgaW50ZXJlc3QuDQo+ID4+IEFkZGVkIHZpcnRpby11c2IgcHJv
cG9zZXIgdG8gdGhyZWFkIHRvIHNlZSBpZiBpdCBpcyBzdGlsbA0KPiA+PiBpbnRlcmVzdGluZywg
aW4gdGhhdCBjYXNlDQo+ID4+IDQ5IHNlZW1zIGdvb2QgaGVyZS4NCj4gPj4NCj4gPj4gR2l2ZW4g
dGhlIHZvdGluZyBoYXMgc3RhcnRlZCwgSSBhbSBub3Qgc3VyZSBpZiB0aGUgcmVhbCBpZCB2YWx1
ZQ0KPiA+PiBtYXR0ZXJzIGFzIGxvbmcgYXMgb25lIG9mIHRoZSB1bmlxdWUgaWQgaXMgcmVzZXJ2
ZWQuDQo+ID4+DQo+ID4+IEFuZCBkbyBub3QgcHJlZmVyIHRvIHJlc3RhcnQgdGhlIHZvdGluZyBm
b3Igc3VjaCBhIHNtYWxsIGNoYW5nZQ0KPiA+PiBlaXRoZXIgb24gbXkgbGF0ZSBvYnNlcnZhdGlv
biBvZiB0aGlzIGhvbGUuDQo+ID4+DQo+ID4+IEkgdGhpbmsgd2hlbiB0aGUgbWFpbnRhaW5lciBt
ZXJnZXMgdGhlIHByb3Bvc2VkIHBhdGNoIHRvIGFzc2lnbiBpZA0KPiA+PiA0OCwgc2hvdWxkIGJl
IGZpbmUuDQo+ID4+DQo+ID4+IE1pY2hhZWwsDQo+ID4+IEFyZSB5b3Ugb2sgdGhpcyB3YXk/IE9y
IHlvdSBoYXZlIGJldHRlciBzdWdnZXN0aW9uPw0KPiA+Pg0KPiA+PiBBaXNod2FyeWEsDQo+ID4+
IElzIHZpcnRpby11c2Igc3RpbGwgaW50ZXJlc3Rpbmc/IElmIHNvLCBjYW4geW91IHBsZWFzZSBy
ZXF1ZXN0IGZvcg0KPiA+PiB0aGUgdm90ZT8gU28gdGhhdCB3ZSBhdm9pZCB0aGUgaG9sZSBpbiBk
ZXZpY2UgaWQgYXNzaWdubWVudC4NCj4gPiBJIHJlY2VpdmVkIGF1dG8gcmVwbHkgZnJvbSBBaXNo
d2FyeWEncyBlbXBsb3llciB0aGF0IHRoZXkgYXJlIG5vdCByZWFjaGFibGUNCj4gZHVlIHRvIGFj
cXVpc2l0aW9uLg0KPiA+IFNvIG5vdCBzdXJlIGlmIHZpcnRpby11c2IgYW5kIDQ4IGlzIHN0aWxs
IHJlbGV2YW50Lg0KPiANCj4gT1RPSCwgYSBnYXAgaW4gdGhlIGlkIGxpc3QgZG9lc24ndCByZWFs
bHkgbWF0dGVyPw0KDQpJdCBpcyBlbGVnYW50IHRvIGtlZXAgdGhlIGNvbnRpbnVvdXMgcmFuZ2Ug
d2hlcmUgb25lIGNhbiB2ZXJpZnkgdGhlIHZhbGlkIGRldmljZSBpZHMgd2l0aG91dCBhZGRpbmcg
ZXhjZXB0aW9uIGNvZGUgdG8gb21pdCBpZHMgd2l0aCBob2xlLg0KVGhlIGZ1dHVyZSBwcm9wb3Nl
cnMgZG8gbm90IG5lZWQgdG8gcGFyc2UgcGFzdCBlbWFpbHMgdG8gZmluZCBvdXQgd2hpY2ggaWRz
IGFyZSBXSVAgdGhhdCB0aGV5IG5lZWQgdG8gb21pdCB3aGVuIHNlbmRpbmcgcGF0Y2hlcy4NCkkg
ZG9u4oCZdCB0aGluayB0aGUgaWQgaW4gdGhlIHBhdGNoIHJlYWxseSBtYXR0ZXJzIGFzIGxvbmcg
YXMgbmV4dCBmcmVlIGlkIGlzIGFzc2lnbmVkLg0KDQo=
