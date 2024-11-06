Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1A91DE2DC
	for <virtio-comment@lists.linux.dev>; Wed,  6 Nov 2024 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730891478; cv=fail; b=InpjPrxAegEX+vX0K7lYbB7ceeCeJUYN2IzbLvV3eKuSF2ZN6T4rTQgTFp3BQf9zt/aFnfvoeQuOQGaZS7miCZX+ySmre1HJi/r8ktF6AwVnf+RBRSn5VjDxb22kIG0KpFyUc5IZSSkIkZDm2dCDhdwbyDh3cEtevGyTY3Z89uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730891478; c=relaxed/simple;
	bh=QjEvJ95k6J1HjY5F+zlSBZqPiGU3XrPxQdidDfY3nZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=YkGzNA6FWx7bbDcRyE6jFGFMJ0+kSsoIWNDCxQV4KAzEGd/MZ7kzC2c2cnPEh2aPcmE4BhcCRU4pnYvDi7EbpdC5Nykbx4czYKtakx7iOV3GSqMH94td9uZ+ZNhiDN3exeM9el4NLWF93JTGghGi5ReAg1f7OQTq/q6JnCnp6Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=gG5Nb+SD reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="gG5Nb+SD"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A64KODS027114;
	Wed, 6 Nov 2024 03:11:05 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42r1b20r1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 03:11:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyN3ETI2vC10VyWL1Tub/4rGIhrMufEEIdgQ0863tWaHvUsyk6Q3re9RmV7l4Kv3AD3RI0cBcKMFCGkbrBEQrfdTH6JhFMbfOarHAsDr3MZNUYsYIAueR7srnH2WYD5mrQ+zpfzZ+03yLvdyk2Jnt7RdVZmuoYOXNJKCj/kpaDGWqYx8KGckwfulJz07TKwCs8CttnCy9+dw16fopUfJW834DEaIsEI8fDP2iiD5TQkSFHFPbltgULrVMS0x0JlhuuB9fQ5lxiowzqadxlfBrLmEm3PAH8caPTQIuWhrP3JGSQVMB7sUigdaCYO6+2j3ov8spUjQg5kCUlYV+7NUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQpwsJn4er88T0LXEHp3ooSiEjQUDlsUeTbCbLVrEps=;
 b=AlTbXOWGuvAKVJ/5ypWv09b9ZFEnRHeNMIfTH2SIwLcjM5cd566vPAdj/r10VM7UNeEp0s4cUuxz3M79nJB6Da6ZuoQj4m4N/jBjUruNK5RnKea6ex6EiozOh4qDcwuvtYGfRofm+d4UgazdEiQmPJc2BhF5Eu4uYAmDrQDaTVTLTgzrBp00GPSA2mbsGdtZPFxlHg5Kr9KEzGG7IkyofnKbEM3ntYmnrvDaEtRiJuJDUriCtXR//z+gbhUqGT5bvBLsC80ZV1CBieR49q93LXs4D+wvJWJNcu1GiYXmD2zkzGUQ0I1kc5NvPHkgjCTneQV1OIwiaCszysS8iGZIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQpwsJn4er88T0LXEHp3ooSiEjQUDlsUeTbCbLVrEps=;
 b=gG5Nb+SDk+SEAv65CBfROCyUtBgIuPFcnkhRlzlyJFaL2e4bWgGfu6l3YvdiqKMe89cuK/tfTxvPEpEBVG0K8HYPUvANYtjyPtAYZGcugqZ9+ziJh/g4VVOYN8r/NNcYqOhyVWPnq09adOgaC8fm53Y5L3pMqiOOzbI3Ji8OhQo=
Received: from MW4PR18MB5244.namprd18.prod.outlook.com (2603:10b6:303:1e0::16)
 by DM8PR18MB4438.namprd18.prod.outlook.com (2603:10b6:8:3d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 11:11:01 +0000
Received: from MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b]) by MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b%6]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 11:11:01 +0000
From: Vamsi Krishna Attunuru <vattunuru@marvell.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>,
        Lege Wang
	<lege.wang@jaguarmicro.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        Nithin Kumar Dabilpuram
	<ndabilpuram@marvell.com>,
        "parav@nvidia.com" <parav@nvidia.com>,
        Leo Liu
	<leo.liu@jaguarmicro.com>,
        Angus Chen <angus.chen@jaguarmicro.com>
Subject: RE: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new
 used buffer notification suppression mechanism
Thread-Topic: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new
 used buffer notification suppression mechanism
Thread-Index: AQHazoxhxQJz+J7qTka2/5VNWObx4LHnxbeAgMHaO0CAAMzpgIAAbwMw
Date: Wed, 6 Nov 2024 11:11:00 +0000
Message-ID:
 <MW4PR18MB5244D80FD2F2067567961722A6532@MW4PR18MB5244.namprd18.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240705035755-mutt-send-email-mst@kernel.org>
 <MW4PR18MB52443417B7398C64244F838BA6522@MW4PR18MB5244.namprd18.prod.outlook.com>
 <CACGkMEsrtZ8Cwby-K9Dynn5-uXu68m2s+bBEdXGW7KrxjfvcUQ@mail.gmail.com>
In-Reply-To:
 <CACGkMEsrtZ8Cwby-K9Dynn5-uXu68m2s+bBEdXGW7KrxjfvcUQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR18MB5244:EE_|DM8PR18MB4438:EE_
x-ms-office365-filtering-correlation-id: 0513c0d0-2361-4e3d-f51d-08dcfe53b27e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1kydDQ1c2paK2N4NFYrUmFGKy9oVnFHK2h1b3UxWU9tSEpPQjNXUWZORG1C?=
 =?utf-8?B?UDBLL3RKczkvVVRxM2FzckhxaUFicmdVTTh4cU95T1BxUVhSTU9YcHgzTS81?=
 =?utf-8?B?RnZPZytVVnRXMStBWURaT2NyaDJhQXNMWUh6WENZb2lKVEczUVJzQ21GTDNG?=
 =?utf-8?B?bTVaVWhlaHVleGxJUm9PbkJCd2lVQ3NTQzR0aDByUmc1c3BnYkVMQVlVbHZC?=
 =?utf-8?B?YnM1L0cxNEsrU3lpRmFMWGF5bitkL3JDd3NjeDJSajRlRktrL1R2NDNkUUNp?=
 =?utf-8?B?N2hseHlwZEE2L1AyTVh4UmFjeU10RFBzTllJdC8yM3grdUFsc3JadEpPUStU?=
 =?utf-8?B?TnpqYVE5NE5LR2czL29vZ3Jvbjdid2thSm1NSkh5b3VCRkcvdFJiK2kwbTI0?=
 =?utf-8?B?ekxHZkRxbjEzU3d5dWhiRWhhbGc0YmtaMU5Mb3g1WXVkMzJjOWY5aXNURTdV?=
 =?utf-8?B?MWN5SUdjcDhhbU5IcytTNTV5N0dTcDlScmE0UUl6dWJsK0l6czdPUDFwNkc0?=
 =?utf-8?B?QjBrdGc2cTFSQWcwU3RMaW95QTgxMkU3bHJMREwwTGZDSmxZcGVMRC85MWJx?=
 =?utf-8?B?dHdvVDNDVXBhY2w3akU5YlBkK0RhRjdBUUd0RWd2QWc4S1dNcmF3a2hGdWNS?=
 =?utf-8?B?dkhIUFlzaFVieWd2ZTRIS3l3WjJwSmdpSXVrUkVFL0t6OXEvYTVkWlRZMlJj?=
 =?utf-8?B?UDdFNTJ5QWxOZU5scHhmKzEvSGp1OXIwcVlrWG00MzRIYVlSamt6Zm9RanpF?=
 =?utf-8?B?VWNwSVk1Q3BRRkdvMzZRQUw4ODA4OGxJR2c4aC9zVHVnVkg0QmQxV3k4cThw?=
 =?utf-8?B?ODVRS0lnS1BsSlVaTVRManVHY1hGbXRYVGEwZE9DSTBHVURsQ1pSaHNBTEdE?=
 =?utf-8?B?QUpIdFZSc2cyVGxCYVhFTG9XM2lDQTFpdWsrQWx2UkRyenZOYy9YMWdyNVIv?=
 =?utf-8?B?L0thOXVGTkxtV0xoSktCYkFTVGEraDRTaUhFdDhacmFXZHpJSkIvZ1B0clBO?=
 =?utf-8?B?eUNxdmJuNDduZUtLQjZsdlRFb2d1TjJOYzBJaDAxU1dYU3hCdXIyTXRLdzc2?=
 =?utf-8?B?T1d3THFqTmhzWWZNWUI4N1p4T05KM2JkYjcvLzU3MzI3eXpoWXlyNVdKZXIw?=
 =?utf-8?B?RkF4WC9CYm1aQzRDd0I4bGxqK2hCYnZXYnAxMGxVMXVRRzNwdjcrdjMxQWRK?=
 =?utf-8?B?OUZSbHFzV0JRMUtnbmk1NEFtRy8vMm4wWktnUDRDR3M2QVBRTzVnelFZblJX?=
 =?utf-8?B?MnRvVWdHT0ZTM3dHVzYrL3VrQjNVNHUySXJ0MTRNN3dKNnQvUUJOUUFxdFZn?=
 =?utf-8?B?T3RvRGlncVJwbnhRTTBRYmpTVmtKMUNUWEZZYTdQMytRSkVlTHQ1d0kycXRK?=
 =?utf-8?B?SHZNRm1KTnA0VVVZczlhNVJvQ1FGNzJHYS84emJjTHFMNlVLSGpxc2NvZUlx?=
 =?utf-8?B?Vlh2N0ltYmFteXhCSVZFUlZtU0liTzhuUHRnRWliSUVpY3NLUFEvazNNc1Nv?=
 =?utf-8?B?cExrR3lxK0Nidzhia3greDQ0UXl5ZTZjUUh6dEwvdFJrbWVMVUsrc1VoUnBG?=
 =?utf-8?B?R0dWSmZSWGwvOCtjOFI2OStvVndWWVZTZ2lwaWRpM0Q0N0dRc1FEcGN0Ujhw?=
 =?utf-8?B?QmlwNk9UVU1NWHJzMlF2VVhWWmtObEtLdkFlMDBia2ViUDFtbFpxRGk2ZXpn?=
 =?utf-8?B?WDJCMzQ5QmNUODE2TnJYeXF4K0xzaHMrNERkQWF2dmZqUHlVNkFLRVdsaE9D?=
 =?utf-8?Q?ibpg2SYSLXwoXl6usjRMHFjrXy8pMrDKlenXdYV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR18MB5244.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TnNwZEN3VXEvM2pZTFhTb05JMis4YlZGdGxlWFNjMFYvSG5JZURsM3pIMUpq?=
 =?utf-8?B?TUpoOEY3dEJuZEpQMktnSlpJaThaS2JYQVRtM3BOZUhxazBYOUJOWGdvMm1q?=
 =?utf-8?B?b2xHSjMyTlV6MndpZFZUbnNCMG5vcG0yc3JLRG5VZUhxMUlUaXpjMkdKdW0v?=
 =?utf-8?B?Mzc0cDFEdXFDbEowNTFLeEVyamNFdG9JNS9icUJLV2I4MWdoUU5uUVNkeWho?=
 =?utf-8?B?MlM5RDNmdVdhL1VTcVQwdmtOK1U5bGhmQ016SjJlQUFmQUpabzZyNHpCWDEz?=
 =?utf-8?B?WExuWWpXRmYvcHZPN0RkRXdHQXg4Ullid0ZEQ0tvSExPTDZOcGdQRVZZQ2cv?=
 =?utf-8?B?REplVjlLcnFNckd3Vm1hbHJyT2M0aXRBQ0hDdTM0c2grMFZrUDR1M3V4dzJw?=
 =?utf-8?B?VmZjM25hVUdhc1k0bkNIUjJUeUtzRzJseVZaaHZmT2QvTFducWNOejlIUnNl?=
 =?utf-8?B?Zk1udlBoUU5KeDFmbnFramRMVTc5TTlOMEJVVWJqQ0U3RDZSei90ZG1sVW5J?=
 =?utf-8?B?cmRDVFdmZ1BlVEVmRG93aFV0cExBemNzUVN2dVlneEM0MWlFNTJzSnU5OEl4?=
 =?utf-8?B?OEZTRThUVGJJdThNNVArRkpEMlpKSnY2dzVFa2pNS2MwOUM0dll6Y2FPTWN1?=
 =?utf-8?B?cFZOT3EzRFZJSHZjOStNTmFJRkZEK2NWU2hoN2htNFk4NDlEVE1wUUdmbENo?=
 =?utf-8?B?RXFneUNKTlpxaHFjOFN3b0dtMFMvSlExcU5CU2ZORVU2Zkp6Z1U1eWtpcnho?=
 =?utf-8?B?UEs1alJoT3dzTGplL0w5VE5aa0d5WUNuRDNqSytGSVQrdTAyWHBBY0c2Zm9m?=
 =?utf-8?B?UURkbVdBOW15U3BrZmhEdHBnV2dqSDV1Ujg1NEY5dTJkVlBpL3pjdk5TZ1hX?=
 =?utf-8?B?dWZJSGdqUU9LeG80VU5SSHIvU0xJYmtVaFNSODloSUsyM3RVUUdWdHE1M3JY?=
 =?utf-8?B?OElHaks1cllOclM5T1Q1RzAyRnhScXFXb242TSthc0s5aUpuV0h5THlHK01P?=
 =?utf-8?B?Zk02Y3JlSlRCRXB2ek1FdEV5d1dJN3NSU0pTdXUwWFN1d2VnUFFhUWJnd3k3?=
 =?utf-8?B?Z2RTNFZzUFBSaGxlYW0yWmUxYldnbUhhTmY3c0szeGNkQWdTMzJHdzZRZnJa?=
 =?utf-8?B?b1JJamxMMXR0VVZvK2tjdjgyTzJNSnU1MFVwZnhuczdZbU5UNU9TWmlpWTZH?=
 =?utf-8?B?Tk1lTVNIcmZUQVpZQVFFSEhaMGttVnJsZGFuc1R2K1ErVUhhR01OR3hFcXdw?=
 =?utf-8?B?MWg5N1FpR0NKSzZia09MdzRveWVxNVR2RU9qU2MwWjh5T0RlR2NEYlhmWnB0?=
 =?utf-8?B?cHVTZmxFNTlLRGtmeTBLNFl3Z1R2VFpFRVBsdmU4NlVCUGRlRFdjUDRYYnd4?=
 =?utf-8?B?NXZQcEsya3NTZDh5c2dya0c3U09QVEZFMnlUd3lhcWFzZjR3SDRCQTU5RUJL?=
 =?utf-8?B?UkdpTFliYitEQ29lYnNXTWFNYWxraVZ2d1FuSnBJcmJndlhKejdoUithY0d6?=
 =?utf-8?B?QmdMVmJpbmtoL1JuS1NrRHExYyt2ZElycjdyNkNSSS90MFJ6SnllQVhWaW1G?=
 =?utf-8?B?cTJVRE9uNUVVZFJjeDlGNEQrN1FGRndTVkVjRzltUzlHYmZhRVdJZWxaemFI?=
 =?utf-8?B?V29NV2I4N2JFdlNiVW1PSENkWWVRdlc1MHBwZ1pHM1gwUlJqSmFmVmR5bWIx?=
 =?utf-8?B?NTdONWh2Qk9XUFFoaDAwSVVkM3dpcW15Uklzc2xSWXRQMzVxTkRGYlA0K1E1?=
 =?utf-8?B?T2R3ZGJ1V1JoT0hjQ1gwS1NYTzJCR3ZId0wxYS9FWkVHSzNueTBVK2M1Ui9v?=
 =?utf-8?B?TjE1ZllhQkFNN01YZlpTTzJyTDV1V05yZmJ6bFc4ZnZNbi8wTStqanZndS9r?=
 =?utf-8?B?TTlmL3dpM2lJM2ZFVC9qa1EwcDNtd2pndUNPWnFGU2tvZFJZWE52NVJJVGVr?=
 =?utf-8?B?TDBtdTRLY3BpZ0ZnSkxEU0pQWEswY2pMM2c4NG1penljaU90Y004NllHZmtR?=
 =?utf-8?B?WkJHVTBkakdqMUZ1QlZMSEJELzQ1Sk5XanUvQ3E2d0JGQndrUmpZVUkxUURV?=
 =?utf-8?B?RnU4SnF2Zk81dHRzczU1aktzNmJ2NDc4Uk5nWHFQMUVZdHF2MUNUNnpZcXN4?=
 =?utf-8?Q?DSvwROlUZHPCK2162jvRo2AHo?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR18MB5244.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0513c0d0-2361-4e3d-f51d-08dcfe53b27e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 11:11:00.9915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0Enw6e+rddn8sr7TDKhINhVTm9o39narM4NhbYSM8RtPp4lnRi0owl+FMMuw70EzcGSbSC9X8BKZJcyR6GYHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR18MB4438
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: fyIEVY19jaRGqMNApgdJV6hkl0VnMifl
X-Proofpoint-GUID: fyIEVY19jaRGqMNApgdJV6hkl0VnMifl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01



>-----Original Message-----
>From: Jason Wang <jasowang@redhat.com>
>Sent: Wednesday, November 6, 2024 10:03 AM
>To: Vamsi Krishna Attunuru <vattunuru@marvell.com>
>Cc: Michael S. Tsirkin <mst@redhat.com>; Lege Wang
><lege.wang@jaguarmicro.com>; virtio-comment@lists.linux.dev; Nithin
>Kumar Dabilpuram <ndabilpuram@marvell.com>; parav@nvidia.com; Leo Liu
><leo.liu@jaguarmicro.com>; Angus Chen <angus.chen@jaguarmicro.com>
>Subject: Re: [EXTERNAL] Re: [PATCH]
>VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer notification
>suppression mechanism
>
>On Wed, Nov 6, 2024 at 12:=E2=80=8A23 AM Vamsi Krishna Attunuru
><vattunuru@=E2=80=8Amarvell.=E2=80=8Acom> wrote: > > Hi Wang, Michael, Jas=
on, > > I wanted
>to follow up on the previous discussions regarding this new used buffer
>notification suppression.=20
>On Wed, Nov 6, 2024 at 12:23=E2=80=AFAM Vamsi Krishna Attunuru
><vattunuru@marvell.com> wrote:
>>
>> Hi Wang, Michael, Jason,
>>
>> I wanted to follow up on the previous discussions regarding this new used
>buffer notification suppression.
>>
>> Since this proposal involves two changes, how about separating it out and
>explore the feasibilities to support interrupt coalescing with existing op=
tions.?
>> 1) Support pvirtq_event_suppress/virtq_avail in PCI bar
>> 2) Support used buffer notification coalescing
>>
>> Regards
>> Vamsi
>
>Maybe post a new RFC to see?

Sure, thanks.
>
>Thanks

